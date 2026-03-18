#import "../shared/_at.typ": *

#show: ad.with(
  title: "Assignment 1",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC2135* \
  Thermodynamics and Statistical Mechanics],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("1")[
  *[13 pts] Ideal gas mixtures*

  In class, we used a microscopic model of an ideal gas to derive the relation between the pressure and the average kinetic energy of an ideal gas made of a single type of molecules with mass $m$, and we then derived the relation between the temperature and the averaged kinetic energy of the molecules in an ideal gas. In this problem, we will discuss ideal gases made of multiple types of molecules with different masses. Note that many important examples, such as air, are indeed gases made of multiple types of molecules.

  Consider a gas in a container made of $n$ types of non-interacting classical particles, and the masses of these particles are $m_1, m_2, m_3, ..., m_n$. Suppose the gas is put in a container with geometric dimensions given by Fig. 1. We will assume that all collisions between the gas particles and the walls of the container are elastic, and the walls of the container are smooth.

  The container has a horizontal length $L_x$, and the area of the right vertical wall of this container is $A$, so that the volume of the container is $V = L_x A$. A single gas particle is shown here.

  #fig(image("../../../../_zss/d 170.png"), width:30%, border: false)

  *(1) (4 points)* Let us start with a single particle of the $i$-th type, which has a mass $m_i$. Suppose the $x$-component of its velocity is $v_(i,x)$. What is the pressure due to this single particle?

  *(2) (3 points)* Suppose the averaged $v_x^2$ for the $i$-th type of particles is $v_(i,x)^2$. What is the averaged kinetic energy of a single particle of the $i$-th type?

  *(3) (2 points)* Suppose the number of the $i$-th type particle is $N_i$. What is the total pressure of this ideal gas?

  *(4) (4 points)* From the more fundamental statistical mechanics, it is known that the averaged kinetic energy of each type of particle is $3/2 k T$, which is independent of the type. Show that the ideal gas law $P V = N k T$ still holds, where $N = N_1 + N_2 + ... + N_n$.
]

#pagebreak()

#solution[
  *Part (1): Single-particle pressure*

  Time between successive hits on the same wall is
  $
  Delta t = frac(2 L_x, v_(i,x)).
  $
  Each collision reverses the $x$-momentum, so
  $
  Delta p_x = 2 m_i v_(i,x).
  $
  The average force is
  $
  F = frac(Delta p_x, Delta t) = frac(m_i v_(i,x)^2, L_x),
  $
  hence the pressure due to one particle is
  $
  P_i = frac(F, A) = frac(m_i v_(i,x)^2, L_x A) = frac(m_i v_(i,x)^2, V).
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Averaged kinetic energy*

  For a single particle,
  $
  ⟨K_i⟩
  = frac(1, 2) m_i ⟨v_(i,x)^2 + v_(i,y)^2 + v_(i,z)^2⟩.
  $
  For an isotropic gas,
  $
  ⟨v_(i,x)^2⟩
  = ⟨v_(i,y)^2⟩
  = ⟨v_(i,z)^2⟩,
  $
  so
  $
  ⟨K_i⟩ = frac(3, 2) m_i ⟨v_(i,x)^2⟩.
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Total pressure*

  Summing over $N_i$ particles of each type,
  $
  P = frac(1, V) sum_i N_i m_i ⟨v_(i,x)^2⟩.
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (4): Ideal-gas law*

  Equipartition gives
  $
  frac(1, 2) m_i ⟨v_(i,x)^2⟩ = frac(1, 2) k T
  $
  for every type. Substituting into the pressure gives
  $
  P V = sum_i N_i k T = N k T,
  $
  with $N = sum_i N_i$.
]

#pagebreak()

#pbm("2")[
  *[13 pts] Hot air balloon*

  In this problem, we will explore an interesting application of the ideal gas law to a hot air balloon.

  *(1) (7 points)* Suppose the pressure of the air inside the balloon is the same as outside. Suppose the average temperature of air inside the balloon is $T_b$, while that outside is $T_("air")$. Find the mass of air inside the balloon needed to lift a total mass $M$, which includes both the balloon and payload but excludes the mass of the air inside the balloon (so you have to include the mass of the air inside the balloon separately!).

  *(2) (6 points)* Suppose the mass density of air is $rho_("air")$ = #qty("1.225", "kg/m^3"), the volume of the balloon is $V$ = #qty("1000", "m^3") and $T_("air")$ = #qty("300", "K"). If $M$ = #qty("500", "kg"), what is the temperature inside the balloon, $T_b$, needed to lift itself?
]

#solution[
  *Part (1): Buoyancy balance*

  With $P_("in") = P_("out") = P$, the buoyant force is $rho_("air") V g$ and the weight is $(M + m) g$, so
  $
  rho_("air") V = M + m.
  $

  Using the ideal gas law (let average molecular mass of air = $m_"a"$), we have
  $
  P V = N k T => (P m_("a"))/(k T) = (N m_("a"))/V => rho = (frac(P m_("a"), k)) 1/T => rho_("in") / rho_("air") = frac(T_("air"), T_b),
  $
  hence
  $
  m = rho_("in") V = rho_("air") V (frac(T_("air"), T_b)).
  $
  Together these give
  $
  m = rho_("air") V - M
  $
  and
  $
  T_b = frac(rho_("air") V T_("air"), rho_("air") V - M).
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Numerical temperature*

  With $rho_("air") = #qty("1.225", "kg/m^3")$, $V = #qty("1000", "m^3")$,
  $T_("air") = #qty("300", "K")$, and $M = #qty("500", "kg")$,
  $
  rho_("air") V = #qty("1225", "kg")
  $
  and
  $
  T_b = frac(1225 · 300, 1225 - 500) ≈ #qty("5.069e2", "K").
  $
]

#pagebreak()

#pbm("3")[
  *[14 pts] Density distribution of air*

  In this problem, you will derive the density distribution of air in the earth's gravitational field.

  *(1) (6 points)* Use force balance on a thin horizontal slab of air (with thickness $dif z$) to relate the pressure gradient $dv(P, z)$ to $rho$, the mass density of the air (taking the gravitational acceleration to be $g$). Then, assuming air is an ideal gas made of molecules with average mass $m$, show that the pressure obeys the differential equation:
  $
  dv(P, z) = -(frac(m g, k T)) P
  $

  *(2) (4 points)* Further assuming that the atmosphere is in thermal equilibrium at a uniform temperature $T$, find the density profile of air, $n(z)$, as a function of the height $z$. Denote the air density at the sea level ($z = 0$) by $n_0$.

  *(3) (2 points)* Calculate the average molecular mass of air $m$, given that it is a mixture of nitrogen $N_2$, oxygen $O_2$ and argon in the ratio $78:21:1$ in terms of particle numbers. You will need to look up the masses of these molecules by yourself.

  *(4) (2 points)* Suppose the pressure at sea level is $P(z = 0)$ = #qty("1e5", "N/m^2"), and the temperature is $T$ = #qty("296", "K") (about 23 C) at all heights. What is the density of air at sea level? Estimate the density of air at the top of mount Everest, whose height is around #qty("9000", "m").
]

#solution[
  *Part (1): Pressure gradient*

  For a slab of thickness $dif z$, force balance gives
  $
  dif P · A = -rho g A dif z,
  $
  hence
  $
  dv(P, z) = -rho g.
  $
  With $P = n k T$ and $rho = m n$, this becomes
  $
  dv(P, z) = -(frac(m g, k T)) P.
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Density profile*

  For constant $T$,
  $
  integral (dif P)/P = -(frac(m g, k T)) integral dif z,
  $
  so
  $
  P(z) = P_0 op("exp")(-(m g z) / (k T))
  $
  and
  $
  n(z) = n_0 op("exp")(-(m g z) / (k T)).
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Average molecular mass*

  Using $N_2:O_2:"Ar" = 78:21:1$ with molar masses 28, 32, 40 g/mol,
  $
  M_("air") ≈ frac(78 · 28 + 21 · 32 + 1 · 40, 100) ≈ #qty("28.96", "g/mol").
  $
  The molecular mass is
  $
  m = frac(M_("air"), N_A) ≈ #qty("4.8e-26", "kg").
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (4): Sea-level and Everest density*

  From the ideal gas law,
  $
  P V = N k T => rho = frac(N m, V) = frac(P m, k T).
  $
  At sea level,
  $
  rho_0 = frac(P_0 m, k T) => rho_0 = frac(P_0 M_("air"), R T)
  $
  gives
  $
  rho_0 ≈ #qty("1.177", "kg/m^3")
  $
  at $P_0 = #qty("1e5", "N/m^2")$ and $T = #qty("296", "K")$.

  At $z = #qty("9000", "m")$,
  $
  rho(z) = rho_0 op("exp")(-(m g z) / (k T)) ≈ #qty("4.175e-1", "kg/m^3").
  $

  The number density follows as, 
  $
  n_0 = frac(P_0, k T) = rho_0 / m ≈ #qty("2.45e25", "m^-3")
  $
  and
  $
  n(z) = n_0 op("exp")(-(m g z) / (k T)) ≈ #qty("8.68e24", "m^-3").
  $
]
