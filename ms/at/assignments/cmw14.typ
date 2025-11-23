#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 14",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("6.4")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 64.png"), width:90%, border: false),
    [Two masses $m_1$ and $m_2$ are suspended by an inextensible string which passes over a massless and frictionless pulley.

    *Holonomic constraint:*
    $ f(vb(r)_1, vb(r)_2) = x_1 + x_2 - ell = 0 $

    *Applied forces:*
    $ vb(F)_1^((A)) (t) = m_1 g vu(e)_1, quad vb(F)_2^((A)) (t) = m_2 g vu(e)_2 $

    Use d'Alembert's principle to find the accelerations of the masses $dot.double(x_1)(t)$ and $dot.double(x_2)(t)$.],
  )
]

#solution[
  *Constraint relations:*

  From the holonomic constraint:
  $ f(vb(r)_1, vb(r)_2) = x_1 + x_2 - ell = 0 quad => quad delta x_1 = -delta x_2 quad <=> quad dot.double(x_1)(t) = -dot.double(x_2)(t) $

  *Apply d'Alembert's principle:*

  D'Alembert's principle states:
  $ sum_alpha [vb(F)_alpha^((A)) (t) - m_alpha dot.double(vb(r))_alpha(t)] dot delta vb(r)_alpha = 0 $

  Since the masses move only vertically, we have $delta vb(r)_1 = delta x_1 vu(e)_1$ and $delta vb(r)_2 = delta x_2 vu(e)_2$.

  Expanding:
  $ m_1 dot.double(vb(r))_1(t) dot delta vb(r)_1 + m_2 dot.double(vb(r))_2(t) dot delta vb(r)_2 = vb(F)_1^((A)) (t) dot delta vb(r)_1 + vb(F)_2^((A)) (t) dot delta vb(r)_2 $

  $ m_1 dot.double(x_1)(t) delta x_1 + m_2 dot.double(x_2)(t) delta x_2 = m_1 g delta x_1 + m_2 g delta x_2 $

  Using the constraint $delta x_1 = -delta x_2$ (or equivalently $delta x_2 = -delta x_1$):
  $ m_1 dot.double(x_1)(t) delta x_1 + [-m_2 dot.double(x_1)(t)](-delta x_1) = m_1 g delta x_1 + m_2 g(-delta x_1) $

  $ (m_1 + m_2) dot.double(x_1)(t) delta x_1 = (m_1 - m_2) g delta x_1 $

  Since $delta x_1$ is arbitrary (non zero), we can divide both sides by $delta x_1$:
  $ dot.double(x_1)(t) = (m_1 - m_2)/(m_1 + m_2) g $

  Using the constraint relation $dot.double(x_2)(t) = -dot.double(x_1)(t)$:
  $ dot.double(x_2)(t) = -(m_1 - m_2)/(m_1 + m_2) g = (m_2 - m_1)/(m_1 + m_2) g $

  #boxed[$ cases(
    dot.double(x_1)(t) = display((m_1 - m_2)/(m_1 + m_2)) g,
    dot.double(x_2)(t) = display((m_2 - m_1)/(m_1 + m_2)) g
  ) $]
]

#pbm("6.5")[
  #grid(
    columns: (3fr, 5fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 65.png"), width:100%, border: false),
    [A point particle of mass $m$ attached to a massless spring of original length $ell_0$ and spring constant $k$ rotates about a frictionless pivot in a plane.

    *Applied forces:*
    $ cases(
      vb(F)_"gravity" (t) &= m g cos phi(t) vu(e)_rho - m g sin phi(t) vu(e)_phi,
      vb(F)_"spring" (t) &= -k[rho(t) - ell_0] vu(e)_rho
    ) $

    Use d'Alembert's principle to obtain equations of motion for $rho(t)$ and $phi(t)$.],
  )
]

#solution[
  *Express position, acceleration, and virtual displacement:*

  In polar coordinates, the position vector and its acceleration are:
  $ vb(r)(t) = rho(t) vu(e)_rho $

  The acceleration in polar coordinates is:
  $ dot.double(vb(r)) = [dot.double(rho)(t) - rho(t) dot(phi)^2 (t)] vu(e)_rho + [rho(t) dot.double(phi)(t) + 2 dot(rho)(t) dot(phi)(t)] vu(e)_phi $

  The virtual displacement is:
  $ delta vb(r) = delta rho vu(e)_rho + rho(t) delta phi vu(e)_phi $

  *Apply d'Alembert's principle:*

  D'Alembert's principle states:
  $ [vb(F)^((A)) (t) - m dot.double(vb(r))(t)] dot delta vb(r) = 0 $

  The total applied force is:
  $ vb(F)^((A)) (t) = vb(F)_"gravity" (t) + vb(F)_"spring" (t) = [m g cos phi(t) - k(rho(t) - ell_0)] vu(e)_rho - m g sin phi(t) vu(e)_phi $

  Substituting into d'Alembert's principle:
  $ &[m g cos phi(t) - k(rho(t) - ell_0)] delta rho - m g sin phi(t) rho(t) delta phi \
  &quad - m[dot.double(rho)(t) - rho(t) dot(phi)^2 (t)] delta rho - m[rho(t) dot.double(phi)(t) + 2 dot(rho)(t) dot(phi)(t)] rho(t) delta phi = 0 $

  Collecting terms by $delta rho$ and $delta phi$:
  $ &{m g cos phi(t) - k[rho(t) - ell_0] - m[dot.double(rho)(t) - rho(t) dot(phi)^2 (t)]} delta rho \
  &quad + {-m g sin phi(t) - m[rho(t) dot.double(phi)(t) + 2 dot(rho)(t) dot(phi)(t)]} rho(t) delta phi = 0 $

  Since $delta rho$ and $delta phi$ are independent and arbitrary, their coefficients must vanish:

  *Equations of motion:*
  $ cases(
    m g cos phi(t) - k[rho(t) - ell_0] - m[dot.double(rho)(t) - rho(t) dot(phi)^2 (t)] &= 0,
    -m g sin phi(t) - m[rho(t) dot.double(phi)(t) + 2 dot(rho)(t) dot(phi)(t)] &= 0
  ) $

  Simplifying:
  #boxed[$ cases(
    dot.double(rho)(t) - rho(t) dot(phi)^2 (t) &= g cos phi(t) - k/m [rho(t) - ell_0],
    rho(t) dot.double(phi)(t) + 2 dot(rho)(t) dot(phi)(t) &= -g sin phi(t)
  ) $]

  The second equation can also be written as:
  $ dv(, t) [rho^2 (t) dot(phi)(t)] = -rho(t) g sin phi(t) $

  which shows conservation of angular momentum in the absence of tangential forces.
]

#pbm("6.6")[
  A particle of mass $m$ is suspended by a massless wire of length $r(t)$ to move on the surface of the sphere of radius $r(t)$.

  *Given:* $r(t) = a + b cos omega t$, where $a > b > 0$

  *Holonomic constraint:* $f(vb(r), t) = r(t) - a - b cos omega t = 0$

  *Applied force:* $vb(F)_"gravity" (t) = -m g cos theta(t) vu(e)_r + m g sin theta(t) vu(e)_theta$

  Use d'Alembert's principle to obtain equations of motion for $theta(t)$ and $phi(t)$.
]

#solution[
  *Kinematics of the constraint:*

  From the constraint $f(vb(r)) = r(t) - a - b cos omega t = 0$, we have:
  $ r(t) = a + b cos omega t $

  Taking time derivatives:
  $ dot(r)(t) = -b omega sin omega t, quad dot.double(r) (t) = -b omega^2 cos omega t $

  *Acceleration in spherical coordinates:*

  The acceleration of a particle in spherical coordinates with time varying $r(t)$ is:
  $ vb(a)(t) &= [dot.double(r)(t) - r(t) dot(phi)^2 (t) sin^2 theta(t) - r(t) dot(theta)^2 (t)] vu(e)_r \
  &quad + [r(t) dot.double(theta)(t) + 2 dot(r)(t) dot(theta)(t) - r(t) dot(phi)^2 (t) sin theta(t) cos theta(t)] vu(e)_theta \
  &quad + [r(t) dot.double(phi)(t) sin theta(t) + 2 dot(r)(t) dot(phi)(t) sin theta(t) + 2 r(t) dot(theta)(t) dot(phi)(t) cos theta(t)] vu(e)_phi $

  *Virtual displacement:*

  Since the particle is constrained to the sphere of radius $r(t)$, the virtual displacement is:
  $ delta vb(r) = r(t) delta theta vu(e)_theta + r(t) sin theta(t) delta phi vu(e)_phi $

  (No $delta r$ component since $r(t)$ is prescribed by the constraint.)

  *Apply d'Alembert's principle:*

  D'Alembert's principle:
  $ [vb(F)^((A)) (t) - m dot.double(vb(r))(t)] dot delta vb(r) = 0 $

  Computing the dot product:
  $ &[m g sin theta(t) - m(r(t) dot.double(theta)(t) + 2 dot(r)(t) dot(theta)(t) - r(t) dot(phi)^2 (t) sin theta(t) cos theta(t))] r(t) delta theta \
  &quad + [-m(r(t) dot.double(phi)(t) sin theta(t) + 2 dot(r)(t) dot(phi)(t) sin theta(t) + 2 r(t) dot(theta)(t) dot(phi)(t) cos theta(t))] r(t) sin theta(t) delta phi = 0 $

  Since $delta theta$ and $delta phi$ are independent and arbitrary:
  $ cases(
    m g r(t) sin theta(t) - m r(t)[r(t) dot.double(theta)(t) + 2 dot(r)(t) dot(theta)(t) - r(t) dot(phi)^2 (t) sin theta(t) cos theta(t)] &= 0,
    -m r(t) sin theta(t)[r(t) dot.double(phi)(t) sin theta(t) + 2 dot(r)(t) dot(phi)(t) sin theta(t) + 2 r(t) dot(theta)(t) dot(phi)(t) cos theta(t)] &= 0
  ) $

  *Simplify equations of motion:*

  Dividing and simplifying, and substituting $r(t) = a + b cos omega t$:

  *$theta$-equation:*
  #boxed[$ (a + b cos omega t) dot.double(theta)(t) - 2 b omega dot(theta)(t) sin omega t - (a + b cos omega t) dot(phi)^2 (t) sin theta(t) cos theta(t) = g sin theta(t) $]

  *$phi$-equation:*
  #boxed[$ (a + b cos omega t) dot.double(phi)(t) sin theta(t) - 2 b omega dot(phi)(t) sin omega t sin theta(t) + 2(a + b cos omega t) dot(theta)(t) dot(phi)(t) cos theta(t) = 0 $]

  These are the coupled nonlinear equations of motion for a particle on a sphere with time varying radius.
]

#pbm("7.1")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 64.png"), width:90%, border: false),
    [Two masses $m_1$ and $m_2$ are suspended by an inextensible string which passes over a massless and frictionless pulley.

    *Holonomic constraint:*
    $ f(vb(r)_1, vb(r)_2, t) = x_1 (t) + x_2 (t) - ell = 0 $

    *Applied forces:*
    $ vb(F)_1^((A)) (t) = m_1 g vu(e)_1, quad vb(F)_2^((A)) (t) = m_2 g vu(e)_2 $

    Use d'Alembert's principle with Lagrange multipliers to find the constrained forces.],
  )
]

#solution[
  *Position vectors and kinematics:*

  The position vectors are:
  $ cases(
    vb(r)_1 (t) = x_1 (t) vu(e)_1,
    vb(r)_2 (t) = x_2 (t) vu(e)_2
  ) quad => quad cases(
    delta vb(r)_1 = delta x_1 vu(e)_1,
    delta vb(r)_2 = delta x_2 vu(e)_2
  ) quad => quad cases(
    dot.double(vb(r))_1(t) = dot.double(x_1)(t) vu(e)_1,
    dot.double(vb(r))_2(t) = dot.double(x_2)(t) vu(e)_2
  ) $

  *Constraint gradients:*

  From the constraint $f(vb(r)_1, vb(r)_2, t) = x_1 (t) + x_2 (t) - ell = 0$:
  $ cases(
    display(pdv(f, vb(r)_1)) = vu(e)_1,
    display(pdv(f, vb(r)_2)) = vu(e)_2
  ) $

  *D'Alembert's principle with Lagrange multipliers:*

  The modified d'Alembert's principle with Lagrange multipliers is:
  $ sum_alpha [vb(F)_alpha^((A)) (t) + lambda(t) pdv(f, vb(r)_alpha) - m_alpha dot.double(vb(r))_alpha(t)] dot delta vb(r)_alpha = 0 $

  Substituting the known quantities:
  $ [m_1 g + lambda(t) - m_1 dot.double(x_1)(t)] delta x_1 + [m_2 g + lambda(t) - m_2 dot.double(x_2)(t)] delta x_2 = 0 $

  Since this must hold for all virtual displacements (not just those satisfying the constraint when using Lagrange multipliers), we get the system:
  $ cases(
    m_1 g + lambda(t) - m_1 dot.double(x)_1 (t) &= 0,
    m_2 g + lambda(t) - m_2 dot.double(x)_2 (t) &= 0,
    x_1 (t) + x_2 (t) - ell &= 0
  ) $

  *Solve for accelerations:*

  From the constraint, taking two time derivatives:
  $ x_1 (t) + x_2 (t) - ell = 0 quad => quad dot.double(x)_1 (t) + dot.double(x)_2 (t) = 0 $

  From the first two equations:
  $ cases(
    m_1 g + lambda(t) - m_1 dot.double(x)_1 (t) = 0,
    m_2 g + lambda(t) - m_2 dot.double(x)_2 (t) = 0
  ) quad => quad cases(
    dot.double(x)_1 (t) = display((m_1 - m_2)/(m_1 + m_2)) g,
    dot.double(x)_2 (t) = display((m_2 - m_1)/(m_1 + m_2)) g
  ) $

  *Find Lagrange multiplier and constraint forces:*

  Substituting $dot.double(x)_1 (t)$ back into the first equation:
  $ m_1 g + lambda(t) - m_1 dot.double(x)_1 (t) = 0 quad => quad lambda(t) = -(2 m_1 m_2)/(m_1 + m_2) g $

  The constraint forces are given by:
  $ vb(F)_i^((C)) (t) = lambda(t) pdv(f, vb(r)_i) $

  Therefore:
  #boxed[$ cases(
    vb(F)_1^((C)) (t) = lambda(t) pdv(f, vb(r)_1) = -display((2 m_1 m_2)/(m_1 + m_2)) g vu(e)_1,
    vb(F)_2^((C)) (t) = lambda(t) pdv(f, vb(r)_2) = -display((2 m_1 m_2)/(m_1 + m_2)) g vu(e)_2
  ) $]

  These are the tension forces in the string acting on each mass. The negative sign indicates the forces act upward (opposite to the positive coordinate directions), as expected for tension.
]

#pbm("7.2")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 63.png"), width:80%, border: false),
    [Two masses $m_1$ and $m_2$ are located each on a smooth double inclined plane with angles $theta_1$ and $theta_2$ respectively. The masses are connected by a massless and inextensible string running over a massless and frictionless pulley.],
  )

  *Holonomic constraints:*
  $ cases(
    f_1 (vb(r)_1, vb(r)_2, t) &= x_1 (t) + x_2 (t) - ell = 0,
    f_2 (vb(r)_1, vb(r)_2, t) &= y_1 (t) = 0,
    f_3 (vb(r)_1, vb(r)_2, t) &= y_2 (t) = 0
  ) $

  *Applied forces:*
  $ vb(F)_1^((A)) (t) &= m_1 g sin theta_1 vu(e)_(x_1) - m_1 g cos theta_1 vu(e)_(y_1) $
  $ vb(F)_2^((A)) (t) &= m_2 g sin theta_2 vu(e)_(x_2) - m_2 g cos theta_2 vu(e)_(y_2) $

  Use d'Alembert's principle with Lagrange multipliers to find the constrained forces.
]

#solution[
  *Position vectors and virtual displacements:*

  The position vectors in the inclined plane coordinates are:
  $ cases(
    vb(r)_1 (t) = x_1 (t) vu(e)_(x_1) + y_1 (t) vu(e)_(y_1),
    vb(r)_2 (t) = x_2 (t) vu(e)_(x_2) + y_2 (t) vu(e)_(y_2)
  ) quad => quad cases(
    delta vb(r)_1 = delta x_1 vu(e)_(x_1) + delta y_1 vu(e)_(y_1),
    delta vb(r)_2 = delta x_2 vu(e)_(x_2) + delta y_2 vu(e)_(y_2)
  ) quad => quad cases(
    dot.double(vb(r))_1(t) = bb(0),
    dot.double(vb(r))_2(t) = bb(0)
  ) $

  (For equilibrium, accelerations are zero.)

  *Constraint gradients:*

  Computing the partial derivatives of the constraints:
  $ cases(
    f_1 (vb(r)_1, vb(r)_2, t) &= x_1 (t) + x_2 (t) - ell = 0,
    f_2 (vb(r)_1, vb(r)_2, t) &= y_1 (t) = 0,
    f_3 (vb(r)_1, vb(r)_2, t) &= y_2 (t) = 0
  ) $

  The gradients are:
  $ cases(
    vb(F)_1^((C)) (t) = lambda_1 (t) pdv(f_1, vb(r)_1) + lambda_2 (t) pdv(f_2, vb(r)_1) + lambda_3 (t) pdv(f_3, vb(r)_1) = lambda_1 (t) vu(e)_(x_1) + lambda_2 (t) vu(e)_(y_1),
    vb(F)_2^((C)) (t) = lambda_1 (t) pdv(f_1, vb(r)_2) + lambda_2 (t) pdv(f_2, vb(r)_2) + lambda_3 (t) pdv(f_3, vb(r)_2) = lambda_1 (t) vu(e)_(x_2) + lambda_3 (t) vu(e)_(y_2)
  ) $

  *Apply d'Alembert's principle with Lagrange multipliers:*

  For equilibrium with Lagrange multipliers:
  $ sum_alpha [vb(F)_alpha^((A)) (t) + sum_i lambda_i (t) pdv(f_i, vb(r)_alpha) - m_alpha dot.double(vb(r))_alpha(t)] dot delta vb(r)_alpha = 0 $

  Since $dot.double(vb(r))_alpha(t) = bb(0)$ for equilibrium:
  $ &[m_1 g sin theta_1 + lambda_1 (t)] delta x_1 + [-m_1 g cos theta_1 + lambda_2 (t)] delta y_1 \
  &quad + [m_2 g sin theta_2 + lambda_1 (t)] delta x_2 + [-m_2 g cos theta_2 + lambda_3 (t)] delta y_2 = 0 $

  Since all virtual displacements are independent in the Lagrange multiplier method:
  $ cases(
    m_1 g sin theta_1 + lambda_1 (t) &= 0,
    -m_1 g cos theta_1 + lambda_2 (t) &= 0,
    m_2 g sin theta_2 + lambda_1 (t) &= 0,
    -m_2 g cos theta_2 + lambda_3 (t) &= 0
  ) $

  *Solve for Lagrange multipliers:*

  From the equilibrium condition (from equations 1 and 3):
  $ m_1 g sin theta_1 + lambda_1 (t) = 0 quad "and" quad m_2 g sin theta_2 + lambda_1 (t) = 0 $

  This gives the equilibrium condition:
  $ m_1 sin theta_1 = m_2 sin theta_2 $

  The Lagrange multipliers are:
  $ cases(
    lambda_1 (t) &= -m_1 g sin theta_1 = -m_2 g sin theta_2,
    lambda_2 (t) &= m_1 g cos theta_1,
    lambda_3 (t) &= m_2 g cos theta_2
  ) $

  *Constraint forces:*

  #boxed[$ cases(
    vb(F)_1^((C)) (t) = lambda_1 (t) vu(e)_(x_1) + lambda_2 (t) vu(e)_(y_1) = -m_1 g sin theta_1 vu(e)_(x_1) + m_1 g cos theta_1 vu(e)_(y_1),
    vb(F)_2^((C)) (t) = lambda_1 (t) vu(e)_(x_2) + lambda_3 (t) vu(e)_(y_2) = -m_2 g sin theta_2 vu(e)_(x_2) + m_2 g cos theta_2 vu(e)_(y_2)
  ) $]

  *Interpretation:*
  - $lambda_1$ represents the tension in the string (negative, acting to restrain motion along the incline)
  - $lambda_2$ and $lambda_3$ represent the normal forces from the inclined planes on masses 1 and 2, respectively
]
