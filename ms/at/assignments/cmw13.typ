#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 13",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("6.1")[
  A particle is confined to a moving surface where the equation of the surface is given by $f(vb(r), t) = 0$. Show that the virtual displacement is tangent to the surface at the same time.
]

#solution[
  Consider a particle constrained to the surface $f(vb(r), t) = 0$.

  For a virtual displacement $delta vb(r)$ at fixed time, Taylor expansion gives:
  $ f(vb(r)(t) + delta vb(r), t) = 0 $

  Expanding to first order:
  $ f(vb(r)(t), t) + nabla f(vb(r), t) dot delta vb(r) = 0 $

  Since the particle is already on the surface, $f(vb(r)(t), t) = 0$, therefore:
  $ nabla f(vb(r), t) dot delta vb(r) = 0 $

  This shows that the virtual displacement $delta vb(r)$ is perpendicular to the gradient $nabla f(vb(r), t)$, which is the normal to the surface. Hence, $delta vb(r)$ is tangent to the surface.

  For an actual displacement, the particle moves to $vb(r)(t + dif t)$ at time $t + dif t$:
  $ f(vb(r)(t) + dif vb(r), t + dif t) = 0 $

  Expanding:
  $ f(vb(r)(t), t) + nabla f(vb(r), t) dot dif vb(r) + pdv(f, t) dif t = 0 $

  Again, since $f(vb(r)(t), t) = 0$:
  #boxed[$ nabla f(vb(r), t) dot dif vb(r) + pdv(f, t) dif t = 0 $]

  This equation shows that the actual displacement $dif vb(r)$ has both a component tangent to the surface and a component accounting for the time evolution of the surface itself.
]

#pbm("6.2")[
  Show that the total virtual work by the constrained forces on the two particles connected by a rigid rod moving in the space is zero.
]

#solution[
  Consider two particles connected by a rigid rod of length $ell$. The constraint is:
  $ f(vb(r)_1, vb(r)_2) = abs(vb(r)_1 - vb(r)_2)^2 - ell^2 = 0 $

  Taking the differential of the constraint:
  $ pdv(f, vb(r)_1) dot delta vb(r)_1 + pdv(f, vb(r)_2) dot delta vb(r)_2 = 0 $

  Computing the partial derivatives:
  $ pdv(f, vb(r)_1) = 2(vb(r)_1 - vb(r)_2), quad quad pdv(f, vb(r)_2) = -2(vb(r)_1 - vb(r)_2) $

  Therefore:
  $ (vb(r)_1 - vb(r)_2) dot (delta vb(r)_1 - delta vb(r)_2) = 0 $

  The constraint forces on the two particles are equal and opposite, acting along the rod:
  $ vb(f)_1 = lambda(vb(r)_1 - vb(r)_2) = -vb(f)_2 $

  where $lambda$ is the Lagrange multiplier (tension/compression in the rod).

  The total virtual work is:
  $ delta W &= vb(f)_1 dot delta vb(r)_1 + vb(f)_2 dot delta vb(r)_2 \
  &= vb(f)_1 dot (delta vb(r)_1 - delta vb(r)_2) \
  &= lambda(vb(r)_1 - vb(r)_2) dot (delta vb(r)_1 - delta vb(r)_2) \
  &= 0 $

  #boxed[Thus, the total virtual work done by the constraint forces is zero.]
]

#pbm("6.3")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 63.png"), width:80%, border: false),
    [Two masses $m_1$ and $m_2$ are located each on a smooth double inclined plane with angles $theta_1$ and $theta_2$ respectively. The masses are connected by a massless and inextensible string running over a massless and frictionless pulley.],
  )

  *Holonomic constraints:*
  $ cases(
    f_1 (vb(r)_1, vb(r)_2) &= x_1 + x_2 - ell = 0,
    f_2 (vb(r)_1, vb(r)_2) &= y_1 = 0,
    f_3 (vb(r)_1, vb(r)_2) &= y_2 = 0
  ) $

  *Applied forces:*
  $ vb(F)_1^((A)) (t) &= m_1 g sin theta_1 vu(e)_(x_1) - m_1 g cos theta_1 vu(e)_(y_1) $
  $ vb(F)_2^((A)) (t) &= m_2 g sin theta_2 vu(e)_(x_2) - m_2 g cos theta_2 vu(e)_(y_2) $

  Establish the condition for equilibrium from the principle of virtual work.
]

#solution[
  *Determine virtual displacements from constraints:*

  Given the holonomic constraints:
  $ cases(
    f_1 (vb(r)_1, vb(r)_2) &= x_1 + x_2 - ell = 0,
    f_2 (vb(r)_1, vb(r)_2) &= y_1 = 0,
    f_3 (vb(r)_1, vb(r)_2) &= y_2 = 0
  ) $

  Taking virtual variations:
  $ cases(
    delta x_1 &= -delta x_2,
    delta y_1 &= 0,
    delta y_2 &= 0
  ) $

  Therefore, the virtual displacements are:
  $ cases(
    delta vb(r)_1 &= delta x_1 vu(e)_(x_1),
    delta vb(r)_2 &= delta x_2 vu(e)_(x_2)
  ) $

  *Apply principle of virtual work:*

  The principle of virtual work states that for equilibrium:
  $ sum_alpha vb(F)_alpha^((A)) (t) dot delta vb(r)_alpha = 0 $

  Computing the virtual work:
  $ vb(F)_1^((A)) dot delta vb(r)_1 + vb(F)_2^((A)) dot delta vb(r)_2 &= (m_1 g sin theta_1 vu(e)_(x_1) - m_1 g cos theta_1 vu(e)_(y_1)) dot (delta x_1 vu(e)_(x_1)) \
  &quad + (m_2 g sin theta_2 vu(e)_(x_2) - m_2 g cos theta_2 vu(e)_(y_2)) dot (delta x_2 vu(e)_(x_2)) \
  &= m_1 g delta x_1 sin theta_1 + m_2 g delta x_2 sin theta_2 $

  Using the constraint $delta x_1 = -delta x_2$:
  $ => m_1 g delta x_1 sin theta_1 + m_2 g delta x_2 sin theta_2 = 0 $
  $ => (m_1 g sin theta_1 - m_2 g sin theta_2) delta x_1 = 0 $

  Since $delta x_1$ is arbitrary (non-zero in general), we obtain the equilibrium condition:
  #boxed[$ m_1 sin theta_1 = m_2 sin theta_2 $]

  This is the condition for equilibrium of the two-mass system on the double inclined plane.
]
