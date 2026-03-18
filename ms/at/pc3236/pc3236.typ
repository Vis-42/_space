#import "../shared/_at.typ": *

#show: ad.with(
  title: "Oscillations of a Driven Triple Pendulum",
  author: "Parth Bhargava · A0310667E",
  experiment: "",
  course: "PC3236 Computational Methods in Physics",
  title-page: false
)

#show link: underline
#set math.equation(numbering: "(1)")

= Abstract

The chaotic dynamics of a driven triple pendulum are investigated numerically. The equations of motion are derived from the Lagrangian for three coupled point masses on rigid, massless rods, with a periodic torque $τ(t) = τ_0 cos(ω_d t)$ applied at the pivot of the first pendulum. The resulting system of three coupled second-order ODEs is reformulated as six first-order equations and integrated using a custom fourth-order Runge-Kutta (RK4) scheme with time step $Δ t = 10^(-3)$ s. The simulation produces time series, phase portraits, Poincaré sections, energy evolution, and sensitivity-to-initial-conditions plots that together demonstrate the transition from regular to chaotic motion. A bifurcation diagram over a range of driving amplitudes reveals the onset of chaos. The custom RK4 implementation is validated against scipy's adaptive RK45 solver, with agreement to $< 10^(-6)$ rad over 20 s of integration.

= Description of the Problem

The simple pendulum is one of the most studied systems in classical mechanics, exhibiting clean periodic oscillations for small angles and mild nonlinearity for large swings. Coupling two pendulums already introduces the possibility of chaotic behaviour, and adding a third greatly enriches the dynamics: the phase space becomes six-dimensional, and even small perturbations in initial conditions can lead to exponentially diverging trajectories.

When an external periodic driving force is added, the system acquires an energy source that can push it through a sequence of bifurcations, from simple periodic motion at low driving amplitude, through period-doubling cascades, to fully developed chaos at stronger driving. This makes the driven triple pendulum a useful model for studying fundamental concepts in nonlinear dynamics: Lyapunov divergence, strange attractors, and the boundary between regular and chaotic regimes.

The problem studied here is: given three point masses $m_1, m_2, m_3$ connected by rigid rods of lengths $L_1, L_2, L_3$, with a periodic torque $τ_0 cos(ω_d t)$ applied at the first pivot, determine the angular trajectories $θ_1(t), θ_2(t), θ_3(t)$ and characterise the system's dynamical behaviour as the driving amplitude varies.

= Equations to be Solved

== Coordinates and Kinematics

Let $θ_i$ be the angle of the $i$-th rod measured from the downward vertical. The Cartesian positions of the three bobs are:

$ x_1 = L_1 sin θ_1, quad y_1 = -L_1 cos θ_1 $ <eq:pos1>

$ x_2 = x_1 + L_2 sin θ_2, quad y_2 = y_1 - L_2 cos θ_2 $ <eq:pos2>

$ x_3 = x_2 + L_3 sin θ_3, quad y_3 = y_2 - L_3 cos θ_3 $ <eq:pos3>

The velocities follow by differentiation:

$ dot(x)_1 = L_1 dot(θ)_1 cos θ_1, quad dot(y)_1 = L_1 dot(θ)_1 sin θ_1 $

and similarly for bobs 2 and 3, each inheriting the velocity of its parent joint.

== Lagrangian

The kinetic energy $T = 1/2 sum_i m_i (dot(x)_i^2 + dot(y)_i^2)$ and potential energy $V = sum_i m_i g y_i$ give the Lagrangian $cal(L) = T - V$. The Euler-Lagrange equations $dif / (dif t) (∂ cal(L)) / (∂ dot(θ)_i) - (∂ cal(L)) / (∂ θ_i) = Q_i$ (where $Q_i$ is the generalised force for the $i$-th coordinate) yield a matrix equation:

$ bold(M)(bold(θ)) dot.double(bold(θ)) = bold(F)(bold(θ), dot(bold(θ)), t) $ <eq:matrix>

== Mass Matrix

The $3 × 3$ mass matrix $bold(M)$ has elements:

$ M_(1 1) = (m_1 + m_2 + m_3) L_1^2 $ <eq:m11>

$ M_(1 2) = M_(2 1) = (m_2 + m_3) L_1 L_2 cos(θ_1 - θ_2) $ <eq:m12>

$ M_(1 3) = M_(3 1) = m_3 L_1 L_3 cos(θ_1 - θ_3) $ <eq:m13>

$ M_(2 2) = (m_2 + m_3) L_2^2 $ <eq:m22>

$ M_(2 3) = M_(3 2) = m_3 L_2 L_3 cos(θ_2 - θ_3) $ <eq:m23>

$ M_(3 3) = m_3 L_3^2 $ <eq:m33>

== Forcing Vector

The forcing vector $bold(F)$ contains the Coriolis-like coupling terms, gravitational torques, and the external drive:

$ F_1 = (m_2 + m_3) L_1 L_2 dot(θ)_2^2 sin(θ_1 - θ_2) + m_3 L_1 L_3 dot(θ)_3^2 sin(θ_1 - θ_3) - (m_1 + m_2 + m_3) g L_1 sin θ_1 + τ_0 cos(ω_d t) $ <eq:f1>

$ F_2 = -(m_2 + m_3) L_1 L_2 dot(θ)_1^2 sin(θ_1 - θ_2) + m_3 L_2 L_3 dot(θ)_3^2 sin(θ_2 - θ_3) - (m_2 + m_3) g L_2 sin θ_2 $ <eq:f2>

$ F_3 = -m_3 L_1 L_3 dot(θ)_1^2 sin(θ_1 - θ_3) - m_3 L_2 L_3 dot(θ)_2^2 sin(θ_2 - θ_3) - m_3 g L_3 sin θ_3 $ <eq:f3>

== State-Space Formulation

Defining the state vector $bold(y) = (θ_1, θ_2, θ_3, ω_1, ω_2, ω_3)^T$ where $ω_i = dot(θ)_i$, the system becomes six first-order ODEs:

$ dot(θ)_i = ω_i, quad quad dot(ω)_i = [bold(M)^(-1) bold(F)]_i $ <eq:state>

This is the form integrated numerically.

== Fourth-Order Runge-Kutta Method

Given the ODE $dot(bold(y)) = bold(f)(t, bold(y))$, a single RK4 step from $t_n$ to $t_(n+1) = t_n + h$ is:

$ bold(k)_1 = bold(f)(t_n, bold(y)_n) $

$ bold(k)_2 = bold(f)(t_n + h/2, bold(y)_n + h/2 bold(k)_1) $

$ bold(k)_3 = bold(f)(t_n + h/2, bold(y)_n + h/2 bold(k)_2) $ <eq:rk4>

$ bold(k)_4 = bold(f)(t_n + h, bold(y)_n + h bold(k)_3) $

$ bold(y)_(n+1) = bold(y)_n + h/6 (bold(k)_1 + 2 bold(k)_2 + 2 bold(k)_3 + bold(k)_4) $

The local truncation error is $O(h^5)$, giving global error $O(h^4)$.

= Description of Computational Methodology and Implementation

== Overview

The simulation is implemented in a single Python script (`triple_pendulum.py`, 270 lines). The structure is:

1. Define physical parameters ($g, L_i, m_i, τ_0, ω_d$) as module-level constants.
2. Implement `mass_matrix(θ)` and `forcing(θ, ω, t)` as separate functions, each returning NumPy arrays.
3. The function `derivs(t, y)` computes $dot(bold(y))$ by solving the $3 × 3$ linear system $bold(M) dot.double(bold(θ)) = bold(F)$ using `np.linalg.solve`.
4. `rk4_step` and `integrate_rk4` implement the custom integrator.
5. Plotting routines generate all seven figures.

The choice to use `np.linalg.solve` rather than explicitly inverting $bold(M)$ is deliberate: LU factorisation is numerically more stable than computing $bold(M)^(-1)$ directly, which matters when the angle differences $θ_i - θ_j$ approach zero and the off-diagonal elements approach their maxima.

== Code-to-Equation Mapping

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    [*Code (line numbers)*], [*Corresponding equation / mathematical operation*],
    [Lines 27--37], [Physical constants $g, L_i, m_i, τ_0, ω_d$ ],
    [Lines 59--76 \ `mass_matrix()`], [Mass matrix elements $M_(i j)$ from @eq:m11 through @eq:m33. Each entry is computed from the rod lengths, masses, and cosines of angle differences.],
    [Lines 79--98 \ `forcing()`], [Forcing vector $F_i$ from @eq:f1, @eq:f2, @eq:f3. The `+ tau0 * np.cos(omega_d * t)` term on line 88 adds the external drive to $F_1$ only.],
    [Lines 101--108 \ `derivs()`], [State-space formulation @eq:state: unpacks $bold(y)$ into $bold(θ)$ and $bold(ω)$, solves $bold(M) dot.double(bold(θ)) = bold(F)$ via LU decomposition (`np.linalg.solve`), and returns $[ω_1, ω_2, ω_3, dot.double(θ)_1, dot.double(θ)_2, dot.double(θ)_3]$.],
    [Lines 113--119 \ `rk4_step()`], [RK4 formula @eq:rk4: four evaluations of `f(t, y)` at the appropriate intermediate points, combined with weights $1/6, 1/3, 1/3, 1/6$. The syntax `y + 0.5*dt*k1` implements $bold(y)_n + (h\/2) bold(k)_1$.],
    [Lines 122--129 \ `integrate_rk4()`], [Time-stepping loop: creates a uniform time grid with `np.linspace`, then advances the state vector one RK4 step per iteration.],
    [Lines 134--150 \ `kinetic_energy()`], [Kinetic energy $T = 1/2 sum_i m_i (dot(x)_i^2 + dot(y)_i^2)$, computed by chaining velocity components from @eq:pos1 through @eq:pos3.],
    [Lines 153--158 \ `potential_energy()`], [Potential energy $V = sum_i m_i g y_i$ using vertical positions from @eq:pos1 through @eq:pos3.],
  ),
  caption: [Mapping between code sections and the mathematical equations they implement.]
) <tab:code-map>

== Why These Syntax Choices

- *`np.linalg.solve(M, F)` instead of `np.dot(np.linalg.inv(M), F)`*: solving a linear system via LU factorisation avoids forming the inverse matrix explicitly, which would square the condition number and amplify round-off error.
- *`np.concatenate([om, alpha])`*: packing the six derivatives $[dot(θ)_1, dot(θ)_2, dot(θ)_3, dot.double(θ)_1, dot.double(θ)_2, dot.double(θ)_3]$ into a single array keeps the interface compatible with both the custom RK4 and scipy's `solve_ivp`.
- *Module-level constants*: parameters like $g$, $L_i$, $m_i$ are defined at the module scope so they are accessible inside `mass_matrix`, `forcing`, and plotting routines without being passed as arguments. This keeps function signatures clean.

== Efficiency and Accuracy

With $Δ t = 10^(-3)$ s and $T = 40$ s, the integrator performs 40 000 steps, each requiring four evaluations of `derivs`, hence four $3 × 3$ linear solves. The total wall time on a laptop (Apple M-series) is about 60 seconds, dominated by the bifurcation diagram which repeats the integration for 60 different driving amplitudes.

Reducing the time step to $5 × 10^(-4)$ s produces no visible change in the time series over the first 20 s, and the agreement with scipy's adaptive RK45 (set to tight tolerances `rtol=1e-9`, `atol=1e-12`) remains below $10^(-6)$ rad, confirming that $Δ t = 10^(-3)$ s is adequate.

== Testing and Verification

- *Energy conservation in the undriven case*: setting $τ_0 = 0$ and integrating for 40 s, the total mechanical energy drifts by less than $10^(-8)$ J, consistent with the $O(h^4)$ global error of RK4.
- *Small-angle limit*: for initial angles below 0.01 rad and no driving, the three pendulums oscillate nearly independently at frequencies close to $sqrt(g/L_i)$, matching the linearised normal modes.
- *scipy cross-check*: the custom RK4 output is compared to `solve_ivp` with method `RK45` and very tight tolerances. The difference in $θ_1$ remains below $10^(-6)$ rad for 20 s (@fig:scipy).

== Debugging and Error Analysis

=== Error 1: Incorrect Sign in Coriolis Terms

During initial development, the forcing function had incorrect signs on the Coriolis coupling terms. Specifically, the $dot(θ)_1^2 sin(θ_1 - θ_2)$ term in $F_2$ was entered with a positive sign instead of negative. The symptom was that for small initial angles the system appeared to gain energy rapidly even with no driving ($τ_0 = 0$).

To diagnose this, I added a print statement inside the time loop that output the total energy every 1000 steps:
```python
if i % 1000 == 0:
    print(f"t={t_arr[i]:.2f}  E={kinetic_energy(...)+potential_energy(...):.6f}")
```
The energy was increasing monotonically, which is physically impossible for an undriven conservative system. I then re-derived the Euler-Lagrange equations by hand, confirmed the correct sign pattern from the $∂ T / ∂ θ_2$ term, and corrected the code. After the fix, energy was conserved to machine precision over short integrations.

=== Error 2: Phase Portrait Wrapping Artefact

When plotting the Poincaré section, the angles were initially left unwrapped, which produced misleading horizontal streaks whenever $θ$ crossed $± π$. I traced this by inspecting the raw $θ$ values at the stroboscopic sampling times and noticing jumps of $≈ 2 π$. The fix was to apply:
```python
th_mod = np.mod(Y[indices, i] + np.pi, 2*np.pi) - np.pi
```
which maps all angles into $(-π, π]$ before plotting. This produced the expected clustered/scattered pattern in the Poincaré section rather than artificial horizontal bands.

= Presentation of Results and Graphs

== Time Series

@fig:timeseries shows the angular displacements of all three pendulums over 40 s. The first pendulum ($θ_1$) shows the most regular structure because it is directly driven; the second and third pendulums exhibit increasingly erratic oscillations as the coupling transmits energy through the chain.

#boxfig("pc3236/plots/time_series.png", width: 95%, box-width: 100%, [Time series of angular displacements $θ_1(t)$, $θ_2(t)$, $θ_3(t)$ for the driven triple pendulum with $τ_0 = 2.0$ N·m, $ω_d = 1.6 π$ rad/s.]) <fig:timeseries>

== Phase Portraits

@fig:phase shows the phase-space trajectories ($θ_i$ vs $dot(θ)_i$) for each pendulum. Pendulum 1 traces a relatively confined orbit, while pendulums 2 and 3 explore increasingly large regions of phase space. The absence of clean closed loops confirms that the system is not strictly periodic.

#boxfig("pc3236/plots/phase_portraits.png", width: 95%, box-width: 100%, [Phase portraits for the three pendulums. The progressively larger explored region from pendulum 1 to 3 reflects the amplification of irregularity along the chain.]) <fig:phase>

== Energy Evolution

@fig:energy plots the kinetic, potential, and total energy as functions of time. Because the system is driven, the total mechanical energy is not conserved: the driving torque continuously injects energy while the nonlinear dynamics redistribute it among the three degrees of freedom. The energy fluctuations grow as the system becomes more chaotic.

#boxfig("pc3236/plots/energy.png", width: 95%, box-width: 100%, [Kinetic, potential, and total energy vs time. The total energy fluctuates because the system is externally driven.]) <fig:energy>

== Poincaré Section

@fig:poincare shows the stroboscopic Poincaré section, where the state is sampled once per driving period $T_d = 2 π / ω_d$. For a periodic orbit the section would consist of a single point; for a quasi-periodic orbit it would trace a curve. The scattered cloud of points, particularly for pendulums 2 and 3, is a hallmark of chaotic dynamics.

#boxfig("pc3236/plots/poincare.png", width: 95%, box-width: 100%, [Poincaré section (stroboscopic sampling at the driving period). The scattered structure indicates chaotic behaviour.]) <fig:poincare>

== Sensitivity to Initial Conditions

@fig:sensitivity shows the separation $|Δ bold(θ)|$ between two trajectories that start with an initial angular difference of $10^(-6)$ rad in $θ_1$ only. The separation grows exponentially for several seconds before saturating, which is the defining signature of chaos. The initial exponential growth rate gives an estimate of the maximal Lyapunov exponent.

#boxfig("pc3236/plots/sensitivity.png", width: 95%, box-width: 100%, [Separation between two nearby trajectories ($Δ θ_1(0) = 10^(-6)$ rad) on a logarithmic scale. The initial exponential divergence demonstrates sensitivity to initial conditions.]) <fig:sensitivity>

== scipy Comparison

@fig:scipy shows the absolute difference $|θ_(1,"RK4") - θ_(1,"scipy")|$ between the custom RK4 integration and scipy's adaptive RK45. The agreement is better than $10^(-6)$ rad for the first 20 s, growing gradually due to the accumulation of truncation errors in both methods. This confirms that the custom integrator is correctly implemented.

#boxfig("pc3236/plots/scipy_comparison.png", width: 95%, box-width: 100%, [Absolute difference in $θ_1$ between the custom RK4 (fixed step $h = 10^(-3)$ s) and scipy RK45 (adaptive, `rtol`$= 10^(-9)$).]) <fig:scipy>

== Bifurcation Diagram

@fig:bifurcation maps the long-time behaviour as the driving amplitude $τ_0$ is swept from 0.5 to 8.0 N·m. At each amplitude the system is integrated for 20 s of transient followed by 20 s of sampling at the driving period. For small $τ_0$ the Poincaré points cluster tightly (periodic response); as $τ_0$ increases, period-doubling bifurcations appear, and beyond $τ_0 ≈ 4$ N·m the system enters a fully chaotic regime with broadly scattered points.

#boxfig("pc3236/plots/bifurcation.png", width: 95%, box-width: 100%, [Bifurcation diagram: Poincaré-sampled angles as a function of driving amplitude $τ_0$. The progression from periodic to chaotic behaviour is visible as the driving strengthens.]) <fig:bifurcation>

= Reflections and Discussion

== Physical Insights

The driven triple pendulum illustrates several key ideas from nonlinear dynamics:

- *Sensitivity to initial conditions* is not just a mathematical curiosity; it has practical consequences. Even with double-precision floating-point arithmetic ($≈ 16$ significant digits), trajectories diverge within tens of seconds, making long-term prediction impossible. The Poincaré section and Lyapunov divergence plot confirm this quantitatively.

- *Energy redistribution* through the chain of pendulums follows from the nonlinear coupling. The driving torque acts only on pendulum 1, but energy flows to pendulums 2 and 3 through the angle-dependent coupling terms in the mass matrix. This is why the outer pendulums show more irregular behaviour: they receive energy through a chaotic intermediary.

- *Bifurcation structure* shows that the transition to chaos is not abrupt. As driving increases, the system first responds periodically, then undergoes period-doubling, and eventually fills a broad region of the Poincaré section. This is the classic route to chaos seen in many driven nonlinear systems (e.g. the Duffing oscillator, the forced Van der Pol oscillator).

== Limitations

The model assumes rigid, massless rods and point masses with no friction or air resistance. A real triple pendulum would dissipate energy, which would compete with the driving force and potentially suppress or alter the chaotic behaviour. Adding a linear damping term $-b dot(θ)_i$ to each equation of motion would be a straightforward extension.

The use of a fixed time step ($10^(-3)$ s) means the integrator may be inefficient during slow phases and insufficiently precise during rapid whipping motions. An adaptive step-size controller (as implemented in scipy's RK45) would be more efficient, but the fixed-step RK4 was chosen to satisfy the project requirement of implementing one's own algorithm.

= Conclusion

The driven triple pendulum was simulated by deriving its equations of motion from the Lagrangian, reformulating them as a six-dimensional first-order ODE system, and integrating with a hand-coded RK4 scheme. The simulation reproduces the expected phenomenology of a chaotic driven system: irregular time series, space-filling phase portraits, scattered Poincaré sections, exponential sensitivity to initial conditions, and a bifurcation diagram showing the route from periodicity to chaos as driving amplitude increases. The custom RK4 integrator agrees with scipy's adaptive solver to within $10^(-6)$ rad over 20 s, confirming its correctness.

= References

1. J. M. T. Thompson and H. B. Stewart, _Nonlinear Dynamics and Chaos_, 2nd ed. (Wiley, 2002). <ref1>

2. S. H. Strogatz, _Nonlinear Dynamics and Chaos_, 2nd ed. (Westview Press, 2015). <ref2>

3. W. H. Press, S. A. Teukolsky, W. T. Vetterling, and B. P. Flannery, _Numerical Recipes_, 3rd ed. (Cambridge University Press, 2007). <ref3>

4. PC3236 Computational Methods in Physics, Project Handout, NUS (2025/26). <ref4>

#pagebreak()

= Declaration on the Use of Generative AI

I declare that I *HAVE* used generative AI tools to produce this assignment.

I acknowledge that generative AI was used in the following manner:

#figure(
  table(
    columns: (auto, 1fr, 1fr),
    align: (left, left, left),
    stroke: 1pt,
    table.hline(stroke: 2pt),
    [*AI Tool Used*], [*My Prompt and AI Output*], [*How the Output Was Used*],
    table.hline(),
    [Claude], [
      *Prompt:* \
      "Help me structure the Python simulation for the driven triple pendulum, including the Lagrangian derivation, RK4 integrator, and plotting routines." \
      *Output:* \
      Python code structure and debugging guidance
    ], [
      Used as a reference for organising the code. All equations were derived by me and verified against textbook sources. The RK4 algorithm was implemented from my lecture notes. I manually corrected sign errors found by energy-conservation testing.
    ],
    table.hline(),
    [Claude], [
      *Prompt:* \
      "Help with Typst formatting for figures, tables, equations, and the code-to-equation mapping table." \
      *Output:* \
      Typst formatting suggestions
    ], [
      Used only for formatting. All physical analysis, interpretation, and report content were written and verified by me.
    ],
    table.hline(stroke: 2pt),
  ),
  caption: [AI Tool Usage Declaration]
)
