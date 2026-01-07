#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 22",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("9.2")[
  Construct the Hamiltonian for a particle of mass $m$ subjected to a conservative central force field with potential energy $U(r)$ using polar coordinates $(r, phi)$ as generalized coordinates.
]

#solution[
  *Lagrangian in polar coordinates:*

  In polar coordinates, the position is $vb(r) = r vu(e)_r$ and the velocity is:
  $ dot(vb(r)) = dot(r) vu(e)_r + r dot(phi) vu(e)_phi $

  The kinetic energy is:
  $ T = m/2 |dot(vb(r))|^2 = m/2 (dot(r)^2 + r^2 dot(phi)^2) $

  The Lagrangian is:
  $ L(r, phi, dot(r), dot(phi)) = m/2 (dot(r)^2 + r^2 dot(phi)^2) - U(r) $

  *Compute generalized momenta:*

  $ cases(
    p_r &= pdv(L, dot(r)) = m dot(r),
    p_phi &= pdv(L, dot(phi)) = m r^2 dot(phi)
  ) $

  *Invert to find velocities:*

  $ cases(
    dot(r) &= p_r/m,
    dot(phi) &= p_phi/(m r^2)
  ) $

  *Construct the Hamiltonian:*

  The Hamiltonian is:
  $ H(r, phi, p_r, p_phi) = sum_i p_i dot(q)_i - L $

  $ H = p_r dot(r) + p_phi dot(phi) - L $

  Substituting:
  $ H &= p_r (p_r/m) + p_phi (p_phi/(m r^2)) - [m/2 ((p_r/m)^2 + r^2 (p_phi/(m r^2))^2) - U(r)] \
  & = (p_r^2)/m + (p_phi^2)/(m r^2) - (p_r^2)/(2m) - (p_phi^2)/(2 m r^2) + U(r) \
  & = (p_r^2)/(2m) + (p_phi^2)/(2 m r^2) + U(r) $

  #boxed[$ H(r, phi, p_r, p_phi) = 1/(2m) [p_r^2 + (p_phi^2)/(r^2)] + U(r) $]

  *Verify Hamilton's equations:*

  $ cases(
    dot(r) &= pdv(H, p_r) = p_r/m quad checkmark,
    dot(phi) &= pdv(H, p_phi) = p_phi/(m r^2) quad checkmark,
    dot(p)_r &= -pdv(H, r) = display((p_phi^2)/(m r^3)) - dv(U, r),
    dot(p)_phi &= -pdv(H, phi) = 0 quad ("conserved angular momentum")
  ) $

  *Physical interpretation:*
  - $phi$ is cyclic in the Hamiltonian ($pdv(H, phi) = 0$)
  - Therefore, $p_phi = m r^2 dot(phi)$ (angular momentum) is conserved
  - The term $p_phi^2 \/ (2 m r^2)$ represents the kinetic energy of rotation
  - The term $p_r^2 \/ (2m)$ represents the kinetic energy of radial motion
]

#pagebreak()

#pbm("9.3")[
  Derive Hamilton's equations of motion starting from the Hamiltonian definition.
]

#solution[
  *Definition of the Hamiltonian:*

  For a system with generalized coordinates ${q_i}$ and generalized momenta ${p_i}$, the Hamiltonian is defined as:
  $ H({q_i, p_i}, t) equiv sum_i dot(q)_i p_i - L({q_i, dot(q)_i}, t) $

  where the generalized momenta are:
  $ p_i equiv pdv(L, dot(q)_i) $

  *Differential of the Hamiltonian:*

  Taking the total differential of $H$ as a function of ${q_i, p_i, t}$:
  $ dif H = sum_i [pdv(H, q_i) dif q_i + pdv(H, p_i) dif p_i] + pdv(H, t) dif t $

  *Differential from the definition:*

  From the definition $H = sum_i dot(q)_i p_i - L$, we have:
  $ dif H = sum_i (dot(q)_i dif p_i + p_i dif dot(q)_i) - dif L $

  Now, the differential of the Lagrangian is:
  $ dif L = sum_i [pdv(L, q_i) dif q_i + pdv(L, dot(q)_i) dif dot(q)_i] + pdv(L, t) dif t $

  *Use the definition of generalized momentum:*

  Since $p_i = pdv(L, dot(q)_i)$:
  $ dif L = sum_i [pdv(L, q_i) dif q_i + p_i dif dot(q)_i] + pdv(L, t) dif t $

  *Substitute into the expression for $dif H$:*

  $ dif H &= sum_i (dot(q)_i dif p_i + p_i dif dot(q)_i) - sum_i [pdv(L, q_i) dif q_i + p_i dif dot(q)_i] - pdv(L, t) dif t \
  &= sum_i dot(q)_i dif p_i - sum_i pdv(L, q_i) dif q_i - pdv(L, t) dif t $

  *Apply Euler-Lagrange equation:*

  From the Euler-Lagrange equation:
  $ pdv(L, q_i) = dv(, t) (pdv(L, dot(q)_i)) = dv(, t) (p_i) = dot(p)_i $

  Substituting:
  $ dif H = sum_i dot(q)_i dif p_i - sum_i dot(p)_i dif q_i - pdv(L, t) dif t $

  *Compare with the general differential:*

  Comparing with $dif H = sum_i [pdv(H, q_i) dif q_i + pdv(H, p_i) dif p_i] + pdv(H, t) dif t$:

  Coefficients of $dif p_i$:
  #boxed[$ pdv(H, p_i) = dot(q)_i $]

  Coefficients of $dif q_i$:
  #boxed[$ pdv(H, q_i) = -dot(p)_i quad => quad dot(p)_i = -pdv(H, q_i) $]

  Coefficients of $dif t$:
  #boxed[$ pdv(H, t) = -pdv(L, t) $]

  *Summary: Hamilton's canonical equations of motion*

  #boxed[
  $ cases(
    dot(q)_i &= pdv(H, p_i),
    dot(p)_i &= -pdv(H, q_i),
    pdv(H, t) &= -pdv(L, t)
  ) $
  ]

  These $2n$ first-order differential equations are equivalent to the $n$ second-order Euler-Lagrange equations, but they have a beautiful symmetry between coordinates and momenta.
]

#pagebreak()

#pbm("9.4")[
  #grid(
      columns: (3fr, 4fr),
      gutter: 1em,
      fig(image("../../../../_zss/d 64.png"), width:100%, border: false),
      [Obtain the Hamilton equations of motion for the Atwood machine and solve for the acceleration of the masses.

      *Recall:* Constraint $x_1 (t) + x_2 (t) = ell$ already applied, so we use $x_1$ as the single generalized coordinate.],
    )

]

#solution[
  *Lagrangian (with constraint applied):*

  From previous analysis:
  $ L(x_1, dot(x)_1) = 1/2 (m_1 + m_2) dot(x)_1^2 + (m_1 - m_2) g x_1 + m_2 g ell $

  (The constant $m_2 g ell$ can be dropped as it doesn't affect the equations of motion.)

  *Generalized momentum:*

  $ p_(x_1) = pdv(L, dot(x)_1) = (m_1 + m_2) dot(x)_1 $

  Inverting:
  $ dot(x)_1 = (p_(x_1))/(m_1 + m_2) $

  *Construct Hamiltonian:*

  $ H(x_1, p_(x_1)) &= dot(x)_1 p_(x_1) - L \
  & = (p_(x_1))/(m_1 + m_2) dot p_(x_1) - [1/2 (m_1 + m_2) ((p_(x_1))/(m_1 + m_2))^2 + (m_1 - m_2) g x_1] \
  & = (p_(x_1)^2)/(m_1 + m_2) - (p_(x_1)^2)/(2(m_1 + m_2)) - (m_1 - m_2) g x_1 $

  #boxed[$ H(x_1, p_(x_1)) = (p_(x_1)^2)/(2(m_1 + m_2)) - (m_1 - m_2) g x_1 $]

  *Hamilton's equations:*

  $ cases(
    dot(x)_1 &= pdv(H, p_(x_1)) = display((p_(x_1))/(m_1 + m_2)),
    dot(p)_(x_1) &= -pdv(H, x_1) = (m_1 - m_2) g
  ) $

  *Solve for acceleration:*

  Taking the time derivative of the first equation:
  $ dot.double(x)_1 = (dot(p)_(x_1))/(m_1 + m_2) $

  Substituting the second equation:
  $ dot.double(x)_1 = ((m_1 - m_2) g)/(m_1 + m_2) $

  #boxed[$ dot.double(x)_1 = (m_1 - m_2)/(m_1 + m_2) g $]

  From the constraint $x_2 = ell - x_1$:
  #boxed[$ dot.double(x)_2 = -dot.double(x)_1 = (m_2 - m_1)/(m_1 + m_2) g $]

  *Physical interpretation:*
  - If $m_1 > m_2$: $dot.double(x)_1 > 0$ (mass 1 accelerates downward)
  - If $m_1 < m_2$: $dot.double(x)_1 < 0$ (mass 1 accelerates upward)
  - If $m_1 = m_2$: $dot.double(x)_1 = 0$ (system in equilibrium)

  This result is identical to what we obtained from the Lagrangian formulation, confirming the equivalence of the two approaches.
]

#pagebreak()

#pbm("9.5")[
  #grid(
      columns: (1fr, 2fr),
      gutter: 1em,
      fig(image("../../../../_zss/d 66.png"), width:80%, border: false),
      [Obtain the Hamiltonian equations of motion for the plane pendulum and identify one constant of motion.

      *Setup:* Point mass $m$ on massless rod of length $ell$ rotating about frictionless pivot.],
    )

]

#solution[
  *Lagrangian:*

  Using angle $theta$ from the vertical as the generalized coordinate:
  $ L(theta, dot(theta)) = m/2 ell^2 dot(theta)^2 + m g ell cos theta $

  *Check homogeneity of kinetic energy:*

  $ T(theta, lambda dot(theta)) = m/2 ell^2 (lambda dot(theta))^2 = lambda^2 · m/2 ell^2 dot(theta)^2 = lambda^2 T(theta, dot(theta)) $

  The kinetic energy is homogeneous of degree 2 in $dot(theta)$. By Euler's theorem:
  $ dot(theta) pdv(T, dot(theta)) = 2T $

  *Generalized momentum:*

  $ p_theta = pdv(L, dot(theta)) = m ell^2 dot(theta) $

  Inverting:
  $ dot(theta) = (p_theta)/(m ell^2) $

  *Construct Hamiltonian:*

  $ H(theta, p_theta) &= dot(theta) p_theta - L \
  & = (p_theta)/(m ell^2) dot p_theta - [m/2 ell^2 ((p_theta)/(m ell^2))^2 + m g ell cos theta] \
  & = (p_theta^2)/(m ell^2) - (p_theta^2)/(2 m ell^2) - m g ell cos theta $

  #boxed[$ H(theta, p_theta) = (p_theta^2)/(2 m ell^2) - m g ell cos theta $]

  *Hamilton's equations:*

  $ cases(
    dot(theta) &= pdv(H, p_theta) = display((p_theta)/(m ell^2)),
    dot(p)_theta &= -pdv(H, theta) = -m g ell sin theta
  ) $

  *Recover equation of motion:*

  Taking the time derivative of the first equation:
  $ dot.double(theta) = (dot(p)_theta)/(m ell^2) = (-m g ell sin theta)/(m ell^2) = -g/ell sin theta $

  #boxed[$ dot.double(theta) + g/ell sin theta = 0 $]

  This is the familiar nonlinear pendulum equation.

  *Identify constant of motion:*

  Check if $H$ depends explicitly on time:
  $ pdv(H, t) = 0 $

  Since $H$ has no explicit time dependence, it is conserved:
  $ (dif H)/(dif t) = pdv(H, theta) dot(theta) + pdv(H, p_theta) dot(p)_theta + pdv(H, t) $

  Using Hamilton's equations:
  $ (dif H)/(dif t) = -(dot(p)_theta) dot(theta) + (dot(theta)) dot(p)_theta + 0 = 0 $

  #boxed[$ H = (p_theta^2)/(2 m ell^2) - m g ell cos theta = E quad ("total energy is conserved") $]

  *Physical interpretation:*

  Since the kinetic energy is homogeneous of degree 2:
  $ H = T + U = m/2 ell^2 dot(theta)^2 - m g ell cos theta $

  The Hamiltonian equals the total mechanical energy. The first term is kinetic energy, and the second is potential energy (with the reference at the pivot level).

  The conservation of energy allows us to reduce the problem to quadrature:
  $ m/2 ell^2 dot(theta)^2 - m g ell cos theta = E $

  $ dot(theta) = plus.minus sqrt((2)/(m ell^2) [E + m g ell cos theta]) $

  This can be integrated (using elliptic integrals) to find $theta(t)$.
]

#pagebreak()

#pbm("9.6")[
  #grid(
      columns: (3fr, 4fr),
      gutter: 1em,
      fig(image("../../../../_zss/d 73.png"), width:100%, border: false),
      [Obtain equations of motion for the spherical pendulum.

      *Setup:* Bob of mass $m$ moving on sphere of radius $b$ (pendulum length).

      *Hamiltonian:*
      $ H(theta, phi, p_theta, p_phi) = (p_theta^2)/(2 m b^2) + (p_phi^2)/(2 m b^2 sin^2 theta) - m g b cos theta $],
    )

]

#solution[
  *Identify cyclic coordinates:*

  Note that $phi$ does not appear in the Hamiltonian:
  $ pdv(H, phi) = 0 $

  Therefore, $phi$ is a cyclic coordinate, and its conjugate momentum is conserved:
  $ dot(p)_phi = -pdv(H, phi) = 0 quad => quad p_phi = Phi = "constant" $

  This is the conservation of angular momentum about the vertical ($z$) axis.

  *Reduce to effective one-dimensional problem:*

  Since $p_phi = Phi$ is constant, we can write the effective Hamiltonian:
  $ H_"eff" (theta, p_theta) = (p_theta^2)/(2 m b^2) + Phi^2/(2 m b^2 sin^2 theta) - m g b cos theta $

  *Hamilton's equations for $theta$:*

  $ cases(
    dot(theta) &= pdv(H, p_theta) = display((p_theta)/(m b^2)),
    dot(p)_theta &= -pdv(H, theta) = display((Phi^2 cos theta)/(m b^2 sin^3 theta)) - m g b sin theta
  ) $

  *Equation of motion for $theta$:*

  $ dot.double(theta) = (dot(p)_theta)/(m b^2) = (Phi^2 cos theta)/(m^2 b^4 sin^3 theta) - g/b sin theta $

  #boxed[$ dot.double(theta) = (Phi^2 cos theta)/(m^2 b^4 sin^3 theta) - g/b sin theta $]

  *Hamilton's equation for $phi$:*

  $ dot(phi) = pdv(H, p_phi) = (p_phi)/(m b^2 sin^2 theta) = Phi/(m b^2 sin^2 theta) $

  #boxed[$ dot(phi) = Phi/(m b^2 sin^2 theta) $]

  *Alternative form using Lagrangian:*

  From the Lagrangian formulation, we have:
  $ L(theta, phi, dot(theta), dot(phi)) = m/2 b^2 dot(theta)^2 + m/2 b^2 sin^2 theta dot(phi)^2 + m g b cos theta $

  The Euler-Lagrange equations are:
  $ cases(
    m b^2 dot.double(theta) - m b^2 sin theta cos theta dot(phi)^2 + m g b sin theta &= 0,
    dv(, t) (m b^2 sin^2 theta dot(phi)) &= 0
  ) $

  Simplifying the first equation:
  #boxed[$ dot.double(theta) = sin theta cos theta dot(phi)^2 - g/b sin theta $]

  And from the second equation (conservation of $p_phi$):
  #boxed[$ m b^2 sin^2 theta dot(phi) = Phi = "constant" $]

  *Two constants of motion:*

  1. **Angular momentum about vertical axis:**
     $ C_1: quad p_phi = m b^2 sin^2 theta dot(phi) = Phi $

  2. **Total energy:**
     $ C_2: quad H = (p_theta^2)/(2 m b^2) + Phi^2/(2 m b^2 sin^2 theta) - m g b cos theta = E $

  These two constants reduce the problem from 4-dimensional phase space $(theta, phi, p_theta, p_phi)$ to effectively 2-dimensional, making it integrable.

  *Physical interpretation:*

  The motion consists of:
  - Oscillation in $theta$ (pendulum swinging)
  - Precession in $phi$ (azimuthal rotation)

  The effective potential for $theta$ motion is:
  $ U_"eff" (theta) = Phi^2/(2 m b^2 sin^2 theta) - m g b cos theta $

  The first term is the centrifugal barrier (prevents $theta -> 0$), and the second is gravitational potential.
]
