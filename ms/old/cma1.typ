#import "../shared/_at.typ": *

#show: ad.with(
  title: "Assignment 1",
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
  *[20 pts] Spiral trajectory*

  A point particle is moving in the $x y$-plane parameterized by $φ$ as follows:
  $ x(φ) = a φ cos φ, quad y(φ) = a φ sin φ $,
  where $a > 0$ and $φ ≥ 0$. Assume that the particle moves along the trajectory above with $φ(t) = α t$ where $α$ is a constant.

  *(a)* Calculate the Cartesian components of the velocity $vb(v)$, acceleration $vb(a)$, the radius of curvature $ρ$ and the radius of torsion $σ ≡ 1/τ$ as a function of time $t$.

  *(b)* Calculate the speed $v$ as functions of time $t$.
]

#solution[
  *Part (a): Velocity and acceleration*

  The position vector in polar form is:
  $ vb(r)(φ) = a φ cos φ vu(e)_x + a φ sin φ vu(e)_y = a φ vu(e)_r $

  Using the chain rule with $φ = α t$:
  $ vb(v) = dv(vb(r), t) = dv(vb(r), φ) dv(φ, t) = dv(vb(r), φ) α $

  In polar coordinates, $vb(r) = r vu(e)_r$ where $r = a φ$:
  $ dv(vb(r), φ) = dv(r, φ) vu(e)_r + r dv(vu(e)_r, φ) = a vu(e)_r + a φ vu(e)_φ $

  Therefore:
  $ vb(v) = α (a vu(e)_r + a φ vu(e)_φ) = a α (vu(e)_r + φ vu(e)_φ) $

  For acceleration:
  $ vb(a) = dv(vb(v), t) = dv(vb(v), φ) dv(φ, t) = α dv(, φ)[a α (vu(e)_r + φ vu(e)_φ)] $

  $ = a α^2 [dv(vu(e)_r, φ) + vu(e)_φ + φ dv(vu(e)_φ, φ)] $

  Using $dv(vu(e)_r, φ) = vu(e)_φ$ and $dv(vu(e)_φ, φ) = -vu(e)_r$:
  $ vb(a) = a α^2 [vu(e)_φ + vu(e)_φ - φ vu(e)_r] = a α^2 [(2 vu(e)_φ - φ vu(e)_r)] $

  Converting to Cartesian coordinates with $φ = α t$, $vu(e)_r = cos φ vu(e)_x + sin φ vu(e)_y$, and $vu(e)_φ = -sin φ vu(e)_x + cos φ vu(e)_y$:

  #boxed[$ vb(v) = a α [(cos α t - α t sin α t) vu(e)_x + (sin α t + α t cos α t) vu(e)_y] $]

  #boxed[$ vb(a) = a α^2 [(-α t cos α t - 2 sin α t) vu(e)_x + (-α t sin α t + 2 cos α t) vu(e)_y] $]

  *Radius of curvature*

  The curvature $κ$ is given by:
  $ κ = (|vb(v) × vb(a)|)/(|vb(v)|^3) $

  Computing the cross product (in 2D, we extend to 3D):
  $ vb(v) × vb(a) = mat(delim: "|", vu(e)_x, vu(e)_y, vu(e)_z; v_x, v_y, 0; a_x, a_y, 0) = (v_x a_y - v_y a_x) vu(e)_z $

  In polar form this is simpler:
  $ vb(v) × vb(a) = a α (vu(e)_r + φ vu(e)_φ) × a α^2 (2 vu(e)_φ - φ vu(e)_r) $

  Using $vu(e)_r × vu(e)_φ = vu(e)_z$ and $vu(e)_φ × vu(e)_r = -vu(e)_z$:
  $ vb(v) × vb(a) = a^2 α^3 [(vu(e)_r × 2 vu(e)_φ) + (φ vu(e)_φ × (-φ vu(e)_r))] = a^2 α^3 (2 + φ^2) vu(e)_z $

  The magnitude is:
  $ |vb(v) × vb(a)| = a^2 α^3 (2 + φ^2) = a^2 α^3 (2 + α^2 t^2) $

  The speed is:
  $ |vb(v)|^2 = a^2 α^2 (1 + φ^2) = a^2 α^2 (1 + α^2 t^2) $

  Therefore:
  $ κ = (a^2 α^3 (2 + α^2 t^2))/([a^2 α^2 (1 + α^2 t^2)]^(3/2)) = (α(2 + α^2 t^2))/(a (1 + α^2 t^2)^(3/2)) $

  The radius of curvature is:
  #boxed[$ ρ = 1/κ = (a (1 + α^2 t^2)^(3/2))/(α(2 + α^2 t^2)) $]

  *Radius of torsion*

  For a planar curve (motion confined to $x y$-plane), the torsion $τ = 0$ everywhere since the curve never leaves the plane. Therefore:
  #boxed[$ σ = 1/τ = ∞ $]

  The infinite radius of torsion indicates no twisting out of the plane.

  *Part (b): Speed*

  From our calculation above:
  $ v = |vb(v)| = a α sqrt(1 + φ^2) = a α sqrt(1 + α^2 t^2) $

  #boxed[$ v(t) = a α sqrt(1 + α^2 t^2) $]

  The initial speed is $v(0) = a α$, and the speed increases monotonically with time as the particle spirals outward.
]

#pbm("2")[
  *[20 pts] Projectile with quadratic drag*

  A particle is projected vertically upwards with speed $u_0$ and moves under uniform gravity in a medium that exerts a resistance force proportional to the square of its speed and in which the particle's terminal speed is $V_∞$.

  *(a)* Find the maximum height above the starting point attained by the particle and the time taken to reach that height.

  *(b)* Show also that the speed of the particle when it returns to its starting point is $sqrt((u_0 V_∞)/(u_0^2 + V_∞^2))$.
]

#solution[
  *Setup*

  For vertical motion with upward positive, the equation of motion is:
  $ m dv(v, t) = -m g - k v^2 $

  The terminal velocity occurs when $m g = k V_∞^2$, giving $k = (m g)/V_∞^2$. Substituting:
  $ dv(v, t) = -g (1 + v^2/V_∞^2) = -(g/V_∞^2)(V_∞^2 + v^2) $

  *Part (a): Maximum height and time*

  Using the chain rule $dv(v, t) = v dv(v, y)$:
  $ v dv(v, y) = -(g/V_∞^2)(V_∞^2 + v^2) $

  Separating variables:
  $ v dif v/(V_∞^2 + v^2) = -(g/V_∞^2) dif y $

  Integrating from initial conditions $(y_0 = 0, v_0 = u_0)$ to general $(y, v)$:
  $ 1/2 ln((V_∞^2 + v^2)/(V_∞^2 + u_0^2)) = -(g y)/V_∞^2 $

  $ V_∞^2 + v^2 = (V_∞^2 + u_0^2) e^(-2 g y/V_∞^2) $

  At maximum height, $v = 0$:
  $ V_∞^2 = (V_∞^2 + u_0^2) e^(-2 g h_"max"/V_∞^2) $

  Solving for $h_"max"$:
  $ e^(2 g h_"max"/V_∞^2) = (V_∞^2 + u_0^2)/V_∞^2 = 1 + u_0^2/V_∞^2 $

  #boxed[$ h_"max" = V_∞^2/(2g) ln(1 + u_0^2/V_∞^2) $]

  For the time, we use:
  $ dv(v, t) = -(g/V_∞^2)(V_∞^2 + v^2) $

  Separating variables:
  $ (dif v)/(V_∞^2 + v^2) = -(g/V_∞^2) dif t $

  $ 1/V_∞ arctan(v/V_∞) |_(u_0)^0 = -(g/V_∞^2) t_"max" $

  $ -1/V_∞ arctan(u_0/V_∞) = -(g/V_∞^2) t_"max" $

  #boxed[$ t_"max" = V_∞/g arctan(u_0/V_∞) $]

  *Part (b): Return speed*

  On the way down, taking downward as positive and denoting the downward speed as $w$:
  $ dv(w, t) = g - (g/V_∞^2) w^2 = (g/V_∞^2)(V_∞^2 - w^2) $

  Using $dv(w, t) = w dv(w, y)$ where $y$ is measured downward from maximum height:
  $ w dv(w, y) = (g/V_∞^2)(V_∞^2 - w^2) $

  $ (w dif w)/(V_∞^2 - w^2) = (g/V_∞^2) dif y $

  Integrating from $(y = 0, w = 0)$ to $(y = h_"max", w = v_"return")$:
  $ -1/2 ln((V_∞^2 - w^2)/V_∞^2) = (g y)/V_∞^2 $

  At $y = h_"max"$:
  $ -1/2 ln((V_∞^2 - v_"return"^2)/V_∞^2) = (g h_"max")/V_∞^2 $

  $ ln((V_∞^2 - v_"return"^2)/V_∞^2) = -2 g h_"max"/V_∞^2 = -ln(1 + u_0^2/V_∞^2) $

  $ (V_∞^2 - v_"return"^2)/V_∞^2 = 1/(1 + u_0^2/V_∞^2) = V_∞^2/(V_∞^2 + u_0^2) $

  $ V_∞^2 - v_"return"^2 = V_∞^4/(V_∞^2 + u_0^2) $

  $ v_"return"^2 = V_∞^2 - V_∞^4/(V_∞^2 + u_0^2) = (V_∞^2 (V_∞^2 + u_0^2) - V_∞^4)/(V_∞^2 + u_0^2) = (V_∞^2 u_0^2)/(V_∞^2 + u_0^2) $

  #boxed[$ v_"return" = (V_∞ u_0)/sqrt(V_∞^2 + u_0^2) $]

  The return speed is always less than the launch speed $u_0$ due to energy dissipation by air resistance. In the limit $V_∞ → ∞$ (no drag), $v_"return" → u_0$, recovering energy conservation.
]

#pbm("3")[
  *[30 pts] Electron in crossed electric and magnetic fields*

  An electron of mass $m$ and charge $-e$ is moving under the combined influence of a uniform electric field $E_0 vu(e)_y$ and a uniform magnetic field $B_0 vu(e)_z$. Initially, the electron is at the origin and is moving with velocity $u_0 vu(e)_x$. Find the trajectory, $x(t)$, $y(t)$, $z(t)$, of the electron in its subsequent motion.

  *Remark:* The general path is called a trochoid which becomes a cycloid in the special case. Cycloidal motion of motion of electrons is used in the magnetron vacuum tube which generates the microwaves in a microwave oven.
]

#solution[
  *Equation of motion*

  The Lorentz force on the electron is:
  $ vb(F) = -e (vb(E) + vb(v) × vb(B)) $

  $ m vb(a) = -e (E_0 vu(e)_y + vb(v) × B_0 vu(e)_z) $

  Expanding the cross product:
  $ vb(v) × vb(B) = (dot(x) vu(e)_x + dot(y) vu(e)_y + dot(z) vu(e)_z) × B_0 vu(e)_z = B_0 (dot(x) vu(e)_y - dot(y) vu(e)_x) $

  Therefore:
  $ m vb(a) = -e [E_0 vu(e)_y + B_0 dot(x) vu(e)_y - B_0 dot(y) vu(e)_x] $

  $ m vb(a) = -e [(-B_0 dot(y)) vu(e)_x + (E_0 + B_0 dot(x)) vu(e)_y] $

  Component equations:
  $ cases(
    m dot.double(x) = e B_0 dot(y),
    m dot.double(y) = -e (E_0 + B_0 dot(x)),
    m dot.double(z) = 0
  ) $

  Define the cyclotron frequency $ω_c ≡ (e B_0)/m > 0$:
  $ cases(
    dot.double(x) = ω_c dot(y),
    dot.double(y) = display(-(e E_0)/m - ω_c dot(x)),
    dot.double(z) = 0
  ) $

  *Solving the $z$-component*

  From $dot.double(z) = 0$ with initial conditions $z(0) = 0$, $dot(z)(0) = 0$:
  #boxed[$ z(t) = 0 $]

  The motion is confined to the $x y$-plane.

  *Solving the coupled $x y$ system*

  Differentiating the first equation:
  $ dot.triple(x) = ω_c dot.double(y) = ω_c [-(e E_0)/m - ω_c dot(x)] = -(e ω_c E_0)/m - ω_c^2 dot(x) $

  This gives:
  $ dot.triple(x) + ω_c^2 dot(x) = -(e ω_c E_0)/m $

  The homogeneous solution is:
  $ dot(x)_h = A cos ω_c t + B sin ω_c t $

  For the particular solution, try a constant: $dot(x)_p = C$:
  $ 0 + ω_c^2 C = -(e ω_c E_0)/m ⟹ C = -(e E_0)/(m ω_c) = -E_0/B_0 $

  General solution for velocity:
  $ dot(x) = A cos ω_c t + B sin ω_c t - E_0/B_0 $

  From $dot.double(x) = ω_c dot(y)$:
  $ -A ω_c sin ω_c t + B ω_c cos ω_c t = ω_c dot(y) $

  $ dot(y) = -A sin ω_c t + B cos ω_c t $

  *Applying initial conditions*

  At $t = 0$: $dot(x)(0) = u_0$, $dot(y)(0) = 0$:
  $ cases(
    A - E_0/B_0 = u_0,
    B = 0
  ) ⟹ cases(
    A = display(u_0 + E_0/B_0),
    B = 0
  ) $

  Therefore:
  $ cases(
    dot(x) = display((u_0 + E_0/B_0) cos ω_c t - E_0/B_0),
    dot(y) = display(-(u_0 + E_0/B_0) sin ω_c t)
  ) $

  *Integrating for position*

  With $x(0) = y(0) = 0$:
  $ x(t) = integral_0^t [(u_0 + E_0/B_0) cos ω_c t' - E_0/B_0] dif t' $

  $ = (u_0 + E_0/B_0) (sin ω_c t)/ω_c - (E_0 t)/B_0 $

  $ y(t) = integral_0^t [-(u_0 + E_0/B_0) sin ω_c t'] dif t' $

  $ = (u_0 + E_0/B_0) (1 - cos ω_c t)/ω_c $

  *Final trajectory*

  #boxed[$ cases(
    x(t) = display((u_0 B_0 + E_0)/(ω_c B_0) sin ω_c t - (E_0 t)/B_0),
    y(t) = display((u_0 B_0 + E_0)/(ω_c B_0) (1 - cos ω_c t)),
    z(t) = 0
  ) $]

  where $ω_c = (e B_0)/m$.

  The trajectory consists of cyclotron motion (circular motion due to the magnetic field) with center drifting in the $-x$ direction. The drift velocity is $v_"drift" = E_0/B_0$, which is the $vb(E) × vb(B)$ drift. The radius of the cyclotron orbit is:
  $ R = (u_0 B_0 + E_0)/(ω_c B_0) = (m(u_0 B_0 + E_0))/(e B_0^2) $
]

#pagebreak()

#pbm("4")[
  *[30 pts] Block sliding on helical track*

  A small block of mass $m$ glides under its own weight $vb(W) = -m g vu(e)_z$ frictionless downward along a helical track
  $ vb(r)(t) = a cos φ(t) vu(e)_x + a sin φ(t) vu(e)_y + b φ(t) vu(e)_z $,
  where $a$ and $b$ are positive constants. The block starts its motion with $φ(0) = φ_0$ and $dot(φ)(0) = 0$.

  *(a)* Derive a second order ordinary differential equation for $φ(t)$ governing the dynamics of the block. Solve for $φ(t)$ and calculate the magnitude of the velocity $vb(v)(t)$ of the block as a function of time.

  *(b)* Calculate the magnitude of the force $vb(F)(t)$ exerted on the block by the helical track as a function of time.
]

#solution[
  *Part (a): Equation of motion*

  The position vector is:
  $ vb(r) = a cos φ vu(e)_x + a sin φ vu(e)_y + b φ vu(e)_z $

  The velocity is:
  $ vb(v) = dv(vb(r), t) = dv(vb(r), φ) dot(φ) = [-a sin φ vu(e)_x + a cos φ vu(e)_y + b vu(e)_z] dot(φ) $

  The speed is:
  $ v^2 = a^2 dot(φ)^2 + b^2 dot(φ)^2 = (a^2 + b^2) dot(φ)^2 $

  The acceleration is:
  $ vb(a) = dv(vb(v), t) = [-a sin φ vu(e)_x + a cos φ vu(e)_y + b vu(e)_z] dot.double(φ) + [-a cos φ vu(e)_x - a sin φ vu(e)_y] dot(φ)^2 $

  *Energy method*

  Since the track is frictionless, we use conservation of energy. Taking the initial height as reference ($z = b φ_0$):
  $ E = 1/2 m v^2 + m g z = 1/2 m (a^2 + b^2) dot(φ)^2 + m g b φ $

  At $t = 0$: $E = m g b φ_0$ (since $dot(φ)(0) = 0$)

  Therefore:
  $ 1/2 m (a^2 + b^2) dot(φ)^2 + m g b φ = m g b φ_0 $

  $ dot(φ)^2 = (2 g b)/(a^2 + b^2) (φ_0 - φ) $

  Taking the time derivative:
  $ 2 dot(φ) dot.double(φ) = -(2 g b)/(a^2 + b^2) dot(φ) $

  For $dot(φ) ≠ 0$:
  #boxed[$ dot.double(φ) = -(g b)/(a^2 + b^2) $]

  This is constant acceleration! Solving with initial conditions $φ(0) = φ_0$, $dot(φ)(0) = 0$:
  $ dot(φ)(t) = -(g b)/(a^2 + b^2) t $

  $ φ(t) = φ_0 - 1/2 (g b)/(a^2 + b^2) t^2 $

  The mass descends, so $φ$ decreases with time (note the negative sign is consistent since $dot(φ) < 0$).

  The speed is:
  $ |vb(v)(t)| = sqrt(a^2 + b^2) |dot(φ)| = sqrt(a^2 + b^2) (g b)/(a^2 + b^2) t $

  #boxed[$ cases(
    φ(t) = display(φ_0 - (g b)/(2(a^2 + b^2)) t^2),
    |vb(v)(t)| = display((g b)/sqrt(a^2 + b^2) t)
  ) $]

  *Part (b): Normal force*

  The forces on the mass are gravity $vb(F)_g = -m g vu(e)_z$ and the normal force $vb(N)$ perpendicular to the track.

  Newton's second law:
  $ m vb(a) = vb(F)_g + vb(N) $

  The normal force is perpendicular to the velocity. The tangent to the helix is:
  $ vu(t) = vb(v)/(|vb(v)|) = ([-a sin φ vu(e)_x + a cos φ vu(e)_y + b vu(e)_z])/sqrt(a^2 + b^2) $

  The component of gravity along the track:
  $ (vb(F)_g · vu(t)) vu(t) = ((-m g vu(e)_z) · ([-a sin φ vu(e)_x + a cos φ vu(e)_y + b vu(e)_z])/sqrt(a^2 + b^2)) vu(t) $

  $ = -(m g b)/sqrt(a^2 + b^2) vu(t) $

  The tangential component of Newton's law gives:
  $ m a_"tan" = m dv(v, t) = -(m g b)/sqrt(a^2 + b^2) $

  This is consistent with our energy equation: $dv(v, t) = sqrt(a^2 + b^2) dot.double(φ) = -(g b)/sqrt(a^2 + b^2)$.

  The normal force satisfies:
  $ vb(N) = m vb(a) - vb(F)_g $

  Computing the acceleration with $dot.double(φ) = -(g b)/(a^2 + b^2)$ and $dot(φ) = -(g b t)/(a^2 + b^2)$:
  $ vb(a) = [-a sin φ vu(e)_x + a cos φ vu(e)_y + b vu(e)_z] (-(g b)/(a^2 + b^2)) + [-a cos φ vu(e)_x - a sin φ vu(e)_y] ((g b t)/(a^2 + b^2))^2 $

  $ vb(N) = m vb(a) + m g vu(e)_z $

  $ = m [-(g b)/(a^2 + b^2) (-a sin φ vu(e)_x + a cos φ vu(e)_y + b vu(e)_z + ((g b t)/(a^2 + b^2))^2 (-a cos φ vu(e)_x - a sin φ vu(e)_y)] + m g vu(e)_z] $

  The $z$-component:
  $ N_z = m [-(g b)/(a^2 + b^2) b + g] = m g [1 - b^2/(a^2 + b^2)] = (m g a^2)/(a^2 + b^2) $

  The horizontal components:
  $ N_x = m [(a g b sin φ)/(a^2 + b^2) - (a g^2 b^2 t^2 cos φ)/(a^2 + b^2)^2] $

  $ N_y = m [-(a g b cos φ)/(a^2 + b^2) - (a g^2 b^2 t^2 sin φ)/(a^2 + b^2)^2] $

  Computing $N_x^2 + N_y^2$:

  $ N_x^2 = m^2 [(a g b sin φ)^2/(a^2 + b^2)^2 - (2 a^2 g^3 b^3 t^2 sin φ cos φ)/(a^2 + b^2)^3 + (a^2 g^4 b^4 t^4 cos^2 φ)/(a^2 + b^2)^4] $

  $ N_y^2 = m^2 [(a g b cos φ)^2/(a^2 + b^2)^2 + (2 a^2 g^3 b^3 t^2 sin φ cos φ)/(a^2 + b^2)^3 + (a^2 g^4 b^4 t^4 sin^2 φ)/(a^2 + b^2)^4] $

  Adding these (note the cross terms cancel):
  $ N_x^2 + N_y^2 = m^2 [(a g b)^2/(a^2 + b^2)^2 (sin^2 φ + cos^2 φ) + (a^2 g^4 b^4 t^4)/(a^2 + b^2)^4 (cos^2 φ + sin^2 φ)] $

  $ = m^2 [(a g b)^2/(a^2 + b^2)^2 + (a^2 g^4 b^4 t^4)/(a^2 + b^2)^4] $

  $ = (m^2 a^2 g^2 b^2)/(a^2 + b^2)^2 [1 + (g^2 b^2 t^4)/(a^2 + b^2)^2] $

  Therefore:
  $ |vb(N)|^2 = N_x^2 + N_y^2 + N_z^2 = (m^2 a^2 g^2 b^2)/(a^2 + b^2)^2 [1 + (g^2 b^2 t^4)/(a^2 + b^2)^2] + (m^2 g^2 a^4)/(a^2 + b^2)^2 $

  $ = (m^2 g^2 a^2)/(a^2 + b^2)^2 [b^2 + (g^2 b^4 t^4)/(a^2 + b^2)^2 + a^2] $

  $ = (m^2 g^2 a^2)/(a^2 + b^2)^2 [(a^2 + b^2) + (g^2 b^4 t^4)/(a^2 + b^2)^2] $

  #boxed[$ |vb(N)(t)| = (m g a)/sqrt(a^2 + b^2) sqrt(1 + (g^2 b^4 t^4)/(a^2 + b^2)^3) $]

  Alternatively, factoring differently:
  #boxed[$ |vb(N)(t)| = m g sqrt(a^2/(a^2 + b^2) + (a^2 g^2 b^4 t^4)/(a^2 + b^2)^4) $]

  At $t = 0$:
  $ |vb(N)(0)| = (m g a)/sqrt(a^2 + b^2) $

  The normal force has a constant vertical component $(m g a^2)/(a^2 + b^2)$ and a horizontal component that grows with time as the mass accelerates down the helix. The centripetal acceleration requires increasing horizontal normal force to keep the mass on the curved track.
]
