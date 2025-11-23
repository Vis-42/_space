#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 19",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("8.4")[
  #grid(
    columns: (3fr, 4fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 71.png"), width:100%, border: false),
    [Huygens (1673) constructed a cycloidal pendulum with a point particle of mass $m$ and a string of length $4R$ suspended from the cusp of an inverted cycloid.

    *Path of point mass (cycloid parametrization):*
    $ cases(
      x &= R(theta + sin theta)\, quad -pi lt.eq theta lt.eq pi,
      y &= R(1 - cos theta)
    ) $

    *Period:* $T = 4 pi sqrt(R\/g)$ (independent of amplitude!)],
  )
  Obtain the equation of motion for the cycloidal pendulum from the Euler-Lagrange equation.
]

#solution[
  *Position vector:*

  The position vector of the particle is:
  $ vb(r)(t) = R[theta(t) + sin theta(t)] vu(e)_x + R[1 - cos theta(t)] vu(e)_y $

  *Velocity vector:*

  Taking the time derivative:
  $ dot(vb(r))(t) = R dot(theta)(t)[1 + cos theta(t)] vu(e)_x + R dot(theta)(t) sin theta(t) vu(e)_y $

  *Kinetic energy:*

  $ T(theta, dot(theta), t) &= m/2 dot(vb(r))(t) dot dot(vb(r))(t) \
  & = m/2 R^2 dot(theta)^2 (t) [(1 + cos theta(t))^2 + sin^2 theta(t)] \
  & = m/2 R^2 dot(theta)^2 (t) [1 + 2 cos theta(t) + cos^2 theta(t) + sin^2 theta(t)] \
  & = m/2 R^2 dot(theta)^2 (t) [2 + 2 cos theta(t)] \
  & = 2 m R^2 dot(theta)^2 (t) cos^2 (theta(t)/2) $

  where we used the identity $1 + cos theta = 2 cos^2 (theta\/2)$.

  *Potential energy:*

  $ U(theta) = m g y(t) = m g R [1 - cos theta(t)] = 2 m g R sin^2 (theta(t)/2) $

  where we used $1 - cos theta = 2 sin^2 (theta\/2)$.

  *Lagrangian:*

  $ L(theta, dot(theta), t) = T - U = 2 m R^2 dot(theta)^2 (t) cos^2 (theta(t)/2) - 2 m g R sin^2 (theta(t)/2) $

  *Change to arc length coordinate:*

  The arc length along the cycloid is:
  $ s(t) = 4 R sin(theta(t)/2) $

  Taking the time derivative:
  $ dot(s)(t) = 2 R dot(theta)(t) cos(theta(t)/2) $

  From this, we can express:
  $ dot(theta)(t) cos(theta(t)/2) = (dot(s)(t))/(2R) $

  *Express Lagrangian in terms of $s$:*

  Substituting into the kinetic energy:
  $ T = 2 m R^2 dot(theta)^2 (t) cos^2 (theta(t)/2) = 2 m R^2 [(dot(theta)(t) cos(theta(t)/2))]^2 = 2 m R^2 ((dot(s)(t))/(2R))^2 = 1/2 m dot(s)^2 (t) $

  For the potential energy, using $sin(theta\/2) = s\/(4R)$:
  $ U = 2 m g R sin^2 (theta(t)/2) = 2 m g R (s(t)/(4R))^2 = (m g)/(8R) s^2 (t) $

  The Lagrangian becomes:
  $ L(s, dot(s), t) = 1/2 m dot(s)^2 (t) - (m g)/(8R) s^2 (t) $

  *Apply Euler-Lagrange equation:*

  $ pdv(L, s) = -(m g)/(4R) s(t), quad pdv(L, dot(s)) = m dot(s)(t) $

  Euler-Lagrange equation:
  $ dv(, t) (pdv(L, dot(s))) - pdv(L, s) = 0 $

  $ m dot.double(s)(t) + (m g)/(4R) s(t) = 0 $

  #boxed[$ dot.double(s)(t) + g/(4R) s(t) = 0 equiv dot.double(s)(t) + omega^2 s(t) = 0 $]

  where $omega = sqrt(g\/(4R))$.

  *Conclusion:* This is simple harmonic motion in the variable $s$, with period $T = 2pi\/omega = 4pi sqrt(R\/g)$, independent of amplitude. This is the key property of the cycloidal pendulum—it is an isochronous oscillator.
]

#pagebreak()

#pbm("8.5")[
  #grid(
    columns: (1fr, 2fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 72.png"), width:80%, border: false),
    [A particle of mass $m$ is constrained to move on the inside surface of a smooth cone of half-angle $alpha$. The particle is subjected to gravitational force.

    Express the Lagrangian in suitable generalized coordinates and obtain the equations of motion.],
  )

]

#solution[
  *Choose generalized coordinates:*

  We use cylindrical coordinates $(rho, phi, z)$ with the cone constraint. The cone surface is described by:
  $ z = rho cot alpha $

  Since the particle is constrained to the cone, we have two degrees of freedom: $(rho, phi)$.

  *Coordinate transformation:*

  The Cartesian coordinates in terms of generalized coordinates:
  $ cases(
    x &= rho cos phi,
    y &= rho sin phi,
    z &= rho cot alpha
  ) $

  *Velocities:*

  Taking time derivatives:
  $ cases(
    dot(x) &= dot(rho) cos phi - rho dot(phi) sin phi,
    dot(y) &= dot(rho) sin phi + rho dot(phi) cos phi,
    dot(z) &= dot(rho) cot alpha
  ) $

  *Kinetic energy:*

  $ T &= m/2 (dot(x)^2 + dot(y)^2 + dot(z)^2) \
  & = m/2 [(dot(rho)^2 cos^2 phi - 2 rho dot(rho) dot(phi) cos phi sin phi + rho^2 dot(phi)^2 sin^2 phi )\
  &quad + (dot(rho)^2 sin^2 phi + 2 rho dot(rho) dot(phi) sin phi cos phi + rho^2 dot(phi)^2 cos^2 phi) + dot(rho)^2 cot^2 alpha] \
  & = m/2 [dot(rho)^2 (cos^2 phi + sin^2 phi + cot^2 alpha) + rho^2 dot(phi)^2 (sin^2 phi + cos^2 phi)] \
  & = m/2 [dot(rho)^2 (1 + cot^2 alpha) + rho^2 dot(phi)^2] \
  & = m/2 [dot(rho)^2 csc^2 alpha + rho^2 dot(phi)^2] $

  where we used $1 + cot^2 alpha = csc^2 alpha$.

  *Potential energy:*

  $ U(rho) = m g z = m g rho cot alpha $

  *Lagrangian:*

  $ L(rho, phi, dot(rho), dot(phi)) = m/2 (dot(rho)^2 csc^2 alpha + rho^2 dot(phi)^2) - m g rho cot alpha $

  *Euler-Lagrange equation for $phi$:*

  Note that $phi$ is a cyclic coordinate ($pdv(L, phi) = 0$):
  $ pdv(L, phi) = 0, quad pdv(L, dot(phi)) = m rho^2 dot(phi) $

  $ dv(, t) (pdv(L, dot(phi))) - pdv(L, phi) = 0 $

  $ => dv(, t) (m rho^2 dot(phi)) = 0 $

  #boxed[$ m rho^2 (t) dot(phi)(t) = "constant" equiv ell $]

  This is the conservation of angular momentum about the vertical axis.

  *Euler-Lagrange equation for $rho$:*

  $ pdv(L, rho) = m rho dot(phi)^2 - m g cot alpha, quad pdv(L, dot(rho)) = m dot(rho) csc^2 alpha $

  $ dv(, t) (pdv(L, dot(rho))) - pdv(L, rho) = 0 $

  $ m dot.double(rho) csc^2 alpha - m rho dot(phi)^2 + m g cot alpha = 0 $

  Dividing by $m$ and rearranging:
  #boxed[$ dot.double(rho)(t) = rho(t) dot(phi)^2 (t) sin^2 alpha - g sin alpha cos alpha $]

  *Alternative form:* Using the conserved angular momentum $ell = rho^2 dot(phi)$, we have $dot(phi) = ell \/ rho^2$:

  $ dot.double(rho)(t) = (ell^2)/(rho^3 (t)) sin^2 alpha - g sin alpha cos alpha $

  This can be written as motion in an effective potential:
  $ dot.double(rho)(t) = -pdv(U_"eff", rho) $

  where the effective potential is:
  #boxed[$ U_"eff" (rho) = (ell^2)/(2 m rho^2) csc^2 alpha + m g rho cot alpha $]

  The first term is the centrifugal potential, and the second is the gravitational potential along the cone.
]
