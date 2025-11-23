#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 20",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("8.6")[
  Show that the Jacobi energy function $h({q_i, dot(q)_i}, t)$ is a constant of motion if the Lagrangian does not depend on time explicitly.

  The Jacobi energy function is defined as:
  $ h({q_i, dot(q)_i}, t) equiv sum_i dot(q)_i pdv(L, dot(q)_i) - L({q_k, dot(q)_k}, t) $
]

#solution[
  *Total time derivative of the Lagrangian:*

  The total time derivative of $L({q_k, dot(q)_k}, t)$ is:
  $ (dif L)/(dif t) = sum_i [pdv(L, q_i) dot(q)_i + pdv(L, dot(q)_i) dot.double(q)_i] + pdv(L, t) $

  *Apply the Euler-Lagrange equation:*

  From the Euler-Lagrange equation:
  $ pdv(L, q_i) = dv(, t) (pdv(L, dot(q)_i)) $

  Substituting this into the expression above:
  $ (dif L)/(dif t) = sum_i [dv(, t) (pdv(L, dot(q)_i)) dot(q)_i + pdv(L, dot(q)_i) dot.double(q)_i] + pdv(L, t) $

  *Simplify using product rule:*

  The first term can be written using the product rule:
  $ sum_i [dv(, t) (pdv(L, dot(q)_i)) dot(q)_i + pdv(L, dot(q)_i) dot.double(q)_i] = sum_i dv(, t) [dot(q)_i pdv(L, dot(q)_i)] $

  Therefore:
  $ (dif L)/(dif t) = dv(, t) [sum_i dot(q)_i pdv(L, dot(q)_i)] + pdv(L, t) $

  *Time derivative of the Jacobi energy function:*

  The Jacobi energy function is:
  $ h = sum_i dot(q)_i pdv(L, dot(q)_i) - L $

  Taking its total time derivative:
  $ (dif h)/(dif t) = dv(, t) [sum_i dot(q)_i pdv(L, dot(q)_i)] - (dif L)/(dif t) $

  Substituting the expression for $dif L \/ dif t$:
  $ (dif h)/(dif t) = dv(, t) [sum_i dot(q)_i pdv(L, dot(q)_i)] - dv(, t) [sum_i dot(q)_i pdv(L, dot(q)_i)] - pdv(L, t) $

  $ (dif h)/(dif t) = -pdv(L, t) $

  *Conclusion:*

  #boxed[If $pdv(L, t) = 0$ (Lagrangian has no explicit time dependence), then $(dif h)/(dif t) = 0$, and $h$ is a constant of motion.]

  *Additional result:* If the kinetic energy is homogeneous of degree 2 in the generalized velocities, i.e., $T({q_k, lambda dot(q)_k}) = lambda^2 T({q_k, dot(q)_k})$, then by Euler's theorem:
  $ sum_i dot(q)_i pdv(T, dot(q)_i) = 2T $

  For a system where $L = T - U$ with $U$ independent of velocities:
  $ h = sum_i dot(q)_i pdv(L, dot(q)_i) - L = sum_i dot(q)_i pdv(T, dot(q)_i) - (T - U) = 2T - T + U = T + U = E $

  Therefore, #boxed[in this case, the Jacobi energy function equals the total mechanical energy.]
]

#pagebreak()

#pbm("8.7")[
  #grid(
      columns: (3fr, 4fr),
      gutter: 1em,
      fig(image("../../../../_zss/d 64.png"), width:100%, border: false),
      [Two masses $m_1$ and $m_2$ are suspended by an inextensible string which passes over a massless, frictionless pulley (Atwood machine).

      *Constraint:* $x_1 (t) + x_2 (t) = "constant"$

      *Kinetic energy:* $T = 1/2 (m_1 dot(x)_1^2 + m_2 dot(x)_2^2)$

      *Potential energy:* $U = -g(m_1 x_1 + m_2 x_2)$

      Solve for the accelerations of the masses from the Euler-Lagrange equation and determine the generalized constraint forces using Lagrange multipliers.],
    )

]

#solution[
  *Method 1: Without Lagrange multipliers (eliminate constraint)*

  *Apply constraint:*

  From the constraint $x_1 (t) + x_2 (t) = ell$ (constant), we have:
  $ dot(x)_2 = -dot(x)_1, quad dot.double(x)_2 = -dot.double(x)_1 $

  *Lagrangian in terms of $x_1$:*

  $ T = 1/2 (m_1 dot(x)_1^2 + m_2 dot(x)_2^2) = 1/2 (m_1 + m_2) dot(x)_1^2 $

  $ U = -g(m_1 x_1 + m_2 x_2) = -g m_1 x_1 - g m_2 (ell - x_1) = -g(m_1 - m_2) x_1 - g m_2 ell $

  $ L(x_1, dot(x)_1) = 1/2 (m_1 + m_2) dot(x)_1^2 + g(m_1 - m_2) x_1 + g m_2 ell $

  *Euler-Lagrange equation:*

  $ pdv(L, x_1) = g(m_1 - m_2), quad pdv(L, dot(x)_1) = (m_1 + m_2) dot(x)_1 $

  $ dv(, t) (pdv(L, dot(x)_1)) - pdv(L, x_1) = 0 $

  $ (m_1 + m_2) dot.double(x)_1 - g(m_1 - m_2) = 0 $

  #boxed[$ dot.double(x)_1 = (m_1 - m_2)/(m_1 + m_2) g, quad dot.double(x)_2 = -dot.double(x)_1 = (m_2 - m_1)/(m_1 + m_2) g $]

  *Method 2: With Lagrange multipliers*

  *Set up the system:*

  The Lagrangian with both coordinates:
  $ L(x_1, x_2, dot(x)_1, dot(x)_2) = 1/2 (m_1 dot(x)_1^2 + m_2 dot(x)_2^2) + m_1 g x_1 + m_2 g x_2 $

  Constraint: $psi(x_1, x_2) = x_1 + x_2 - ell = 0$

  *Modified Euler-Lagrange equations:*

  $ cases(
    dv(, t) (pdv(L, dot(x)_1)) - pdv(L, x_1) &= lambda pdv(psi, x_1),
    dv(, t) (pdv(L, dot(x)_2)) - pdv(L, x_2) &= lambda pdv(psi, x_2),
    psi(x_1, x_2) &= 0
  ) $

  Since $pdv(psi, x_1) = 1$ and $pdv(psi, x_2) = 1$:
  $ cases(
    m_1 dot.double(x)_1 - m_1 g &= lambda,
    m_2 dot.double(x)_2 - m_2 g &= lambda,
    x_1 + x_2 &= ell
  ) $

  *Solve the system:*

  From the first two equations:
  $ m_1 dot.double(x)_1 - m_1 g = m_2 dot.double(x)_2 - m_2 g $

  Using $dot.double(x)_2 = -dot.double(x)_1$ from the constraint:
  $ m_1 dot.double(x)_1 - m_1 g = -m_2 dot.double(x)_1 - m_2 g $

  $ (m_1 + m_2) dot.double(x)_1 = (m_1 - m_2) g $

  #boxed[$ dot.double(x)_1 = (m_1 - m_2)/(m_1 + m_2) g, quad dot.double(x)_2 = -(m_1 - m_2)/(m_1 + m_2) g $]

  *Find Lagrange multiplier:*

  Substituting back:
  $ lambda = m_1 dot.double(x)_1 - m_1 g = m_1 (m_1 - m_2)/(m_1 + m_2) g - m_1 g = -(2 m_1 m_2)/(m_1 + m_2) g $

  *Generalized constraint forces:*

  The generalized constraint forces are:
  $ cases(
    Q^"cons"_(x_1) &= lambda pdv(psi, x_1) = -(2 m_1 m_2)/(m_1 + m_2) g,
    Q^"cons"_(x_2) &= lambda pdv(psi, x_2) = -(2 m_1 m_2)/(m_1 + m_2) g
  ) $

  #boxed[These represent the tension forces in the string acting on each mass.]

  The magnitude of the tension is:
  #boxed[$ T_"string" = (2 m_1 m_2)/(m_1 + m_2) g $]
]

#pagebreak()

#pbm("8.8")[
  #grid(
      columns: (1fr, 1fr),
      gutter: 1em,
      fig(image("../../../../_zss/d 80.png"), width:100%, border: false),
      [A particle of mass $m$ starts at rest on top of a smooth fixed hemisphere of radius $a$. Determine the angle at which the particle leaves the hemisphere from the Euler-Lagrange equation.],
    )

]

#solution[
  *Set up the Lagrangian:*

  Using polar coordinates $(r, theta)$ with origin at the center of the hemisphere:

  $ L(r, theta, dot(r), dot(theta)) = m/2 (dot(r)^2 + r^2 dot(theta)^2) - m g r cos theta $

  *Constraint and Lagrange multiplier method:*

  Constraint: $psi(r, theta) = r - a = 0$

  Modified Euler-Lagrange equations:
  $ cases(
    dv(, t) (pdv(L, dot(r))) - pdv(L, r) &= lambda pdv(psi, r),
    dv(, t) (pdv(L, dot(theta))) - pdv(L, theta) &= lambda pdv(psi, theta),
    psi(r, theta) &= 0
  ) $

  *Compute partial derivatives:*

  $ cases(
    display(pdv(L, r)) &= m r dot(theta)^2 - m g cos theta,
    display(pdv(L, dot(r))) &= m dot(r),
    display(pdv(L, theta)) &= m g r sin theta,
    display(pdv(L, dot(theta))) &= m r^2 dot(theta)
  ) $

  Also, $pdv(psi, r) = 1$ and $pdv(psi, theta) = 0$.

  *Write the equations:*

  $ cases(
    m dot.double(r) - m r dot(theta)^2 + m g cos theta &= lambda,
    m r^2 dot.double(theta) + 2 m r dot(r) dot(theta) - m g r sin theta &= 0,
    r - a &= 0
  ) $

  *Apply constraint:*

  On the hemisphere, $r = a$, $dot(r) = 0$, $dot.double(r) = 0$. The equations become:
  $ cases(
    -m a dot(theta)^2 + m g cos theta &= lambda,
    m a^2 dot.double(theta) - m g a sin theta &= 0
  ) $

  *Solve for $dot(theta)^2$:*

  From the second equation:
  $ dot.double(theta) = g/a sin theta $

  Using the chain rule $dot.double(theta) = dot(theta) dv(dot(theta), theta)$:
  $ dot(theta) dv(dot(theta), theta) = g/a sin theta $

  Integrating:
  $ integral dot(theta) dif dot(theta) = integral g/a sin theta dif theta $

  $ (dot(theta)^2)/2 = -g/a cos theta + C $

  *Apply initial conditions:*

  At $t = 0$: $theta = 0$ and $dot(theta) = 0$ (starts from rest at the top):
  $ 0 = -g/a + C quad => quad C = g/a $

  Therefore:
  $ (dot(theta)^2)/2 = g/a (1 - cos theta) $

  #boxed[$ dot(theta)^2 = (2g)/a (1 - cos theta) $]

  *Find constraint force:*

  Substituting into the first equation:
  $ lambda = -m a dot(theta)^2 + m g cos theta = -m a · (2g)/a (1 - cos theta) + m g cos theta $

  $ lambda = -2 m g (1 - cos theta) + m g cos theta = -2 m g + 2 m g cos theta + m g cos theta $

  $ lambda = m g (3 cos theta - 2) $

  The constraint force (normal force) is:
  $ Q^"cons"_r = lambda pdv(psi, r) = lambda = m g (3 cos theta - 2) $

  *Particle leaves when constraint force becomes zero:*

  The particle leaves the hemisphere when the normal force vanishes:
  $ m g (3 cos theta_0 - 2) = 0 $

  $ 3 cos theta_0 = 2 $

  #boxed[$ theta_0 = cos^(-1) (2/3) ≈ 48.2 degree $]

  *Physical interpretation:* At this angle, the required centripetal force exceeds what gravity can provide via the normal force, so the particle loses contact with the hemisphere and becomes a projectile.
]
