#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 17",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("8.1")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 69.png"), width:100%, border: false),
    [A block of mass $m$ is free to slide on the wedge of mass $M$ which can slide on the horizontal table, both with negligible friction.

    *Generalized coordinates:* $s$ is the distance of the block from the top of the wedge and $x$ is the distance of the wedge from any convenient fixed point on the table.],
  )

  Find the acceleration of the wedge, and acceleration of the block relative to the wedge from Lagrange's equation.
]

#solution[
  *Position vectors:*
  $ cases(
    vb(r)_1 (t) = x(t) vu(e)_x,
    vb(r)_2 (t) = [x(t) + s(t) cos alpha] vu(e)_x + [H - s(t) sin alpha] vu(e)_y
  ) $

  *Kinetic energy:*
  $ T equiv T(x, s, dot(x), dot(s), t) &= M/2 dot(vb(r))_1(t) dot dot(vb(r))_1(t) + m/2 dot(vb(r))_2(t) dot dot(vb(r))_2(t) \
  & = M/2 dot(x)^2 (t) + m/2 [dot(s)^2 (t) + 2 dot(s) (t) dot(x)(t) cos alpha + dot(x)^2 (t)] $

  *Potential energy:*
  $ U equiv U(x, s) = m g y_2 (t) = m g H - m g s(t) sin alpha $

  *Lagrange's equation for $x(t)$:*
  $ cases(
    display(pdv(T, dot(x))) = (M + m) dot(x)(t) + m dot(s) (t) cos alpha,
    display(pdv(T, x)) = 0,
    display(pdv(U, x)) = 0
  ) $

  $ dv(, t) (pdv(T, dot(x))) - pdv(T, x) = -pdv(U, x) quad => quad (M + m) dot.double(x)(t) + m dot.double(s) (t) cos alpha = "constant" $

  *Lagrange's equation for $s(t)$:*
  $ cases(
    display(pdv(T, dot(s))) = m dot(s) (t) + m dot(x)(t) cos alpha,
    display(pdv(T, s)) = 0,
    display(pdv(U, s)) = -m g sin alpha
  ) $

  $ dv(, t) (pdv(T, dot(s))) - pdv(T, s) = -pdv(U, s) quad => quad m dot.double(s) (t) + m dot.double(x)(t) cos alpha = m g sin alpha $

  *System of equations:*
  $ cases(
    (M + m) dot.double(x)(t) + m dot.double(s) (t) cos alpha = "constant",
    m dot.double(s) (t) + m dot.double(x)(t) cos alpha = m g sin alpha
  ) $

  Assuming the system starts from rest (constant = 0):
  $ cases(
    (M + m) dot.double(x)(t) + m dot.double(s) (t) cos alpha = 0,
    m dot.double(s) (t) + m dot.double(x)(t) cos alpha = m g sin alpha
  ) $

  *Solving for accelerations:*
  #boxed[$ cases(
    dot.double(x)(t) = -display((m g sin alpha cos alpha)/(M + m sin^2 alpha)),
    dot.double(s) (t) = display(((M + m) g sin alpha)/(M + m sin^2 alpha))
  ) $]
]

#pagebreak()

#pbm("8.2")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 70.png"), width:100%, border: false),
    [A plane double pendulum consists of two light and inextensible rods of lengths $ell_1$ and $ell_2$ respectively. Two point masses, $m_1$ and $m_2$, are respectively attached at the end of each rod.

    *Holonomic constraints:*
    $ cases(
      f_1 &= x_1^2 + y_1^2 - ell_1^2 = 0,
      f_2 &= (x_2 - x_1)^2 + (y_2 - y_1)^2 - ell_2^2 = 0
    ) $

    *Generalized coordinates:* $(q_1, q_2) equiv (theta_1, theta_2)$

    Obtain the equations of motion for the plane double pendulum from the Euler Lagrange equation.],
  )
]

#solution[
  *Holonomic constraints:*
  $ cases(
    f_1 &= x_1^2 + y_1^2 - ell_1^2 = 0,
    f_2 &= (x_2 - x_1)^2 + (y_2 - y_1)^2 - ell_2^2 = 0
  ) $

  *Position vectors:*
  $ cases(
    vb(r)_1 (t) = ell_1 sin theta_1 (t) vu(e)_x + ell_1 cos theta_1 (t) vu(e)_y,
    vb(r)_2 (t) = [ell_1 sin theta_1 (t) + ell_2 sin theta_2 (t)] vu(e)_x + [ell_1 cos theta_1 (t) + ell_2 cos theta_2 (t)] vu(e)_y
  ) $

  *Kinetic energy:*
  $ T equiv T(theta_1, theta_2, dot(theta)_1, dot(theta)_2, t) &= m_1/2 dot(vb(r))_1(t) dot dot(vb(r))_1(t) + m_2/2 dot(vb(r))_2(t) dot dot(vb(r))_2(t) \
  & = (m_1 + m_2)/2 ell_1^2 dot(theta)_1^2 (t) + m_2/2 ell_2^2 dot(theta)_2^2 (t) + m_2 ell_1 ell_2 dot(theta)_1 (t) dot(theta)_2 (t) cos[theta_1 (t) - theta_2 (t)] $

  *Potential energy:*
  $ U equiv U(theta_1, theta_2) &= -m_1 g y_1 (t) - m_2 g y_2 (t) \
  &= -(m_1 + m_2) g ell_1 cos theta_1 (t) - m_2 g ell_2 cos theta_2 (t) $

  *Lagrangian:*
  $ cal(L) equiv cal(L)(theta_1, theta_2, dot(theta)_1, dot(theta)_2, t) = T - U $

  $ = (m_1 + m_2)/2 ell_1^2 dot(theta)_1^2 (t) + m_2/2 ell_2^2 dot(theta)_2^2 (t) + m_2 ell_1 ell_2 dot(theta)_1 (t) dot(theta)_2 (t) cos[theta_1 (t) - theta_2 (t)] \
  + (m_1 + m_2) g ell_1 cos theta_1 (t) + m_2 g ell_2 cos theta_2 (t) $

  *Euler-Lagrange equation for $theta_1 (t)$:*
  $ cases(
    display(pdv(cal(L), dot(theta)_1)) = (m_1 + m_2) ell_1^2 dot(theta)_1 (t) + m_2 ell_1 ell_2 dot(theta)_2 (t) cos[theta_1 (t) - theta_2 (t)],
    display(pdv(cal(L), theta_1)) = -m_2 ell_1 ell_2 dot(theta)_1 (t) dot(theta)_2 (t) sin[theta_1 (t) - theta_2 (t)] - (m_1 + m_2) g ell_1 sin theta_1 (t)
  ) $

  $ dv(, t) (pdv(cal(L), dot(theta)_1)) - pdv(cal(L), theta_1) = 0 $

  #boxed[$ (m_1 + m_2) ell_1^2 dot.double(theta)_1 (t) + m_2 ell_1 ell_2 dot.double(theta)_2 (t) cos[theta_1 (t) - theta_2 (t)] \
  + m_2 ell_1 ell_2 dot(theta)_2^2 (t) sin[theta_1 (t) - theta_2 (t)] + (m_1 + m_2) g ell_1 sin theta_1 (t) = 0 $]

  *Euler-Lagrange equation for $theta_2 (t)$:*
  $ cases(
    display(pdv(cal(L), dot(theta)_2)) = m_2 ell_2^2 dot(theta)_2 (t) + m_2 ell_1 ell_2 dot(theta)_1 (t) cos[theta_1 (t) - theta_2 (t)],
    display(pdv(cal(L), theta_2)) = m_2 ell_1 ell_2 dot(theta)_1 (t) dot(theta)_2 (t) sin[theta_1 (t) - theta_2 (t)] - m_2 g ell_2 sin theta_2 (t)
  ) $

  $ dv(, t) (pdv(cal(L), dot(theta)_2)) - pdv(cal(L), theta_2) = 0 $

  #boxed[$ m_2 ell_2^2 dot.double(theta)_2 (t) + m_2 ell_1 ell_2 dot.double(theta)_1 (t) cos[theta_1 (t) - theta_2 (t)] - m_2 ell_1 ell_2 dot(theta)_1^2 (t) sin[theta_1 (t) - theta_2 (t)] + m_2 g ell_2 sin theta_2 (t) = 0 $]
]
