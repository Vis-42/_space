#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 16",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("7.4")[
  Obtain the expression for the inertial force term in the d'Alembert's principle.
]

#solution[
  Starting with the position vector as a function of generalized coordinates:
  $ vb(r)_alpha = vb(r)_alpha ({q_k (t)}, t) $

  Taking the total time derivative:
  $ dv(, t) (pdv(vb(r)_alpha, q_k)) &= sum_(i=1)^M pdv(, q_i) (pdv(vb(r)_alpha, q_k)) dot(q)_i + pdv(, t) (pdv(vb(r)_alpha, q_k)) \
  &= sum_(i=1)^M pdv(, q_k) (pdv(vb(r)_alpha, q_i)) dot(q)_i + pdv(, q_k) (pdv(vb(r)_alpha, t)) \
  &= sum_(i=1)^M pdv(, q_k) (pdv(vb(r)_alpha, q_i) dot(q)_i) + pdv(, q_k) (pdv(vb(r)_alpha, t)) \
  &= pdv(, q_k) [sum_(i=1)^M (pdv(vb(r)_alpha, q_i) dot(q)_i) + pdv(vb(r)_alpha, t)] \
  &= pdv(dot(vb(r))_alpha, q_k) $

  For the virtual displacement:
  $ vb(r)_alpha = vb(r)_alpha ({q_k (t)}, t) quad => quad delta vb(r)_alpha = sum_(k=1)^M pdv(vb(r)_alpha, q_k) delta q_k $

  The inertial force term in d'Alembert's principle:
  $ -sum_(alpha=1)^N m_alpha dot.double(vb(r))_alpha dot delta vb(r)_alpha &= -sum_(alpha=1)^N sum_(k=1)^M m_alpha dot.double(vb(r))_alpha dot pdv(vb(r)_alpha, q_k) delta q_k \
  &= -sum_(k=1)^M sum_(alpha=1)^N [dv(, t) (m_alpha dot.double(vb(r))_alpha dot pdv(vb(r)_alpha, q_k)) - m_alpha dot.double(vb(r))_alpha dot dv(, t) (pdv(vb(r)_alpha, q_k))] delta q_k \
  &= -sum_(k=1)^M sum_(alpha=1)^N [dv(, t) (m_alpha dot.double(vb(r))_alpha dot pdv(vb(r)_alpha, q_k)) - m_alpha dot.double(vb(r))_alpha dot pdv(dot(vb(r))_alpha, q_k)] delta q_k \
  & = -sum_(k=1)^M sum_(alpha=1)^N {dv(, t) [pdv(, dot(q)_k) (1/2 m_alpha dot(vb(r))_alpha dot dot(vb(r))_alpha)] - pdv(, q_k) (1/2 m_alpha dot(vb(r))_alpha dot dot(vb(r))_alpha)} delta q_k $
]

#pagebreak()

#pbm("7.5")[
  Two identical particles, $P_1$ and $P_2$, with mass $m$ are connected by a light rigid rod of length $a$. $P_1$ is constrained to move along a fixed horizontal frictionless rail and the system moves in the vertical plane through the rail. An external force $F(t) vu(e)_x$ is acted on $P_2$.

  #fig(image("../../../../_zss/d 67.png"), width:70%, border: false)

  *Generalized coordinates:* $(q_1, q_2) equiv (x, theta)$

  Use Lagrange's equation to obtain equations of motions for $x(t)$ and $theta(t)$.
]

#solution[
  *Position vectors:*
  $ cases(
    vb(r)_1 (t) = x(t) vu(e)_x,
    vb(r)_2 (t) = [x(t) + a sin theta(t)] vu(e)_x - a cos theta(t) vu(e)_y
  ) $

  *Velocity vectors:*
  $ cases(
    dot(vb(r))_1(t) = dot(x)(t) vu(e)_x,
    dot(vb(r))_2(t) = [dot(x)(t) + a dot(theta)(t) cos theta(t)] vu(e)_x + a dot(theta)(t) sin theta(t) vu(e)_y
  ) $

  *Kinetic energy:*
  $ T equiv T(x, theta, dot(x), dot(theta), t) &= m/2 dot(vb(r))_1(t) dot dot(vb(r))_1(t) + m/2 dot(vb(r))_2(t) dot dot(vb(r))_2(t) \
  & = 1/2 m dot(x)^2 (t) + m a^2 dot(theta)^2 (t) + m a dot(x)(t) dot(theta)(t) cos theta(t) $

  *Applied forces and generalized forces:*
  $ cases(
    vb(F)_1 (t) = -m g vu(e)_y,
    vb(F)_2 (t) = -m g vu(e)_y + F(t) vu(e)_x
  ) $

  $ cases(
    cal(Q)_x (t) = vb(F)_1 (t) dot pdv(vb(r)_1, x) + vb(F)_2 (t) dot pdv(vb(r)_2, x) = F(t),
    cal(Q)_theta (t) = vb(F)_1 (t) dot pdv(vb(r)_1, theta) + vb(F)_2 (t) dot pdv(vb(r)_2, theta) = a cos theta(t) F(t) - m g a sin theta(t)
  ) $

  *Lagrange's equation for $x(t)$:*
  $ cases(
    display(pdv(T, x)) = 0,
    display(pdv(T, dot(x))) = 2m dot(x)(t) + m a dot(theta)(t) cos theta(t)
  ) $

  $ dv(, t) (pdv(T, dot(x))) - pdv(T, x) = cal(Q)_x (t) $

  $ => dv(, t) [2m dot(x)(t) + m a dot(theta)(t) cos theta(t)] = F(t) $

  #boxed[$ 2m dot.double(x)(t) + m a cos theta(t) dot.double(theta)(t) - m a sin theta(t) dot(theta)^2 (t) = F(t) $]

  *Lagrange's equation for $theta(t)$:*
  $ cases(
    display(pdv(T, theta)) = -m a sin theta(t) dot(x)(t) dot(theta)(t),
    display(pdv(T, dot(theta))) = m a^2 dot(theta)(t) + m a cos theta(t) dot(x)(t)
  ) $

  $ dv(, t) (pdv(T, dot(theta))) - pdv(T, theta) = cal(Q)_theta (t) $

  $ dv(, t) [m a^2 dot(theta)(t) + m a cos theta(t) dot(x)(t)] + m a sin theta(t) dot(x)(t) dot(theta)(t) = a cos theta(t) F(t) - m g a sin theta(t) $

  #boxed[$ m a^2 dot.double(theta)(t) + m a cos theta(t) dot.double(x)(t) = a cos theta(t) F(t) - m g a sin theta(t) $]
]

#pbm("7.6")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 68.png"), width:100%, border: false),
    [A simple pendulum in which the pivot is made to move vertically so that its distance from the fixed origin at time $t$ is $Z(t) = Z_0 cos Omega t$. The string is a light rigid rod of length $a$ that cannot go slack.

    *Generalized coordinate:* $q_1 equiv theta$

    Use Lagrange's equation to obtain equations of motion for $theta(t)$.],
  )
]

#solution[
  *Position vector:*
  $ vb(r)(t) = a sin theta(t) vu(e)_x + [Z(t) + a cos theta(t)] vu(e)_z $

  *Velocity vector:*
  $ dot(vb(r)) (t) = a dot(theta)(t) cos theta(t) vu(e)_x + [dot(Z) (t) - a dot(theta)(t) sin theta(t)] vu(e)_z $

  *Kinetic energy:*
  $ T equiv T(theta, dot(theta), t) &= m/2 dot(vb(r)) (t) dot dot(vb(r)) (t) \
  & = m/2 [a^2 dot(theta)^2 (t) + dot(Z)^2 (t) - 2 a dot(Z) (t) dot(theta)(t) sin theta(t)] $

  *Partial derivatives:*
  $ pdv(T, theta) = -m a dot(Z) (t) dot(theta)(t) cos theta(t), quad pdv(T, dot(theta)) = m a^2 dot(theta)(t) - m a dot(Z) (t) sin theta(t) $

  *Applied force and generalized force:*
  $ vb(F)(t) = m g vu(e)_z quad => quad cal(Q)_theta (t) = vb(F)(t) dot pdv(vb(r), theta) = -m g a sin theta(t) $

  *Lagrange's equation:*
  $ dv(, t) (pdv(T, dot(theta))) - pdv(T, theta) = cal(Q)_theta (t) $

  $ dv(, t) [m a^2 dot(theta)(t) - m a dot(Z) (t) sin theta(t)] + m a dot(Z) (t) dot(theta)(t) cos theta(t) = -m g a sin theta(t) $

  $ = > dot.double(theta)(t) - 1/a dot.double(Z) (t) sin theta(t) = -g/a sin theta(t) $

  Substituting $Z(t) = Z_0 cos Omega t$ gives $dot.double(Z) (t) = -Omega^2 Z_0 cos(Omega t)$:
  #boxed[$ dot.double(theta)(t) + (Omega^2 Z_0)/a cos(Omega t) sin theta(t) + g/a sin theta(t) = 0 $]
]
