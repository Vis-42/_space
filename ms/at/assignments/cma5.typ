#import "../shared/_at.typ": *

#show: ad.with(
  title: "Assignment 5",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("1")[
  *[20 pts] Spring pendulum*

  A spring pendulum consists of a point mass $m$ attached to one end of a massless spring with spring constant $k$. The other end of the spring is tied to a fixed pivot point. When no weight is loaded on the spring, its length is $ℓ_0$. Assume that the motion of the system is confined to a vertical plane. With suitable generalized coordinate(s), derive the equation(s) of motion. Solve the equation(s) of motion in the approximation of small angular and radial displacements from equilibrium.
]

#solution[
  *Generalized coordinates*

  Use polar coordinates $(r, θ)$ where:
  - $r$ = length of spring (distance from pivot to mass)
  - $θ$ = angle from vertical (positive clockwise)

  *Position and velocity*

  Position in Cartesian coordinates (origin at pivot, $y$ downward):
  $ x = r sin θ, quad y = r cos θ $

  Velocity:
  $ dot(x) = dot(r) sin θ + r dot(θ) cos θ $
  $ dot(y) = dot(r) cos θ - r dot(θ) sin θ $

  Speed squared:
  $ v^2 = dot(x)^2 + dot(y)^2 = dot(r)^2 (sin^2 θ + cos^2 θ) + r^2 dot(θ)^2 (cos^2 θ + sin^2 θ) = dot(r)^2 + r^2 dot(θ)^2 $

  *Lagrangian*

  Kinetic energy:
  $ T = 1/2 m v^2 = 1/2 m (dot(r)^2 + r^2 dot(θ)^2) $

  Potential energy (taking pivot as reference, $y$ positive downward):
  $ V = -m g r cos θ + 1/2 k (r - ℓ_0)^2 $

  (gravitational PE is negative since mass hangs below pivot; spring PE with natural length $ℓ_0$)

  Lagrangian:
  $ L = T - V = 1/2 m (dot(r)^2 + r^2 dot(θ)^2) + m g r cos θ - 1/2 k (r - ℓ_0)^2 $

  *Equations of motion*

  For $r$:
  $ dv(L, r) = m r dot(θ)^2 + m g cos θ - k(r - ℓ_0) $

  $ dv(L, dot(r)) = m dot(r), quad dv(, t)(dv(L, dot(r))) = m dot.double(r) $

  Euler-Lagrange equation:
  $ m dot.double(r) = m r dot(θ)^2 + m g cos θ - k(r - ℓ_0) $

  #boxed[$ m dot.double(r) - m r dot(θ)^2 - m g cos θ + k(r - ℓ_0) = 0 $]

  For $θ$:
  $ dv(L, θ) = -m g r sin θ $

  $ dv(L, dot(θ)) = m r^2 dot(θ), quad dv(, t)(dv(L, dot(θ))) = m (2 r dot(r) dot(θ) + r^2 dot.double(θ)) $

  Euler-Lagrange equation:
  $ m (2 r dot(r) dot(θ) + r^2 dot.double(θ)) = -m g r sin θ $

  $ 2 r dot(r) dot(θ) + r^2 dot.double(θ) + g r sin θ = 0 $

  Dividing by $r$:
  #boxed[$ r dot.double(θ) + 2 dot(r) dot(θ) + g sin θ = 0 $]

  Or equivalently:
  #boxed[$ dv(, t)(r^2 dot(θ)) + g r sin θ = 0 $]

  *Equilibrium position*

  At equilibrium: $dot(r) = dot(θ) = dot.double(r) = dot.double(θ) = 0$ and $θ = 0$ (hanging straight down).

  From the $r$ equation with $θ = 0$, $dot(θ) = 0$:
  $ 0 = m g - k(r_"eq" - ℓ_0) $

  #boxed[$ r_"eq" = ℓ_0 + (m g)/k $]

  This is the equilibrium length: natural length plus extension due to weight.

  *Small oscillations about equilibrium*

  Let:
  $ r(t) = r_"eq" + ρ(t), quad θ(t) = ε(t) $

  where $ρ, ε ≪ 1$ (small displacements).

  *Linearized radial equation*

  Substitute $r = r_"eq" + ρ$, $θ = ε$ into the $r$ equation:
  $ m dot.double(ρ) - m (r_"eq" + ρ) dot(ε)^2 - m g cos ε + k ρ = 0 $

  The $r$ equation is:
  $ m dot.double(r) = m r dot(θ)^2 + m g cos θ - k(r - ℓ_0) $

  At equilibrium ($r = r_"eq"$, $θ = 0$, $dot(θ) = 0$):
  $ 0 = m g - k(r_"eq" - ℓ_0) $

  So: $k(r_"eq" - ℓ_0) = m g$

  For small oscillations $r = r_"eq" + ρ$, $θ = ε$:
  $ m dot.double(ρ) = m (r_"eq" + ρ) dot(ε)^2 + m g cos ε - k(r_"eq" + ρ - ℓ_0) $

  Using $k(r_"eq" - ℓ_0) = m g$ and expanding to first order: $cos ε ≈ 1$, $dot(ε)^2 ≈ 0$:
  $ m dot.double(ρ) ≈ -k ρ $

  #boxed[$ dot.double(ρ) + (k/m) ρ = 0 $]

  This gives radial oscillations with frequency:
  #boxed[$ ω_r = sqrt(k/m) $]

  *Linearized angular equation*

  From $r dot.double(θ) + 2 dot(r) dot(θ) + g sin θ = 0$, substitute $r = r_"eq" + ρ$, $θ = ε$:
  $ (r_"eq" + ρ) dot.double(ε) + 2 dot(ρ) dot(ε) + g sin ε = 0 $

  For small $ε$: $sin ε ≈ ε$, and dropping second-order term $ρ dot.double(ε)$ and product $dot(ρ) dot(ε)$:
  $ r_"eq" dot.double(ε) + g ε = 0 $

  #boxed[$ dot.double(ε) + g/r_"eq" ε = 0 $]

  This gives angular oscillations with frequency:
  #boxed[$ ω_θ = sqrt(g/r_"eq") = sqrt(g/(ℓ_0 + m g\/k)) = sqrt((g k)/(k ℓ_0 + m g)) $]

  *Summary of small oscillation solution*

  The radial and angular motions decouple to first order:

  Radial:
  $ ρ(t) = A cos(ω_r t + φ_r), quad ω_r = sqrt(k/m) $

  Angular:
  $ ε(t) = B cos(ω_θ t + φ_θ), quad ω_θ = sqrt(g/r_"eq") $

  where $A, B, φ_r, φ_θ$ are determined by initial conditions.

  #boxed[
    *Complete solution for small oscillations:*

    $r(t) = r_"eq" + A cos(sqrt(k/m) t + φ_r)$

    $θ(t) = B cos(sqrt(g/r_"eq") t + φ_θ)$

    where $r_"eq" = ℓ_0 + m g\/k$
  ]

]

#pagebreak()

#pbm("2")[
  *[20 pts] Time-dependent Lagrangian*

  Consider a one-dimensional mechanical system described by the following Lagrangian function:
  $ L(q(t), dot(q)(t), t) = e^(γ t) [1/2 m dot(q)^2(t) - 1/2 k q^2(t)] $,
  where $γ$, $m$, $k$ are positive constants.

  *(a)* Obtain the Euler-Lagrange equation of motion. Is there any constant of motion? How would you describe the motion?

  *(b)* Now, perform a point transformation to another generalized coordinate given by
  $ Q = Q(q(t), t) = exp(γ t/2) q(t) $.
  Obtain the Lagrangian function and Euler-Lagrange equation of motion in terms of the new generalized coordinate. Is there any constant of motion? How would you describe the relationship between the two solutions given by these two Lagrange functions?
]

#solution[
  *Part (a): Euler-Lagrange equation*

  Given: $L = e^(γ t) [1/2 m dot(q)^2 - 1/2 k q^2]$

  Compute partial derivatives:
  $ dv(L, q) = e^(γ t) · (-k q) = -k q e^(γ t) $

  $ dv(L, dot(q)) = e^(γ t) · m dot(q) = m dot(q) e^(γ t) $

  $ dv(, t)(dv(L, dot(q))) = m dot.double(q) e^(γ t) + m dot(q) · γ e^(γ t) = e^(γ t) (m dot.double(q) + γ m dot(q)) $

  Euler-Lagrange equation:
  $ e^(γ t) (m dot.double(q) + γ m dot(q)) = -k q e^(γ t) $

  Dividing by $e^(γ t)$:
  $ m dot.double(q) + γ m dot(q) + k q = 0 $

  #boxed[$ dot.double(q) + γ dot(q) + ω_0^2 q = 0 $]

  where $ω_0^2 = k/m$.

  This is a damped harmonic oscillator equation with damping coefficient $γ$.

  *Constants of motion*

  Check if energy is conserved. The Jacobi energy (generalized energy) is:
  $ h = dot(q) dv(L, dot(q)) - L = dot(q) · m dot(q) e^(γ t) - e^(γ t) [1/2 m dot(q)^2 - 1/2 k q^2] $

  $ = e^(γ t) [m dot(q)^2 - 1/2 m dot(q)^2 + 1/2 k q^2] = e^(γ t) [1/2 m dot(q)^2 + 1/2 k q^2] $

  Taking time derivative:
  $ dv(h, t) = γ e^(γ t) [1/2 m dot(q)^2 + 1/2 k q^2] + e^(γ t) [m dot(q) dot.double(q) + k q dot(q)] $

  Using the equation of motion $m dot.double(q) = -γ m dot(q) - k q$:
  $ dv(h, t) = γ e^(γ t) [1/2 m dot(q)^2 + 1/2 k q^2] + e^(γ t) dot(q) [-γ m dot(q) - k q + k q] $

  $ = γ e^(γ t) [1/2 m dot(q)^2 + 1/2 k q^2] - γ m dot(q)^2 e^(γ t) $

  $ = γ e^(γ t) [1/2 m dot(q)^2 + 1/2 k q^2 - m dot(q)^2] $

  $ = γ e^(γ t) [-1/2 m dot(q)^2 + 1/2 k q^2] ≠ 0 $

  Therefore, the Jacobi energy is NOT conserved.

  Since $dv(L, t) ≠ 0$ (explicit time dependence), energy is not conserved.

  #boxed[*No constants of motion* (for generic initial conditions)]

  *Description of motion*

  The equation $dot.double(q) + γ dot(q) + ω_0^2 q = 0$ describes a damped harmonic oscillator.

  Define the discriminant: $Δ = γ^2 - 4 ω_0^2$

  *Case 1: Underdamped* ($γ^2 < 4 ω_0^2$)

  Characteristic equation: $r^2 + γ r + ω_0^2 = 0$

  $ r = (-γ ± sqrt(γ^2 - 4 ω_0^2))/(2) = -γ/2 ± i ω_d $

  where $ω_d = sqrt(ω_0^2 - γ^2/4)$ is the damped frequency.

  Solution:
  $ q(t) = e^(-γ t\/2) (A cos(ω_d t) + B sin(ω_d t)) $

  #boxed[$ q(t) = e^(-γ t\/2) C cos(ω_d t - φ) $]

  where $C$ and $φ$ are determined by initial conditions.

  *Case 2: Critically damped* ($γ^2 = 4 ω_0^2$)

  $ r = -γ/2 $ (repeated root)

  Solution:
  #boxed[$ q(t) = (A + B t) e^(-γ t\/2) $]

  *Case 3: Overdamped* ($γ^2 > 4 ω_0^2$)

  $ r = -γ/2 ± sqrt(γ^2/4 - ω_0^2) $

  Solution:
  #boxed[$ q(t) = A e^(r_1 t) + B e^(r_2 t) $]

  where both $r_1, r_2 < 0$ (exponential decay).

  *Physical interpretation*: The time-dependent factor $e^(γ t)$ in the Lagrangian acts as a gauge transformation. The actual motion is that of a damped oscillator, with amplitude decaying as $e^(-γ t\/2)$ (for underdamped case).

  *Part (b): Point transformation*

  Given transformation: $Q = e^(γ t\/2) q$

  Inverse: $q = e^(-γ t\/2) Q$

  Velocity transformation:
  $ dot(q) = dv(, t)(e^(-γ t\/2) Q) = e^(-γ t\/2) dot(Q) + Q · (-γ/2) e^(-γ t\/2) $

  $ = e^(-γ t\/2) (dot(Q) - γ/2 Q) $

  *New Lagrangian*

  Substitute into original Lagrangian:
  $ L &= e^(γ t) [1/2 m dot(q)^2 - 1/2 k q^2] \
    &= e^(γ t) [1/2 m e^(-γ t) (dot(Q) - γ/2 Q)^2 - 1/2 k e^(-γ t) Q^2] \
    &= e^(γ t) · e^(-γ t) [1/2 m (dot(Q) - γ/2 Q)^2 - 1/2 k Q^2] \
    &= 1/2 m (dot(Q) - γ/2 Q)^2 - 1/2 k Q^2 $

  Expanding $(dot(Q) - γ/2 Q)^2 = dot(Q)^2 - γ dot(Q) Q + γ^2/4 Q^2$:
  $ L' &= 1/2 m dot(Q)^2 - 1/2 m γ dot(Q) Q + 1/2 m γ^2/4 Q^2 - 1/2 k Q^2 \
    &= 1/2 m dot(Q)^2 - 1/2 m γ dot(Q) Q + 1/2 (m γ^2/4 - k) Q^2 $

  #boxed[$ L'(Q, dot(Q)) = 1/2 m dot(Q)^2 - (m γ)/2 dot(Q) Q - 1/2 (k - (m γ^2)/4) Q^2 $]

  Note: This Lagrangian does NOT have explicit time dependence!

  *Euler-Lagrange equation in new coordinates*

  $ dv(L', Q) = -(m γ)/2 dot(Q) - (k - (m γ^2)/4) Q $

  $ dv(L', dot(Q)) = m dot(Q) - (m γ)/2 Q $

  $ dv(, t)(dv(L', dot(Q))) = m dot.double(Q) - (m γ)/2 dot(Q) $

  Euler-Lagrange equation:
  $ m dot.double(Q) - (m γ)/2 dot(Q) = -(m γ)/2 dot(Q) - (k - (m γ^2)/4) Q $

  $ m dot.double(Q) = -(k - (m γ^2)/4) Q $

  #boxed[$ dot.double(Q) + (k/m - γ^2/4) Q = 0 $]

  Or:
  #boxed[$ dot.double(Q) + Ω^2 Q = 0 $]

  where $Ω^2 = k/m - γ^2/4 = ω_0^2 - γ^2/4$.

  *Constants of motion in new coordinates*

  Check the Jacobi energy:
  $ h' &= dot(Q) dv(L', dot(Q)) - L' \
    &= dot(Q) (m dot(Q) - (m γ)/2 Q) - [1/2 m dot(Q)^2 - (m γ)/2 dot(Q) Q - 1/2 (k - (m γ^2)/4) Q^2] \
    &= m dot(Q)^2 - (m γ)/2 Q dot(Q) - 1/2 m dot(Q)^2 + (m γ)/2 dot(Q) Q + 1/2 (k - (m γ^2)/4) Q^2 \
    &= 1/2 m dot(Q)^2 + 1/2 (k - (m γ^2)/4) Q^2 $

  #boxed[$ E' = 1/2 m dot(Q)^2 + 1/2 (k - (m γ^2)/4) Q^2 = "const" $]

  Since $L'$ has no explicit time dependence ($dv(L', t) = 0$), this energy IS conserved!

  *Relationship between solutions*

  From $Q = e^(γ t\/2) q$, we have $q = e^(-γ t\/2) Q$.

  The equation for $Q$ is simple harmonic motion (if $Ω^2 > 0$):
  $ Q(t) = A cos(Ω t) + B sin(Ω t) = C cos(Ω t - φ) $

  where $Ω = sqrt(ω_0^2 - γ^2/4)$ (assuming underdamped).

  Therefore:
  $ q(t) = e^(-γ t\/2) Q(t) = e^(-γ t\/2) C cos(Ω t - φ) $

  This matches the solution from part (a) with $ω_d = Ω = sqrt(ω_0^2 - γ^2/4)$!

  #boxed[
    *Relationship:*

    The transformation $Q = e^(γ t\/2) q$ converts the damped oscillator into an undamped one.

    Original system: damped oscillator with decaying amplitude

    New system: simple harmonic oscillator with conserved energy

    Solutions related by: $q(t) = e^(-γ t\/2) Q(t)$
  ]

  *Physical interpretation*

  The time-dependent Lagrangian $L$ can be viewed as arising from a gauge transformation of the simpler Lagrangian $L'$. The exponential factor $e^(γ t)$ in $L$ is absorbed by the coordinate transformation, revealing the underlying simple harmonic motion. The apparent "damping" in the $q$ description is actually a consequence of the time-dependent coordinate system, not energy dissipation.

]

#pagebreak()

#pbm("3")[
  *[30 pts] Particle on rotating hoop*

  A particle of mass $m$ is constrained to slide without friction on a rotating hoop of radius $a$ whose axis of rotation is through a vertical diameter. The hoop is rotating at a constant angular speed $ω$.

  *(a)* With suitable generalized coordinate(s), write down the Lagrangian function of the system. Identify any constant of motion that may exist.

  *(b)* Locate the positions of equilibrium positions of the particle for $ω < ω_c$ and $ω > ω_c$ where $ω_c ≡ sqrt(g/a)$. Which of these equilibrium positions are stable and unstable?

  *(c)* For stable equilibrium, perform a small perturbation about the equilibrium position $θ_0$: $θ(t) = θ_0 + ε(t)$ where $|ε(t)| ≪ θ_0$, determine the oscillation frequency of small amplitude oscillation about the equilibrium point.
]

#solution[
  *Part (a): Lagrangian and constants of motion*

  *Coordinates*

  Use angle $θ$ measured from the top of the hoop (vertical upward direction). The hoop rotates about the vertical diameter with constant angular velocity $ω$.

  In a coordinate system rotating with the hoop, the particle's position is:
  - Distance from axis: $ρ = a sin θ$
  - Height below top: $z = a(1 - cos θ)$ (or $z = -a cos θ$ from center)

  In the fixed (inertial) frame, if we use cylindrical coordinates $(ρ, φ, z)$:
  - $ρ = a sin θ$
  - $φ = ω t + $ (angle in rotating frame) $= ω t$ (if we track particle's azimuthal position)
  - $z = -a cos θ$ (taking hoop center as origin)

  In the rotating frame, the particle has only one degree of freedom: $θ$. The azimuthal angle is fixed in the rotating frame.

  *Velocity in inertial frame*

  Position vector:
  $ arrow(r) = a sin θ (cos(ω t) hat(x) + sin(ω t) hat(y)) - a cos θ hat(z) $

  Velocity:
  $ arrow(v) = dv(arrow(r), t) = a dot(θ) cos θ (cos(ω t) hat(x) + sin(ω t) hat(y)) + a sin θ (-ω sin(ω t) hat(x) + ω cos(ω t) hat(y)) + a dot(θ) sin θ hat(z) $

  Speed squared:
  $ v^2 = a^2 dot(θ)^2 cos^2 θ + a^2 ω^2 sin^2 θ + a^2 dot(θ)^2 sin^2 θ $

  $ = a^2 dot(θ)^2 (cos^2 θ + sin^2 θ) + a^2 ω^2 sin^2 θ $

  $ = a^2 dot(θ)^2 + a^2 ω^2 sin^2 θ $

  *Lagrangian*

  Kinetic energy:
  $ T = 1/2 m v^2 = 1/2 m a^2 dot(θ)^2 + 1/2 m a^2 ω^2 sin^2 θ $

  Potential energy (taking hoop center as reference, $z$ positive upward):
  $ V = -m g a cos θ $

  Lagrangian:
  #boxed[$ L = 1/2 m a^2 dot(θ)^2 + 1/2 m a^2 ω^2 sin^2 θ + m g a cos θ $]

  *Constants of motion*

  Since $ω$ is constant and $L$ has no explicit $t$ dependence, the energy (Jacobi energy) is conserved:

  $ E = dot(θ) dv(L, dot(θ)) - L = 1/2 m a^2 dot(θ)^2 - 1/2 m a^2 ω^2 sin^2 θ - m g a cos θ $

  Defining the effective potential:
  $ V_"eff"(θ) = -1/2 m a^2 ω^2 sin^2 θ - m g a cos θ $

  #boxed[*Conserved quantity:* $E = 1/2 m a^2 dot(θ)^2 + V_"eff"(θ) = "const"$]

  *Part (b): Equilibrium positions*

  *Equation of motion*

  From Euler-Lagrange:
  $ dv(L, θ) = m a^2 ω^2 sin θ cos θ - m g a sin θ $

  $ dv(L, dot(θ)) = m a^2 dot(θ) $

  $ dv(, t)(dv(L, dot(θ))) = m a^2 dot.double(θ) $

  Equation of motion:
  $ m a^2 dot.double(θ) = m a^2 ω^2 sin θ cos θ - m g a sin θ $

  $ dot.double(θ) = ω^2 sin θ cos θ - g/a sin θ $

  #boxed[$ dot.double(θ) = sin θ (ω^2 cos θ - g/a) $]

  *Equilibrium conditions*

  At equilibrium: $dot(θ) = dot.double(θ) = 0$

  From $dot.double(θ) = sin θ (ω^2 cos θ - g/a) = 0$:

  Either $sin θ = 0$ or $ω^2 cos θ - g/a = 0$.

  *Case 1:* $sin θ = 0$
  $ θ = 0 "(top)" quad "or" quad θ = π "(bottom)" $

  *Case 2:* $ω^2 cos θ = g/a$
  $ cos θ = g/(a ω^2) $

  This has real solutions only if $|g/(a ω^2)| ≤ 1$, i.e., $ω^2 ≥ g/a$ or $ω ≥ ω_c$ where:
  $ ω_c = sqrt(g/a) $

  For $ω ≥ ω_c$:
  #boxed[$ θ_± = ± arccos(g/(a ω^2)) $]

  (symmetric positions on either side of vertical)

  *Summary of equilibria:*

  - For all $ω$: $θ = 0$ (top) and $θ = π$ (bottom)
  - For $ω ≥ ω_c$: additionally $θ = ± arccos(g/(a ω^2))$

  *Stability analysis*

  Use effective potential:
  $ V_"eff"(θ) = -1/2 m a^2 ω^2 sin^2 θ - m g a cos θ $

  Or rewrite using $sin^2 θ = 1 - cos^2 θ$:
  $ V_"eff"(θ) = -1/2 m a^2 ω^2 (1 - cos^2 θ) - m g a cos θ $

  $ = -1/2 m a^2 ω^2 + 1/2 m a^2 ω^2 cos^2 θ - m g a cos θ $

  Let $u = cos θ$:
  $ V_"eff"(u) = "const" + 1/2 m a^2 ω^2 u^2 - m g a u $

  Critical points:
  $ dv(V_"eff", u) = m a^2 ω^2 u - m g a = 0 ⟹ u = g/(a ω^2) $

  Second derivative:
  $ dv(V_"eff", u, 2) = m a^2 ω^2 > 0 $

  So $u = g/(a ω^2)$ is a minimum of $V_"eff"$ (stable).

  *At $θ = 0$ (top):*
  $ dv(V_"eff", θ, 2)|_(θ=0) = m g a + m a^2 ω^2 - 2 m a^2 ω^2 = m g a - m a^2 ω^2 $

  $ = m a (g - a ω^2) $

  - If $ω < ω_c$ (i.e., $ω^2 < g/a$): $dv(V_"eff", θ, 2) > 0$ → *stable minimum*
  - If $ω > ω_c$ (i.e., $ω^2 > g/a$): $dv(V_"eff", θ, 2) < 0$ → *unstable maximum*

  *At $θ = π$ (bottom):*
  $ dv(V_"eff", θ, 2)|_(θ=π) = m g a (-1) + m a^2 ω^2 - 2 m a^2 ω^2 $

  $ = -m g a - m a^2 ω^2 < 0 $

  Always *unstable maximum*.

  *At $θ = arccos(g/(a ω^2))$ (for $ω > ω_c$):*

  Let $θ_0 = arccos(g/(a ω^2))$, so $cos θ_0 = g/(a ω^2)$.

  $ dv(V_"eff", θ, 2)|_(θ_0) = m a [g cos θ_0 + a ω^2 - 2 a ω^2 cos^2 θ_0] $

  $ = m a [g^2/(a ω^2) + a ω^2 - (2 g^2)/(a ω^2)] = m (a^2 ω^4 - g^2)/ω^2 $

  For $ω > ω_c = sqrt(g/a)$, we have $a^2 ω^4 > g^2$, so $dv(V_"eff", θ, 2) > 0$ → *stable minimum*.

  #boxed[
    *Equilibrium stability:*

    *For $ω < ω_c$:*
    - $θ = 0$ (top): *stable*
    - $θ = π$ (bottom): *unstable*

    *For $ω > ω_c$:*
    - $θ = 0$ (top): *unstable*
    - $θ = π$ (bottom): *unstable*
    - $θ = ± arccos(g\/(a ω^2))$: *stable*
  ]

  *Physical interpretation*: Below critical speed $ω_c$, the particle prefers to stay at the top. Above $ω_c$, centrifugal effects dominate, and the particle moves to tilted equilibrium positions where gravitational and centrifugal forces balance.

  *Part (c): Frequency of small oscillations*

  For a stable equilibrium at $θ = θ_0$, linearize about this point.

  Let $θ(t) = θ_0 + ε(t)$ where $|ε| ≪ 1$.

  From the equation of motion:
  $ dot.double(θ) = sin θ (ω^2 cos θ - g/a) $

  Expand to first order in $ε$:
  $ sin θ = sin(θ_0 + ε) ≈ sin θ_0 + ε cos θ_0 $
  $ cos θ = cos(θ_0 + ε) ≈ cos θ_0 - ε sin θ_0 $

  $ dot.double(ε) ≈ (sin θ_0 + ε cos θ_0)(ω^2 (cos θ_0 - ε sin θ_0) - g/a) $

  At equilibrium: $sin θ_0 (ω^2 cos θ_0 - g/a) = 0$

  Expanding:
  $ dot.double(ε) ≈ sin θ_0 · ω^2 (cos θ_0 - ε sin θ_0) + ε cos θ_0 (ω^2 cos θ_0 - g/a) - sin θ_0 · g/a $

  Using equilibrium condition (either $sin θ_0 = 0$ or $ω^2 cos θ_0 = g/a$):

  *Case: $θ_0 = 0$ (top, stable for $ω < ω_c$)*

  $sin θ_0 = 0$, $cos θ_0 = 1$:

  $ dot.double(ε) ≈ ε (ω^2 - g/a) $

  For stability, $ω^2 - g/a < 0$ (i.e., $ω < ω_c$):

  $ dot.double(ε) + (g/a - ω^2) ε = 0 $

  #boxed[$ Ω = sqrt(g/a - ω^2) = sqrt(ω_c^2 - ω^2) $]

  *Case: $θ_0 = arccos(g/(a ω^2))$ (tilted, stable for $ω > ω_c$)*

  At this equilibrium: $ω^2 cos θ_0 = g/a$. Using the effective potential approach:

  $ dot.double(θ) = -(1)/(m a^2) dv(V_"eff", θ) $

  Linearizing about $θ_0$:
  $ dot.double(ε) = -(1)/(m a^2) dv(V_"eff", θ, 2)|_(θ_0) ε $

  From earlier: $dv(V_"eff", θ, 2)|_(θ_0) = m a^2 ω^2 - (m g^2)/ω^2$

  $ dot.double(ε) = -(ω^2 - g^2/(a^2 ω^2)) ε $

  $ dot.double(ε) + (a^2 ω^4 - g^2)/(a^2 ω^2) ε = 0 $

  #boxed[$ Ω = (sqrt(a^2 ω^4 - g^2))/(a ω) = ω sqrt(1 - ω_c^4/ω^4) $]

]

#pagebreak()

#pbm("4")[
  *[30 pts] Rotating coordinate system*

  A particle of mass $m$ is acted on by a force whose potential energy is $U(r)$.

  *(a)* Obtain the Lagrangian function in a spherical coordinate system which is rotating with constant angular speed $Ω$ about the $z$-axis.

  *(b)* Show that your Lagrangian function has the same form as in a fixed coordinate system with the addition of a velocity-dependent potential energy function $U'$ which gives the centrifugal and Coriolis forces.

  *(c)* Calculate from the velocity-dependent potential $U'$ the components of the centrifugal and Coriolis forces in the radial and azimuthal directions.
]

#solution[
  *Part (a): Lagrangian in rotating coordinates*

  *Coordinate systems*

  Fixed (inertial) frame: spherical coordinates $(r, θ, φ_"fixed")$

  Rotating frame: spherical coordinates $(r, θ, φ_"rot")$ rotating at angular velocity $Ω$ about $z$-axis

  Relationship: $φ_"fixed" = φ_"rot" + Ω t$

  In the rotating frame, we use coordinates $(r, θ, φ)$ where $φ = φ_"rot"$.

  *Velocity in inertial frame*

  Position vector in spherical coordinates:
  $ arrow(r) = r hat(r) $

  where $hat(r)$ is the radial unit vector.

  In the inertial frame, the velocity is:
  $ arrow(v)_"inertial" = dot(r) hat(r) + r dot(θ) hat(θ) + r sin θ dot(φ)_"fixed" hat(φ) $

  where $hat(θ)$ and $hat(φ)$ are the standard spherical basis vectors.

  Since $φ_"fixed" = φ + Ω t$:
  $ dot(φ)_"fixed" = dot(φ) + Ω $

  Therefore:
  $ arrow(v)_"inertial" = dot(r) hat(r) + r dot(θ) hat(θ) + r sin θ (dot(φ) + Ω) hat(φ) $

  *Kinetic energy*

  $ T = 1/2 m v_"inertial"^2 = 1/2 m [dot(r)^2 + r^2 dot(θ)^2 + r^2 sin^2 θ (dot(φ) + Ω)^2] $

  Expanding:
  $ T = 1/2 m [dot(r)^2 + r^2 dot(θ)^2 + r^2 sin^2 θ (dot(φ)^2 + 2 dot(φ) Ω + Ω^2)] $

  #boxed[$ T = 1/2 m [dot(r)^2 + r^2 dot(θ)^2 + r^2 sin^2 θ dot(φ)^2] + m r^2 sin^2 θ Ω dot(φ) + 1/2 m r^2 sin^2 θ Ω^2 $]

  *Lagrangian*

  The potential $U$ depends only on $r = |arrow(r)|$, so:

  #boxed[$ L = 1/2 m [dot(r)^2 + r^2 dot(θ)^2 + r^2 sin^2 θ dot(φ)^2] + m r^2 sin^2 θ Ω dot(φ) + 1/2 m r^2 sin^2 θ Ω^2 - U(r) $]

  *Part (b): Velocity-dependent potential*

  The Lagrangian in a fixed (non-rotating) frame would be:
  $ L_"fixed" = 1/2 m [dot(r)^2 + r^2 dot(θ)^2 + r^2 sin^2 θ dot(φ)^2] - U(r) $

  Comparing with the rotating frame Lagrangian:
  $ L = L_"fixed" + m r^2 sin^2 θ Ω dot(φ) + 1/2 m r^2 sin^2 θ Ω^2 $

  The additional terms can be written as:
  $ U' = -m r^2 sin^2 θ Ω dot(φ) - 1/2 m r^2 sin^2 θ Ω^2 $

  So:
  #boxed[$ L = L_"fixed" - U'(r, θ, dot(φ)) $]

  where:
  #boxed[$ U' = m r^2 sin^2 θ Ω dot(φ) + 1/2 m r^2 sin^2 θ Ω^2 $]

  This is a *velocity-dependent potential* (depends on $dot(φ)$).

  *Generalized forces from $U'$*

  The generalized force is:
  $ Q_i = -dv(U', q_i) + dv(, t)(dv(U', dot(q)_i)) $

  For $r$:
  $ dv(U', r) = 2 m r sin^2 θ Ω dot(φ) + m r sin^2 θ Ω^2 $

  $ dv(U', dot(r)) = 0 ⟹ dv(, t)(dv(U', dot(r))) = 0 $

  $ Q_r = -2 m r sin^2 θ Ω dot(φ) - m r sin^2 θ Ω^2 $

  For $θ$:
  $ dv(U', θ) = 2 m r^2 sin θ cos θ Ω dot(φ) + m r^2 sin θ cos θ Ω^2 $

  $ Q_θ = -2 m r^2 sin θ cos θ Ω dot(φ) - m r^2 sin θ cos θ Ω^2 $

  For $φ$:
  $ dv(U', φ) = 0 $

  $ dv(U', dot(φ)) = m r^2 sin^2 θ Ω $

  $ Q_φ = -0 + dv(, t)(m r^2 sin^2 θ Ω) = m Ω dv(, t)(r^2 sin^2 θ) $

  $ = m Ω (2 r dot(r) sin^2 θ + r^2 · 2 sin θ cos θ dot(θ)) $

  $ = 2 m Ω sin θ (r dot(r) sin θ + r^2 cos θ dot(θ)) $

  *Part (c): Centrifugal and Coriolis forces*

  The pseudo-forces in the rotating frame are the centrifugal force and Coriolis force.

  From the velocity-dependent potential $U'$, we can identify:

  *Centrifugal potential:*
  $ U_"centrifugal" = -1/2 m r^2 sin^2 θ Ω^2 = -1/2 m Ω^2 ρ^2 $

  where $ρ = r sin θ$ is the perpendicular distance from the rotation axis.

  The centrifugal force is:
  $ arrow(F)_"centrifugal" = -gradient U_"centrifugal" = m Ω^2 ρ hat(ρ) $

  (outward, perpendicular to rotation axis)

  *Coriolis potential:*
  $ U_"Coriolis" = -m r^2 sin^2 θ Ω dot(φ) $

  This is velocity-dependent, giving the Coriolis force.

  *Components of forces*

  In spherical coordinates, the position-dependent parts of $Q_r, Q_θ$ give:

  From $Q_r = -2 m r sin^2 θ Ω dot(φ) - m r sin^2 θ Ω^2$:

  - Centrifugal (from $-m r sin^2 θ Ω^2$):
    #boxed[$ F_r^"(centrifugal)" = m r sin^2 θ Ω^2 = m Ω^2 ρ^2/r $]

    (outward radial component)

  - Coriolis (from $-2 m r sin^2 θ Ω dot(φ)$):
    #boxed[$ F_r^"(Coriolis)" = 2 m r sin^2 θ Ω dot(φ) $]

  From $Q_θ = -2 m r^2 sin θ cos θ Ω dot(φ) - m r^2 sin θ cos θ Ω^2$:

  - Centrifugal:
    #boxed[$ F_θ^"(centrifugal)" = m r^2 sin θ cos θ Ω^2 = m r sin θ cos θ Ω^2 · r $]

  - Coriolis:
    #boxed[$ F_θ^"(Coriolis)" = 2 m r^2 sin θ cos θ Ω dot(φ) $]

  From $Q_φ$:

  The azimuthal force comes from:
  $ Q_φ = 2 m Ω sin θ (r dot(r) sin θ + r^2 cos θ dot(θ)) $

  This is purely Coriolis (velocity-dependent):
  #boxed[$ F_φ^"(Coriolis)" = 2 m Ω sin θ (r dot(r) sin θ + r^2 cos θ dot(θ)) $]

  (no centrifugal component in azimuthal direction, as centrifugal force is radial)

  *Summary in component form*

  #boxed[
    *Centrifugal force:*

    $F_r^"(cent)" = m Ω^2 r sin^2 θ$

    $F_θ^"(cent)" = m Ω^2 r sin θ cos θ$

    $F_φ^"(cent)" = 0$

    *Coriolis force:*

    $F_r^"(Cor)" = 2 m Ω r sin^2 θ dot(φ)$

    $F_θ^"(Cor)" = 2 m Ω r^2 sin θ cos θ dot(φ)$

    $F_φ^"(Cor)" = 2 m Ω r sin θ (dot(r) sin θ + r dot(θ) cos θ)$
  ]

  *Physical interpretation*

  - *Centrifugal force*: Points outward from the rotation axis, with magnitude $m Ω^2 ρ$ where $ρ = r sin θ$ is the perpendicular distance from axis. Components:
    - Radial: $m Ω^2 r sin^2 θ$ (outward)
    - Polar: $m Ω^2 r sin θ cos θ$ (toward equator if in northern hemisphere)

  - *Coriolis force*: Perpendicular to velocity in rotating frame, given by $arrow(F)_"Cor" = -2 m arrow(Ω) times arrow(v)_"rot"$. Components depend on velocities $dot(r), dot(θ), dot(φ)$.

  *Vector form*

  In Cartesian coordinates, these are:
  $ arrow(F)_"centrifugal" = m Ω^2 ρ hat(ρ) = m arrow(Ω) times (arrow(Ω) times arrow(r)) $

  $ arrow(F)_"Coriolis" = -2 m arrow(Ω) times arrow(v)_"rot" $

  where $arrow(Ω) = Ω hat(z)$ and $arrow(v)_"rot" = dot(r) hat(r) + r dot(θ) hat(θ) + r sin θ dot(φ) hat(φ)$.

]
