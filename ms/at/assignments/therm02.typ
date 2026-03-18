#import "../shared/_at.typ": *

#show: ad.with(
  title: "Assignment 2",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC2135* \
  Thermodynamics and Statistical Mechanics],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#let imath(body) = text(size: 1.1em)[#body]

#pbm("1")[
  *[12 pts] Partial derivatives practice*

  In this class, partial derivatives will be used frequently. In this problem, we do more exercise to familiarize ourselves with partial derivatives.

  *(1) (3 points)* Suppose #imath[$z$] is a function of #imath[$x$] and #imath[$y$], namely,
  $
  z(x, y) = x y + x
  $
  Calculate #imath[$pdv(z, x)_y$] and #imath[$pdv(z, y)_x$].

  *(2) (4 points)* Now define #imath[$w = x y$]. Then we can view #imath[$z$] as a function of #imath[$x$] and #imath[$w$]. Calculate #imath[$pdv(z, x)_w$] and #imath[$pdv(z, w)_x$].

  *(3) (5 points)* We can also view #imath[$w$] as a function of #imath[$y$] and #imath[$z$]. Calculate #imath[$pdv(w, y)_z$] and #imath[$pdv(w, z)_y$].
]

#solution[
  *Part (1): Direct partials in $(x, y)$*

  From
  $
  z(x, y) = x y + x,
  $
  and treating $y$ as a constant (freeze the other coordinate),
  $
  pdv(z, x)_y = pdv(x y, x)_y + pdv(x, x)_y = y + 1,
  $
  while treating $x$ as a constant,
  $
  pdv(z, y)_x = pdv(x y, y)_x + pdv(x, y)_x = x + 0 = x.
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Re-express $z$ as $z(x, w)$*

  Define $w = x y$, so $y = w / x$. Then
  $
  z = x y + x = w + x.
  $
  Holding $w$ fixed (so $y$ adjusts to keep $x y$ constant) gives
  $
  pdv(z, x)_w = (pdv((w + x), x))_w = 1,
  $
  and holding $x$ fixed gives
  $
  pdv(z, w)_x = (pdv((w + x), w))_x = 1.
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Re-express $w$ as $w(y, z)$*

  From $z = x(y + 1)$,
  $
  x = frac(z, y + 1),
  $
  so
  $
  w = x y = frac(y z, y + 1).
  $
  With $z$ fixed,
  $
  pdv(w, y)_z
  = frac((y + 1) z - y z, (y + 1)^2)
  = frac(z, (y + 1)^2),
  $
  and with $y$ fixed,
  $
  quad
  pdv(w, z)_y = frac(y, y + 1).
  $

]

#pbm("2")[
  *[18 pts] Diatomic ideal-gas cycle*

  Ideal gas is a model that we should understand really really well. In class, we have derived the compression-expansion work and heat of the ideal gas undergoing various processes. In this problem, we strengthen our understanding by applying similar considerations to a diatomic ideal gas undergoing the process shown in Fig. 1. We assume that the energy of this ideal gas is #imath[$U = f N k T / 2$], where #imath[$f$] is the number of degrees of freedom, #imath[$N$] is the number of molecules and #imath[$T$] is the temperature. In this problem, please express all answers in terms of #imath[$N$], #imath[$T_h$], #imath[$T_l$], #imath[$f$], #imath[$V_1$] and #imath[$V_2$].

  #fig(image("../../../../_zss/d 171.png"), width:30%, border: false)

  Figure 1: In this process, #imath[$1 -> 2$] is an isothermal process at a temperature #imath[$T_h$], #imath[$2 -> 3$] is an adiabatic process, #imath[$3 -> 4$] is an isothermal process at a temperature #imath[$T_l$], and #imath[$4 -> 1$] is an adiabatic process. Suppose the volumes for the states #imath[$1, 2, 3, 4$] are #imath[$V_1, V_2, V_3, V_4$], respectively.

  *(1) (2 points)* What is #imath[$V_3$] in terms of #imath[$T_h$], #imath[$T_l$] and #imath[$V_2$]? What is #imath[$V_4$] in terms of #imath[$T_h$], #imath[$T_l$] and #imath[$V_1$]?

  *(2) (3 points)* What is the heat absorbed by the gas during #imath[$1 -> 2$]? What is the work done by the gas to the environment during #imath[$1 -> 2$]? Note this is not asking about the work done by the environment to the gas.

  *(3) (3 points)* What is the heat absorbed by the gas during #imath[$2 -> 3$]? What is the work done by the gas to the environment during #imath[$2 -> 3$]?

  *(4) (3 points)* What is the heat absorbed by the gas during #imath[$3 -> 4$]? What is the work done by the gas to the environment during #imath[$3 -> 4$]?

  *(5) (4 points)* In the entire process #imath[$1 -> 2 -> 3 -> 4 -> 1$], what is the total work #imath[$W$] done by the gas to the environment? In the entire process, the only process in which the gas absorbs heat is the process #imath[$1 -> 2$]. Denote this heat by #imath[$Q_(1->2)$]. Find the ratio #imath[$W / Q_(1->2)$] in terms of #imath[$T_h$] and #imath[$T_l$].
]

#solution[
  *Part (1): Adiabatic volume relations*

  For an adiabatic ideal gas,
  $
  T V^(2/f) = "const".
  $
  Along $2 -> 3$ and $4 -> 1$,
  $
  T_h V_2^(2/f) = T_l V_3^(2/f),
  quad
  T_h V_1^(2/f) = T_l V_4^(2/f),
  $
  so dividing by $T_l$ and raising to $f/2$ gives
  $
  V_3 = V_2 (T_h / T_l)^(f/2),
  quad
  V_4 = V_1 (T_h / T_l)^(f/2).
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Isothermal expansion $1 -> 2$*

  At constant $T_h$, the gas expands and does work. Use
  $
  P = N k T_h / V,
  $
  $
  W_(1->2) = integral_(V_1)^(V_2) P dif V
  = N k T_h op("ln")(V_2 / V_1).
  $
  For an ideal gas $U = (f/2) N k T$, so $Delta T = 0$ implies
  $
  Delta U = 0,
  $
  and the first law ($Delta U = Q - W$) gives
  $
  Q_(1->2) = Delta U + W_(1->2) = W_(1->2)
  = N k T_h op("ln")(V_2 / V_1).
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Adiabatic expansion $2 -> 3$*

  Adiabatic implies no heat exchange:
  $
  Q_(2->3) = 0.
  $
  The temperature drops from $T_h$ to $T_l$, so
  $
  Delta U = frac(f, 2) N k (T_l - T_h),
  $
  and the first law yields
  $
  W_(2->3) = -Delta U = frac(f, 2) N k (T_h - T_l).
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (4): Isothermal compression $3 -> 4$*

  At constant $T_l$ the environment compresses the gas, so the gas does
  negative work; use $P = N k T_l / V$:
  $
  W_(3->4) = N k T_l op("ln")(V_4 / V_3),
  $
  and $Delta U = 0$, so by the first law
  $
  Q_(3->4) = W_(3->4) = N k T_l op("ln")(V_4 / V_3).
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (5): Net work and efficiency ratio*

  For adiabatic $4 -> 1$,
  $
  Q_(4->1) = 0,
  quad
  W_(4->1) = -frac(f, 2) N k (T_h - T_l).
  $
  Thus $W_(2->3) + W_(4->1) = 0$ (the adiabatic legs cancel).
  Using
  $
  V_4 / V_3 = V_1 / V_2,
  $
  the total work is
  $
  W = W_(1->2) + W_(3->4)
  = N k (T_h - T_l) op("ln")(V_2 / V_1).
  $
  With $Q_(1->2) = N k T_h op("ln")(V_2 / V_1)$,
  $
  W / Q_(1->2) = 1 - T_l / T_h.
  $

]

#pbm("3")[
  *[5 pts] Specific heat and latent heat*

  At 1 atm, the specific heat capacity of liquid water is #imath[$4.2 J/(g K)$]. The latent heat for melting ice is #imath[#qty("333", "J/g")], and the latent heat for boiling water is #imath[#qty("2260", "J/g")]. Starting from #imath[#qty("1", "g")] of ice at #imath[$0 C$], how much heat is needed to fully convert the ice to vapor? Assume in this process the ice is first fully melted into water, and then the water increases its temperature until it is boiling, which finally becomes vapor.
]

#solution[
  The process is: melt ice at $0 C$ (latent heat), heat liquid water to
  $100 C$ (sensible heat), then vaporize at $100 C$ (latent heat).
  The total heat is the sum of these three stages:
  $
  Q = m L_f + m c Delta T + m L_v.
  $
  For $m = #qty("1", "g")$ and $Delta T = 100$ K,
  $
  Q = #qty("333", "J") + #qty("420", "J") + #qty("2260", "J")
  = #qty("3013", "J").
  $

]
