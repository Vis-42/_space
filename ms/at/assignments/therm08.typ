#import "../shared/_at.typ": *

#show: ad.with(
  title: "Assignment 8",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC2135* \
  Thermodynamics and Statistical Mechanics],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: "(1)")
#set math.cases(gap: 1em)

#let imath(body) = text(size: 1.1em)[#body]

#pbm("1")[
  *[15 pts]*
  In class, we have learnt that the van der Waals model of fluids can be used to qualitatively describe the liquid-gas transition. Near the critical point of the transition, universal physics emerges, and important quantities associated with the universal physics are various critical exponents. In this problem, we will use the van der Waals model to calculate some of the critical exponents. Although the final results we get are not exact, this exercise helps us better understand the van der Waals model and the concepts of critical exponents.

  For your convenience, the van der Waals equation of state is copied here:
  $
  P = frac(N k T, V - N b) - frac(a N^2, V^2)
  $ <eq:vdw>
  where $a$ and $b$ are positive constants. In terms of the reduced variables, this equation of state takes the dimensionless form
  $
  p = frac(8 t, 3 v - 1) - frac(3, v^2)
  $ <eq:vdw-red>
  where $p = P\/P_c$, $v = V\/V_c$ and $t = T\/T_c$, with $V_c = 3 N b$, $P_c = a\/(27 b^2)$ and $k T_c = 8 a\/(27 b)$.

  *(1) (2 points)* Expand the van der Waals equation @eq:vdw-red in a Taylor series in $delta v = v - 1$, keeping terms through order $delta v^3$. For now, we assume that for $T$ sufficiently close to $T_c$, the term quadratic in $delta v$ becomes negligible compared to the others and may be dropped. We will justify this assumption in part (3).

  *(2) (2 points)* The resulting expression for $p(v)$ is anti-symmetric about the point $delta v = 0$. Use this fact to find an approximate formula for the vapor pressure as a function of temperature. Evaluate the slope of the phase boundary, $dif p\/dif t$, at the critical point.

  *(3) (3 points)* Still working in the same limit, find an expression for the difference in volume between the gas and liquid phases at the vapor pressure. You should find $v_g - v_l ∝ delta t^beta$ for $delta t > 0$, where $delta t = 1 - t$ and $beta$ is known as a critical exponent. Experiments show that $beta$ has a universal value of about $1\/3$, but the van der Waals model predicts a larger value. Use this result to justify the assumption made in part (1), where the term quadratic in $delta v$ can be ignored.

  *(4) (2 points)* Use the previous result to calculate the predicted latent heat of the liquid-gas transition as a function of temperature, and sketch this function.

  *(5) (3 points)* The shape of the $T = T_c$ isotherm defines another critical exponent, called $delta$: $delta p ∝ delta v^delta$, where $delta p = p - 1$. Calculate $delta$ in the van der Waals model.

  *(6) (3 points)* A third critical exponent describes the temperature dependence of the isothermal compressibility right at $P_c$:
  $
  kappa = -frac(1, V) pdv(V, P)_T
  $
  This quantity diverges at the critical point, in proportion to a power of $delta t$ that in principle could differ depending on whether one approaches the critical point from higher or lower temperature. Therefore, the critical exponents $gamma$ and $gamma'$ are defined by the relation
  $
  kappa ∝ cases(
    delta t^(-gamma) &"as" delta t -> 0^+,
    |delta t|^(-gamma') quad &"as" delta t -> 0^-
  )
  $
  Calculate $gamma$ and $gamma'$ in the van der Waals model and show that $gamma = gamma'$ in this model.
]

#solution[
  *Part (1): Taylor expansion of reduced equation*

  Write $v = 1 + delta v$ and expand each term of @eq:vdw-red to third order.

  For the first term, $3 v - 1 = 2 + 3 delta v$:
  $
  frac(1, 3 v - 1) = frac(1, 2) dot frac(1, 1 + frac(3 delta v, 2))
  ≈ frac(1, 2) [1 - frac(3, 2) delta v + frac(9, 4) delta v^2 - frac(27, 8) delta v^3]
  $
  For the second term, $v^2 = (1 + delta v)^2$:
  $
  frac(1, v^2) ≈ 1 - 2 delta v + 3 delta v^2 - 4 delta v^3
  $
  Substituting and collecting powers of $delta v$ (using $delta t = 1 - t$, so $t = 1 - delta t$):
  $
  p ≈ (1 - 4 delta t) + 6 delta t thin delta v - 9 delta t thin delta v^2 - frac(3, 2) delta v^3
  $ <eq:p-expand>
  Dropping the quadratic term (justified in part (3)):
  $
  p ≈ (1 - 4 delta t) + 6 delta t thin delta v - frac(3, 2) delta v^3
  $ <eq:p-approx>

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Vapor pressure and phase boundary slope*

  Write @eq:p-approx as $p = p_0 + f(delta v)$, where $p_0 = 1 - 4 delta t$ and $f(delta v) = 6 delta t thin delta v - frac(3, 2) delta v^3$ is an odd function of $delta v$. By Maxwell's equal-area rule, the horizontal tie-line at the vapor pressure must have equal areas above and below. Since $f(delta v)$ is odd, the line $p = p_0$ satisfies this automatically by symmetry. Therefore the vapor pressure is
  $
  p_("vap") = 1 - 4 delta t = 4 t - 3
  $ <eq:pvap>
  The slope of the phase boundary at the critical point ($t = 1$):
  $
  dv(p_("vap"), t) = 4
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Volume difference and critical exponent $beta$*

  At $p = p_("vap")$, the $delta v$-dependent part vanishes:
  $
  6 delta t thin delta v - frac(3, 2) delta v^3 = 0 quad ==> quad delta v (6 delta t - frac(3, 2) delta v^2) = 0
  $
  The non-trivial solutions are $delta v^2 = 4 delta t$, giving $delta v = plus.minus 2 sqrt(delta t)$. Therefore
  $
  v_g - v_l = 4 sqrt(delta t) ∝ delta t^(1\/2)
  $ <eq:beta>
  The critical exponent is $beta = 1\/2$ (the experimental value $beta ≈ 1\/3$ is smaller).

  *Justification for dropping the quadratic term:* at the phase boundary, $delta v ∝ delta t^(1\/2)$, so $delta v^2 ∝ delta t$ and the quadratic term scales as $delta t dot delta v^2 ∝ delta t^2$. The retained terms scale as $delta t dot delta v ∝ delta t^(3\/2)$ and $delta v^3 ∝ delta t^(3\/2)$. Since $delta t^2 << delta t^(3\/2)$ as $delta t -> 0$, the quadratic term is indeed negligible.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (4): Latent heat*

  From the Clausius--Clapeyron relation in reduced variables:
  $
  dv(p_("vap"), t) = frac(l, t (v_g - v_l))
  $
  where $l$ is the latent heat in reduced units ($l = L\/(P_c V_c)$). Using @eq:pvap and @eq:beta:
  $
  l = t (v_g - v_l) dot dv(p_("vap"), t) = t dot 4 sqrt(delta t) dot 4 = 16 t sqrt(1 - t)
  $
  Near $t = 1$: $l ≈ 16 sqrt(1 - t) ∝ (T_c - T)^(1\/2)$. The latent heat vanishes at the critical point and grows as the square root of the distance below $T_c$.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (5): Critical exponent $delta$*

  On the critical isotherm $t = 1$ ($delta t = 0$), @eq:p-approx reduces to
  $
  delta p = p - 1 = -frac(3, 2) delta v^3
  $
  Therefore $delta p ∝ |delta v|^3 op("sgn")(delta v)$, giving
  $
  delta = 3
  $
  (Experimental values are typically $delta ≈ 4$--$5$.)

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (6): Critical exponents $gamma$ and $gamma'$ for compressibility*

  The isothermal compressibility in reduced variables is #imath[$kappa = -(1\/(P_c v)) pdv(v, p)_t = -(1\/(P_c v)) (pdv(p, v)_t)^(-1)$].

  From @eq:p-approx:
  $
  pdv(p, v)_t = pdv(p, (delta v))_t = 6 delta t - frac(9, 2) delta v^2
  $ <eq:dpdv>

  *Approaching from above ($t > 1$, $delta t < 0$):* at $v = 1$ ($delta v = 0$), the single-phase fluid exists. From @eq:dpdv:
  $
  pdv(p, v) = 6 delta t = -6 |delta t| quad ==> quad kappa = frac(1, P_c dot 6 |delta t|) ∝ |delta t|^(-1)
  $
  Therefore $gamma = 1$.

  *Approaching from below ($t < 1$, $delta t > 0$):* the system phase-separates. Evaluate the compressibility of either phase at the coexistence volume $delta v = plus.minus 2 sqrt(delta t)$:
  $
  pdv(p, v) = 6 delta t - frac(9, 2) dot 4 delta t = 6 delta t - 18 delta t = -12 delta t
  $
  $
  kappa = frac(1, P_c dot 12 delta t) ∝ delta t^(-1)
  $
  Therefore $gamma' = 1$, and $gamma = gamma' = 1$ in the van der Waals model. $square.filled$
]

#pagebreak()

#pbm("2")[
  *[15 pts]*
  In class, when we discuss the energy of mixing of non-ideal mixtures, we took the energy to be proportional to $x(1 - x)$, where $x$ is the fraction of one of the two substances in the mixture. In this problem, we consider a concrete model that indeed gives such an energy of mixing. From this model, we will also better understand the notion of solubility gap.

  Consider a mixture of A and B molecules that is ideal in every way but one: the potential energy due to the interaction of neighbouring molecules depends upon whether the molecules are like or unlike. Let $n$ be the average number of nearest neighbours of any given molecule (perhaps 6 or 8 or 10). Let $u_0$ be the average potential energy associated with the interaction between neighbouring molecules that are the same (A--A or B--B), and let $u_(A B)$ be the potential energy associated with the interaction of a neighbouring unlike pair (A--B). There are no interactions beyond the range of the nearest neighbours; the values of $u_0$ and $u_(A B)$ are independent of the amounts of A and B; the entropy of mixing is the same as for an ideal solution; and without mixing the Gibbs free energy density is the same for pure A and pure B systems.

  *(1) (2 points)* Show that when the system is unmixed, the total potential energy due to all neighbour--neighbour interactions is $N n u_0\/2$. (Hint: Be sure to count each neighbouring pair only once.)

  *(2) (2 points)* Find a formula for the total potential energy when the system is mixed, in terms of $x$, the fraction of B. (Assume that the mixing is totally random.)

  *(3) (2 points)* Subtract the results of parts (1) and (2) to obtain the change in energy upon mixing. Simplify the result as much as possible; you should obtain an expression proportional to $x(1 - x)$. Sketch this function vs. $x$, for both possible signs of $u_(A B) - u_0$.

  *(4) (2 points)* Show that the slope of the mixing energy function is finite at both end points, unlike the slope of the mixing entropy function.

  *(5) (3 points)* Below we assume $u_(A B) > u_0$. Sketch a graph of the Gibbs free energy of this system vs. $x$ at several temperatures. Find the maximal temperature at which this system has a solubility gap.

  *(6) (2 points)* Make a very rough estimate of $u_(A B) - u_0$ for a liquid mixture that has a solubility gap below 100 °C.

  *(7) (2 points)* Sketch the phase diagram ($T$ vs. $x$) for this system.
]

#solution[
  *Part (1): Potential energy of the unmixed system*

  Each of the $N$ molecules has $n$ nearest neighbours. Summing over all molecules counts each pair twice (once from each end), so the number of distinct pairs is $N n\/2$. In the unmixed system, every neighbour pair is like--like with energy $u_0$. Therefore
  $
  U_("unmixed") = frac(N n u_0, 2)
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Potential energy of the mixed system*

  With fraction $x$ of B and $(1 - x)$ of A, assuming random mixing, the probability that a given neighbouring pair is of each type is

  #block(inset: (left: 1em))[
    A--A: $(1 - x)^2$ with energy $u_0$ \
    B--B: $x^2$ with energy $u_0$ \
    A--B: $2 x(1 - x)$ with energy $u_(A B)$
  ]

  The total potential energy is
  $
  U_("mixed") = frac(N n, 2) [(1 - x)^2 u_0 + x^2 u_0 + 2 x(1 - x) u_(A B)]
  $
  $
  = frac(N n, 2) [u_0 (1 - 2 x(1 - x)) + 2 x(1 - x) u_(A B)]
  $
  $
  = frac(N n, 2) [u_0 + 2 x(1 - x)(u_(A B) - u_0)]
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Energy of mixing*

  $
  Delta U = U_("mixed") - U_("unmixed") = N n x(1 - x)(u_(A B) - u_0)
  $ <eq:DeltaU>
  The function $x(1 - x)$ is a symmetric parabola with maximum $1\/4$ at $x = 1\/2$. If $u_(A B) > u_0$, $Delta U > 0$ (mixing is energetically unfavourable). If $u_(A B) < u_0$, $Delta U < 0$ (mixing is favourable).

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (4): Finite slope at the endpoints*

  $
  dv(Delta U, x) = N n (u_(A B) - u_0)(1 - 2 x)
  $
  At $x = 0$: slope $= N n(u_(A B) - u_0)$ (finite). At $x = 1$: slope $= -N n(u_(A B) - u_0)$ (finite).

  By contrast, the ideal mixing entropy is $Delta S = -N k[x ln x + (1 - x) ln(1 - x)]$, with derivative
  $
  dv(Delta S, x) = -N k [ln x - ln(1 - x)]
  $
  which diverges as $x -> 0^+$ or $x -> 1^-$. The entropy slope is infinite at both endpoints while the energy slope remains finite.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (5): Gibbs free energy and maximum solubility-gap temperature*

  The Gibbs free energy of mixing (at constant $P$, with $Delta V ≈ 0$) is
  $
  frac(Delta G, N) = n(u_(A B) - u_0) x(1 - x) + k T [x ln x + (1 - x) ln(1 - x)]
  $ <eq:DG>
  At high $T$, the entropy term (concave) dominates and $Delta G$ is concave everywhere: one phase. At low $T$, the energy term creates a local maximum near $x = 1\/2$: a solubility gap.

  The critical temperature occurs when the curvature at $x = 1\/2$ changes sign. Taking the second derivative of @eq:DG:
  $
  frac(1, N) dv(Delta G, x, 2) = -2 n(u_(A B) - u_0) + k T [frac(1, x) + frac(1, 1 - x)]
  $
  At $x = 1\/2$:
  $
  frac(1, N) dv(Delta G, x, 2) = -2 n(u_(A B) - u_0) + 4 k T
  $
  Setting this to zero:
  $
  T_c = frac(n(u_(A B) - u_0), 2 k)
  $ <eq:Tc-mix>
  For $T > T_c$ the system is fully miscible; for $T < T_c$ a solubility gap exists.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (6): Rough estimate of $u_(A B) - u_0$*

  A solubility gap below 100 °C means $T_c ≈ 373$ K. Using @eq:Tc-mix with $n ≈ 6$:
  $
  u_(A B) - u_0 = frac(2 k T_c, n) = frac(2 (1.381 times 10^(-23))(373), 6) ≈ 1.7 times 10^(-21) text(" J") ≈ 0.01 text(" eV")
  $
  This is a small fraction of a typical bond energy, consistent with the fact that the A--B interaction is only slightly different from A--A and B--B.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (7): Phase diagram*

  The model treats A and B symmetrically, so the phase diagram is symmetric about $x = 1\/2$. Below $T_c$, there is a miscibility gap (two-phase region) bounded by a coexistence curve. The two branches meet at $(x, T) = (1\/2, T_c)$ and curve outward towards $(0, 0)$ and $(1, 0)$.

  At each $T < T_c$, the phase boundary compositions $x_1$ and $x_2 = 1 - x_1$ are found from the common tangent construction on $Delta G(x)$. By the symmetry of the model, they satisfy $x_1 + x_2 = 1$, and they approach $x = 1\/2$ as $T -> T_c$ from below, forming an inverted-parabola-shaped coexistence dome.
]

#pbm("3")[
  *[10 pts]*
  Seawater has a salinity of 3.5%, meaning that if you boil away a kilogram of seawater, when you are finished you will have 35 g of solids (mostly NaCl) left in the pot. When dissolved, sodium chloride dissociates into separate Na${}^+$ and Cl${}^-$ ions.

  *(1) (5 points)* Calculate the osmotic pressure difference between a kilogram of seawater and freshwater at temperature 300 K. Assume for simplicity that all the dissolved salts in seawater are NaCl, and that 1 kilogram of seawater has a volume of 1 litre.

  *(2) (5 points)* If you apply a pressure difference greater than the osmotic pressure to a solution separated from pure solvent by a semipermeable membrane, you get reverse osmosis: a flow of solvent out of the solution. This process can be used to desalinate seawater. Calculate the minimum work required to desalinate one litre of seawater. Discuss some reasons why the actual work required would be greater than the minimum.
]

#solution[
  *Part (1): Osmotic pressure*

  Mass of NaCl per kilogram of seawater: 35 g.
  Molar mass of NaCl: $M = 58.44$ g/mol.
  Moles of NaCl:
  $
  n_("NaCl") = frac(35, 58.44) ≈ 0.599 text(" mol")
  $
  Each NaCl dissociates into Na${}^+$ and Cl${}^-$, giving 2 solute particles per formula unit:
  $
  n_("solute") = 2 times 0.599 ≈ 1.20 text(" mol")
  $
  The van 't Hoff formula gives the osmotic pressure for a dilute solution:
  $
  Pi = frac(n_("solute") R T, V)
  $
  With $V = 1 text(" L") = 10^(-3) text(" m")^3$, $T = 300$ K, and $R = 8.314 text(" J/(mol·K)")$:
  $
  Pi = frac(1.20 times 8.314 times 300, 10^(-3)) ≈ 2.99 times 10^6 text(" Pa") ≈ 29.5 text(" atm")
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Minimum desalination work*

  The minimum work to push a volume $V$ of pure water through the membrane against the osmotic pressure is
  $
  W_("min") = Pi V = 2.99 times 10^6 times 10^(-3) ≈ 3.0 times 10^3 text(" J") ≈ 3.0 text(" kJ")
  $
  This is the thermodynamic lower bound for desalinating one litre of seawater.

  In practice, significantly more work is required because:
  - As water permeates out, the remaining brine becomes more concentrated and $Pi$ increases, so the applied pressure must exceed the initial osmotic pressure.
  - Frictional losses and pressure drops across the membrane dissipate energy.
  - Pumping systems have finite mechanical efficiency.
  - Pre-treatment (filtration, chemical conditioning) requires additional energy input.
]
