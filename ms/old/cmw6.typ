#import "_at.typ": *

#show: ad.with(
  title: "Worksheet 6",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("3.1")[
  #grid(
    columns: (1fr, 2fr),
    gutter: 1em,
    fig(image("../../../_zss/d 29.png"), width:80%, border: false),
    [A spacecraft with mass $M$ moves through space with constant velocity $vb(v)$. The spacecraft encounters a stream of dust particles that embed themselves in the hull at rate $dot(m)(t)$. The dust has velocity $vb(u)$ just before it hits.

    Find the external force necessary to keep the spacecraft moving uniformly.],
  )
]

#solution[
  Using the momentum conservation approach for variable mass systems:
  $
    cases(
      vb(P)(t) = M(t) vb(v) + (Delta m) vb(u),
      vb(P)(t + Delta t) = (M(t) + Delta m) vb(v)
    ) quad quad
    => Delta vb(P) = vb(P)(t + Delta t) - vb(P)(t) = (vb(v) - vb(u)) Delta m
  $

  The external force required is:
  $ vb(F)(t) = dv(vb(P), t) = lim_(Delta t -> 0) (Delta vb(P))/(Delta t) = (vb(v) - vb(u)) dot(m)(t) $
]

#pbm("3.2")[
  A rocket is taking off from rest in a uniform gravitation field $vb(g) = -g vu(e)_z$. The fuel is ejected at a constant rate $dot(m)(t) = -k$ at a constant exhaust speed $u$ relative to the rocket.

  Find $v(t)$ and $r(t)$ for the rocket in its subsequent motion given that the initial mass of the rocket is $m_0$.
]

#solution[
  Given: $vb(g) = -g vu(e)_z$, $vb(u) = -u vu(e)_z$, $dot(m)(t) = -k$ $arrow.r$ $m(t) = m_0 - k t$

  Using the rocket equation:
  $ m(t) dv(vb(v), t) - vb(u)(t) dot(m)(t) &= vb(F)^"ext" (t) \
    m(t) dv(v_z, t) + dot(m)(t) u &= -m(t) g \
    dv(v_z, t) &= -g - u (dot(m)(t))/(m(t)) \
    v_z (t) &= -g t - u ln (m(t))/(m_0) \
    v_z (t) &= -g t - u ln ((m_0 - k t)/(m_0)) $

  For position:
  $ dv(z, t) &= v_z (t) \
    z(t) &= -1/2 g t^2 - u integral_0^t ln ((m_0 - k t')/(m_0)) dif t' \
    z(t) &= -1/2 g t^2 + u t + u/k (m_0 - k t) ln ((m_0 - k t)/(m_0)) $
]

#pbm("3.3")[
  A thin non-uniform plate lies on the $x y$-plane with corners $(0,0)$, $(a,0)$, $(0,b)$ and $(a,b)$. Its surface mass density is $sigma(x,y) = sigma_0 (x y)/(a b)$ where $sigma_0$ is a constant. Find its center of mass.
]

#solution[
  Given: $vb(r) = x vu(e)_x + y vu(e)_y$, $sigma(vb(r)) = sigma(x,y) = sigma_0 (x y)/(a b)$

  First, find the total mass:
  $ M = integral integral sigma(vb(r)) dif A = integral_(x=0)^a integral_(y=0)^b (sigma_0)/(a b) x y dif x dif y = 1/4 sigma_0 a b $

  Center of mass coordinates:
  $ X_"CM" = 1/M integral integral x sigma(vb(r)) dif A  arrow.r X_"CM" = 1/M integral_(x=0)^a integral_(y=0)^b x (sigma_0 x y)/(a b) dif x dif y = 2/3 a $

  $ Y_"CM" = 1/M integral integral y sigma(vb(r)) dif A arrow.r Y_"CM" = 1/M integral_(x=0)^a integral_(y=0)^b y (sigma_0 x y)/(a b) dif x dif y = 2/3 b $

  Therefore: $ vb(R)_"CM" = 2/3 a vu(e)_x + 2/3 b vu(e)_y $
]
