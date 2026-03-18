#import "../shared/_at.typ": *

#show: ad.with(
  title: "Assignment 5",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC2135* \
  Thermodynamics and Statistical Mechanics],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: "(1)")
#set math.cases(gap: 1em)

#let imath(body) = text(size: 1.1em)[#body]

#pbm("1")[
  *[14 pts]*
  In class, we have learnt how to express the temperature and pressure of a gas from the perspective of statistical mechanics. Namely, assuming that the particle number is always fixed to be $N$, the temperature #imath[$T = 1"/"(pdv(S, U))_V$] and the pressure #imath[$P = T pdv(S, V)_U$]. We have also learnt one of Maxwell’s relations, #imath[$pdv(T, V)_S = -pdv(P, S)_V$]. To better understand these concepts, in this problem, we explicitly verify this Maxwell’s relation in the context of a monatomic ideal gas made of $N$ particles, each of which has a mass $m$. Recall that the entropy of such an ideal gas as a function of the energy $U$ and volume $V$ is
  $
  S(U, V) = N k [
  ln(
  frac(V, N)
  (frac(4 π m U, 3 N h^2))^(3/2)
  )
  + frac(5, 2)
  ].
  $ <eq:ideal-entropy>

  *(1) (4 points)* Use the microscopic definition of the temperature, #imath[$T = 1"/"(pdv(S, U))_V$], and Eq. @eq:ideal-entropy to calculate the temperature $T$ of the ideal gas as a function of $N$, $U$ and $V$. Then show that $T$ as a function of $S$ and $V$ is
  $
  T = frac(h^2, 2 π k m)
  (frac(N, V) op("exp")(frac(S, N k) - frac(5, 2)))^(2/3).
  $ <eq:ideal-temp>

  *(2) (3 points)* Calculate #imath[$pdv(T, V)_S$].

  *(3) (4 points)* Use the relation #imath[$P = T pdv(S, V)_U$] and Eq. @eq:ideal-entropy to calculate the pressure $P$ of the ideal gas as a function of $U$ and $V$. Then show that $P$ as a function of $S$ and $V$ is
  $
  P = frac(N h^2, 2 π V m)
  (frac(N, V) op("exp")(frac(S, N k) - frac(5, 2)))^(2/3).
  $ <eq:ideal-press>

  *(4) (3 points)* Calculate #imath[$pdv(P, S)_V$]. Comparing this result with the result in part (2), does Maxwell’s relation #imath[$pdv(T, V)_S = -pdv(P, S)_V$] hold for the ideal gas?
]

#solution[
  *Part (1): Temperature from $S(U, V)$*

  Expand Eq. @eq:ideal-entropy:
  $
  S = N k [
  ln frac(V, N)
  + frac(3, 2) ln frac(4 π m U, 3 N h^2)
  + frac(5, 2)
  ].
  $
  At fixed $V$,
  $
  pdv(S, U)_V = N k frac(3, 2) frac(1, U),
  $
  so
  $
  T = frac(1, pdv(S, U)_V) = frac(2 U, 3 N k).
  $
  To express $T$ as a function of $S$ and $V$, exponentiate Eq. @eq:ideal-entropy:
  $
  op("exp")(frac(S, N k) - frac(5, 2))
  = frac(V, N) (frac(4 π m U, 3 N h^2))^(3/2).
  $
  Thus
  $
  frac(4 π m U, 3 N h^2)
  = (frac(N, V) op("exp")(frac(S, N k) - frac(5, 2)))^(2/3),
  $
  and
  $
  U = frac(3 N h^2, 4 π m)
  (frac(N, V) op("exp")(frac(S, N k) - frac(5, 2)))^(2/3).
  $
  Substituting into $T = frac(2 U, 3 N k)$ gives Eq. @eq:ideal-temp.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Derivative $pdv(T, V)_S$*

  From Eq. @eq:ideal-temp, at fixed $S$ we have $T ∝ V^(-2/3)$, so
  $
  pdv(T, V)_S = -frac(2, 3) frac(T, V).
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Pressure from $S(U, V)$*

  From Eq. @eq:ideal-entropy,
  $
  pdv(S, V)_U = N k frac(1, V),
  $
  hence
  $
  P = T pdv(S, V)_U = frac(N k T, V).
  $
  Using $T = frac(2 U, 3 N k)$ gives
  $
  P = frac(2 U, 3 V).
  $
  Substituting the expression for $U(S, V)$ from part (1) yields Eq. @eq:ideal-press.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (4): Verify Maxwell relation*

  From Eq. @eq:ideal-press,
  $
  pdv(P, S)_V = frac(2, 3) frac(P, N k).
  $
  Using $P = frac(N k T, V)$ gives
  $
  pdv(P, S)_V = frac(2, 3) frac(T, V),
  $
  so
  $
  pdv(T, V)_S = -pdv(P, S)_V.
  $
  Maxwell’s relation holds for the ideal gas.
]

#pagebreak()

#pbm("2")[
  *[12 pts]*
  In class, we have learnt how to calculate the change of entropy during a reversible process. In this problem, we apply it to a real system that goes through an irreversible process. The heat capacity of one mole of graphite at constant pressure takes the following form over a fairly wide range of temperatures
  $
  C_P = a + b T - frac(c, T^2)
  $ <eq:cp-graphite>
  where $a = #qty("16.86", "J/K")$, $b = #qty("4.77e-3", "J/K^2")$, and $c = 8.54 × 10^5 text("J·K")$. Suppose that a mole of graphite is heated at constant pressure from $T_1 = #qty("298", "K")$ to $T_2 = #qty("500", "K")$ very fast, so that the entire process is irreversible. Calculate the increase in its entropy during this process.
]

#solution[
  Entropy is a state function, so for an irreversible heating we may compute the change using a reversible path:
  $
  Delta S = integral_(T_1)^(T_2) frac(C_P, T) dif T.
  $
  Using Eq. @eq:cp-graphite,
  $
  frac(C_P, T) = frac(a, T) + b - frac(c, T^3),
  $
  hence
  $
  Delta S =
  a ln frac(T_2, T_1)
  + b (T_2 - T_1)
  + frac(c, 2) (frac(1, T_2^2) - frac(1, T_1^2)).
  $
  Substituting the values gives
  $
  Delta S ≈ #qty("6.59", "J/K").
  $
]

#pagebreak()

#pbm("3")[
  *[14 pts]*
  A cylinder contains one liter of helium gas at room temperature ($300$ K) and atmospheric pressure (#qty("1e5", "N/m^2")). The walls of the cylinder conduct heat well. At one end of the cylinder is a massless piston, whose surface area is #qty("0.01", "m^2"). Suppose that you push the piston in suddenly, exerting a force of #qty("2000", "N"). The piston moves only one millimeter, before it is stopped by an immovable barrier. After a while, the gas reaches thermal equilibrium again. Throughout the entire process, the force you exert is always #qty("2000", "N"), even after the gas equilibrates again.

  *(1) (3 points)* How much work have you done on this system?

  *(2) (3 points)* Assuming that all the energy added goes into the gas (not the piston or cylinder walls or the immovable barrier), by how much does the internal energy of the gas increase?

  *(3) (3 points)* How much heat has been added to the gas?

  *(4) (5 points)* What is the change of the entropy of the gas?
]

#solution[
  *Part (1): Work done by you*

  The piston displacement is $Delta x = #qty("1e-3", "m")$, so the work you do is
  $
  W_("on") = F Delta x = #qty("2000", "N") · #qty("1e-3", "m") = #qty("2", "J").
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Internal energy increase (immediate)*

  Under the stated assumption, all added energy goes into the gas:
  $
  Delta U = W_("on") = #qty("2", "J").
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Heat added over the full process*

  The walls conduct heat and the gas re-equilibrates at room temperature, so the final temperature is $T_2 = T_1 = #qty("300", "K")$. For an ideal gas, $U$ depends only on $T$, so over the full process
  $
  Delta U = 0.
  $
  Using the first law in the sign convention $Delta U = Q + W_("on")$ gives
  $
  Q = -W_("on") = -#qty("2", "J").
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (4): Entropy change of the gas*

  The volume decreases by $Delta V = A Delta x = #qty("1e-2", "m^2") · #qty("1e-3", "m") = #qty("1e-5", "m^3")$,
  so $V_1 = #qty("1e-3", "m^3")$ and $V_2 = #qty("9.9e-4", "m^3")$.
  The number of moles is
  $
  n = frac(P V_1, R T_1)
  = frac(#qty("1e5", "N/m^2") · #qty("1e-3", "m^3"), 8.314 text("J/mol·K") · #qty("300", "K"))
  ≈ #qty("4.01e-2", "mol").
  $
  Since $T_2 = T_1$, the entropy change for the gas is
  $
  Delta S = n R ln frac(V_2, V_1)
  ≈ #qty("4.01e-2", "mol") · 8.314 text("J/mol·K") · ln(0.99)
  ≈ #qty("-3.35e-3", "J/K").
  $
]
