#import "../shared/_at.typ": *

#show: ad.with(
  title: "Assignment 3",
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
  *[20 pts] Sphere on incline*

  A uniform sphere has mass $M$ and radius $a$. The sphere is released from rest on a plane that is inclined at an angle $β$ to the horizontal and for which the coefficient of static friction is $μ_s$.

  *(a)* Suppose the sphere rolls without slipping. Determine the acceleration of the CM and the required frictional force in terms of $M$, $g$ and $β$. Deduce that there is a critical angle of inclination $β_c$ below which there is pure rolling motion and above which there is slipping.

  *(b)* Suppose $β > β_c$ so that that slipping occurs. The coefficient of kinetic friction between the sphere and the plane is $μ_k$. Determine the acceleration of the CM and the angular acceleration. Deduce a relation between the CM velocity and the angular velocity.

  *(c)* Show that the mechanical energy of the sphere is constant during rolling but decreases quadratically with time during slipping.
]

#solution[
  *Part (a): Rolling without slipping*

  *Setup and force analysis*

  For a uniform sphere, the moment of inertia about the center is:
  $ I = 2/5 M a^2 $

  Let $x$ be the position of the center of mass down the incline, with acceleration $a_"CM" = dot.double(x)$.

  Forces on the sphere:
  - Weight component along incline: $M g sin β$ (down the incline)
  - Normal force: $N = M g cos β$ (perpendicular to incline)
  - Friction force: $f$ (up the incline, opposing motion)

  Newton's second law for translation:
  $ M a_"CM" = M g sin β - f quad quad (1) $

  *Rotational equation*

  The friction force creates a torque about the center of mass:
  $ τ = f a = I α = 2/5 M a^2 α quad quad (2) $

  where $α = dot.double(θ)$ is the angular acceleration.

  *Rolling constraint*

  For rolling without slipping:
  $ x = a θ ⟹ a_"CM" = a α quad quad (3) $

  From equation (2):
  $ f = (I α)/a = (2/5 M a^2 α)/a = 2/5 M a α = 2/5 M a_"CM" $

  Substituting into equation (1):
  $ M a_"CM" = M g sin β - 2/5 M a_"CM" $

  $ M a_"CM" + 2/5 M a_"CM" = M g sin β $

  $ 7/5 M a_"CM" = M g sin β $

  #boxed[$ a_"CM" = 5/7 g sin β $]

  The frictional force is:
  #boxed[$ f = 2/5 M a_"CM" = 2/5 M · 5/7 g sin β = 2/7 M g sin β $]

  *Critical angle*

  Slipping begins when the friction force reaches its maximum value:
  $ f_"max" = μ_s N = μ_s M g cos β $

  At the critical angle $β_c$:
  $ 2/7 M g sin β_c = μ_s M g cos β_c $

  $ tan β_c = 7/2 μ_s $

  #boxed[$ β_c = arctan(7/2 μ_s) $]

  *Part (b): Slipping motion*

  When $β > β_c$, the sphere slips. The kinetic friction force is:
  $ f = μ_k N = μ_k M g cos β $

  *Linear acceleration*

  From Newton's second law:
  $ M a_"CM" = M g sin β - μ_k M g cos β $

  #boxed[$ a_"CM" = g(sin β - μ_k cos β) $]

  *Angular acceleration*

  The torque equation:
  $ I α = f a = μ_k M g cos β · a $

  $ 2/5 M a^2 α = μ_k M g a cos β $

  #boxed[$ α = (5 μ_k g cos β)/(2 a) $]

  *Relationship between $v_"CM"$ and $ω$*

  Since slipping occurs, the rolling constraint is violated. Integrating the accelerations from rest:
  $ v_"CM" = a_"CM" t = g(sin β - μ_k cos β) t $

  $ ω = α t = (5 μ_k g cos β)/(2 a) t $

  Eliminating $t$:
  $ ω = (5 μ_k g cos β)/(2 a) · v_"CM"/(g(sin β - μ_k cos β)) $

  #boxed[$ ω = (5 μ_k cos β)/(2 a(sin β - μ_k cos β)) v_"CM" $]

  Alternatively, expressing $v_"CM"$ in terms of $ω$:
  #boxed[$ v_"CM" = (2 a(sin β - μ_k cos β))/(5 μ_k cos β) ω $]

  Note that during slipping, $v_"CM" > a ω$ (the contact point slides down the incline).

  *Part (c): Energy analysis*

  *Case 1: Rolling without slipping*

  The total mechanical energy is:
  $ E = 1/2 M v_"CM"^2 + 1/2 I ω^2 + M g h = 7/10 M v_"CM"^2 + M g h $

  where we used $I = 2/5 M a^2$ and the rolling constraint $v_"CM" = a ω$.

  Taking the time derivative:
  $ dv(E, t) = 7/5 M v_"CM" a_"CM" + M g dot(h) $

  Since $dot(h) = -v_"CM" sin β$ and $a_"CM" = 5/7 g sin β$:
  $ dv(E, t) = 7/5 M v_"CM" · 5/7 g sin β - M g v_"CM" sin β = 0 $

  #boxed[$ dv(E, t) = 0 quad "during rolling without slipping" $]

  Energy is conserved because the friction force does no work (the contact point has zero velocity).

  *Case 2: Slipping motion*

  The total energy is:
  $ E = 1/2 M v_"CM"^2 + 1/5 M a^2 ω^2 + M g h $

  The rate of energy dissipation is the power lost to friction:
  $ dv(E, t) = -f · v_"slip" = -μ_k M g cos β (v_"CM" - a ω) $

  where $v_"slip" = v_"CM" - a ω$ is the slip velocity at the contact point.

  *Quadratic decrease with time*

  From part (b), during slipping (starting from rest):
  $ v_"CM" = g(sin β - μ_k cos β) t, quad ω = (5 μ_k g cos β)/(2 a) t $

  The height decreases as: $h(t) = h_0 - 1/2 g(sin β - μ_k cos β) sin β t^2$

  Substituting into the energy expression:
  $ E(t) &= 1/2 M [g(sin β - μ_k cos β) t]^2 + 1/5 M a^2 [(5 μ_k g cos β)/(2 a) t]^2 + M g [h_0 - 1/2 g(sin β - μ_k cos β) sin β t^2] \
    &= M g h_0 + M g^2 t^2 [1/2 (sin β - μ_k cos β)^2 + (5/4) μ_k^2 cos^2 β - 1/2 (sin β - μ_k cos β) sin β] $

  Simplifying the bracket:
  $ [·] &= 1/2 (sin^2 β - 2 μ_k sin β cos β + μ_k^2 cos^2 β) + (5/4) μ_k^2 cos^2 β - 1/2 sin^2 β + 1/2 μ_k sin β cos β \
    &= -1/2 μ_k sin β cos β + (7/4) μ_k^2 cos^2 β $

  Therefore:
  $ E(t) = M g h_0 - M g^2 t^2 [1/2 μ_k sin β cos β - (7/4) μ_k^2 cos^2 β] $

  The coefficient of $t^2$ is positive (since $μ_k < tan β$ for slipping), so:

  #boxed[$ E(t) = E_0 - C t^2 quad "where" C > 0 $]

  where $E_0 = M g h_0$ and $C = M g^2 [1/2 μ_k sin β cos β - (7/4) μ_k^2 cos^2 β]$.

  #boxed[$ "Energy decreases quadratically with time during slipping," \ "whereas it remains constant during pure rolling" $]
]

#pagebreak()

#pbm("2")[
  *[20 pts] Rope sliding off table*

  A uniform rope of length $ℓ$ and mass $M$ is stretched on a table with a segment of length $x_0$ hanging over the edge. The rope is released from rest.

  *(a)* Suppose the table is frictionless, find the time $t_s$ taken for the rope to slide off the table from Newton's second law.

  *(b)* Solve the same problem by applying work-energy theorem, and compare the result with (a).

  *(c)* Suppose the motion is subjected to friction, with a coefficient of kinetic friction $μ_k$ between the rope and table. Find the time $t_s$ taken for the rope to slide off the table.

  *(d)* Calculate the total loss in mechanical energy of the rope at time $t_s$ in terms of $μ_k$, $x_0/ℓ$ and $M g ℓ$.
]

#solution[
  *Part (a): Frictionless case using Newton's second law*

  *Setup*

  Let $x(t)$ be the length of rope hanging over the edge at time $t$. Initially, $x(0) = x_0$ and $dot(x)(0) = 0$.

  The linear mass density is $λ = M/ℓ$.

  *Force analysis*

  The hanging segment has mass $m_"hang" = λ x = (M x)/ℓ$ and experiences gravitational force $m_"hang" g = (M g x)/ℓ$ downward.

  The portion on the table has mass $m_"table" = M(ℓ - x)/ℓ$ and experiences no net horizontal force (frictionless table, no tension gradient).

  *Newton's second law*

  The entire rope moves with the same acceleration $a = dot.double(x)$. Applying Newton's second law to the whole rope:
  $ M dot.double(x) = (M g x)/ℓ $

  $ dot.double(x) = (g x)/ℓ $

  *Solving the differential equation*

  Rearranging:
  $ dot.double(x) - (g/ℓ) x = 0 $

  The general solution is:
  $ x(t) = A e^(sqrt(g/ℓ) t) + B e^(-sqrt(g/ℓ) t) $

  Applying initial conditions $x(0) = x_0$ and $dot(x)(0) = 0$:
  $ x(0) = A + B = x_0 $

  $ dot(x)(t) = A sqrt(g/ℓ) e^(sqrt(g/ℓ) t) - B sqrt(g/ℓ) e^(-sqrt(g/ℓ) t) $

  $ dot(x)(0) = sqrt(g/ℓ) (A - B) = 0 ⟹ A = B $

  From $A + B = x_0$ and $A = B$:
  $ A = B = x_0/2 $

  Therefore:
  $ x(t) = x_0/2 [e^(sqrt(g/ℓ) t) + e^(-sqrt(g/ℓ) t)] = x_0 cosh(sqrt(g/ℓ) t) $

  *Finding the time to slide off*

  The rope completely slides off when $x(t_s) = ℓ$:
  $ ℓ = x_0 cosh(sqrt(g/ℓ) t_s) $

  $ cosh(sqrt(g/ℓ) t_s) = ℓ/x_0 $

  $ sqrt(g/ℓ) t_s = "arccosh"(ℓ/x_0) = ln(ℓ/x_0 + sqrt((ℓ/x_0)^2 - 1)) $

  #boxed[$ t_s = sqrt(ℓ/g) ln(ℓ/x_0 + sqrt((ℓ/x_0)^2 - 1)) $]

  Alternatively:
  #boxed[$ t_s = sqrt(ℓ/g) "arccosh"(ℓ/x_0) $]

  *Part (b): Work-energy theorem*

  *Energy method*

  The initial potential energy (taking the table as reference level $U = 0$):
  $ E_0 = -integral_0^(x_0) λ g y dif y = -λ g · x_0^2/2 = -(M g x_0^2)/(2 ℓ) $

  (negative because the hanging segment is below the table)

  When length $x$ hangs over the edge, the potential energy is:
  $ U(x) = -integral_0^x λ g y dif y = -(M g x^2)/(2 ℓ) $

  The kinetic energy is:
  $ K(x) = 1/2 M dot(x)^2 $

  By energy conservation:
  $ K(x) + U(x) = E_0 $

  $ 1/2 M dot(x)^2 - (M g x^2)/(2 ℓ) = -(M g x_0^2)/(2 ℓ) $

  $ dot(x)^2 = (g(x^2 - x_0^2))/ℓ $

  $ dot(x) = sqrt((g(x^2 - x_0^2))/ℓ) $

  (taking positive root since $x$ increases with time)

  *Separating variables*

  $ dif t = (dif x)/sqrt((g(x^2 - x_0^2))/ℓ) = sqrt(ℓ/g) (dif x)/sqrt(x^2 - x_0^2) $

  Integrating from $x_0$ to $ℓ$:
  $ t_s = sqrt(ℓ/g) integral_(x_0)^ℓ (dif x)/sqrt(x^2 - x_0^2) $

  Using the standard integral $integral (dif x)/sqrt(x^2 - a^2) = "arccosh"(x/a) + C$:
  $ t_s = sqrt(ℓ/g) ["arccosh"(x/x_0)]_(x_0)^ℓ $

  $ = sqrt(ℓ/g) ["arccosh"(ℓ/x_0) - "arccosh"(1)] $

  $ = sqrt(ℓ/g) "arccosh"(ℓ/x_0) $

  (since $"arccosh"(1) = 0$)

  #boxed[$ t_s = sqrt(ℓ/g) "arccosh"(ℓ/x_0) = sqrt(ℓ/g) ln(ℓ/x_0 + sqrt((ℓ/x_0)^2 - 1)) $]

  This result agrees exactly with part (a), confirming the consistency of the two methods.

  *Part (c): With kinetic friction*

  *Force analysis with friction*

  The friction force on the portion of rope on the table is:
  $ f = μ_k N = μ_k m_"table" g = μ_k M g (ℓ - x)/ℓ $

  This opposes the motion (acts backward on the table portion).

  Newton's second law for the entire rope:
  $ M dot.double(x) = (M g x)/ℓ - μ_k M g (ℓ - x)/ℓ $

  $ dot.double(x) = (g x)/ℓ - (μ_k g (ℓ - x))/ℓ $

  $ dot.double(x) = g/ℓ [x - μ_k (ℓ - x)] = g/ℓ [x + μ_k x - μ_k · ℓ] $

  $ dot.double(x) = g/ℓ [(1 + μ_k) x - μ_k · ℓ] $

  *Solving the differential equation*

  Rearranging:
  $ dot.double(x) - (g(1 + μ_k))/ℓ x = -(μ_k g) $

  This is a second-order linear ODE with constant coefficients. Let $ω^2 = g(1 + μ_k)/ℓ$.

  The homogeneous solution is:
  $ x_h(t) = A e^(ω t) + B e^(-ω t) $

  For the particular solution, try a constant: $x_p = C$:
  $ 0 - ω^2 C = -μ_k · g $

  $ C = (μ_k g)/ω^2 = (μ_k g)/(g(1 + μ_k)/ℓ) = (μ_k ℓ)/(1 + μ_k) $

  General solution:
  $ x(t) = A e^(ω t) + B e^(-ω t) + (μ_k ℓ)/(1 + μ_k) $

  *Applying initial conditions*

  At $t = 0$: $x(0) = x_0$, $dot(x)(0) = 0$:
  $ x_0 = A + B + (μ_k ℓ)/(1 + μ_k) $

  $ A + B = x_0 - (μ_k · ℓ)/(1 + μ_k) = (x_0(1 + μ_k) - μ_k · ℓ)/(1 + μ_k) $

  $ dot(x)(t) = A ω e^(ω t) - B ω e^(-ω t) $

  $ dot(x)(0) = ω(A - B) = 0 ⟹ A = B $

  Therefore:
  $ A = B = 1/2 · (x_0(1 + μ_k) - μ_k · ℓ)/(1 + μ_k) = (x_0(1 + μ_k) - μ_k · ℓ)/(2(1 + μ_k)) $

  The solution is:
  $ x(t) = (x_0(1 + μ_k) - μ_k · ℓ)/(2(1 + μ_k)) [e^(ω t) + e^(-ω t)] + (μ_k · ℓ)/(1 + μ_k) $

  $ = (x_0(1 + μ_k) - μ_k · ℓ)/(1 + μ_k) cosh(ω t) + (μ_k · ℓ)/(1 + μ_k) $

  $ = ((x_0(1 + μ_k) - μ_k · ℓ) cosh(ω t) + μ_k · ℓ)/(1 + μ_k) $

  *Finding time to slide off*

  When $x(t_s) = ℓ$:
  $ ℓ = ((x_0(1 + μ_k) - μ_k · ℓ) cosh(ω t_s) + μ_k · ℓ)/(1 + μ_k) $

  $ ℓ(1 + μ_k) = (x_0(1 + μ_k) - μ_k · ℓ) cosh(ω t_s) + μ_k · ℓ $

  $ ℓ(1 + μ_k) - μ_k · ℓ = (x_0(1 + μ_k) - μ_k · ℓ) cosh(ω t_s) $

  $ ℓ = (x_0(1 + μ_k) - μ_k · ℓ) cosh(ω t_s) $

  $ cosh(ω t_s) = ℓ/(x_0(1 + μ_k) - μ_k · ℓ) = ℓ/(x_0 + μ_k · (x_0 - ℓ)) $

  With $ω = sqrt((g(1 + μ_k))/ℓ)$:

  #boxed[$ t_s = sqrt(ℓ/(g(1 + μ_k))) "arccosh"(ℓ/(x_0 + μ_k · (x_0 - ℓ))) $]

  Alternatively:
  #boxed[$ t_s = sqrt(ℓ/(g(1 + μ_k))) ln((ℓ + sqrt(ℓ^2 - [x_0 + μ_k · (x_0 - ℓ)]^2))/(x_0 + μ_k · (x_0 - ℓ))) $]

  Note: For $μ_k = 0$, this reduces to the frictionless case.

  *Part (d): Energy loss*

  *Initial and final energies*

  Initial energy (at $t = 0$, $x = x_0$):
  $ E_0 = -(M g x_0^2)/(2 ℓ) $

  Final energy (at $t = t_s$, $x = ℓ$):
  $ E_f = 1/2 M v_f^2 - (M g ℓ^2)/(2 ℓ) = 1/2 M v_f^2 - (M g ℓ)/2 $

  where $v_f = dot(x)(t_s)$.

  From $x(t) = ((x_0(1 + μ_k) - μ_k · ℓ) cosh(ω t) + μ_k · ℓ)/(1 + μ_k)$:
  $ dot(x)(t) = ((x_0(1 + μ_k) - μ_k · ℓ) ω sinh(ω t))/(1 + μ_k) $

  At $t = t_s$, using $cosh(ω t_s) = ℓ/(x_0 + μ_k · (x_0 - ℓ))$:

  From $cosh^2 - sinh^2 = 1$:
  $ sinh^2(ω t_s) &= cosh^2(ω t_s) - 1 \
    &= [ℓ/(x_0 + μ_k · (x_0 - ℓ))]^2 - 1 \
    &= (ℓ^2 - [x_0 + μ_k · (x_0 - ℓ)]^2)/([x_0 + μ_k · (x_0 - ℓ)]^2) $

  Let $x_"eff" = x_0 + μ_k · (x_0 - ℓ) = x_0(1 + μ_k) - μ_k · ℓ$:
  $ sinh(ω t_s) = sqrt(ℓ^2 - x_"eff"^2)/x_"eff" $

  Therefore:
  $ v_f &= (x_"eff" · ω · sqrt(ℓ^2 - x_"eff"^2))/(x_"eff" (1 + μ_k)) \
    &= (ω sqrt(ℓ^2 - x_"eff"^2))/(1 + μ_k) \
    &= (sqrt((g(1 + μ_k))/ℓ) sqrt(ℓ^2 - x_"eff"^2))/(1 + μ_k) \
    &= sqrt(g/ℓ) · sqrt(ℓ^2 - x_"eff"^2)/sqrt(1 + μ_k) $

  $ v_f^2 = (g(ℓ^2 - x_"eff"^2))/(ℓ(1 + μ_k)) $

  *Energy loss calculation*

  The energy loss is:
  $ Δ E = E_f - E_0 = [1/2 M v_f^2 - (M g ℓ)/2] - [-(M g x_0^2)/(2 ℓ)] $

  $ = 1/2 M v_f^2 - (M g ℓ)/2 + (M g x_0^2)/(2 ℓ) $

  Substituting $v_f^2$:
  $ Δ E = 1/2 M · (g(ℓ^2 - x_"eff"^2))/(ℓ(1 + μ_k)) - (M g ℓ)/2 + (M g x_0^2)/(2 ℓ) $

  $ = (M g)/(2 ℓ) [(ℓ^2 - x_"eff"^2)/(1 + μ_k) - ℓ^2 + x_0^2] $

  With $x_"eff" = x_0(1 + μ_k) - μ_k · ℓ$:
  $ x_"eff"^2 = [x_0(1 + μ_k) - μ_k · ℓ]^2 = x_0^2(1 + μ_k)^2 - 2 x_0 μ_k · ℓ(1 + μ_k) + μ_k^2 ℓ^2 $

  *Energy dissipated by friction*

  The work done against friction as the rope slides off is:
  $ W_"friction" = integral_0^(t_s) f · v dif t = integral_0^(t_s) μ_k · M g (ℓ - x)/ℓ · dot(x) dif t $

  Changing variables to $x$:
  $ W_"friction" = integral_(x_0)^ℓ μ_k · M g (ℓ - x)/ℓ dif x $

  $ = (μ_k M g)/ℓ integral_(x_0)^ℓ (ℓ - x) dif x $

  $ = (μ_k M g)/ℓ [ℓ x - x^2/2]_(x_0)^ℓ $

  $ = (μ_k M g)/ℓ [(ℓ^2 - ℓ^2/2) - (ℓ x_0 - x_0^2/2)] $

  $ = (μ_k M g)/ℓ [ℓ^2/2 - ℓ x_0 + x_0^2/2] $

  $ = (μ_k M g)/(2 ℓ) [ℓ^2 - 2 ℓ x_0 + x_0^2] $

  $ = (μ_k M g)/(2 ℓ) (ℓ - x_0)^2 $

  The total energy loss (magnitude) is:

  #boxed[$ |Δ E| = (μ_k M g)/(2 ℓ) (ℓ - x_0)^2 = (μ_k M g ℓ)/2 (1 - x_0/ℓ)^2 $]

  Expressing in the requested form:
  #boxed[$ |Δ E| = 1/2 μ_k · M g ℓ (1 - x_0/ℓ)^2 $]

  The energy loss is proportional to $μ_k$ and to the square of the distance $(ℓ - x_0)$ that slides across the table. Longer sliding distances and higher friction lead to greater dissipation.
]

#pagebreak()

#pbm("3")[
  *[20 pts] Ball and peg*

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 84.png"), width:100%, border: false),
    [A heavy ball is attached to a fixed point $O$ by a light inextensible string of length $2a$. The ball is drawn back until the string makes an acute angle $α$ with the vertical and is then released. A thin peg is fixed a distance $a$ vertically below $O$ in the path of the string as shown. ],
  )
  In a game, the contestant chooses the value of $α$ and wins a prize if the ball strikes the peg. Ignoring frictions, find the winning value of $α$.
]

#solution[
  *Setup*

  The ball is released from angle $α$ from vertical. The string wraps around the peg when the ball passes through the vertical position on the opposite side. After wrapping, the ball swings in a circle of radius $a$ centered at the peg.

  *Phase 1: Initial swing*

  Taking the peg as reference level ($h = 0$ at peg), the initial height is:
  $ h_i = a - 2a cos α = a(1 - 2 cos α) $

  where $a$ is the distance from $O$ to the peg.

  The lowest point of the swing (ball directly below $O$) is at height:
  $ h_"bottom" = a - 2a = -a $

  By energy conservation:
  $ m g h_i = m g h_"bottom" + 1/2 m v_"bottom"^2 $

  $ g a (1 - 2 cos α) = -g a + 1/2 v_"bottom"^2 $

  $ v_"bottom"^2 = 2 g a (1 - 2 cos α + 1) = 4 g a (1 - cos α) $

  *Phase 2: After wrapping around peg*

  When the string wraps around the peg, the effective radius becomes $a$. The ball is at the bottom of the new circular path (height $-a$ relative to peg) with speed $v_"bottom"$.

  For the ball to strike the peg, it must reach the peg height ($h = 0$) with zero velocity, at which point the string goes slack and the ball falls onto the peg.

  *Energy conservation from bottom to peg level*

  At the bottom of the circle (height $-a$), the ball has speed $v_"bottom"$.

  At the peg height ($h = 0$), the ball should have zero speed:
  $ 1/2 m v_"bottom"^2 - m g a = m g · 0 + 1/2 m · 0^2 $

  $ 1/2 v_"bottom"^2 = g a $

  $ v_"bottom"^2 = 2 g a $

  From $v_"bottom"^2 = 4 g a (1 - cos α)$:
  $ 4 g a (1 - cos α) = 2 g a $

  $ 1 - cos α = 1/2 $

  $ cos α = 1/2 $

  #boxed[$ α = 60° = π/3 $]
]

#pagebreak()

#pbm("4")[
  *[20 pts] Elastic cord*

  A light elastic cord of length $2ℓ$ and spring constant $k$ is held with the ends fixed a distance $2ℓ$ apart in a horizontal position. A block of mass $m$ is then suspended from the midpoint of the cord.

  *(a)* Choosing zero potential reference at $y = 0$ before the block is suspended from the mid point of the cord. Find an expression for the potential energy of the system $V(y)$ where $y$ is the vertical sag of the center of the cord.

  *(b)* Determine the frequency of vertical oscillations about the equilibrium position of the block.
]

#solution[
  *Part (a): Potential energy*

  *Geometry*

  Initially, the cord is horizontal with endpoints separated by $2ℓ$. The midpoint is at the origin ($y = 0$).

  When the block is suspended and the midpoint sags by distance $y$ (downward, $y > 0$), each half of the cord forms a straight line from an endpoint to the midpoint.

  Taking $y$ as positive downward: endpoints at $(±ℓ, 0)$, midpoint at $(0, y)$.

  *Length of each half*

  The length of each half is:
  $ L = sqrt(ℓ^2 + y^2) $

  The total length of the cord is:
  $ L_"total" = 2 sqrt(ℓ^2 + y^2) $

  The natural length is $2ℓ$, so the extension is:
  $ Δ L = 2 sqrt(ℓ^2 + y^2) - 2ℓ = 2(sqrt(ℓ^2 + y^2) - ℓ) $

  *Elastic potential energy*

  For a spring with spring constant $k$ and extension $Δ L$:
  $ U_"elastic" = 1/2 k (Δ L)^2 = 1/2 k [2(sqrt(ℓ^2 + y^2) - ℓ)]^2 $

  $ = 2 k (sqrt(ℓ^2 + y^2) - ℓ)^2 $

  *Gravitational potential energy*

  Taking $y = 0$ as the reference level:
  $ U_"grav" = -m g y $

  *Total potential energy*

  $ V(y) = U_"elastic" + U_"grav" = 2 k (sqrt(ℓ^2 + y^2) - ℓ)^2 - m g y $

  #boxed[$ V(y) = 2 k (sqrt(ℓ^2 + y^2) - ℓ)^2 - m g y $]

  *Part (b): Frequency of oscillations*

  *Equilibrium position*

  At equilibrium, $dv(V, y) = 0$:
  $ dv(V, y) = 2 k · 2(sqrt(ℓ^2 + y^2) - ℓ) · y/sqrt(ℓ^2 + y^2) - m g = 0 $

  $ (4 k y (sqrt(ℓ^2 + y^2) - ℓ))/sqrt(ℓ^2 + y^2) = m g $

  Let $y_0$ be the equilibrium sag. Then:
  $ (4 k y_0 (sqrt(ℓ^2 + y_0^2) - ℓ))/sqrt(ℓ^2 + y_0^2) = m g quad quad (star) $

  *Small oscillations*

  For small oscillations about $y_0$, let $y = y_0 + η$ where $|η| ≪ y_0$.

  The equation of motion is:
  $ m dot.double(y) = -dv(V, y) $

  Expanding $V(y)$ to second order in $η$:
  $ V(y_0 + η) ≈ V(y_0) + (dv(V, y))|_(y_0) η + 1/2 (dv(dv(V, y), y))|_(y_0) η^2 $

  The first derivative vanishes at equilibrium. The effective spring constant is:
  $ k_"eff" = (dot.double(V))|_(y_0) $

  The frequency is:
  $ ω = sqrt(k_"eff"/m) = sqrt(1/m (dot.double(V))|_(y_0)) $

  *Computing the second derivative*

  $ dv(V, y) = (4 k y (sqrt(ℓ^2 + y^2) - ℓ))/sqrt(ℓ^2 + y^2) - m g $

  Denoting $r(y) = sqrt(ℓ^2 + y^2)$:

  $ dv(V, y) = (4 k y (r - ℓ))/r - m g $

  Taking the derivative:
  $ dot.double(V) = dv(, y)[(4 k y (r - ℓ))/r] $

  Using the quotient rule and $dv(r, y) = y/r$:
  $ dot.double(V) = 4 k [dv(, y)[y(r - ℓ)] · r - y(r - ℓ) · dv(r, y)]/r^2 $

  Computing $dv(, y)[y(r - ℓ)]$:
  $ dv(, y)[y(r - ℓ)] &= (r - ℓ) + y dv(r, y) \
    &= (r - ℓ) + y · y/r \
    &= (r - ℓ) + y^2/r \
    &= (r^2 - ℓ r + y^2)/r \
    &= (ℓ^2 + y^2 - ℓ r + y^2)/r \
    &= (ℓ^2 + 2y^2 - ℓ r)/r $

  Therefore:
  $ dot.double(V) &= 4 k [(ℓ^2 + 2y^2 - ℓ r)/r · r - y(r - ℓ) · y/r]/r^2 \
    &= 4 k [(ℓ^2 + 2y^2 - ℓ r) - y^2(r - ℓ)/r]/r^2 \
    &= 4 k [r(ℓ^2 + 2y^2 - ℓ r) - y^2(r - ℓ)]/(r^3) \
    &= 4 k [ℓ^2 r + 2 y^2 r - ℓ r^2 - y^2 r + ℓ y^2]/(r^3) \
    &= 4 k [ℓ^2 r + y^2 r - ℓ r^2 + ℓ y^2]/(r^3) \
    &= 4 k [ℓ^2 r - ℓ r^2 + y^2(r + ℓ)]/(r^3) \
    &= 4 k [ℓ r(ℓ - r) + y^2(r + ℓ)]/(r^3) $

  At equilibrium $y = y_0$, let $r_0 = sqrt(ℓ^2 + y_0^2)$.

  From the equilibrium condition ($star$):
  $ 4 k y_0 (r_0 - ℓ) = m g r_0 $

  $ 4 k (r_0 - ℓ) = (m g r_0)/y_0 $

  Substituting into $dot.double(V)|_(y_0)$:
  $ dot.double(V)|_(y_0) &= 4 k [ℓ r_0(ℓ - r_0) + y_0^2(r_0 + ℓ)]/(r_0^3) \
    &= 4 k [-ℓ r_0(r_0 - ℓ) + y_0^2(r_0 + ℓ)]/(r_0^3) $

  Using $r_0^2 = ℓ^2 + y_0^2$:
  $ dot.double(V)|_(y_0) &= 4 k [(ℓ^2 r_0 - ℓ^3 + y_0^2 r_0)/r_0^3] \
    &= 4 k [(r_0(ℓ^2 + y_0^2) - ℓ^3)/r_0^3] \
    &= 4 k [(r_0^3 - ℓ^3)/r_0^3] \
    &= 4 k [1 - (ℓ/r_0)^3] $

  Therefore:
  $ k_"eff" = dot.double(V)|_(y_0) = 4 k [1 - (ℓ/r_0)^3] $

  The frequency is:
  $ ω = sqrt(k_"eff"/m) = sqrt((2 k)/m [1 - (ℓ/r_0)^3]) $

  #boxed[$ f = ω/(2π) = 1/(2π) sqrt((2 k)/m [1 - (ℓ/r_0)^3]) $]

  where $r_0 = sqrt(ℓ^2 + y_0^2)$ and $y_0$ satisfies the equilibrium condition:
  $ (2 k y_0(r_0 - ℓ))/r_0 = m g $

  #boxed[$ ω = sqrt((2 k)/m [1 - (ℓ/sqrt(ℓ^2 + y_0^2))^3]) $]

  *Physical interpretation:* The frequency depends on the equilibrium sag $y_0$, which itself depends on the mass $m$, spring constant $k$, and cord length $ℓ$. For small sag ($y_0 ≪ ℓ$), $r_0 ≈ ℓ$ and $ω ≈ 0$, indicating very slow oscillations. For large sag, $ℓ/r_0 → 0$ and $ω → sqrt(2k/m)$.

]

#pagebreak()

#pbm("5")[
  *[20 pts] Cube on sphere*

  A uniform cubical block of mass $m$ and sides $2a$ is balanced on top of a fixed rough sphere of radius $R$.

  *(a)* Choosing zero potential reference at the center of the sphere, show that the potential energy function can be expressed as
  $ U(θ) = m g [(a + R) cos θ + R θ sin θ] $,
  where $θ$ is the angle of tilt of the block measured with respect to the horizontal level.

  *(b)* Show that the equilibrium at $θ = 0$ is stable or unstable depending on whether $a$ is less than or greater than $R$ respectively. And, determine the period of oscillation for the case of stable equilibrium.

  *(c)* Determine the stability for the case $a = R$.
]

#solution[
  *Part (a): Potential energy*

  *Setup and geometry*

  The cube has side length $2a$, so its center is at distance $a$ from any face. When balanced on top of the sphere with one face horizontal, the bottom face touches the sphere at one point.

  Initially ($θ = 0$), the cube sits symmetrically with its bottom face horizontal. The center of the cube is at height $h_0 = R + a$ above the sphere's center (radius $R$ to the top of sphere, plus $a$ to the center of cube).

  *Rolling without slipping*

  When the cube rocks through angle $θ$ (measured from vertical), it rotates about the contact point. The arc length traveled on the sphere is $s = R θ$.

  *Geometric derivation*

  Using coordinates with origin at the sphere's center:
  - Contact point $C$ on sphere: $(R sin θ, R cos θ)$
  - Cube rotates by angle $θ$ while maintaining contact
  - Cube's center $G$ is at distance $a$ from the bottom face

  For a cube of side $2a$ rolling without slipping on a sphere of radius $R$, the height of the cube's center above the sphere's center is:
  $ h(θ) = (a + R) cos θ + R θ sin θ $

  This accounts for:
  1. The contact point on the sphere at height $R cos θ$
  2. The displacement of the cube's center due to rotation by angle $θ$
  3. The arc length constraint $s = R θ$ (no slipping)

  #boxed[$ U(θ) = m g h(θ) = m g [(a + R) cos θ + R θ sin θ] $]

  *Part (b): Stability analysis*

  *Equilibrium*

  At $θ = 0$ (cube sitting symmetrically on top):
  $ dv(U, θ)|_(θ=0) = m g [-a sin θ + R θ cos θ]|_(θ=0) = 0 $

  This confirms $θ = 0$ is an equilibrium.

  *Stability*

  The second derivative:
  $ dot.double(U) = m g [-a cos θ + R cos θ - R θ sin θ] $

  At $θ = 0$:
  $ dot.double(U)|_(θ=0) = m g (R - a) $

  *Case 1: $a < R$*

  $ dot.double(U)|_(θ=0) = m g (R - a) > 0 $

  The potential has a local minimum at $θ = 0$, so equilibrium is *stable*.

  *Case 2: $a > R$*

  $ dot.double(U)|_(θ=0) = m g (R - a) < 0 $

  The potential has a local maximum at $θ = 0$, so equilibrium is *unstable*.

  #boxed[$ "Stable if" a < R, quad "Unstable if" a > R $]

  *Period of small oscillations (stable case, $a < R$)*

  *Equation of motion*

  For small oscillations, expand $U(θ)$ to second order:
  $ U(θ) ≈ U(0) + 1/2 dot.double(U)|_(θ=0) θ^2 = m g (a + R) + 1/2 m g (R - a) θ^2 $

  The moment of inertia about the instantaneous contact point is approximately:
  $ I ≈ I_"CM" + m a^2 = (2 m a^2)/3 + m a^2 = (5 m a^2)/3 $

  where $I_"CM" = (2 m a^2)/3$ is the moment of inertia about the center (for a cube of side $2a$).

  The equation of motion:
  $ I dot.double(θ) = -dv(U, θ) ≈ -m g (R - a) θ $

  $ dot.double(θ) + (3 g (R - a))/(5 a^2) θ = 0 $

  The angular frequency:
  $ ω = sqrt((3 g (R - a))/(5 a^2)) $

  The period:
  #boxed[$ T = (2π)/ω = 2π sqrt((5 a^2)/(3 g (R - a))) = 2π a sqrt(5/(3 g (R - a))) $]

  *Part (c): Marginal case $a = R$*

  When $a = R$:
  $ dot.double(U)|_(θ=0) = m g (R - a) = 0 $

  The second derivative test is inconclusive. Examining higher-order terms, expand $U(θ)$ to fourth order:
  $ cos θ ≈ 1 - θ^2/2 + θ^4/24 $
  $ sin θ ≈ θ - θ^3/6 $

  $ U(θ) ≈ m g R [2(1 - θ^2/2 + θ^4/24) + θ(θ - θ^3/6)] $

  $ = m g R [2 - θ^2 + θ^4/12 + θ^2 - θ^4/6] $

  $ = m g R [2 + θ^4(1/12 - 1/6)] = m g R [2 + θ^4(1/12 - 2/12)] $

  $ = m g R [2 - θ^4/12] $

  So for small $θ$:
  $ U(θ) ≈ 2 m g R - (m g R θ^4)/12 $

  This shows $U(θ) < U(0)$ for any $θ ≠ 0$ (to fourth order). Therefore, $θ = 0$ is a local maximum, and the equilibrium is *unstable*.

  #boxed[$ "For" a = R": unstable equilibrium" $]

  *Physical interpretation:* When $a < R$ (small cube or large sphere), the cube is stable - its center of mass is close to the sphere, making it hard to tip over. When $a > R$ (large cube or small sphere), the cube is unstable - it's top-heavy and easily tips. The marginal case $a = R$ is also unstable, but only weakly so (fourth-order instability rather than second-order).

]
