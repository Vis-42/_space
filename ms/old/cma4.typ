#import "../shared/_at.typ": *

#show: ad.with(
  title: "Assignment 4",
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
  *[20 pts] Double Atwood machine*

  #grid(
      columns: (1fr, 2fr),
      gutter: 1em,
      fig(image("../../../../_zss/d 85.png"), width:80%, border: false),
      [Consider a double Atwood machine as shown below. The center pulley is free to move vertically and it has a mass $M$. The string connecting the three masses is massless and inextensible. Masses $m_1$ and $m_2$ hang on the left and right respectively from the fixed pulleys. The acceleration of gravity is $g$. All three pulleys are frictionless so that the string slides freely over them.],
    )

  *(a)* Obtain the conditions for static equilibrium from the principle of virtual work.

  *(b)* Solve for the accelerations of all three masses from the d'Alembert's principle.
]

#solution[
  *Part (a): Equilibrium from virtual work*

  *Setup and coordinates*

  Let:
  - $y_M$ = vertical position of center pulley (mass $M$), measured downward from some reference
  - $y_1$ = vertical position of mass $m_1$, measured downward from its fixed pulley
  - $y_2$ = vertical position of mass $m_2$, measured downward from its fixed pulley

  *Constraint equations*

  For an inextensible string:
  - On the left side: The total length from fixed pulley to $m_1$ is constant
  - On the right side: The total length from fixed pulley to $m_2$ is constant
  - The string connecting the two sides through the center pulley has constant total length

  If the center pulley descends by $δ y_M$, the length of string on each side increases by $δ y_M$. If $m_1$ descends by $δ y_1$, it uses up additional string of length $δ y_1$ on the left.

  For the left side, the constraint is:
  $ y_1 - y_M = "const" ⟹ δ y_1 = δ y_M $

  Similarly for the right side:
  $ y_2 - y_M = "const" ⟹ δ y_2 = δ y_M $

  *Standard double Atwood machine configuration*

  The center pulley (mass $M$) hangs by a string and has $m_1$ and $m_2$ suspended from it by another string. For the string connecting $m_1$ and $m_2$ through the movable pulley at $M$:
  $ (y_1 - y_M) + (y_2 - y_M) = "const" $

  Taking the variation:
  $ δ y_1 + δ y_2 - 2 δ y_M = 0 $
  $ δ y_1 + δ y_2 = 2 δ y_M quad quad (1) $

  *Virtual work principle*

  The forces are:
  - Weight of $M$: $M g$ (downward)
  - Weight of $m_1$: $m_1 g$ (downward)
  - Weight of $m_2$: $m_2 g$ (downward)

  Virtual work:
  $ δ W = M g δ y_M + m_1 g δ y_1 + m_2 g δ y_2 $

  Using the constraint $δ y_1 + δ y_2 = 2 δ y_M$, we can express two variations in terms of one. Let $δ y_M$ be independent, and choose $δ y_1$ as another independent variation. Then:
  $ δ y_2 = 2 δ y_M - δ y_1 $

  Substituting:
  $ δ W = M g δ y_M + m_1 g δ y_1 + m_2 g (2 δ y_M - δ y_1) $
  $ = M g δ y_M + m_1 g δ y_1 + 2 m_2 g δ y_M - m_2 g δ y_1 $
  $ = (M + 2 m_2) g δ y_M + (m_1 - m_2) g δ y_1 $

  For equilibrium, $δ W = 0$ for arbitrary independent variations:

  #boxed[$ m_1 = m_2 $]

  The condition $(M + 2m_2)g = 0$ cannot be satisfied for positive masses. This indicates that the center pulley must be externally suspended (e.g., by a string over another fixed pulley). The equilibrium condition for the masses hanging from the center pulley is simply $m_1 = m_2$, which makes physical sense: the two sides must balance.

  *Part (b): Accelerations using d'Alembert's principle*

  The kinematic constraint from the geometry is:
  $ a_1 + a_2 = -2 a_M quad quad (1) $

  Applying d'Alembert's principle, the virtual work including inertial forces is:
  $ δ W = (M g - M a_M) δ y_M + (m_1 g - m_1 a_1) δ y_1 + (m_2 g - m_2 a_2) δ y_2 = 0 $

  Using the constraint $δ y_2 = -2 δ y_M - δ y_1$:
  $ (M g - M a_M) δ y_M + (m_1 g - m_1 a_1) δ y_1 + (m_2 g - m_2 a_2)(-2 δ y_M - δ y_1) = 0 $

  $ [M g - M a_M - 2 m_2 g + 2 m_2 a_2] δ y_M + [m_1 g - m_1 a_1 - m_2 g + m_2 a_2] δ y_1 = 0 $

  For arbitrary independent variations, the coefficients vanish:
  $ M a_M - 2 m_2 a_2 &= (M - 2 m_2) g quad quad (2) \
  m_1 a_1 - m_2 a_2 &= (m_1 - m_2) g quad quad (3) \
  M a_M - 2 m_1 a_1 &= (M - 2 m_1) g quad quad (4) $

  Substituting the constraint $a_2 = -2 a_M - a_1$ into equation (2):
  $ M a_M - 2 m_2(-2 a_M - a_1) &= (M - 2 m_2) g \
  (M + 4 m_2) a_M + 2 m_2 a_1 &= (M - 2 m_2) g quad quad (5) $

  From equation (4):
  $ a_1 = [M a_M - (M - 2 m_1) g]/(2 m_1) $

  Substituting into equation (5):
  $ (M + 4 m_2) a_M + (m_2/m_1)[M a_M - M g + 2 m_1 g] &= (M - 2 m_2) g \
  [M + 4 m_2 + (m_2/m_1) M] a_M &= [M - 2 m_2 + (m_2/m_1) M - 2 m_2] g \
  [M(m_1 + m_2) + 4 m_1 m_2] a_M &= [M(m_1 + m_2) - 4 m_1 m_2] g $

  #boxed[$ a_M = g · [M(m_1 + m_2) - 4 m_1 m_2]/[M(m_1 + m_2) + 4 m_1 m_2] $]

  Using equation (3) with the constraint:
  $ m_1 a_1 - m_2(-2 a_M - a_1) &= (m_1 - m_2) g \
  (m_1 + m_2) a_1 + 2 m_2 a_M &= (m_1 - m_2) g $

  #boxed[$ a_1 = g · [M m_1 - 3 M m_2 + 4 m_1 m_2]/[M(m_1 + m_2) + 4 m_1 m_2] $]

  From the constraint (1):
  #boxed[$ a_2 = g · [M m_2 - 3 M m_1 + 4 m_1 m_2]/[M(m_1 + m_2) + 4 m_1 m_2] $]

]

#pagebreak()

#pbm("2")[
  *[20 pts] Pendulum in accelerating car*

  #grid(
      columns: (1fr, 1fr),
      gutter: 1em,
      fig(image("../../../../_zss/d 86.png"), width:100%, border: false),
      [A pendulum with a massless string of length $ℓ$ and mass $m$ is attached to a moving car. The car is accelerated uniformly at $a$ along a horizontal track starting with an initial horizontal speed $v_0$. The angle between the mass $m$ and the vertical is denoted as $θ$.],
    )

  *(a)* Obtain the equation of motion for $θ(t)$ from the d'Alembert's principle.

  *(b)* Determine the angle, $θ_"eq"$, when the mass remains at rest in stable equilibrium. Give an expression for the tangent of this angle, $tan θ_"eq"$.

  *(c)* Set $θ(t) = θ_"eq" + ε(t)$, that is, measure the motion with respect to the equilibrium position. Obtain the equation of motion for $ε(t)$ for small oscillations around $θ_"eq"$ and obtain the angular frequency of these small oscillation.
]

#solution[
  *Part (a): Equation of motion from d'Alembert's principle*

  *Setup*

  The car is an accelerating (non-inertial) reference frame with acceleration $a$ in the horizontal direction (positive $x$-direction).

  In the car's reference frame, the pendulum experiences:
  1. Gravitational force: $m g$ (downward)
  2. Pseudo-force (d'Alembert force): $-m a$ (backward, opposing car's acceleration)
  3. Tension: $T$ (along the string toward pivot)

  *Coordinates*

  Use angle $θ$ from vertical (positive when pendulum swings forward in direction of car's motion).

  Position of mass in car's frame:
  $ x = ℓ sin θ, quad y = -ℓ cos θ $

  (taking pivot as origin, $y$ positive upward)

  Velocity in car's frame:
  $ dot(x) = ℓ dot(θ) cos θ, quad dot(y) = ℓ dot(θ) sin θ $

  Acceleration in car's frame:
  $ dot.double(x) = ℓ dot.double(θ) cos θ - ℓ dot(θ)^2 sin θ $
  $ dot.double(y) = ℓ dot.double(θ) sin θ + ℓ dot(θ)^2 cos θ $

  *D'Alembert's principle*

  In the accelerating frame, we add the pseudo-force $-m a$ (horizontal, backward). The effective forces are:
  - Horizontal: $-T sin θ - m a$ (tension component + pseudo-force)
  - Vertical: $T cos θ - m g$ (tension component - weight)

  D'Alembert's principle states that the system is in "virtual equilibrium" when we include the inertial forces $-m dot.double(x)$ and $-m dot.double(y)$:

  $ -T sin θ - m a - m dot.double(x) = 0 $
  $ T cos θ - m g - m dot.double(y) = 0 $

  Substituting the accelerations:
  $ -T sin θ - m a - m(ℓ dot.double(θ) cos θ - ℓ dot(θ)^2 sin θ) = 0 $
  $ T cos θ - m g - m(ℓ dot.double(θ) sin θ + ℓ dot(θ)^2 cos θ) = 0 $

  $ cases(
    -T sin θ - m a - m ℓ dot.double(θ) cos θ + m ℓ dot(θ)^2 sin θ = 0 quad quad (1),
    T cos θ - m g - m ℓ dot.double(θ) sin θ - m ℓ dot(θ)^2 cos θ = 0 quad quad (2)
  ) $

  To eliminate $T$, multiply (1) by $cos θ$ and (2) by $sin θ$:
  $ -T sin θ cos θ - m a cos θ - m ℓ dot.double(θ) cos^2 θ + m ℓ dot(θ)^2 sin θ cos θ = 0 $
  $ T sin θ cos θ - m g sin θ - m ℓ dot.double(θ) sin^2 θ - m ℓ dot(θ)^2 sin θ cos θ = 0 $

  $ - m a cos θ - m ℓ dot.double(θ) cos^2 θ - m g sin θ - m ℓ dot.double(θ) sin^2 θ = 0 $
  $ - m a cos θ - m ℓ dot.double(θ) (cos^2 θ + sin^2 θ) - m g sin θ = 0 $
  $ - m a cos θ - m ℓ dot.double(θ) - m g sin θ = 0 $
  $ ℓ dot.double(θ) = - a cos θ - g sin θ $

  #boxed[$ dot.double(θ) + g/ℓ sin θ + a/ℓ cos θ = 0 $]

  Or equivalently:
  #boxed[$ ℓ dot.double(θ) + g sin θ + a cos θ = 0 $]

  *Part (b): Equilibrium angle*

  At equilibrium, $dot.double(θ) = 0$ and $dot(θ) = 0$, so $θ = θ_"eq" = $ constant.

  From the equation of motion:
  $ g sin θ_"eq" + a cos θ_"eq" = 0 $

  $ tan θ_"eq" = sin θ_"eq"/cos θ_"eq" = -a/g $

  #boxed[$ tan θ_"eq" = -a/g $]

  The negative sign indicates that the equilibrium angle is in the backward direction (opposite to the car's acceleration), which makes physical sense: the pendulum leans backward.

  If we define $θ$ as positive backward (opposite to car's motion), then:
  #boxed[$ tan θ_"eq" = a/g $]

  The equilibrium angle is:
  #boxed[$ θ_"eq" = arctan(a/g) $]

  *Part (c): Small oscillations about equilibrium*

  Let $θ(t) = θ_"eq" + ε(t)$ where $|ε| ≪ 1$.

  Substituting into the equation of motion:
  $ ℓ dot.double(ε) + g sin(θ_"eq" + ε) + a cos(θ_"eq" + ε) = 0 $

  Using Taylor expansion for small $ε$:
  $ sin(θ_"eq" + ε) ≈ sin θ_"eq" + ε cos θ_"eq" $
  $ cos(θ_"eq" + ε) ≈ cos θ_"eq" - ε sin θ_"eq" $

  Substituting:
  $ ℓ dot.double(ε) + g(sin θ_"eq" + ε cos θ_"eq") + a(cos θ_"eq" - ε sin θ_"eq") = 0 $

  $ ℓ dot.double(ε) + g sin θ_"eq" + a cos θ_"eq" + ε(g cos θ_"eq" - a sin θ_"eq") = 0 $

  The first three terms vanish (equilibrium condition $g sin θ_"eq" + a cos θ_"eq" = 0$):
  $ ℓ dot.double(ε) + ε(g cos θ_"eq" - a sin θ_"eq") = 0 $

  From $tan θ_"eq" = a/g$, we have $sin θ_"eq" = a/sqrt(a^2 + g^2)$ and $cos θ_"eq" = g/sqrt(a^2 + g^2)$ (for acute angles).

  $ g cos θ_"eq" - a sin θ_"eq" = g · g/sqrt(a^2 + g^2) - a · a/sqrt(a^2 + g^2) $

  $ = (g^2 - a^2)/sqrt(a^2 + g^2) $

  The car accelerates forward (positive $x$), so the pseudo-force is backward (negative $x$). The pendulum swings backward. If we measure $θ$ as positive when the pendulum swings forward (in the direction of car motion), then at equilibrium, $θ_"eq" < 0$.

  From $g sin θ_"eq" + a cos θ_"eq" = 0$ with $θ_"eq" < 0$:
  $ g sin θ_"eq" = -a cos θ_"eq" $
  $ tan θ_"eq" = -a/g < 0 $

  So $θ_"eq" = -arctan(a/g)$ (negative angle, pendulum leans back).

  For small oscillations $ε$ around this:
  $ g cos θ_"eq" - a sin θ_"eq" = g cos(-arctan(a/g)) - a sin(-arctan(a/g)) $

  $ = g cos(arctan(a/g)) + a sin(arctan(a/g)) $

  $ = g · g/sqrt(g^2 + a^2) + a · a/sqrt(g^2 + a^2) = (g^2 + a^2)/sqrt(g^2 + a^2) = sqrt(g^2 + a^2) $

  Therefore:
  $ ℓ dot.double(ε) + sqrt(g^2 + a^2) ε = 0 $

  #boxed[$ dot.double(ε) + sqrt(g^2 + a^2)/ℓ ε = 0 $]

  This is simple harmonic motion with angular frequency:
  $ ω^2 = sqrt(g^2 + a^2)/ℓ $

  #boxed[$ ω = sqrt(sqrt(g^2 + a^2)/ℓ) = sqrt(g_"eff"/ℓ) $]

  where $g_"eff" = sqrt(g^2 + a^2)$ is the effective gravitational acceleration in the accelerating frame.

  *Physical interpretation*: The pendulum oscillates about the equilibrium angle $θ_"eq" = -arctan(a/g)$ with the same period formula as a regular pendulum, but with effective gravity $g_"eff" = sqrt(g^2 + a^2)$ instead of $g$.

]

#pagebreak()

#pbm("3")[
  *[20 pts] Ball with string*

  A uniform solid ball has a few turns of light string wound around it. The end of the string is held steady and the ball is allowed to fall under gravity. Using d'Alembert with Lagrange multiplier, find the acceleration of the ball and the tension in the string.
]

#solution[
  *Setup*

  Let:
  - $m$ = mass of ball
  - $r$ = radius of ball
  - $I = 2/5 m r^2$ = moment of inertia of uniform solid ball about its center
  - $y$ = vertical position of center of ball (positive downward)
  - $θ$ = angle of rotation of ball (positive when ball rotates as it descends)

  The ball is subject to:
  - Gravity: $m g$ (downward)
  - Tension: $T$ (upward, applied at the rim where string attaches)

  *Constraint*

  Since the string is held steady and the ball unwinds as it falls, the constraint is:
  $ y = r θ quad "(no slipping of string)" $

  Or: $dot(y) = r dot(θ)$ and $dot.double(y) = r dot.double(θ)$

  This is a holonomic constraint: $f(y, θ) = y - r θ = 0$

  *D'Alembert's principle with Lagrange multiplier*

  Virtual work done by applied forces (including d'Alembert forces):
  $ δ W = (m g - m dot.double(y)) δ y - I dot.double(θ) δ θ $

  The tension $T$ is the constraint force (we don't include it directly; it emerges from the Lagrange multiplier).

  The constraint is $y - r θ = 0$, so $δ y - r δ θ = 0$ for virtual displacements.

  Using Lagrange multiplier $λ$:
  $ δ W + λ (δ y - r δ θ) = 0 $

  $ (m g - m dot.double(y) + λ) δ y + (-I dot.double(θ) - λ r) δ θ = 0 $

  For arbitrary independent variations $δ y$ and $δ θ$:
  $ cases(
    m g - m dot.double(y) + λ = 0 quad quad (1),
    I dot.double(θ) + λ r = 0 quad quad (2)
  ) $

  From (2): $λ = -I dot.double(θ)/r$

  From constraint: $dot.double(y) = r dot.double(θ)$, so $dot.double(θ) = dot.double(y)/r$

  $ λ = -I dot.double(y)/(r^2) $

  Substituting into (1):
  $ m g - m dot.double(y) - I dot.double(y)/r^2 = 0 $

  $ m g = (m + I/r^2) dot.double(y) $

  With $I = 2/5 m r^2$:
  $ m g = (m + (2/5 m r^2)/r^2) dot.double(y) = (m + 2/5 m) dot.double(y) = 7/5 m dot.double(y) $

  #boxed[$ dot.double(y) = 5/7 g $]

  The Lagrange multiplier $λ$ represents the constraint force. From $λ = -I dot.double(y)/r^2$:
  $ λ = -(2/5 m r^2)/(r^2) · 5/7 g = -2/5 m · 5/7 g = -2/7 m g $

  The tension is related to the Lagrange multiplier. Looking at the force balance:

  From equation (1): $m g - m dot.double(y) + λ = 0$

  The actual forces on the ball in the vertical direction are gravity $m g$ (down) and tension $T$ (up):
  $ m dot.double(y) = m g - T $

  Comparing with equation (1): $m g - m dot.double(y) = -λ$

  $ T = -λ = -(-2/7 m g) = 2/7 m g $

  #boxed[$ T = 2/7 m g $]

  *Verification*

  Verifying using the rotational equation. The torque about the center of the ball due to tension:
  $ τ = T r = I dot.double(θ) = I dot.double(y)/r $

  $ T = I dot.double(y)/r^2 = (2/5 m r^2)/(r^2) · 5/7 g = 2/5 m · 5/7 g = 2/7 m g $ ✓

  *Physical interpretation*

  The ball accelerates downward at $5/7 g$, which is less than free fall ($g$) because the string provides an upward tension force. The tension $T = 2/7 m g$ is less than the weight, so there's a net downward force causing acceleration.

  The acceleration $5/7 g$ is the same as a ball rolling down a vertical surface without slipping, which makes sense since the constraint (string unwinding without slipping) is mathematically equivalent to rolling.

]

#pagebreak()

#pbm("4")[
  *[20 pts] Particle on rotating incline*

  A particle slides on a smooth inclined plane whose inclination $θ$ in increasing at a constant rate $Ω$. If $θ(0) = 0$ at which the particle starts from rest from a distance $x(0) = x_0$ from the bottom of the inclined. Obtain the equation of equation of motion from the Lagrange's equation and solve for $x(t)$.
]

#solution[
  *Setup*

  The incline angle increases as: $θ(t) = Ω t$

  Let $x(t)$ be the position of the particle along the incline, measured from the bottom (positive up the incline).

  *Coordinates in fixed frame*

  Taking the origin at the bottom of the incline:
  - Horizontal position: $ξ = x cos θ = x cos(Ω t)$
  - Vertical position: $η = x sin θ = x sin(Ω t)$

  *Velocity*

  $ dot(ξ) = dot(x) cos(Ω t) - x Ω sin(Ω t) $
  $ dot(η) = dot(x) sin(Ω t) + x Ω cos(Ω t) $

  *Kinetic energy*

  $ T = 1/2 m (dot(ξ)^2 + dot(η)^2) $

  $ = 1/2 m [(dot(x) cos(Ω t) - x Ω sin(Ω t))^2 + (dot(x) sin(Ω t) + x Ω cos(Ω t))^2] $

  $ dot(ξ)^2 &= dot(x)^2 cos^2(Ω t) - 2 dot(x) x Ω cos(Ω t) sin(Ω t) + x^2 Ω^2 sin^2(Ω t) \
  dot(η)^2 &= dot(x)^2 sin^2(Ω t) + 2 dot(x) x Ω sin(Ω t) cos(Ω t) + x^2 Ω^2 cos^2(Ω t) $

  $ dot(ξ)^2 + dot(η)^2 &= dot(x)^2 (cos^2(Ω t) + sin^2(Ω t)) + x^2 Ω^2 (sin^2(Ω t) + cos^2(Ω t)) \
    &= dot(x)^2 + x^2 Ω^2 $

  $ T = 1/2 m (dot(x)^2 + x^2 Ω^2) $

  *Potential energy*

  Taking the bottom of the incline as the reference ($η = 0$):
  $ V = m g η = m g x sin(Ω t) $

  *Lagrangian*

  $ L = T - V = 1/2 m (dot(x)^2 + x^2 Ω^2) - m g x sin(Ω t) $

  *Lagrange's equation*

  $ dv(L, x) = m x Ω^2 - m g sin(Ω t) $

  $ dv(L, dot(x)) = m dot(x) $

  $ dv(, t) (dv(L, dot(x))) = m dot.double(x) $

  Lagrange's equation:
  $ m dot.double(x) = m x Ω^2 - m g sin(Ω t) $

  #boxed[$ dot.double(x) - Ω^2 x = -g sin(Ω t) $]

  *Solving the differential equation*

  This is a second-order linear ODE with time-dependent forcing:
  $ dot.double(x) - Ω^2 x = -g sin(Ω t) $

  *Homogeneous solution*

  $ dot.double(x)_h - Ω^2 x_h = 0 $

  Characteristic equation: $r^2 - Ω^2 = 0$

  $ cases(
    r = Ω,
    r = -Ω
  ) $

  $ x_h = A e^(Ω t) + B e^(-Ω t) $

  *Particular solution*

  For the forcing term $-g sin(Ω t)$, try:
  $ x_p = C sin(Ω t) + D cos(Ω t) $

  $ dot(x)_p = C Ω cos(Ω t) - D Ω sin(Ω t) $

  $ dot.double(x)_p = -C Ω^2 sin(Ω t) - D Ω^2 cos(Ω t) $

  Substituting into the ODE:
  $ -C Ω^2 sin(Ω t) - D Ω^2 cos(Ω t) - Ω^2 (C sin(Ω t) + D cos(Ω t)) &= -g sin(Ω t) \
  -C Ω^2 sin(Ω t) - D Ω^2 cos(Ω t) - C Ω^2 sin(Ω t) - D Ω^2 cos(Ω t) &= -g sin(Ω t) \
  -2 C Ω^2 sin(Ω t) - 2 D Ω^2 cos(Ω t) &= -g sin(Ω t) $

  $ cases(
    -2 C Ω^2 = -g,
    -2 D Ω^2 = 0
  ) ⟹ cases(
    C = g/(2 Ω^2),
    D = 0
  ) $

  $ x_p = g/(2 Ω^2) sin(Ω t) $

  *General solution*

  $ x(t) = A e^(Ω t) + B e^(-Ω t) + g/(2 Ω^2) sin(Ω t) $

  *Initial conditions*

  At $t = 0$: $x(0) = x_0$ and $dot(x)(0) = 0$ (starts from rest)

  $ x(0) &= A + B + g/(2 Ω^2) sin(0) = A + B = x_0 \
  dot(x)(t) &= A Ω e^(Ω t) - B Ω e^(-Ω t) + g/(2 Ω) cos(Ω t) \
  dot(x)(0) &= A Ω - B Ω + g/(2 Ω) = 0 \
  A - B &= -g/(2 Ω^2) $

  $ cases(
    A + B = x_0,
    A - B = -g/(2 Ω^2)
  ) $

  $ cases(
    2 A = x_0 - g/(2 Ω^2),
    2 B = x_0 + g/(2 Ω^2)
  ) ⟹ cases(
    A = x_0/2 - g/(4 Ω^2),
    B = x_0/2 + g/(4 Ω^2)
  ) $

  *Final solution*

  $ x(t) = (x_0/2 - g/(4 Ω^2)) e^(Ω t) + (x_0/2 + g/(4 Ω^2)) e^(-Ω t) + g/(2 Ω^2) sin(Ω t) $

  $ x(t) &= x_0/2 (e^(Ω t) + e^(-Ω t)) + g/(4 Ω^2) (e^(-Ω t) - e^(Ω t)) + g/(2 Ω^2) sin(Ω t) \
    &= x_0 cosh(Ω t) - g/(2 Ω^2) sinh(Ω t) + g/(2 Ω^2) sin(Ω t) \
    &= x_0 cosh(Ω t) + g/(2 Ω^2) [sin(Ω t) - sinh(Ω t)] $

  #boxed[$ x(t) = x_0 cosh(Ω t) + g/(2 Ω^2) [sin(Ω t) - sinh(Ω t)] $]

  #boxed[$ x(t) = (x_0/2 - g/(4 Ω^2)) e^(Ω t) + (x_0/2 + g/(4 Ω^2)) e^(-Ω t) + g/(2 Ω^2) sin(Ω t) $]

  *Physical interpretation*

  The solution has three parts:
  1. Growing exponential $e^(Ω t)$: As the incline steepens, the particle tends to accelerate away from the bottom
  2. Decaying exponential $e^(-Ω t)$: This component dies out quickly
  3. Oscillating term $sin(Ω t)$: Periodic response to the time-varying gravity component

  For large $t$, the $e^(Ω t)$ term dominates, showing the particle accelerates up (or down) the increasingly steep incline.

]

#pagebreak()

#pbm("5")[
  *[20 pts] Block on cart with wheels*

  #grid(
        columns: (1fr, 1fr),
        gutter: 1em,
        fig(image("../../../../_zss/d 87.png"), width:80%, border: false),
        [A block of mass $m$ is free to slide along the inclined plane on the cart under the action of gravity and the spring. The body of the cart has mass $M_1$. Each wheel hass mass mass $M$, radius $r$ and moment of inertia $I$ about its axle. A constant force $f$ is exerted on the cart. Denote $q_0$ as the value of $q$ when the spring is unstretched.],
      )

  *(a)* Using $x$ and $y$ as generalized coordinates, obtain the equations of motion from the d'Alembert principle.

  *(b)* Using $x$ and $q$ as generalized coordinates, obtain the equations of motion from the Lagrange's equation.
]

#solution[
  *Setup*

  Let:
  - $x$ = horizontal position of cart
  - $y$ = position of block along incline, measured from some reference point on cart (positive up the incline)
  - $q$ = absolute position of block along the incline measured from a fixed reference
  - $α$ = angle of incline
  - $k$ = spring constant
  - $q_0$ = unstretched spring position

  The relationship between coordinates: $q = $ (cart's contribution) $+ y$

  *Coordinate definitions*
  - $x$ = horizontal position of cart (or equivalently, position of cart's reference point)
  - $y$ = position of block along incline relative to cart (measured from cart's reference point)
  - $q$ = absolute position of block along incline in a fixed frame

  The incline is attached to the cart. If the cart moves forward by $x$, the entire incline moves forward. The block's position relative to the cart is $y$ along the incline.


  *Part (a): Using coordinates $(x, y)$ with d'Alembert's principle*

  *Kinematics*

  Cart position: $x$ (horizontal)

  Block's position in fixed frame:
  - Horizontal: $ξ = x + y cos α$ (cart position + component of $y$ along horizontal)
  - Vertical: $η = y sin α$ (component of $y$ along vertical)

  Velocities:
  $ dot(ξ) = dot(x) + dot(y) cos α $
  $ dot(η) = dot(y) sin α $

  Accelerations:
  $ dot.double(ξ) = dot.double(x) + dot.double(y) cos α $
  $ dot.double(η) = dot.double(y) sin α $

  *Wheels*

  Each wheel has mass $M$, radius $r$, moment of inertia $I$. For rolling without slipping:
  $ v_"wheel" = r ω ⟹ ω = v_"wheel"/r = dot(x)/r $

  Kinetic energy of one wheel:
  $ T_"wheel" = 1/2 M dot(x)^2 + 1/2 I ω^2 = 1/2 M dot(x)^2 + 1/2 I (dot(x)/r)^2 = 1/2 (M + I/r^2) dot(x)^2 $

  For two wheels:
  $ T_"wheels" = (M + I/r^2) dot(x)^2 $

  *Kinetic energy*

  Cart body: $T_"cart" = 1/2 M_1 dot(x)^2$

  Block: $T_"block" = 1/2 m (dot(ξ)^2 + dot(η)^2) = 1/2 m [(dot(x) + dot(y) cos α)^2 + (dot(y) sin α)^2]$

  $ = 1/2 m [dot(x)^2 + 2 dot(x) dot(y) cos α + dot(y)^2 cos^2 α + dot(y)^2 sin^2 α] $

  $ = 1/2 m [dot(x)^2 + 2 dot(x) dot(y) cos α + dot(y)^2] $

  Total kinetic energy:
  $ T = 1/2 M_1 dot(x)^2 + (M + I/r^2) dot(x)^2 + 1/2 m [dot(x)^2 + 2 dot(x) dot(y) cos α + dot(y)^2] $

  $ = 1/2 (M_1 + 2M + 2I/r^2 + m) dot(x)^2 + m dot(x) dot(y) cos α + 1/2 m dot(y)^2 $

  Let $M_"eff" = M_1 + 2M + 2I/r^2 + m$ (effective mass including cart, wheels, and block).

  $ T = 1/2 M_"eff" dot(x)^2 + m dot(x) dot(y) cos α + 1/2 m dot(y)^2 $

  *Potential energy*

  Gravitational: $V_g = m g y sin α$ (height of block)

  Spring: $V_s = 1/2 k (y - y_0)^2$ where $y_0$ is the unstretched position measured from the same reference as $y$.
  $ V_s = 1/2 k (y - y_0)^2 $

  Total potential energy:
  $ V = m g y sin α + 1/2 k (y - y_0)^2 $

  *D'Alembert's principle*

  Virtual work including applied forces and d'Alembert forces:
  $ δ W = sum (F_i - m_i a_i) · δ r_i = 0 $

  Applied forces:
  - Force $f$ on cart (horizontal): $f$ in $x$-direction
  - Gravity on block: $m g$ (vertical, downward)
  - Spring force on block: $-k(y - y_0)$ (along incline, upward)

  D'Alembert forces (inertial forces):
  - Cart body: $-M_1 dot.double(x)$ (horizontal)
  - Two wheels: $-2(M + I/r^2) dot.double(x)$ (horizontal, combined)
  - Block: $-m dot.double(ξ)$ (horizontal), $-m dot.double(η)$ (vertical)

  Virtual displacements:
  - Cart: $δ x$ (horizontal)
  - Block: $δ ξ = δ x + δ y cos α$ (horizontal), $δ η = δ y sin α$ (vertical)

  Virtual work:
  $ δ W = f δ x - m g δ η - k(y - y_0) δ y - M_1 dot.double(x) δ x - 2(M + I/r^2) dot.double(x) δ x - m dot.double(ξ) δ ξ - m dot.double(η) δ η = 0 $

  Substituting virtual displacements and accelerations:
  $ δ W &= f δ x - m g δ y sin α - k(y - y_0) δ y - M_1 dot.double(x) δ x - 2(M + I/r^2) dot.double(x) δ x \
    &quad - m(dot.double(x) + dot.double(y) cos α)(δ x + δ y cos α) - m dot.double(y) sin α · δ y sin α = 0 $

  $ δ W &= f δ x - m g sin α δ y - k(y - y_0) δ y - [M_1 + 2M + 2I/r^2] dot.double(x) δ x \
    &quad - m(dot.double(x) + dot.double(y) cos α) δ x - m(dot.double(x) + dot.double(y) cos α) cos α δ y - m dot.double(y) sin^2 α δ y = 0 $

  $ δ W &= [f - (M_1 + 2M + 2I/r^2) dot.double(x) - m dot.double(x) - m dot.double(y) cos α] δ x \
    &quad + [-m g sin α - k(y - y_0) - m dot.double(x) cos α - m dot.double(y) cos^2 α - m dot.double(y) sin^2 α] δ y = 0 $

  $ δ W &= [f - (M_1 + 2M + 2I/r^2 + m) dot.double(x) - m dot.double(y) cos α] δ x \
    &quad + [-m g sin α - k(y - y_0) - m dot.double(x) cos α - m dot.double(y)] δ y = 0 $

  For arbitrary independent variations $δ x$ and $δ y$, the coefficients must vanish:
  $ cases(
    (M_1 + 2M + 2I/r^2 + m) dot.double(x) + m dot.double(y) cos α = f quad quad (1),
    m dot.double(x) cos α + m dot.double(y) = -m g sin α - k(y - y_0) quad quad (2)
  ) $

  #boxed[$ cases(
    (M_1 + 2M + 2I/r^2 + m) dot.double(x) + m dot.double(y) cos α = f,
    m dot.double(x) cos α + m dot.double(y) = -m g sin α - k(y - y_0)
  ) $]

  *Part (b): Using coordinates $(x, q)$ with Lagrange's equation*

  Coordinate $q$ is the absolute position of the block along the incline. The relative position is $y = q - x cos α$.

  *Kinematics with coordinates $(x, q)$*

  Block's position in fixed frame:
  $ ξ &= x + y cos α \
    &= x + (q - x cos α) cos α \
    &= x sin^2 α + q cos α $

  $ η &= y sin α \
    &= q sin α - x sin α cos α $

  $ dot(ξ) = dot(x) sin^2 α + dot(q) cos α $
  $ dot(η) = dot(q) sin α - dot(x) sin α cos α $

  *Kinetic energy*

  $ dot(ξ)^2 &= (dot(x) sin^2 α + dot(q) cos α)^2 \
    &= dot(x)^2 sin^4 α + 2 dot(x) dot(q) sin^2 α cos α + dot(q)^2 cos^2 α $

  $ dot(η)^2 &= (dot(q) sin α - dot(x) sin α cos α)^2 \
    &= dot(q)^2 sin^2 α - 2 dot(q) dot(x) sin^2 α cos α + dot(x)^2 sin^2 α cos^2 α $

  $ dot(ξ)^2 + dot(η)^2 &= dot(x)^2 sin^4 α + dot(q)^2 cos^2 α + dot(q)^2 sin^2 α + dot(x)^2 sin^2 α cos^2 α \
    &= dot(x)^2 sin^2 α (sin^2 α + cos^2 α) + dot(q)^2 (cos^2 α + sin^2 α) \
    &= dot(x)^2 sin^2 α + dot(q)^2 $

  $ T_"block" = 1/2 m (dot(x)^2 sin^2 α + dot(q)^2) $

  $ T_"cart+wheels" = 1/2 (M_1 + 2M + 2I/r^2) dot(x)^2 $

  $ T &= 1/2 (M_1 + 2M + 2I/r^2) dot(x)^2 + 1/2 m (dot(x)^2 sin^2 α + dot(q)^2) \
    &= 1/2 (M_1 + 2M + 2I/r^2 + m sin^2 α) dot(x)^2 + 1/2 m dot(q)^2 $

  *Potential energy*

  $ V_g &= m g y sin α \
    &= m g (q - x cos α) sin α \
    &= m g q sin α - m g x sin α cos α $

  $ V_s = 1/2 k (q - x cos α - q_0)^2 $

  $ V &= m g q sin α - m g x sin α cos α \
    &quad + 1/2 k (q - x cos α - q_0)^2 $

  *Lagrangian*

  $ L &= T - V \
    &= 1/2 (M_1 + 2M + 2I/r^2 + m sin^2 α) dot(x)^2 + 1/2 m dot(q)^2 \
    &quad - m g q sin α + m g x sin α cos α - 1/2 k (q - x cos α - q_0)^2 $

  *Lagrange's equations*

  For coordinate $x$:
  $ dv(L, x) &= m g sin α cos α - 1/2 k · 2(q - x cos α - q_0) · (-cos α) \
    &= m g sin α cos α + k(q - x cos α - q_0) cos α $

  $ dv(L, dot(x)) = (M_1 + 2M + 2I/r^2 + m sin^2 α) dot(x) $

  $ dv(, t)(dv(L, dot(x))) = (M_1 + 2M + 2I/r^2 + m sin^2 α) dot.double(x) $

  Lagrange's equation with generalized force $Q_x = f$:
  $ (M_1 + 2M + 2I/r^2 + m sin^2 α) dot.double(x) &= f + m g sin α cos α \
    &quad + k(q - x cos α - q_0) cos α $

  For coordinate $q$:
  $ dv(L, q) = -m g sin α - k(q - x cos α - q_0) $

  $ dv(L, dot(q)) = m dot(q) $

  $ dv(, t)(dv(L, dot(q))) = m dot.double(q) $

  Lagrange's equation ($Q_q = 0$):
  $ m dot.double(q) = -m g sin α - k(q - x cos α - q_0) $

  With $q = x cos α + y$ and $q_0 = y_0$:
  $ dot.double(q) = dot.double(x) cos α + dot.double(y) $
  $ q - x cos α - q_0 = y - y_0 $

  $ cases(
    (M_1 + 2M + 2I/r^2 + m sin^2 α) dot.double(x) - k(y - y_0) cos α = f + m g sin α cos α,
    m dot.double(x) cos α + m dot.double(y) = -m g sin α - k(y - y_0)
  ) $

  $ (M_1 + 2M + 2I/r^2 + m sin^2 α) dot.double(x) + m dot.double(y) cos α &= f + m g sin α cos α + k(y - y_0) cos α + m dot.double(y) cos α \
    &= f + m g sin α cos α + k(y - y_0) cos α + \
    & quad quad [-m g sin α - k(y - y_0) - m dot.double(x) cos α] cos α \
    &= f - m dot.double(x) cos^2 α $

  $ (M_1 + 2M + 2I/r^2 + m sin^2 α + m cos^2 α) dot.double(x) + m dot.double(y) cos α = f $

  $ (M_1 + 2M + 2I/r^2 + m) dot.double(x) + m dot.double(y) cos α = f $

  #boxed[$ cases(
    (M_1 + 2M + 2I/r^2 + m) dot.double(x) + m dot.double(y) cos α = f,
    m dot.double(x) cos α + m dot.double(y) = -m g sin α - k(y - y_0)
  ) $]
]
