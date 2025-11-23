#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 4",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("2.1")[
  #grid(
    columns: (1fr, 2fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 26.png"), width:80%, border: false),
    [A mass $m_1$ hangs at one end of a string that is led over a pulley $A$. The other end carries another pulley $B$ which in turn carries a string with the masses $m_2$ and $m_3$ fixed to its ends. All pulleys and strings are assumed to be massless. Also, all strings are inextensible.

    Find the acceleration of the masses.],
  )
]

#solution[
*Constraint analysis:*

Let $a_1, a_2, a_3$ be accelerations of masses $m_1, m_2, m_3$ respectively.

From string constraints:
$ cases(
  a_(1 A) = -a_(B A),
  a_(2 B) = -a_(3 B)
) $

$ a_(2 B) = -a_(3 B) ⟹ a_2 + a_1 = -(a_3 + a_1) ⟹ a_1 = -1/2 (a_2 + a_3) $

Also since the strings are assumed to be massless and inextensible:
$ T_1 = 2T_2 = 2T_3 = 2T $

*Force equations:*
$ cases(
  T_1 - m_1 g = m_1 a_1,
  T_2 - m_2 g = m_2 a_2,
  T_3 - m_3 g = m_3 a_3
) ⟹ cases(
  2T - m_1 g = display(m_1 (a_2 + a_3)/2),
  T - m_2 g = m_2 a_2,
  T - m_3 g = m_3 a_3
) $

*Solution:*
#boxed[$ cases(
  a_2 = display(-(4 m_2 m_3 + m_1 (m_2 - 3m_3))/(m_1 (m_2 + m_3) + 4m_2 m_3) g),
  a_3 = display(-(4 m_2 m_3 + m_1 (m_3 - 3m_2))/(m_1 (m_2 + m_3) + 4m_2 m_3) g),
  T = display((4 m_1 m_2 m_3)/(m_1 (m_2 + m_3) + 4m_2 m_3) g),
  a_1 = display(-1/2 (a_2 + a_3) = (4 m_2 m_3 - m_1 (m_2 + m_3))/(m_1 (m_2 + m_3) + 4m_2 m_3) g)
) $]
]

#pagebreak()

#pbm("2.2")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 27.png"), width:80%, border: false),
    [Two masses $m_1$ and $m_2$ are lying each on one of two joined inclined planes with angles $α$ and $β$ with the horizontal. Both inclined planes and the horizontal make a right-angle triangle. The two masses are connected by a massless and inextensible string running over a massless and fixed pulley. The coefficients of kinetic friction of both planes are $μ_k$.

    Find the acceleration of the masses.],
  )
]

#solution[
*Force analysis for mass $m_1$:*
$ vb(F)_1 = (m_1 g sin α - T - μ_k N_1) vu(e)_x + (m_1 g cos α - N_1) vu(e)_y $

$ vb(F)_1 = m_1 vb(a)_1 ⟹ cases(
  m_1 g sin α - T - μ_k N_1 = m_1 a,
  m_1 g cos α - N_1 = 0
) $

$ ⟹ m_1 g sin α - T - μ_k m_1 g cos α = m_1 a $

*Force analysis for mass $m_2$:*
$ vb(F)_2 = (m_2 g cos β - N_2) vu(e)_x + (m_2 g sin β - T + μ_k N_2) vu(e)_y $

$ vb(F)_2 = m_2 vb(a)_2 ⟹ cases(
  m_2 g cos β - N_2 = 0,
  m_2 g sin β - T + μ_k N_2 = -m_2 a
) $

$ ⟹ m_2 g sin β - T + μ_k m_2 g cos β = -m_2 a $

*System of equations:*
$ cases(
  m_1 g sin α - T - μ_k m_1 g cos α = m_1 a,
  m_2 g sin β - T + μ_k m_2 g cos β = -m_2 a
) $

*Solution:*
#boxed[$ cases(
  a = display(((m_1 sin α - m_2 sin β) - μ_k (m_1 cos α + m_2 cos β))/(m_1 + m_2) g),
  T = display((m_1 m_2 g)/(m_1 + m_2) [(sin α + sin β) - μ_k (cos α - cos β)])
) $]

*Special cases:*

When $μ_k → 0$:
#boxed[$ a → (m_1 sin α - m_2 sin β)/(m_1 + m_2) g $]

When $α = β = π/2$:
#boxed[$ a → (m_1 - m_2)/(m_1 + m_2) g $]
]

#pagebreak()

#pbm("2.3")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 28.png"), width:80%, border: false),
    [A particle of mass $m$ is located at the "North pole" of a smooth hemisphere of radius $R$ fixed on the ground. The particle slides down the hemisphere after a small kick.

    Find the angle and the speed at which the particle breaks off from the hemisphere.],
  )
]

#solution[
*Energy conservation:*
$ E = 1/2 m v^2 + m g R cos φ = m g R $

$ v^2 = 2 g R (1 - cos φ) $

$ (dv(φ, t))^2 = (2g)/R (1 - cos φ) $

*Radial force equation:*
$ N - m g cos φ = m R (dv(φ, t))^2 $

*Breaking condition ($N = 0$):*
$ g cos φ = R (dv(φ, t))^2 $

Substituting the energy result:
$ g cos φ = 2g (1 - cos φ) $

$ 3 cos φ = 2 $

$ cos φ = 2/3 $

*Results:*

Breaking angle:
#boxed[$ φ_0 = arccos(2/3) ≅ 48.2° $]

Breaking speed:
#boxed[$ v_0 = sqrt((2 g R)/3) $]
]

#pagebreak()

#pbm("2.4")[
  Obtain short-time and long-time behaviors for $v_y (t)$ and $y(t)$ for projectile with linear air resistance.

  $ dv(v_y, t) = -k v_y (t), quad y(0) = y_0, quad v_y (0) = v_0 cos θ_0 $
]

#solution[
*Differential equation:*
$ dv(v_y, t) = -k v_y (t), quad y(0) = y_0, quad v_y (0) = v_0 cos θ_0 $

*Solving for velocity:*
$ dv(v_y (t), t) = -k v_y (t) ⟹ integral_(v_y' = v_0 cos θ_0)^(v_y) (dif v_y')/(v_y') = -k integral_(t'=0)^t dif t $

$ ⟹ v_y (t) = v_0 cos θ_0 e^(-k t) $

*Solving for position:*
$ dv(y, t) = v_0 cos θ_0 e^(-k t) ⟹ integral_(y'=y_0)^y dif y' = integral_(t'=0)^t v_0 cos θ_0 e^(-k t') dif t' $

$ ⟹ y(t) = y_0 + (v_0 cos θ_0)/k (1 - e^(-k t)) $

*General solutions:*
#boxed[$ v_y (t) = v_0 cos θ_0 e^(-k t) quad "and" quad y(t) = y_0 + (v_0 cos θ_0)/k (1 - e^(-k t)) $]

*Short-time behavior ($t ≪ 1/k$):*
$ cases(
  v_y (t) → v_0 cos θ_0 (1 - k t),
  y(t) → y_0 + v_0 (cos θ_0) t - display(1/2) k v_0 (cos θ_0) t^2
) $

*Long-time behavior ($t ≫ 1/k$):*
$ cases(
  v_y (t) → 0,
  y(t) → y_0 + display((v_0 cos θ_0)/k)
) $

*Alternative form using chain rule:*
$ dv(v_y (t), t) = -k v_y (t) ⟹ dv(v_y (y), y) dv(y, t) = -k v_y (t) $

$ ⟹ integral_(v_y' = v_0 cos θ_0)^(v_y) dif v_y' = - integral_(y'=y_0)^y k dif y' ⟹ v_y (y) = v_0 cos θ_0 - k(y - y_0) $
]
