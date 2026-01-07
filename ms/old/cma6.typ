#import "../shared/_at.typ": *

#show: ad.with(
  title: "Assignment 6",
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
  *[40 pts] Beads on rotating hoop*

  Consider a system consisting of two beads, a massless spring and a circular light hoop. The beads are connected by the spring and they slide without friction on the hoop. The hoop lies in the $y z$-plane with its center at the origin of the coordinate system. The $y z$-plane is horizontal and the spring is parallel to the $y$-axis. Each bead has mass $m$, the force constant of the spring is $k$ and the radius of the hoop is $R$. The equilibrium length $2r_0$ of the spring is less that the diameter of the hoop, i.e. $r_0 < R$. Suppose the hoop rotates about the $z$-axis with a constant angular speed $ω$.

  #fig(image("../../../../_zss/d 88.png"), width:40%, border: false)

  *(a)* Express the Lagrangian in terms of cylindrical coordinates and show that it can be written in the one-dimensional form:
  $ L = 1/2 μ dot(z)^2 - V_"eff"(z) $,
  where $μ$ is the position-dependent effective mass and $V_"eff"$ is the one-dimensional effective potential. Determine the expressions for $μ$ and $V_"eff"(z)$.

  *(b)* Determine the equilibrium points $z_ω$ of the beads. And, determine the stability of these equilibrium points. Show that there exists a critical angular speed $ω_"crit"$ at which the stability of these equilibrium points should depend on whether $ω > ω_"crit"$, $ω = ω_"crit"$ or $ω < ω_"crit"$ respectively.

  *(c)* Now, suppose the axis of rotation of the hoop is turned through an angle $α$ about the $y$-axis. Determine the effect of a uniform gravitational field $arrow(g) = -g vu(e)_x$ on the above results.

  *(d)* Determine the angular frequencies of small oscillations about the equilibrium points when $α = 0$. Express the results in terms of $ω$, $ω_"crit"$ and $ω_0 ≡ sqrt(2k/m)$.

  *Remark:* This system is a mechanical equivalent of a thermodynamic system where the state is characterized by three physical variables: $z_ω$, $ω$ and $g$. This simple system provides insights into topics like spontaneous symmetry breaking, phase transitions, order parameters and critical exponents in the thermodynamic system. The angular speed $ω$ is analogous to the temperature in a thermodynamic system. The equilibrium positions $z_ω$ play the role of an order parameter which 'spontaneously' acquires a non-zero value growing as $sqrt(ω_"crit" - ω)$ just below $ω_"crit"$. The critical exponent for this order parameter is $1/2$ which is very familiar in the Landau theory for various systems with second-order phase transitions. The role of the gravitational force is to cause an explicit symmetry breaking illustrating the difference between explicit and spontaneous symmetry breaking.
]

#solution[
  *Part (a): Lagrangian and effective potential*

  *Setup and coordinates*

  Two beads on circular hoop in $y z$-plane, radius $R$. Hoop rotates about $z$-axis at constant $ω$.

  Use cylindrical coordinates $(ρ, φ, z)$ where:
  - $ρ$ = perpendicular distance from $z$-axis
  - $φ$ = azimuthal angle (increases with rotation)
  - $z$ = height along rotation axis

  Constraint (on hoop): $ρ^2 + z^2 = R^2$, so $ρ = sqrt(R^2 - z^2)$

  *Positions of beads*

  By symmetry of the rotating system and spring force, the two beads remain symmetrically placed in the rotating frame, both at the same height $z$ but on opposite sides of the hoop (separated by angle $\pi$):

  Bead 1: $(ρ, φ_1, z_1) = (sqrt(R^2 - z^2), ω t, z)$

  Bead 2: $(ρ, φ_2, z_2) = (sqrt(R^2 - z^2), ω t + π, z)$

  Both beads are at the same $z$-coordinate, but on opposite sides of the hoop in the $x y$-plane.

  Due to symmetry, we need only one generalized coordinate: $z$ (position along $z$-axis, same for both beads).

  *Velocity of bead 1 in inertial frame*

  Position in Cartesian:
  $ x_1 = ρ cos(ω t) = sqrt(R^2 - z^2) cos(ω t) $
  $ y_1 = ρ sin(ω t) = sqrt(R^2 - z^2) sin(ω t) $
  $ z_1 = z $

  Velocity:
  $ dot(x)_1 = (-z dot(z))/sqrt(R^2 - z^2) cos(ω t) - ω sqrt(R^2 - z^2) sin(ω t) $

  $ dot(y)_1 = (-z dot(z))/sqrt(R^2 - z^2) sin(ω t) + ω sqrt(R^2 - z^2) cos(ω t) $

  $ dot(z)_1 = dot(z) $

  Speed squared:
  $ v_1^2 = dot(x)_1^2 + dot(y)_1^2 + dot(z)_1^2 $

  $ = (z^2 dot(z)^2)/(R^2 - z^2) (cos^2(ω t) + sin^2(ω t)) + ω^2 (R^2 - z^2)(sin^2(ω t) + cos^2(ω t)) $
  $ quad + (z dot(z) ω sqrt(R^2 - z^2))/sqrt(R^2 - z^2) (-cos(ω t) sin(ω t) + sin(ω t) cos(ω t)) + dot(z)^2 $

  $ = (z^2 dot(z)^2)/(R^2 - z^2) + ω^2 (R^2 - z^2) + dot(z)^2 $

  $ = dot(z)^2 ((z^2)/(R^2 - z^2) + 1) + ω^2 (R^2 - z^2) $

  $ = dot(z)^2 (R^2)/(R^2 - z^2) + ω^2 (R^2 - z^2) $

  *Kinetic energy*

  By symmetry, bead 2 has the same kinetic energy:
  $ T = 2 · 1/2 m v_1^2 = m [dot(z)^2 (R^2)/(R^2 - z^2) + ω^2 (R^2 - z^2)] $

  $ = (m R^2 dot(z)^2)/(R^2 - z^2) + m ω^2 (R^2 - z^2) $

  *Potential energy*

  Distance between beads:
  - Bead 1 at $(ρ cos 0, ρ sin 0, z) = (ρ, 0, z)$ in rotating frame
  - Bead 2 at $(ρ cos π, ρ sin π, z) = (-ρ, 0, z)$ in rotating frame

  Distance in 3D:
  $ d^2 = (ρ - (-ρ))^2 + (0 - 0)^2 + (z - z)^2 = 4ρ^2 = 4(R^2 - z^2) $

  $ d = 2ρ = 2sqrt(R^2 - z^2) $

  Spring potential energy:
  $ V_"spring" = 1/2 k (d - 2r_0)^2 = 1/2 k (2sqrt(R^2 - z^2) - 2r_0)^2 = 2k(sqrt(R^2 - z^2) - r_0)^2 $

  *Lagrangian*

  $ L = T - V = (m R^2 dot(z)^2)/(R^2 - z^2) + m ω^2 (R^2 - z^2) - 2k(sqrt(R^2 - z^2) - r_0)^2 $

  Rearranging:
  $ L = (m R^2)/(R^2 - z^2) dot(z)^2 - [2k(sqrt(R^2 - z^2) - r_0)^2 - m ω^2 (R^2 - z^2)] $

  This is of the form $L = 1/2 μ(z) dot(z)^2 - V_"eff"(z)$ where:

  #boxed[$ μ(z) = (2 m R^2)/(R^2 - z^2) $]

  #boxed[$ V_"eff"(z) = 2k(sqrt(R^2 - z^2) - r_0)^2 - m ω^2 (R^2 - z^2) $]

  *Simplified form*

  Let $ρ = sqrt(R^2 - z^2)$. Then:

  #boxed[
    $μ = (2 m R^2)/ρ^2$

    $V_"eff" = 2k(ρ - r_0)^2 - m ω^2 ρ^2$
  ]

  *Part (b): Equilibrium points and stability*

  *Equation of motion*

  The Euler-Lagrange equation with $z$-dependent mass $μ(z)$:
  $ dv(, t)(μ(z) dot(z)) = dv(L, z) $

  At equilibrium: $dot(z) = 0$ and $dv(V_"eff", z) = 0$

  Using $V_"eff" = 2k(sqrt(R^2 - z^2) - r_0)^2 - m ω^2 (R^2 - z^2)$:
  $ dv(V_"eff", z) &= 2k · 2(sqrt(R^2 - z^2) - r_0) · (-z)/sqrt(R^2 - z^2) - m ω^2 · (-2z) \
    &= -(4k z)/sqrt(R^2 - z^2) (sqrt(R^2 - z^2) - r_0) + 2 m ω^2 z \
    &= z [-(4k(R^2 - z^2) - 4k r_0 sqrt(R^2 - z^2))/sqrt(R^2 - z^2) + 2 m ω^2] \
    &= z [-(4k sqrt(R^2 - z^2) - (4k r_0))/sqrt(R^2 - z^2) + 2 m ω^2] $

  For equilibrium, either $z = 0$ or the bracket vanishes.

  *Equilibrium 1:* $z = 0$ (equatorial plane)

  At $z = 0$: $ρ = R$, distance $d = 2R$

  Using $ρ = sqrt(R^2 - z^2)$:

  $ dv(V_"eff", z) = dv(V_"eff", ρ) · dv(ρ, z) = dv(V_"eff", ρ) · (-z)/sqrt(R^2 - z^2) = -dv(V_"eff", ρ) · z/ρ $

  So equilibrium when $z = 0$ or $dv(V_"eff", ρ) = 0$.

  $ dv(V_"eff", ρ) = 2k · 2(ρ - r_0) - 2 m ω^2 ρ $

  $ = 4k(ρ - r_0) - 2 m ω^2 ρ $

  $ = 4k ρ - 4k r_0 - 2 m ω^2 ρ $

  $ = 2ρ(2k - m ω^2) - 4k r_0 $

  Setting to zero:
  $ 2ρ(2k - m ω^2) = 4k r_0 $

  #boxed[$ ρ_ω = (2k r_0)/(2k - m ω^2) $]

  This is physical (positive) only if $2k - m ω^2 > 0$, i.e., $ω < sqrt(2k/m) = ω_0$.

  Also need $ρ_ω ≤ R$:
  $ (2k r_0)/(2k - m ω^2) ≤ R $

  $ 2k r_0 ≤ R(2k - m ω^2) $

  $ m ω^2 R ≤ 2R k - 2k r_0 $

  $ ω^2 ≤ (2k)/m (1 - r_0/R) $

  Define critical frequency:
  #boxed[$ ω_"crit" = sqrt((2k)/m (1 - r_0/R)) = ω_0 sqrt(1 - r_0/R) $]

  where $ω_0 = sqrt(2k/m)$ as given in part (d).

  *Summary of equilibria:*

  1. *$z = 0$* (beads at equator): Always an equilibrium

  2. *$ρ = ρ_ω$* (equivalently, $z = ±sqrt(R^2 - ρ_ω^2)$): Exists only for $ω < ω_"crit"$

  *Stability analysis*

  Use second derivative test. At $z = 0$ (equivalently $ρ = R$):

  $ dv(V_"eff", ρ, 2)|_(ρ=R) = 4k - 2m ω^2 = 2m(2k/m - ω^2) = 2m(ω_0^2 - ω^2) $

  Since $dv(V_"eff", z) = -dv(V_"eff", ρ) · z/ρ$, stability in $z$ requires $dv(V_"eff", ρ, 2) > 0$ at $ρ = R$.

  - If $ω < ω_0 = sqrt(2k/m)$: $dv(V_"eff", ρ, 2) > 0$ → *stable*
  - If $ω > ω_0 = sqrt(2k/m)$: $dv(V_"eff", ρ, 2) < 0$ → *unstable*

  Note that $ω_"crit" = ω_0 sqrt(1 - r_0/R) < ω_0$.

  At $ρ = ρ_ω$ (when it exists for $ω < ω_"crit"$):
  $ dv(V_"eff", ρ, 2) = 4k - 2m ω^2 = 2m(ω_0^2 - ω^2) $

  This is the same expression, which is always positive for $ω < ω_0$.

  The effective potential in $ρ$ is:
  $ V_"eff"(ρ) = 2k(ρ - r_0)^2 - m ω^2 ρ^2 $

  This is valid only for $0 ≤ ρ ≤ R$. The equilibrium at $z = 0$ corresponds to $ρ = R$, which is a *boundary* of the allowed region.

  For $ω < ω_"crit"$, there exists an interior equilibrium at $ρ = ρ_ω < R$. At this point $dv(V_"eff", ρ) = 0$ and $dv(V_"eff", ρ, 2) > 0$, so it's a stable minimum. The boundary point $ρ = R$ then becomes unstable.

  For $ω > ω_"crit"$, there's no interior equilibrium ($ρ_ω > R$ would be unphysical), so $ρ = R$ is the only equilibrium and it's stable.

  #boxed[
    *Equilibrium positions:*

    *For all $ω$:* $z = 0$ (equator, $ρ = R$)

    *For $ω < ω_"crit"$:* $z = ±z_ω$ where $z_ω = sqrt(R^2 - ρ_ω^2)$ and $ρ_ω = (2k r_0)/(2k - m ω^2)$

    *Stability:*

    *For $ω < ω_"crit"$:*
    - $z = 0$: unstable (interior minimum exists)
    - $z = ±z_ω$: stable

    *For $ω > ω_"crit"$:*
    - $z = 0$: stable (only equilibrium)

    *Critical frequency:* $ω_"crit" = ω_0 sqrt(1 - r_0/R)$ where $ω_0 = sqrt(2k/m)$
  ]

  This exhibits *spontaneous symmetry breaking*: below $ω_"crit"$, the symmetric configuration ($z=0$) becomes unstable, and beads move to asymmetric positions $±z_ω$.

  *Part (c): Effect of gravity with tilted axis*

  When rotation axis is tilted by angle $α$ about $y$-axis, with gravity $arrow(g) = -g hat(x)$:

  Original setup: $z$-axis is rotation axis
  After tilt: rotation axis makes angle $α$ with vertical $z$-axis

  In the tilted frame, gravity has components both parallel and perpendicular to the rotation axis.

  Gravitational potential energy for the two beads:
  - Bead 1: height $h_1 = z cos α - ρ cos(ω t) sin α$
  - Bead 2: height $h_2 = -z cos α - ρ cos(ω t + π) sin α = -z cos α + ρ cos(ω t) sin α$

  Total gravitational PE:
  $ V_"grav" = m g (h_1 + h_2) = m g · 0 = 0 $

  With $arrow(g) = -g hat(x)$, the gravitational potential is $V = m g x$ for each bead.

  For bead 1: $x_1 = ρ cos(ω t)$
  For bead 2: $x_2 = ρ cos(ω t + π) = -ρ cos(ω t)$

  So: $V_"grav" = m g (x_1 + x_2) = m g · 0 = 0$

  The gravitational contributions cancel due to symmetry!

  However, if the axis is tilted through angle $α$ about $y$-axis:
  - New $z'$-axis (rotation axis) is at angle $α$ from $z$-axis
  - Gravity is in $-x$ direction

  The component of gravity along the rotation axis creates an effective force that breaks the symmetry.

  After tilt, in the rotating frame aligned with the new axis:
  $ V_"grav" = m g (x_1 + x_2) $

  where positions depend on $α$.

  #boxed[
  *Effect of tilted axis with gravity:*

  When $α ≠ 0$, gravity creates time-dependent perturbations in the rotating frame. The effective potential gains a term proportional to $2 m g ρ sin α cos(ω t)$, breaking rotational symmetry and causing forced oscillations at frequency $ω$ and parametric resonance effects.

  For $α = 0$ (original problem), gravitational effects cancel by symmetry.
  ]

  *Part (d): Frequencies of small oscillations ($α = 0$)*

  *Case 1: $ω > ω_"crit"$ (equilibrium at $z = 0$)*

  Near $z = 0$, expand $V_"eff"(z)$ to second order:

  $ V_"eff"(z) ≈ V_"eff"(0) + 1/2 V_"eff"''(0) z^2 $

  From $V_"eff"(ρ) = 2k(ρ - r_0)^2 - m ω^2 ρ^2$ with $ρ = sqrt(R^2 - z^2)$:

  At $z = 0$: $ρ = R$

  $ dv(ρ, z)|_(z=0) = -z/sqrt(R^2 - z^2)|_(z=0) = 0 $

  $ dv(ρ, z, 2)|_(z=0) = dv(, z)(-z/sqrt(R^2 - z^2)) = -(1/sqrt(R^2 - z^2) + z^2/(R^2 - z^2)^(3/2))|_(z=0) = -1/R $

  So:
  $ dv(V_"eff", z, 2)|_(z=0) = dv(V_"eff", ρ, 2) (dv(ρ, z))^2 + dv(V_"eff", ρ) dv(ρ, z, 2) $

  $ = dv(V_"eff", ρ, 2) · 0 + dv(V_"eff", ρ)|_(ρ=R) · (-1/R) $

  At equilibrium $z=0$:
  $ dv(V_"eff", z)|_(z=0) = -z/ρ · dv(V_"eff", ρ)|_(ρ=R) = 0 $

  This is automatically zero regardless of $dv(V_"eff", ρ)|_(ρ=R)$.

  For the second derivative, use:
  $ dv(V_"eff", z, 2) = dv(, z)(dv(V_"eff", ρ) dv(ρ, z)) $

  At $z = 0$:
  $ dv(V_"eff", z, 2)|_(z=0) = [dv(V_"eff", ρ, 2) (dv(ρ, z))^2 + dv(V_"eff", ρ) dv(ρ, z, 2)]|_(z=0) $

  $ = 0 + dv(V_"eff", ρ)|_(ρ=R) · (-1/R) $

  $ = -(4k R - 4k r_0 - 2m ω^2 R)/R $

  $ = -4k + (4k r_0)/R + 2m ω^2 $

  $ = 2m ω^2 + (4k r_0)/R - 4k $

  $ = 2m[ω^2 - (2k)/m(1 - r_0/R)] $

  $ = 2m(ω^2 - ω_"crit"^2) $

  The equation of motion near $z=0$ with $μ(0) = 2m R^2/R^2 = 2m$:

  $ 2m dot.double(z) ≈ -2m(ω^2 - ω_"crit"^2) z $

  $ dot.double(z) + (ω^2 - ω_"crit"^2) z = 0 $

  For $ω > ω_"crit"$:

  #boxed[$ Ω_1 = sqrt(ω^2 - ω_"crit"^2) $]

  *Case 2: $ω < ω_"crit"$ (equilibrium at $z = z_ω$)*

  At the off-equator equilibrium $ρ = ρ_ω$, where $dv(V_"eff", ρ) = 0$:

  The curvature is:
  $ dv(V_"eff", ρ, 2)|_(ρ_ω) = 4k - 2m ω^2 = 2m(2k/m - ω^2) = 2m(ω_0^2 - ω^2) $

  Converting to $z$-coordinate with $z_ω = sqrt(R^2 - ρ_ω^2)$:

  $ μ(z_ω) = (2m R^2)/ρ_ω^2 $

  The effective restoring force:
  $ dv(V_"eff", z, 2)|_(z_ω) = (z_ω/ρ_ω)^2 dv(V_"eff", ρ, 2)|_(ρ_ω) = (z_ω/ρ_ω)^2 · 2m(ω_0^2 - ω^2) $

  Equation of motion:
  $ (2m R^2)/ρ_ω^2 dot.double(z) = -(z_ω/ρ_ω)^2 · 2m(ω_0^2 - ω^2) z $

  $ dot.double(z) = -(z_ω^2)/(R^2) (ω_0^2 - ω^2) z $

  $ dot.double(z) + (R^2 - ρ_ω^2)/R^2 (ω_0^2 - ω^2) z = 0 $

  Since $z_ω^2 = R^2 - ρ_ω^2$:

  $ dot.double(z) + (z_ω^2)/(R^2) (ω_0^2 - ω^2) z = 0 $

  For small oscillations about $z = z_ω$, the frequency is:

  $ Ω^2 = (z_ω^2)/(R^2) (ω_0^2 - ω^2) $

  At $ρ = ρ_ω$, the second derivative in $ρ$ coordinates gives the oscillation frequency directly.

  #boxed[
    *Oscillation frequencies ($α = 0$):*

    *For $ω > ω_"crit"$ (equilibrium at $z = 0$):*

    $Ω = sqrt(ω^2 - ω_"crit"^2)$

    *For $ω < ω_"crit"$ (equilibrium at $z = ±z_ω$):*

    $Ω = sqrt(ω_0^2 - ω^2)$

    where $ω_0 = sqrt(2k/m)$ and $ω_"crit" = ω_0 sqrt(1 - r_0/R)$
  ]

]

#pagebreak()

#pbm("2")[
  *[30 pts] Particles on rail*

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 67.png"), width:100%, border: false),
    [A system consists of two identical particles $P_1$ and $P_2$ of mass $m$ connected by a light inextensible string of length $a$. The particle $P_1$ is constrained to move along a fixed smooth horizontal rail and the whole system moves under uniform gravity in the vertical plane through the rail.],
  )


  *(a)* Using $x$ and $θ$ as generalized coordinates, find the Hamiltonian of the system.

  *(b)* Hence, obtain differential equations for $x$ and $θ$ governing the dynamics of the system.
]

#solution[
  *Part (a): Hamiltonian*

  *Setup and coordinates*

  - Particle $P_1$: mass $m$, on horizontal rail at position $x$
  - Particle $P_2$: mass $m$, hangs from $P_1$ by string length $a$
  - String makes angle $θ$ from vertical

  Choose origin on the rail at initial position of $P_1$, $y$-axis pointing downward.

  *Positions*

  $P_1$: $(x, 0)$

  $P_2$: $(x + a sin θ, a cos θ)$

  *Velocities*

  $P_1$: $(dot(x), 0)$

  $P_2$: $(dot(x) + a dot(θ) cos θ, -a dot(θ) sin θ)$

  *Kinetic energy*

  $ T = 1/2 m dot(x)^2 + 1/2 m [(dot(x) + a dot(θ) cos θ)^2 + a^2 dot(θ)^2 sin^2 θ] $

  $ = 1/2 m dot(x)^2 + 1/2 m [dot(x)^2 + 2 dot(x) a dot(θ) cos θ + a^2 dot(θ)^2 cos^2 θ + a^2 dot(θ)^2 sin^2 θ] $

  $ = 1/2 m dot(x)^2 + 1/2 m [dot(x)^2 + 2 dot(x) a dot(θ) cos θ + a^2 dot(θ)^2] $

  $ = m dot(x)^2 + m dot(x) a dot(θ) cos θ + 1/2 m a^2 dot(θ)^2 $

  *Potential energy*

  Taking the rail as reference ($y = 0$):

  $ V = 0 + m g a cos θ = m g a cos θ $

  *Lagrangian*

  $ L = T - V = m dot(x)^2 + m dot(x) a dot(θ) cos θ + 1/2 m a^2 dot(θ)^2 - m g a cos θ $

  *Canonical momenta*

  $ p_x = dv(L, dot(x)) = 2m dot(x) + m a dot(θ) cos θ $

  $ p_θ = dv(L, dot(θ)) = m a dot(x) cos θ + m a^2 dot(θ) $

  *Invert to find velocities*

  From the first equation:
  $ dot(x) = (p_x - m a dot(θ) cos θ)/(2m) $

  Substitute into the second:
  $ p_θ = m a cos θ · (p_x - m a dot(θ) cos θ)/(2m) + m a^2 dot(θ) $

  $ p_θ = (a cos θ)/(2) p_x - (m a^2 cos^2 θ)/(2) dot(θ) + m a^2 dot(θ) $

  $ p_θ = (a cos θ)/(2) p_x + m a^2 dot(θ) (1 - (cos^2 θ)/(2)) $

  $ p_θ = (a cos θ)/(2) p_x + m a^2 dot(θ) ((2 - cos^2 θ)/(2)) $

  $ p_θ - (a cos θ)/(2) p_x = (m a^2)/2 (2 - cos^2 θ) dot(θ) $

  #boxed[$ dot(θ) = (2(p_θ - (a cos θ)/2 p_x))/(m a^2 (2 - cos^2 θ)) = (2 p_θ - a p_x cos θ)/(m a^2 (2 - cos^2 θ)) $]

  And:
  $ dot(x) = (p_x)/(2m) - (a cos θ)/(2m) dot(θ) $

  $ = (p_x)/(2m) - (a cos θ)/(2m) · (2 p_θ - a p_x cos θ)/(m a^2 (2 - cos^2 θ)) $

  $ = (p_x)/(2m) - (cos θ (2 p_θ - a p_x cos θ))/(2 m a (2 - cos^2 θ)) $

  Defining $Δ = 2 - cos^2 θ$:
  #boxed[$ dot(x) = (p_x Δ - a p_θ cos θ)/(2m Δ) $]

  *Hamiltonian*

  $ H = p_x dot(x) + p_θ dot(θ) - L $

  Using matrix inversion for the coupled momenta:

  The kinetic energy in matrix form:
  $ T = 1/2 [dot(x), dot(θ)] mat(2m, m a cos θ; m a cos θ, m a^2) mat(dot(x); dot(θ)) $

  The mass matrix:
  $ M = mat(2m, m a cos θ; m a cos θ, m a^2) $

  Its inverse:
  $ det(M) = 2m · m a^2 - (m a cos θ)^2 = m^2 a^2 (2 - cos^2 θ) = m^2 a^2 Δ $

  $ M^(-1) = 1/(m^2 a^2 Δ) mat(m a^2, -m a cos θ; -m a cos θ, 2m) $

  $ = 1/(m Δ) mat(1, -(cos θ)/a; -(cos θ)/a, 2/a^2) $

  The Hamiltonian:
  $ H = 1/2 [p_x, p_θ] M^(-1) mat(p_x; p_θ) + V $

  $ = 1/(2m Δ) [p_x, p_θ] mat(1, -(cos θ)/a; -(cos θ)/a, 2/a^2) mat(p_x; p_θ) + m g a cos θ $

  $ = 1/(2m Δ) [p_x - (p_θ cos θ)/a, -(p_x cos θ)/a + (2 p_θ)/a^2] mat(p_x; p_θ) + m g a cos θ $

  $ = 1/(2m Δ) [(p_x - (p_θ cos θ)/a) p_x + (-(p_x cos θ)/a + (2 p_θ)/a^2) p_θ] + m g a cos θ $

  $ = 1/(2m Δ) [p_x^2 - (p_x p_θ cos θ)/a - (p_x p_θ cos θ)/a + (2 p_θ^2)/a^2] + m g a cos θ $

  $ = 1/(2m Δ) [p_x^2 - (2 p_x p_θ cos θ)/a + (2 p_θ^2)/a^2] + m g a cos θ $

  #boxed[$ H = (p_x^2 - (2 p_x p_θ cos θ)/a + (2 p_θ^2)/a^2)/(2m(2 - cos^2 θ)) + m g a cos θ $]

  Or equivalently:
  #boxed[$ H = (a^2 p_x^2 - 2 a p_x p_θ cos θ + 2 p_θ^2)/(2 m a^2 (2 - cos^2 θ)) + m g a cos θ $]

  *Part (b): Equations of motion*

  Using Hamilton's equations:

  $ dot(x) = dv(H, p_x), quad dot(θ) = dv(H, p_θ) $

  $ dot(p)_x = -dv(H, x), quad dot(p)_θ = -dv(H, θ) $

  *Calculate $dot(x)$:*

  $ dot(x) = dv(, p_x) [(a^2 p_x^2 - 2 a p_x p_θ cos θ + 2 p_θ^2)/(2 m a^2 Δ)] $

  $ = (2 a^2 p_x - 2 a p_θ cos θ)/(2 m a^2 Δ) = (a p_x - p_θ cos θ)/(m a Δ) $

  #boxed[$ dot(x) = (a p_x - p_θ cos θ)/(m a (2 - cos^2 θ)) $]

  *Calculate $dot(θ)$:*

  $ dot(θ) = dv(, p_θ) [(a^2 p_x^2 - 2 a p_x p_θ cos θ + 2 p_θ^2)/(2 m a^2 Δ)] $

  $ = (-2 a p_x cos θ + 4 p_θ)/(2 m a^2 Δ) = (2 p_θ - a p_x cos θ)/(m a^2 Δ) $

  #boxed[$ dot(θ) = (2 p_θ - a p_x cos θ)/(m a^2 (2 - cos^2 θ)) $]

  *Calculate $dot(p)_x$:*

  Since $H$ has no explicit $x$ dependence:

  #boxed[$ dot(p)_x = -dv(H, x) = 0 $]

  This means $p_x$ is conserved (horizontal momentum conservation).

  *Calculate $dot(p)_θ$:*

  $ dot(p)_θ = -dv(H, θ) $

  From the Lagrangian: $dv(L, x) = 0$ (no explicit $x$ dependence), so:
  #boxed[$ dot(p)_x = 0 ⟹ p_x = "const" $]

  And:
  $ dv(L, θ) = -m dot(x) a dot(θ) sin θ + m g a sin θ = m a sin θ (g - dot(x) dot(θ)) $

  #boxed[$ dot(p)_θ = m a sin θ (g - dot(x) dot(θ)) $]

  *Summary of equations:*

  From Hamilton's equations or equivalently from Lagrangian formulation:

  #boxed[
    $ dot(x) = (a p_x - p_θ cos θ)/(m a (2 - cos^2 θ)) $

    $ dot(θ) = (2 p_θ - a p_x cos θ)/(m a^2 (2 - cos^2 θ)) $

    $ dot(p)_x = 0 $

    $ dot(p)_θ = m a sin θ (g - dot(x) dot(θ)) $
  ]

  Or in terms of $x, θ$ and their derivatives:
  #boxed[
    $ 2 dot.double(x) + a dot.double(θ) cos θ - a dot(θ)^2 sin θ = 0 $

    $ dot.double(x) cos θ + a dot.double(θ) = g sin θ $
  ]
]

#pagebreak()

#pbm("3")[
  *[30 pts] Particle on rotating wire*

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 89.png"), width:100%, border: false),
    [A particle of mass $m$ can slide freely along a light wire $A B$ whose perpendicular distance to the origin $O$ is $h$. The line $O C$ rotates about the origin at a constant angular speed $Ω$. The position of the particle can be described in terms of the angle $θ$ and the distance $q$ to the point $C$. The initial conditions are $θ(0) = 0$, $q(0) = 0$ and $dot(q)(0) = 0$.],
  )



  *(a)* Using $q$ as the generalized coordinate, find the Hamiltonian of the system.

  *(b)* Is the total mechanical energy given by the Hamiltonian? Is the total mechanical energy conserved? Explain.

  *(c)* Obtain equation of motion using Hamilton equation of motion. Solve for $q(t)$.
]

#solution[
  *Part (a): Hamiltonian*

  *Setup and coordinates*

  - Wire $A B$ at perpendicular distance $h$ from origin $O$
  - Point $C$ is the foot of perpendicular from $O$ to wire
  - Line $O C$ rotates at constant $Ω$, so $θ(t) = Ω t$ (with $θ(0) = 0$)
  - Particle at distance $q$ from $C$ along wire

  *Position in Cartesian coordinates*

  In the fixed (inertial) frame, with $x$-axis along initial direction of $O C$:
  - Point $C$ rotates: $(h cos(Ω t), h sin(Ω t))$
  - Particle is at distance $q$ from $C$ along the wire
  - Wire is perpendicular to $O C$, so along direction $(-sin(Ω t), cos(Ω t))$

  Position vector:
  $ arrow(r) = (h cos(Ω t) + q sin(Ω t)) hat(x) + (h sin(Ω t) - q cos(Ω t)) hat(y) $

  *Velocity*

  $ dot(arrow(r)) &= [(-h Ω sin(Ω t) + dot(q) sin(Ω t) + q Ω cos(Ω t))] hat(x) \
    &quad + [(h Ω cos(Ω t) - dot(q) cos(Ω t) - q Ω sin(Ω t))] hat(y) \
    &= [(dot(q) - h Ω) sin(Ω t) + q Ω cos(Ω t)] hat(x) \
    &quad + [(dot(q) - h Ω) cos(Ω t) - q Ω sin(Ω t)] hat(y) $

  *Kinetic energy*

  $ v^2 = dot(arrow(r)) · dot(arrow(r)) = (dot(q) - h Ω)^2 + q^2 Ω^2 $

  $ T = 1/2 m [(dot(q) - h Ω)^2 + q^2 Ω^2] $

  *Potential energy*

  $ y = h sin(Ω t) - q cos(Ω t) $

  $ V = m g y = m g (h sin(Ω t) - q cos(Ω t)) $

  *Lagrangian*

  $ L = T - V = 1/2 m [(dot(q) - h Ω)^2 + q^2 Ω^2] - m g (h sin(Ω t) - q cos(Ω t)) $

  *Canonical momentum*

  $ p = dv(L, dot(q)) = m (dot(q) - h Ω) $

  $ dot(q) = p/m + h Ω $

  *Hamiltonian*

  $ H &= p dot(q) - L \
    &= p (p/m + h Ω) - [1/2 m (p/m)^2 + 1/2 m q^2 Ω^2 - m g (h sin(Ω t) - q cos(Ω t))] \
    &= p^2/m + p h Ω - p^2/(2m) - 1/2 m q^2 Ω^2 + m g h sin(Ω t) - m g q cos(Ω t) \
    &= p^2/(2m) + p h Ω - 1/2 m q^2 Ω^2 + m g h sin(Ω t) - m g q cos(Ω t) $

  #boxed[$ H(q, p, t) = p^2/(2m) + Ω h p - 1/2 m Ω^2 q^2 + m g h sin(Ω t) - m g q cos(Ω t) $]

  *Part (b): Energy conservation*

  Total mechanical energy:
  $ E &= T + V \
    &= 1/2 m [(dot(q) - h Ω)^2 + q^2 Ω^2] + m g (h sin(Ω t) - q cos(Ω t)) $

  Using $p = m (dot(q) - h Ω)$:
  $ E &= 1/2 m (p/m)^2 + 1/2 m q^2 Ω^2 + m g (h sin(Ω t) - q cos(Ω t)) \
    &= p^2/(2m) + 1/2 m q^2 Ω^2 + m g h sin(Ω t) - m g q cos(Ω t) $

  Comparing with $H$:
  $ E - H = p^2/(2m) + 1/2 m q^2 Ω^2 - p^2/(2m) - Ω h p + 1/2 m Ω^2 q^2 = m Ω^2 q^2 - Ω h p $

  #boxed[$ E - H = m Ω^2 q^2 - Ω h p ≠ 0 ⟹ H ≠ E $]

  The Hamiltonian does *not* equal the total mechanical energy.

  *Is energy conserved?*

  The Hamiltonian has explicit time dependence through $sin(Ω t)$:
  $ dv(H, t) = m g h Ω cos(Ω t) ≠ 0 $

  Therefore the Hamiltonian is *not* conserved.

  The total mechanical energy $E$ also has explicit time dependence, so it is *not* conserved.

  #boxed[
    *Energy analysis:*

    - Total mechanical energy: $E = p^2/(2m) + 1/2 m q^2 Ω^2 + m g h sin(Ω t) - m g q cos(Ω t)$
    - Hamiltonian: $H = p^2/(2m) + Ω h p - 1/2 m Ω^2 q^2 + m g h sin(Ω t) - m g q cos(Ω t) ≠ E$
    - $dv(H, t) = m g h Ω cos(Ω t) ≠ 0$: Hamiltonian is *not conserved*
    - Total energy is *not conserved*

    *Reason:* The rotating wire constraint is time-dependent (rheonomic), and external work is done to maintain the rotation. The gravitational potential also has explicit time dependence in the rotating frame.
  ]

  *Part (c): Equation of motion and solution*

  *Hamilton's equations:*

  $ dot(q) = dv(H, p) = p/m + h Ω $

  $ dot(p) = -dv(H, q) = m Ω^2 q + m g cos(Ω t) $

  $ dot.double(q) &= dot(p)/m \
    &= Ω^2 q + g cos(Ω t) $

  #boxed[$ dot.double(q) - Ω^2 q = g cos(Ω t) $]

  *General solution:*

  Homogeneous solution:
  $ q_h(t) = C_1 cosh(Ω t) + C_2 sinh(Ω t) $

  Particular solution: $q_p(t) = A_p cos(Ω t)$

  $ dot.double(q)_p = -A_p Ω^2 cos(Ω t) $

  $ -A_p Ω^2 cos(Ω t) - Ω^2 A_p cos(Ω t) = g cos(Ω t) $

  $ A_p = -g/(2 Ω^2) $

  $ q(t) = C_1 cosh(Ω t) + C_2 sinh(Ω t) - g/(2 Ω^2) cos(Ω t) $

  *Initial conditions:*

  $q(0) = 0$:
  $ 0 = C_1 - g/(2 Ω^2) ⟹ C_1 = g/(2 Ω^2) $

  $dot(q)(0) = 0$:
  $ dot(q)(t) = C_1 Ω sinh(Ω t) + C_2 Ω cosh(Ω t) + g/(2 Ω) sin(Ω t) $

  $ dot(q)(0) = C_2 Ω = 0 ⟹ C_2 = 0 $

  #boxed[$ q(t) = g/(2 Ω^2) [cosh(Ω t) - cos(Ω t)] $]
]
