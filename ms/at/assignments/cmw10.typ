#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 10",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("5.1")[
  #grid(
    columns: (1fr, 2fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 40.png"), width:80%, border: false),
    [A pendulum consists of a light rigid rod of length $L$ pivoted at one end with mass $m$ attached at the other end. The pendulum is released from rest at angle $φ_0$.

    Obtain the speed of the mass $m$ when the rod is at an angle $φ$ from work-energy theorem.],
  )
]

#solution[
*Position vector of the mass:*
$ vb(r)(t) = L sin φ(t) vu(e)_y + L cos φ(t) vu(e)_z ⟹ d vb(r) = L cos φ(t) d φ vu(e)_y - L sin φ(t) d φ vu(e)_z $ <eq:displacement>

*Forces acting on the mass:*
$ vb(F)(t) = vb(W)(t) + vb(N)(t) = -m g vu(e)_z - [N(t) sin φ(t) vu(e)_y + N(t) cos φ(t) vu(e)_z] $ <eq:forces>

*Work done by all forces:*
$ W (vb(r)(0) → vb(r)(t)) &= integral_(vb(r)(0))^(vb(r)(t)) vb(F)(t) · d vb(r) = integral_(vb(r)(0))^(vb(r)(t)) vb(W)(t) · d vb(r) + integral_(vb(r)(0))^(vb(r)(t)) vb(N)(t) · d vb(r) \
  &= integral_(φ(0))^(φ(t)) -m g L sin φ(t) d φ = m g L [cos φ(0) - cos φ(t)] $ <eq:work-gravity>

#note[
The constraint force $vb(N)(t)$ is always perpendicular to the displacement, so:
$ integral_(vb(r)(0))^(vb(r)(t)) vb(N)(t) · d vb(r) = 0 $]

*Applying work-energy theorem:*
$ T(t) - T(0) = W (vb(r)(0) → vb(r)(t)) ⟹ m/2 v^2(t) - m/2 v^2(0) = m g L [cos φ(0) - cos φ(t)]\ ⟹ v(t) = sqrt(2 g L [cos φ(0) - cos φ(t)] + v^2(0)) $ <eq:speed-general>

#boxed[$ v(t) = sqrt(2 g L [cos φ_0 - cos φ(t)]) $]
]

#pbm("5.2")[
*Gravitational force* acting on a mass $m$ at a distance $r$ from the center of Earth of mass $M$:
$ vb(F)(vb(r)) = -(G M m)/r^2 vu(e)_r $

Mass $m$ is projected from the surface of the Earth $r = R_e$ with an initial speed $v_0$ at an angle $α$ from the vertical.

*Escape speed* for the mass $m$ to escape Earth's gravitational field is independent of the launching direction:
$ v_"escape" = sqrt(2 g R_e) $

Obtain the expression for the escape speed from work-energy theorem. Assume gravitational force is the only force and ignore the rotation of the Earth.
]

#solution[
*Gravitational force and displacement:*
$ vb(F)(vb(r)) = -(G M m)/r^2 vu(e)_r $ <eq:grav-force>

$ d vb(r) = d r vu(e)_r + r d θ vu(e)_θ + r sin θ d φ vu(e)_φ $ <eq:displacement-spherical>

*Work done by gravitational force:*
$ W (vb(r)_1 → vb(r)_2) &= integral_(vb(r)_1)^(vb(r)_2) vb(F)(vb(r)) · d vb(r) = -integral_(r_1)^(r_2) (G M m)/r^2 d r \
  & = -G M m integral_(r_1)^(r_2) 1/r^2 d r = -G M m [- 1/r]_(r_1)^(r_2) \
  & = G M m [1/r_2 - 1/r_1] = G M m [1/r(t) - 1/r(0)] $ <eq:work-result>

*Applying work-energy theorem:*
$ T(t) - T(0) = W (vb(r)_0 → vb(r)) ⟹ m/2 v^2(t) - m/2 v^2(0) = G M m [1/r(t) - 1/r(0)] \
  ⟹ v^2(0) = v^2(t) - 2 G M [1/r(t) - 1/r(0)] $ <eq:energy-conservation>

*For escape condition:*
$ cases(
  r(t) → ∞,
  v(t) = 0
) ⟹ v^2(0) = (2 G M)/R_e $ <eq:escape-condition>

Since $G M = g R_e^2$ at Earth's surface:
$ v^2(0) = (2 g R_e^2)/R_e = 2 g R_e $

#boxed[$ v_"escape" = sqrt(2 g R_e) $]
]

#pagebreak()

#pbm("5.3")[
A point mass of mass $m$ is attached at the end of the massless string of length $L$. It is released from $θ = θ_0$ with $dot(θ) = 0$ at $t = 0$.

Obtain the first-order differential equation for $θ(t)$ governing the dynamics of the point mass. Assuming small angles, $θ_0 << 1$, solve for $θ(t)$.
]

#solution[
*Position and velocity vectors:*
$ vb(r)(t) = L sin θ(t) vu(e)_y + L cos θ(t) vu(e)_z , #h(2em) vb(W)(t) = m g vu(e)_z $ <eq:position-weight>

$ dot(vb(r))(t) = L dot(θ)(t) cos θ(t) vu(e)_y - L dot(θ)(t) sin θ(t) vu(e)_z $ <eq:velocity>

*Kinetic energy:*
$ ⟹ T(t) = m/2 dot(vb(r))(t) · dot(vb(r))(t) = 1/2 m L^2 dot(θ)^2(t) $ <eq:kinetic-energy>

*Forces acting on the mass:*
$ vb(F)(t) = vb(W)(t) + vb(N)(t) = m g vu(e)_z + N(t) [- sin θ(t) vu(e)_y - cos θ(t) vu(e)_z] $ <eq:forces-pendulum>

*Work done by all forces:*
$ W (vb(r)(0) → vb(r)(t)) = integral_(vb(r)(0))^(vb(r)(t)) vb(F)(t) · d vb(r) = - integral_(θ(0))^(θ(t)) m g L sin θ(t) d θ $ <eq:work-calculation>

*Work-energy theorem:*
$ &T(t) - T(0) = W (vb(r)(0) → vb(r)(t)) \
 &⟹ 1/2 m L^2 dot(θ)^2(t) - 1/2 m L^2 dot(θ)^2(0) = m g L [cos θ(t) - cos θ(0)] \
 &⟹ 1/2 L dot(θ)^2(t) = g cos θ(t) - g cos θ_0 \
 &⟹ dv(θ, t) = - sqrt(2g/L [cos θ(t) - cos θ_0]) \
 &⟹ sqrt(2g/L) integral_0^t d t = - integral_(θ_0)^(θ(t)) (d θ)/(sqrt(cos θ - cos θ_0)) \
 &⟹ sqrt(2g/L) integral_0^t d t = -sqrt(2) integral_(θ_0)^(θ(t)) (d θ)/(sqrt(θ_0^2 - θ^2)) #h(10em) [ because cos θ ≈ 1 - θ^2 /2 ] \
 &⟹ sqrt(g/L) integral_0^t d t = - integral_(θ_0)^(θ(t)) (sqrt(1 - θ^2/θ_0^2))^(-1) d (θ/θ_0) \
 &⟹ sqrt(g/L) t = - sin^(-1)((θ(t))/(θ_0)) + π/2 $

#boxed[$ θ(t) = θ_0 cos(sqrt(display(g/L)) t) $]
]
