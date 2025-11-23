#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 8",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("4.2")[
  #grid(
    columns: (1fr, 2fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 33.png"), width:80%, border: false),
    [Johannes Kepler announced his first two laws of planetary motion in 1609. The first law is that the orbits of the planets are ellipses. The second is the law of equal areas: the area swept out by the radius vector from the Sun to a planet in a given time is the same for any location of the planet in its orbit.

    Show that the rate at which area is swept out is constant.],
  )
]

#solution[
  Given a Central Force,

  $ cases(vb(F)(t) &= f(r) vu(e)_r, vb(r)(t) &= r(t) vu(e)_r) => vb(tau)(t) = vb(r)(t) times vb(F)(t) = 0 $

  In cylindrical coordinates:
  $ vb(r)(t) = rho(t) vu(e)_rho => vb(v)(t) = dot(rho)(t) vu(e)_rho + rho(t) dot(phi)(t) vu(e)_phi => vb(L)(t) = vb(r)(t) times vb(p)(t) = m rho^2(t) dot(phi)(t) vu(e)_z $

  Since $dot(vb(L))(t) = vb(tau)(t) = 0$:
  $ vb(L)(t) = m rho^2(t) dot(phi)(t) vu(e)_z = "constant" $

  Therefore: $L_z (t) = m rho^2(t) dot(phi)(t) = "constant"$

  For the swept area in time $Delta t$:
  $ Delta A ≈ 1/2 [rho(t) + Delta rho][rho(t) Delta phi] = 1/2 rho^2(t) Delta phi + 1/2 rho(t) Delta rho Delta phi $

  *Rate of area swept:*
  $ dv(A,t) = lim_(Delta t -> 0) (Delta A)/(Delta t) = 1/2 rho^2(t) dot(phi)(t) = L_z/(2m) = text("constant") $

  *Conclusion:* The rate at which area is swept out is constant, proving Kepler's second law.
]

#pagebreak()

#pbm("4.3")[
  #grid(
    columns: (1fr, 2fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 37.png"), width:80%, border: false),
    [A long uniform rod of length $L$ and mass $M$ hangs at its end from a pivot point about which it is free to swing in a vertical plane like a physical pendulum.

    Calculate orbital and spin angular momentum of the rod. Also, calculate directly the total angular momentum of the rod about the pivot point.],
  )
]

#solution[
  Center of mass position (from pivot):
  $ vb(R)_"CM" (t) = L/2 sin phi(t) vu(e)_y + L/2 cos phi(t) vu(e)_z \
  => vb(V)_"CM" (t) = L/2 dot(phi)(t) cos phi(t) vu(e)_y - L/2 dot(phi)(t) sin phi(t) vu(e)_z $

  *Orbital angular momentum:*
  $ vb(L)^"orbital" (t) &= vb(R)_"CM" (t) times vb(P)(t) = M vb(R)_"CM" (t) times vb(V)_"CM" (t) \
    & = -(M L^2)/4 dot(phi)(t) sin^2 phi(t) vu(e)_x - (M L^2)/4 dot(phi)(t) cos^2 phi(t) vu(e)_x \
    & = -1/4 M L^2 dot(phi)(t) vu(e)_x $

  *Spin angular momentum:*

  For a rod rotating about its center with $omega = dot(phi)(t)$:
  $ vb(L)^"spin" (t) = -integral_0^(L slash 2) r'^2 dot(phi)(t) dif m vu(e)_x = -1/12 M L^2 dot(phi)(t) vu(e)_x $

  *Direct calculation of total angular momentum:*

  For a rod element at distance $r$ from pivot:
  $ vb(r)_alpha (t) &= r sin phi(t) vu(e)_y + r cos phi(t) vu(e)_z \
  => dot(vb(r))_alpha (t) &= r dot(phi)(t) cos phi(t) vu(e)_y - r dot(phi)(t) sin phi(t) vu(e)_z \ => vb(L)_alpha (t) &= m_alpha vb(r)_alpha (t) times dot(vb(r))_alpha (t) = -m_alpha r^2 dot(phi) (t) vu(e)_x $

  Total angular momentum:
  $ vb(L)(t) = -integral_0^L r^2 dot(phi)(t) dif m vu(e)_x = -1/3 M L^2 dot(phi)(t) vu(e)_x $

  *Verification:*
  $ vb(L)^"orbital" (t) + vb(L)^"spin" (t) &= -1/4 M L^2 dot(phi)(t) vu(e)_x + (-1/12 M L^2 dot(phi)(t) vu(e)_x) = -1/3 M L^2 dot(phi)(t) vu(e)_x $

  #boxed[$ vb(L)^"orbital" (t) + vb(L)^"spin" (t)= vb(L)(t) $]

]

#pbm("4.4")[
  #grid(
    columns: (1fr, 2fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 36.png"), width:80%, border: false),
    [A uniform ladder of length $L$ is supported by a smooth horizontal floor and leaning against a smooth vertical wall. The ladder is released from rest with $phi = 30°$. The ladder is assumed to remain in contact with the wall in its subsequent motion.

    Obtain a second order differential equation for $phi(t)$ governing the motion of the ladder.],
  )
]

#solution[
  Center of mass position (from floor contact point):
  $ vb(R)_"CM" (t) &= L/2 cos phi(t) vu(e)_y + L/2 sin phi(t) vu(e)_z \
  => vb(V)_"CM" (t) &= -L/2 dot(phi)(t) sin phi(t) vu(e)_y + L/2 dot(phi)(t) cos phi(t) vu(e)_z \
  => vb(A)_"CM" (t) &= -L/2 [dot(phi)^2(t) cos phi(t) + dot.double(phi)(t) sin phi(t)] vu(e)_y + L/2 [-dot(phi)^2(t) sin phi(t) + dot.double(phi)(t) cos phi(t)] vu(e)_z $

  External forces:
  $ vb(F)(t) = N_"wall" (t) vu(e)_y + [N_"floor" (t) - M g] vu(e)_z $

  Newton's second law: $vb(F)(t) = M vb(A)_"CM" (t)$ gives:
  $ N_"wall" (t) &= -(M L)/2 [dot(phi)^2(t) cos phi(t) + dot.double(phi)(t) sin phi(t)] \
    N_"floor" (t) &= M g + (M L)/2 [-dot(phi)^2(t) sin phi(t) + dot.double(phi)(t) cos phi(t)] $

  Angular momentum about center of mass:
  $ vb(L)'(t) = -1/12 M L^2 dot(phi)(t) vu(e)_x $

  External torque about center of mass:
  $ vb(tau)^"ext" (t) &= [L/2 cos phi(t) vu(e)_y + L/2 sin phi(t) vu(e)_z] times N_"wall"(t) vu(e)_y + [L/2 cos phi(t) vu(e)_y - L/2 sin phi(t) vu(e)_z] times N_"floor" (t) vu(e)_z \
    & = L/2 [-N_"wall" (t) sin phi(t) + N_"floor" (t) cos phi(t)] vu(e)_x \
    & = (M L^2)/4 [dot.double(phi)(t) + (2g)/L cos phi(t)] vu(e)_x $

  Angular momentum equation: $dot(vb(L)')(t) = vb(tau)^"ext" (t)$ gives:
  $ -1/12 M L^2 dot.double(phi)(t) = (M L^2)/4 [dot.double(phi)(t) + (2g)/L cos phi(t)] $

  #boxed[$ dot.double(phi)(t) + display((3g)/(2L)) cos phi(t) = 0 $]
]
