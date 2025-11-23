#import "_at.typ": *

#show: ad.with(
  title: "Worksheet 7",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)

#pbm("3.4")[
  #fig(image("../../../_zss/d 30.png"), width:60%, border: false)
  Two identical blocks 1 and 2 each of mass $m$ slide without friction on a straight track. They are connected by a massless spring with unstretched length $L_0$ and spring constant $k$. Initially, the system is at rest. At $t = 0$, block 1 is hit sharply giving it an instantaneous velocity $v_0$ to the right.

  Find the velocities of each block at later times with respect to the track.
]

#solution[
  *Center of mass motion*\
  Since there are no external forces: $vb(F)^"ext" (t) = M dot.double(vb(R))_"CM" (t) = 0$ $->$ $dot.double(vb(R))_"CM" (t) = 0$

  Center of mass position:
  $ X_"CM" (t) = frac(m_1 x_1(t) + m_2 x_2(t), m_1 + m_2) = frac(1,2) [x_1(t) + x_2(t)] $

  *Relative coordinates transformation*
  $ vb(r)'(t) = vb(r)(t) - vb(R)_"CM" (t) => cases(x_1^' (t) &= x_1(t) - X_"CM" (t) = display(1/2) [x_1(t) - x_2(t)],
  x_2^' (t) &= x_2(t) - X_"CM" (t) = -display(1/2) [x_1(t) - x_2(t)]) $

  Spring extension relation: $x_1(t) - x_2(t) - L_0 = x_1^' (t) - x_2^' (t) - L_0$

  *Equations of motion in CM frame*
  $ cases(vb(F)_1(t) &= m_1 dot.double(vb(r))_1^' (t),\
  vb(F)_2(t) &= m_2 dot.double(vb(r))_2^' (t)) \ => cases(m dot.double(x)_1^' (t) &= -k [x_1^' (t) - x_2^' (t) - L_0] , \
  m dot.double(x)_2^' (t) &= +k [x_1^' (t) - x_2^' (t) - L_0]) quad quad stretch(->)^(u(t) = x_1^' (t) - x_2^' (t) - L_0) quad m dot.double(u)(t) + 2k u(t) = 0 $

  *General solution:* $ u(t) = A cos omega t + B sin omega t quad "where" omega = sqrt(display((2k)/m)) $

  *For given initial conditions,*
  $ cases(u(0) &= x_1(0) - x_2(0) - L_0 = 0 ,
  dot(u)(0) &= dot(x)_1(0) - dot(x)_2(0) = v_0) quad => u(t) = display(v_0/ omega) sin omega t $

  *Velocities in CM frame*\
  $ cases(x_1^' (t) &= display(1/2) [x_1(t) - x_2(t)],
  x_2^' (t) &= -display(1/2) [x_1(t) - x_2(t)]) => x_1^' (t) = -x_2^' (t) $
  Since $u(t) = x_1^' (t) - x_2^' (t) - L_0$:
  $ dot(u)(t) = dot(x)_1^' (t) - dot(x)_2^' (t) = v_0 cos omega t -> dot(x)_1^' (t) = -dot(x)_2^' (t) = frac(v_0,2) cos omega t $

  *Center of mass velocity*
  $ dot.double(X)_"CM" (t) = 0 -> dot(X)_"CM" (t) = dot(X)_"CM" (0) = frac(1,2) [dot(x)_1(0) + dot(x)_2(0)] = frac(v_0,2) $

  *Final velocities*
  $ cases(dot(x)_1(t) &= dot(x)_1^' (t) + dot(X)_"CM" (t) = display(v_0/2) cos omega t + display(v_0/2),\
  dot(x)_2(t) &= dot(x)_2^' (t) + dot(X)_"CM" (t) = -display(v_0/2) cos omega t + display(v_0/2)) \
  => quad cases(dot(x)_1(t) &= display(v_0/2) (1 + cos omega t),\
  dot(x)_2(t) &= display(v_0/2) (1 - cos omega t)) $
]

#pbm("4.1")[
  #grid(
      columns: (2fr, 5fr),
      gutter: 1em,
      fig(image("../../../_zss/d 31.png"), width:80%, border: false),
      [Mass $M$ is fixed to the end of a light rod of length $L$ that is pivoted to swing from the end of a hub that rotates at constant angular frequency $omega$. The mass moves with steady speed in a circular path of constant radius.

      Verify that the relation $vb(tau)(t) = dot(vb(ell))(t)$ is satisfied for the following two origins: (1) center of the circular plane of motion; and (2) pivot point on the axis.],
    )
]

#solution[
  Given: $vb(r)(t) = L sin alpha vu(e)_rho$, $vb(F)(t) = -M g tan alpha vu(e)_rho$, $vb(v)(t) = L omega sin alpha vu(e)_phi$

  *Case 1: About center of circular motion*

  Torque about center:
  $ vb(tau)(t) = vb(r)(t) times vb(F)(t) = (L sin alpha vu(e)_rho) times (-M g tan alpha vu(e)_rho) = 0 $

  Angular momentum about center:
  $ vb(ell)(t) = vb(r)(t) times vb(p)(t) = (L sin alpha vu(e)_rho) times (M L omega sin alpha vu(e)_phi) = M L^2 omega sin^2 alpha vu(e)_z $

  Time derivative:
  $ dot(vb(ell))(t) = dv((M r^2 omega vu(e)_z), t) = 0 $

  ✓ Verified: $vb(tau)(t) = 0 = dot(vb(ell))(t)$

  *Case 2: About pivot point*

  Position from pivot: $vb(r)_"pivot" (t) = L cos alpha vu(e)_z$

  Torque about pivot:
  $ vb(tau)_"pivot" (t) &= [vb(r)(t) - vb(r)_"pivot" (t)] times vb(F)(t) \
    &= [L sin alpha vu(e)_rho - L cos alpha vu(e)_z] times (-M g tan alpha vu(e)_rho) \
    &= M g L sin alpha vu(e)_phi $

  Angular momentum about pivot:
  $ vb(ell)_"pivot" (t) &= [vb(r)(t) - vb(r)_"pivot" (t)] times vb(p)(t) \
    &= [L sin alpha vu(e)_rho - L cos alpha vu(e)_z] times (M L omega sin alpha vu(e)_phi) \
    &= M L^2 omega sin^2 alpha vu(e)_z + M L^2 omega sin alpha cos alpha vu(e)_rho $

  Time derivative:
  $ dot(vb(ell))_"pivot" (t) = M L^2 omega^2 sin alpha cos alpha vu(e)_phi = M g L sin alpha vu(e)_phi $

  ✓ Verified: $vb(tau)_"pivot" (t) = M g L sin alpha vu(e)_phi = dot(vb(ell))_"pivot" (t)$
]
