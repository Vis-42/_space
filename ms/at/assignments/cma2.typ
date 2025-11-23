#import "../shared/_at.typ": *

#show: ad.with(
  title: "Assignment 2",
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
  *[35 pts] Raindrop falling through mist*

  A raindrop is falling through a mist collecting mass as it falls. Assume that the drop remains spherical and that the rate of accretion is proportional to the cross-sectional area of the drop multiplied by the speed of fall. You may assume uniform downward gravitational field of magnitude $g$, zero air resistance and the density $ρ$ of the drop remains constant.

  *(a)* Given that the initial radius of the drop is $r_0$, obtain a second-order nonlinear ordinary differential equation for $z(t)$ governing the dynamics of the raindrop as it is falling through the mist.

  *(b)* Now, consider that the drop starts from rest when it is infinitesimally small, i.e. $r_0 ≈ 0$, solve for $z(t)$, $dot(z)(t)$ and $dot.double(z)(t)$.
]

#solution[
  *Part (a): Deriving the equation of motion*

  *Setup and mass accretion rate*

  Let $m(t)$ be the mass of the raindrop at time $t$, and $r(t)$ be its radius. Since the density is constant:
  $ m = 4/3 π r^3 ρ $

  The accretion rate is proportional to cross-sectional area $π r^2$ times speed $|dot(z)|$. Since the drop is falling (taking downward as positive for $v = dot(z) > 0$):
  $ dv(m, t) = k π r^2 v $

  where $k$ is a constant with dimensions of density. Physically, $k$ represents the mass density of the mist being swept up.

  From $m = 4/3 π r^3 ρ$:
  $ dv(m, t) = 4 π r^2 ρ dv(r, t) $

  Equating the two expressions:
  $ 4 π r^2 ρ dv(r, t) = k π r^2 v $

  $ dv(r, t) = (k v)/(4 ρ) $

  *Variable mass dynamics - Rocket equation*

  For a variable mass system, Newton's second law takes the form:
  $ vb(F)^"ext" = dv(, t)(m vb(v)) = m dv(vb(v), t) + vb(v) dv(m, t) $

  For our falling raindrop with external force $vb(F)^"ext" = m g$ (downward):
  $ m g = m dv(v, t) + v dv(m, t) $

  Substituting $dv(m, t) = k π r^2 v$:
  $ m g = m dv(v, t) + v (k π r^2 v) $

  $ m dv(v, t) = m g - k π r^2 v^2 $

  Using $m = 4/3 π r^3 ρ$:
  $ 4/3 π r^3 ρ dv(v, t) = 4/3 π r^3 ρ g - k π r^2 v^2 $

  Dividing by $4/3 π r^2 ρ$:
  $ r dv(v, t) = r g - (3 k v^2)/(4 ρ) $

  From $m = 4/3 π r^3 ρ$:
  $ dv(m, t) = 4 π r^2 ρ dv(r, t) = 4 π r^2 ρ (k v)/(4 ρ) = k π r^2 v $

  This confirms the accretion relation. From $m dv(v, t) = m g - k π r^2 v^2$:
  $ (4/3 π r^3 ρ) dv(v, t) = (4/3 π r^3 ρ) g - k π r^2 v^2 $

  $ dv(v, t) = g - (3 k v^2)/(4 ρ r) $

  Since $v = dv(z, t)$ and $dv(v, t) = dot.double(z)$:

  #boxed[$ dot.double(z) = g - (3 k v^2)/(4 ρ r(t)) $]

  where $r(t)$ satisfies $dv(r, t) = (k v)/(4 ρ)$ with $v = dv(z, t)$.

  For $r_0 ≈ 0$, we eliminate $r$ to obtain a single equation. From $dv(r, t) = (k v)/(4 ρ)$:
  $ r(t) = (k)/(4 ρ) integral_0^t v(t') dif t' = (k z(t))/(4 ρ) $

  Substituting back:
  $ dot.double(z) = g - (3 k v^2)/(4 ρ) · (4 ρ)/(k z) = g - (3 v^2)/z $

  #boxed[$ dot.double(z) = g - (3 [dv(z, t)]^2)/(z) $]

  This is the second-order nonlinear ODE for $z(t)$ when $r_0 ≈ 0$.

  *Part (b): Solution for $r_0 ≈ 0$ starting from rest*

  For $r_0 ≈ 0$, we have the equation:
  $ dot.double(z) = g - (3 v^2)/z $

  with initial conditions $z(0) = 0$, $v(0) = 0$.

  Using the chain rule $dot.double(z) = v dv(v, z)$:
  $ v dv(v, z) = g - (3 v^2)/z $

  Multiplying both sides by $z$:
  $ z v dv(v, z) = g z - 3 v^2 $

  $ z v dif v = (g z - 3 v^2) dif z $

  This is a first-order ODE. We seek a power law solution of the form $v = A z^α$ for constants $A$ and $α$.

  Then $dv(v, z) = α A z^(α-1)$ and:
  $ z (A z^α)(α A z^(α-1)) &= g z - 3 (A z^α)^2 \
    α A^2 z^(2α) &= g z - 3 A^2 z^(2α) $

  For this to hold for all $z$, we need $2α = 1$, giving $α = 1/2$.

  Then:
  $ 1/2 A^2 z &= g z - 3 A^2 z \
    1/2 A^2 + 3 A^2 &= g \
    7/2 A^2 &= g \
    A &= sqrt((2g)/7) $

  Therefore:
  $ v(t) = sqrt((2g)/7) sqrt(z) $

  #boxed[$ dot(z)(t) = sqrt((2g)/7) sqrt(z(t)) $]

  To find $z(t)$, we solve:
  $ dv(z, t) = sqrt((2g)/7) sqrt(z) $

  Separating variables:
  $ (dif z)/sqrt(z) = sqrt((2g)/7) dif t $

  Integrating:
  $ 2 sqrt(z) = sqrt((2g)/7) t + C $

  With $z(0) = 0$, we have $C = 0$:
  $ 2 sqrt(z) &= sqrt((2g)/7) t \
    sqrt(z) &= 1/2 sqrt((2g)/7) t \
    &= sqrt(g/(14)) t $

  #boxed[$ z(t) = (g t^2)/14 $]

  The velocity is:
  $ dot(z)(t) = (2 g t)/14 = (g t)/7 $

  #boxed[$ dot(z)(t) = (g t)/7 $]

  The acceleration is:
  $ dot.double(z)(t) = g/7 $

  #boxed[$ dot.double(z)(t) = g/7 $]

  The raindrop falls with constant acceleration $g/7$, which is less than free fall acceleration $g$. As the drop collects mass, the rate of momentum increase from accretion partially balances the gravitational force, resulting in reduced acceleration. The factor of $1/7$ emerges from the balance between gravitational force and the momentum carried by the accreted mist.

  *Verification:*
  $ dot.double(z) = g/7 $
  $ (3 v^2)/z = (3 (g t/7)^2)/(g t^2/14) = 3 · (g^2 t^2)/49 · 14/(g t^2) = (42 g)/49 = (6g)/7 $

  Therefore:
  $ g - (3 v^2)/z = g - (6g)/7 = g/7 = dot.double(z) checkmark $
]

#pagebreak()

#pbm("2")[
  *[30 pts] Chain on table*

  A uniform chain of mass $M$ and length $L$ is held at rest hanging vertically downwards with its lower end touching a fixed horizontal table. The chain is then released.

  *(a)* Assume that, before hitting the table, the chain falls freely under uniform gravity. Show that, while the chain is falling, the force that exerts on the table is always three times the weight of the chain actually lying on the table.

  *(b)* Now, when all the chain has landed on the table, the loose end is pulled upwards with a constant force $M g/3$. Find the height to which the chain will first rise. This time, assume that the force exerted on the chain by the table is equal to the weight of chain lying on the table.
]

#solution[
  *Part (a): Force on table during free fall*

  *Setup and kinematics*

  Let $y(t)$ be the distance fallen by the top of the chain at time $t$. Initially, $y(0) = 0$ and $dot(y)(0) = 0$. The length of chain on the table is $y$, and the length still in the air is $L - y$.

  The mass of chain on the table is:
  $ m_"table" = (M y)/L $

  The mass of chain in the air is:
  $ m_"air" = (M(L-y))/L $

  *Force analysis using momentum*

  The airborne chain has mass $m(y) = M(L-y)/L$ and velocity $v = dot(y)$. The momentum is:
  $ P = m(y) v = (M(L-y))/L v $

  Taking the time derivative:
  $ dv(P, t) = dv(m, t) v + m dv(v, t) = -(M/L) v · v + (M(L-y))/L dot.double(y) $

  The net external force on the airborne portion is:
  $ F_"net" = m g - N = (M(L-y))/L g - N $

  where $N$ is the normal force from the table on the segment currently hitting the table.

  By Newton's second law:
  $ -(M v^2)/L + (M(L-y))/L dot.double(y) = (M(L-y))/L g - N quad quad (1) $

  For the free-falling chain, $dot.double(y) = g$:
  $ -(M v^2)/L + (M(L-y))/L g = (M(L-y))/L g - N $

  $ N = (M v^2)/L $

  For free fall from rest, $v^2 = 2 g y$:
  $ N = (M · 2 g y)/L = (2 M g y)/L $

  The total force on the table is the sum of:
  1. Normal force from collision: $N = (2 M g y)/L$
  2. Weight of chain on table: $(M g y)/L$

  $ F_"table" = (2 M g y)/L + (M g y)/L = (3 M g y)/L = 3 × (M g y)/L $

  #boxed[$ F_"table" = 3 × "weight of chain on table" $]

  *Part (b): Maximum height with upward pulling force*

  The loose end is pulled upward with force $F = M g/3$. Let $h$ be the height of the loose end above the table.

  When a length $h$ is above the table, the mass above is:
  $ m_"above" = (M h)/L $

  The portion of chain above the table experiences:
  - Applied force $F = M g/3$ (upward)
  - Weight $(M g h)/L$ (downward)

  Using energy methods:

  *Energy approach*

  Initially, the chain is on the table at rest. Work done by applied force $F$ to lift height $h$:
  $ W_F = F h = (M g h)/3 $

  Potential energy gained by the lifted portion (center of mass at $h/2$):
  $ Δ U = (M h)/L g · h/2 = (M g h^2)/(2L) $

  Kinetic energy of the lifted portion:
  $ K = 1/2 (M h)/L dot(h)^2 $

  By work-energy theorem:
  $ W_F = Δ U + K $

  $ (M g h)/3 = (M g h^2)/(2L) + 1/2 (M h)/L dot(h)^2 $

  Dividing by $(M h)/(2L)$:
  $ (2 g L)/3 = g h + dot(h)^2 $

  $ dot(h)^2 = (2 g L)/3 - g h $

  At maximum height $h_"max"$, $dot(h) = 0$:
  $ 0 = (2 g L)/3 - g h_"max" $

  $ h_"max" = (2L)/3 $

  #boxed[$ h_"max" = (2L)/3 $]

  With an upward force equal to one-third the total weight, the chain can lift $2/3$ of its length above the table. The effective lifting force must overcome the weight of the portion being lifted, and the balance point occurs at $h = 2L/3$.
]

#pagebreak()

#pbm("3")[
  *[35 pts] Angular momentum*

  *(a)* Consider a system of point particles each with mass $m_α$. With respect to the origin of an inertial frame $O$, the position vector of the particle is respectively given by $vb(r)_α(t)$. In the lecture, the time rate of change of total angular momentum of the system about the origin of the inertial frame is found to be
  $ dot(vb(L))(t) = vb(τ)^"ext"(t) $,
  where $vb(τ)^"ext"(t)$ is the total external torque about the origin of the inertial frame. Here, the internal forces among the particles are assumed to obey Newton's third law and central. The position vector of the center of mass of this system of particle is denoted by $vb(R)_"CM"(t)$. And, we have shown during the lecture that the time rate of change of total angular momentum about the center-of-mass frame is given by
  $ dot(vb(L))_"CM"(t) = vb(τ)_"CM"^"ext"(t) $,
  where $vb(τ)_"CM"^"ext"(t)$ is the total external torque about the center-of-mass frame. Now, we consider a reference frame $O'$ at which the position vector of its origin is $vb(R)(t)$ with respect to the origin of $O$. Denoting the total mass of the system by $M$, show that
  $ dot(vb(L))'(t) = vb(τ)'^"ext"(t) - M [vb(R)_"CM"(t) - vb(R)(t)] × dot.double(vb(R))(t) $.

  *(b)* A uniform circular hoop, of mass $M$ and radius $R$, is lying on a smooth horizontal table at which the hoop can slide freely. A bug of mass $m$ can run on the hoop. The system is at rest when the bug starts to run. What is the angle turned through by the hoop when the bug has completed one lap of the hoop?
]

#solution[
  *Part (a): Angular momentum in arbitrary reference frame*

  *Setup and definitions*

  In the inertial frame $O$, let particle $i$ have position $vb(r)_i$ and velocity $vb(v)_i = dot(vb(r))_i$.

  In frame $O'$ at position $vb(R)(t)$, the position of particle $i$ is:
  $ vb(r)'_i = vb(r)_i - vb(R) $

  The velocity in frame $O'$ is:
  $ vb(v)'_i = dot(vb(r))'_i = dot(vb(r))_i - dot(vb(R)) = vb(v)_i - dot(vb(R)) $

  *Angular momentum about $O'$*

  The angular momentum about $O'$ is:
  $ vb(L)' = sum_i m_i vb(r)'_i × vb(v)'_i = sum_i m_i (vb(r)_i - vb(R)) × (vb(v)_i - dot(vb(R))) $

  Taking the time derivative:
  $ dot(vb(L))' = sum_i [m_i dot(vb(r))'_i × vb(v)'_i + m_i vb(r)'_i × dot(vb(v))'_i] $

  $ = sum_i [m_i vb(v)'_i × vb(v)'_i + m_i vb(r)'_i × dot(vb(v))'_i] $

  The first term vanishes, so:
  $ dot(vb(L))' = sum_i m_i vb(r)'_i × dot(vb(v))'_i $

  Since $vb(v)'_i = vb(v)_i - dot(vb(R))$:
  $ dot(vb(v))'_i = dot(vb(v))_i - dot.double(vb(R)) $

  Therefore:
  $ dot(vb(L))' = sum_i m_i vb(r)'_i × (dot(vb(v))_i - dot.double(vb(R))) $

  $ = sum_i m_i vb(r)'_i × dot(vb(v))_i - (sum_i m_i vb(r)'_i) × dot.double(vb(R)) $

  Since $vb(r)'_i = vb(r)_i - vb(R)$:
  $ sum_i m_i vb(r)'_i = sum_i m_i (vb(r)_i - vb(R)) = M vb(R)_"CM" - M vb(R) = M(vb(R)_"CM" - vb(R)) $

  By Newton's second law, $m_i dot(vb(v))_i = vb(F)_i$ (total force on particle $i$):
  $ sum_i m_i vb(r)'_i × dot(vb(v))_i = sum_i vb(r)'_i × vb(F)_i = vb(τ)'^"ext" + vb(τ)'^"int" $

  Since internal torques cancel ($vb(τ)'^"int" = 0$):
  $ sum_i m_i vb(r)'_i × dot(vb(v))_i = vb(τ)'^"ext" $

  Therefore:
  $ dot(vb(L))' = vb(τ)'^"ext" - M(vb(R)_"CM" - vb(R)) × dot.double(vb(R)) $

  #boxed[$ dot(vb(L))'(t) = vb(τ)'^"ext"(t) - M [vb(R)_"CM"(t) - vb(R)(t)] × dot.double(vb(R))(t) $]

  This result shows that angular momentum about an accelerating frame $O'$ is not simply equal to the external torque. The additional term $-M(vb(R)_"CM" - vb(R)) × dot.double(vb(R))$ represents a pseudo-torque due to the acceleration of the reference frame. When $O'$ coincides with the center of mass ($vb(R) = vb(R)_"CM"$) or is inertial ($dot.double(vb(R)) = 0$), this term vanishes and we recover the standard result $dot(vb(L))' = vb(τ)'^"ext"$.

  *Part (b): Bug on rotating hoop*

  *Setup*

  A bug (mass $m$) runs on a circular hoop (mass $M$, radius $R$) on a smooth horizontal table. Initially at rest. The table is frictionless, so there are no external torques.

  Let $θ$ be the angle the hoop has rotated, and $φ$ be the angle of the bug relative to the hoop. Initially, $θ(0) = 0$ and $φ(0) = 0$. When the bug completes one lap relative to the hoop, $φ = 2π$.

  *Conservation of angular momentum*

  Since there are no external torques (smooth table, no friction), the total angular momentum about the vertical axis through the center is conserved. Initially, the system is at rest, so:
  $ L_"initial" = 0 $

  Therefore, $L(t) = 0$ for all $t$.

  *Angular momentum components*

  The hoop rotates with angular velocity $dot(θ)$. Its moment of inertia about the central axis is:
  $ I_"hoop" = M R^2 $

  The bug's position angle in the lab frame is $θ + φ$ (hoop rotation plus position on hoop). Its angular velocity in the lab frame is:
  $ ω_"bug" = dv(, t)(θ + φ) = dot(θ) + dot(φ) $

  The bug's moment of inertia about the center is:
  $ I_"bug" = m R^2 $

  The total angular momentum is:
  $ L = I_"hoop" dot(θ) + I_"bug" (dot(θ) + dot(φ)) = M R^2 dot(θ) + m R^2 (dot(θ) + dot(φ)) $

  $ = (M + m) R^2 dot(θ) + m R^2 dot(φ) $

  Setting $L = 0$:
  $ (M + m) dot(θ) + m dot(φ) = 0 $

  $ dot(θ) = -(m dot(φ))/(M + m) $

  *Finding total rotation*

  Integrating from $t = 0$ to $t = t_f$ (when bug completes one lap):
  $ θ(t_f) - θ(0) = -m/(M+m) [φ(t_f) - φ(0)] $

  With $θ(0) = 0$, $φ(0) = 0$, and $φ(t_f) = 2π$:
  $ θ(t_f) = -(m · 2π)/(M+m) = -(2π m)/(M+m) $

  The magnitude of rotation is:
  $ |θ(t_f)| = (2π m)/(M+m) $

  #boxed[$ θ = (2π m)/(M + m) $]

  The hoop rotates in the opposite direction to the bug's motion. Since there's no external torque, the center of mass of the system remains stationary. As the bug runs around the hoop in one direction, the hoop must rotate in the opposite direction to conserve angular momentum. The lighter the hoop compared to the bug, the more it rotates. In the limit $M → ∞$, the hoop doesn't move ($θ → 0$). In the limit $M → 0$, the hoop rotates nearly a full revolution in the opposite direction ($θ → 2π$).
]
