#import "../shared/_at.typ": *

#show: ad.with(
  title: "Assignment 3",
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
  *[13 pts]*
  In the class, we have calculated the multiplicity of a magnet made of $N$ two-state systems, if it has a magnetization $M > 0$ (namely, the number of up-pointing dipoles minus the number of down-pointing dipoles is $M$). This multiplicity is given by
  $
  frac(N!, ((N + M)/2)! ((N − M)/2)!)
  $
  In this problem, we will consider two interacting magnets $A$ and $B$, which are made of $N_A$ two-state systems and $N_B$ two-state systems, respectively, where both $N_A$ and $N_B$ are large. Denote the magnetizations of $A$ and $B$ by $M_A$ and $M_B$, respectively. Suppose $|M_A| >> 1$, $|M_B| >> 1$, $N_A − M_A >> 1$, $N_A + M_A >> 1$, $N_B − M_B >> 1$, $N_B + M_B >> 1$. Assume $M = M_A + M_B$, the total magnetization of the combined system is fixed, and $1 << |M| < N_A + N_B$. We will explore how the multiplicity of the combined system behaves as a function of $M_A$.

  *(1) (3 points)* Without making any approximation, show that the multiplicity of the combined system is
  $
  Omega =
  frac(N_A!, ((N_A + M_A)/2)! ((N_A − M_A)/2)!)
  frac(N_B!, ((N_B + M_B)/2)! ((N_B − M_B)/2)!)
  $
  What is the entropy of the combined system?

  *(2) (5 points)* Applying the Stirling formula (i.e., $ln n! ≈ n ln n − n$ for $n >> 1$) to the entropy, show that the entropy under this approximation is
  $
  S = k [
  N_A ln N_A
  − (N_A + M_A)/2 ln (N_A + M_A)/2
  − (N_A − M_A)/2 ln (N_A − M_A)/2
  \
  + N_B ln N_B
  − (N_B + M_B)/2 ln (N_B + M_B)/2
  − (N_B − M_B)/2 ln (N_B − M_B)/2
  ]
  $ <eq:mag-entropy>
  Fixing $N_A$, $N_B$ and $M = M_A + M_B$, show that $M_A/N_A = M_B/N_B$ for the most probable macrostate.
  Remark: This result makes sense, because it means that in thermal equilibrium the system tends to be uniform with the same magnetization density everywhere.

  *(3) (5 points)* Denoting the most probable value of $M_A$ by $M_A^\*$ and $delta M_A = M_A − M_A^\*$. Expand Eq. @eq:mag-entropy to the second order of $delta M_A$ and show that
  $
  S = S^\* − frac(k, 2)
  frac((N_A + N_B)^3, N_A N_B (N_A + N_B + M)(N_A + N_B − M))(delta M_A)^2 + O((delta M_A)^3)
  $ <eq:mag-expansion>
  where $S^\*$ is the entropy for the most probable macrostate. Show that this result implies that near the most probable macrostate where $delta M_A$ is small, the multiplicity $Omega$ as a function of $delta M_A$ can be viewed as a normal distribution with a width of the order of
  $
  sqrt(
  frac(N_A N_B (N_A + N_B + M)(N_A + N_B − M), (N_A + N_B)^3)
  )
  $
  That is, $Omega(delta M_A) ∝ op("exp")(-(delta M_A)^2/ sigma^2)$ with $sigma$ of the order of
  $
  sqrt(
  frac(N_A N_B (N_A + N_B + M)(N_A + N_B − M), (N_A + N_B)^3)
  )
  $
  Remark: Suppose $N_A$ and $N_B$ are of the same order, and typically $M$ is an extensive quantity of the order of $N_A$, then the number of different macrostates is of the order of $N_A$. Therefore, the ratio between the above width and the number of all macrostates is of the order of $1/sqrt(N_A)$, which is quite small for large $N_A$. Namely, we will almost surely only observe the most probable macrostate.

  #figure(
    image("../../../../_zss/d 174.png", width: 50%),
    caption: [Two ideal gases made of the same type of monatomic particles are separated by a plate (represented by the red vertical line) that allows energy exchange but no particle exchange. The position of the plate can also move horizontally without encountering any friction.],
    supplement: [Figure]
  )
]

#solution[
  *Part (1): Multiplicity and entropy*

  The multiplicity of each magnet is
  $
  Omega_A
  = frac(N_A!, ((N_A + M_A)/2)! ((N_A - M_A)/2)!),
  quad
  Omega_B
  = frac(N_B!, ((N_B + M_B)/2)! ((N_B - M_B)/2)!)
  $
  For independent subsystems, multiplicities multiply, so
  $
  Omega = Omega_A Omega_B.
  $
  Therefore the entropy is additive,
  $
  S = k ln Omega = S_A + S_B.
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Stirling and equilibrium condition*

  Applying Stirling to each term gives
  $
  ln Omega_A
  ≈ N_A ln N_A
  − (N_A + M_A)/2 ln((N_A + M_A)/2)
  − (N_A − M_A)/2 ln((N_A − M_A)/2)
  $
  and similarly for $B$. Therefore
  $
  S = k [
  N_A ln N_A
  − (N_A + M_A)/2 ln (N_A + M_A)/2
  − (N_A − M_A)/2 ln (N_A − M_A)/2
  \
  + N_B ln N_B
  − (N_B + M_B)/2 ln (N_B + M_B)/2
  − (N_B − M_B)/2 ln (N_B − M_B)/2
  ].
  $
  With $M_B = M − M_A$, the most probable macrostate maximizes $S$:
  $
  0 = pdv(S, M_A)
  = frac(k, 2) ln frac(N_A − M_A, N_A + M_A)
  − frac(k, 2) ln frac(N_B − M_B, N_B + M_B)
  $
  Thus
  $
  frac(N_A + M_A, N_A − M_A)
  = frac(N_B + M_B, N_B − M_B)
  quad => quad
  frac(M_A, N_A) = frac(M_B, N_B)
  $
  This shows equal magnetization density at equilibrium.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Quadratic expansion and width*

  The Taylor expansion about $M_A = M_A^\*$ is
  $
  S = S^\* + pdv(S, M_A)_\* (delta M_A)
  + frac(1, 2) pdv(S, M_A, M_A)_\* (delta M_A)^2 + O((delta M_A)^3)
  $
  The linear term vanishes at the maximum. Evaluated at $(M_A, M_B) = (M_A^\*, M_B^\*)$,
  $
  pdv(S, M_A, M_A)_\*
  = -frac(k, 2)[
  1/(N_A + M_A^\*) + 1/(N_A − M_A^\*)
  + 1/(N_B + M_B^\*) + 1/(N_B − M_B^\*)
  ].
  $
  Expanding about $M_A^\*$,
  $
  S = S^\* + frac(1, 2) pdv(S, M_A, M_A)_\* (delta M_A)^2 + O((delta M_A)^3)
  $
  Using $M_A^\*/N_A = M_B^\*/N_B$ and $M = M_A^\* + M_B^\*$, the coefficient simplifies to
  $
  pdv(S, M_A, M_A)_\* =
  -k
  frac((N_A + N_B)^3, N_A N_B (N_A + N_B + M)(N_A + N_B − M))
  $
  Hence
  $
  S = S^\* − frac(k, 2)
  frac((N_A + N_B)^3, N_A N_B (N_A + N_B + M)(N_A + N_B − M)) (delta M_A)^2 + O((delta M_A)^3)
  $
  Since $Omega ∝ op("exp")(S / k)$,
  $
  Omega(delta M_A) ∝
  op("exp")(
  - (delta M_A)^2 / sigma^2
  ),
  $
  with
  $
  sigma^2 ~
  frac(N_A N_B (N_A + N_B + M)(N_A + N_B − M), (N_A + N_B)^3)
  $
]

#pagebreak()

#pbm("2")[
  *[13 pts]*
  In the class, we have learnt that the entropy of an ideal gas made of $N$ identical monatomic particles with total energy $U$ and volume $V$ is
  $
  S = N k [
  ln( (V / N) (4π m U / (3 N h^2))^(3/2) )
  + 5/2
  ].
  $ <eq:ideal-entropy>
  and the multiplicity is
  $
  Omega = f(N) V^N U^(3 N/2)
  $ <eq:ideal-multiplicity>
  where
  $
  f(N) = π^(3 N/2) / (N! h^(3 N) (3 N/2)! (2 m)^(3 N/2))
  $
  In this problem, we will examine the thermal equilibrium state of two ideal gases made of the same type of monatomic particle with mass $m$. These two gases are separated by a plate that allows energy exchange and can move without friction (see Fig. 1). Suppose the left side contains $N_A$ particles, has energy $U_A$ and volume $V_A$, and the right side contains $N_B$ particles, has energy $U_B$ and volume $V_B$. Suppose there is no particle exchange between the two containers, so that $N_A$ and $N_B$ are fixed. Also supposed the total energy $U = U_A + U_B$ and total volume $V = V_A + V_B$ are both fixed.

  *(1) (3 points)* Show that the total entropy of the two gases is
  $
  S = N_A k [
  ln( (V_A / N_A) (4π m U_A / (3 N_A h^2))^(3/2) )
  + 5/2
  ]
  + N_B k [
  ln( (V_B / N_B) (4π m U_B / (3 N_B h^2))^(3/2) )
  + 5/2
  ].
  $ <eq:total-entropy>

  *(2) (5 points)* Take the derivatives of the total multiplicity with respect to $U_A$ and $V_A$ to show that $U_A/N_A = U_B/N_B$ and $V_A/N_A = V_B/N_B$ in the most probable macrostate. Use the equipartition theorem and ideal gas law to show that the temperatures on the two sides of the plate are the same, and the pressures on the two sides of the plate are also the same.
  Remark: Again, this result makes sense because it means that in thermal equilibrium the system tends to be uniform.

  *(3) (5 points)* For the most probable macrostate, calculate the second order derivatives of Eq. @eq:total-entropy, the total entropy of the two gases, with respect to $U_A$ and $V_A$, i.e., $∂^2 S / ∂U_A^2$, $∂^2 S / ∂U_A ∂V_A$ and $∂^2 S / ∂V_A^2$. You should find, for the most probable macrostate,
  $
  pdv(S, U_A, U_A)
  = - frac(3 k (N_A + N_B)^3, 2 N_A N_B U^2)
  quad
  pdv(S, U_A, V_A)
  = 0,
  quad
  pdv(S, V_A, V_A)
  = - frac(k (N_A + N_B)^3, N_A N_B V^2)
  $ <eq:ideal-second-deriv>
  Show that these results imply that near the most probable macrostate, the multiplicity $Omega$ as a function of $U_A$ and $V_A$ is a two-variable Gaussian function with a width of the order
  $
  sqrt(frac(N_A N_B U^2, (N_A + N_B)^3))
  $
  along the $U_A$ direction and a width of the order
  $
  sqrt(frac(N_A N_B V^2, (N_A + N_B)^3))
  $
  along the $V_A$ direction. That is, $Omega ∝ op("exp")(
  - (U_A − U_A^\*)^2 / sigma_U^2
  - (V_A − V_A^\*)^2 / sigma_V^2)$, where $U_A^\*$ and $V_A^\*$ are the most probable values of $U_A$ and $V_A$, respectively, and $sigma_U$ and $sigma_V$ are of the order of
  $
  sqrt(frac(N_A N_B U^2, (N_A + N_B)^3))
  $
  and
  $
  sqrt(frac(N_A N_B V^2, (N_A + N_B)^3)),
  $
  respectively.
  Remark: Again, consider the case where $N_A$ and $N_B$ are of the same order, typically the energy $U$ and volume $V$ are extensive quantities, i.e., they are also of the same order of $N_A$ and $N_B$. So the total number of all macrostates will be proportional to $U V$. Therefore, the above widths suggest that the fluctuations around the most probable macrostates are concentrating in a narrow window. Namely, we will almost surely only observe the most probable macrostate.

  #figure(
    image("../../../../_zss/d 175.png", width: 80%),
    caption: [Initially, two ideal gases made of two different types of monatomic particles are separated by a plate (represented by the red vertical line) that allows neither energy exchange nor particle exchange. There is also no energy or particle exchange between the gases and the environment outside. After some time, the plate is removed.],
    supplement: [Figure]
  )

]

#solution[
  *Part (1): Total entropy*

  The two subsystems are independent, so
  $
  Omega = Omega_A Omega_B,
  $
  and therefore the entropy is additive,
  $
  S = S_A + S_B,
  $
  with $S_A$ and $S_B$ given by the ideal-gas entropy formula for their own $N, U, V$.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Most probable macrostate*

  Maximizing $S$ with $U_B = U − U_A$ gives
  $
  0 = pdv(S, U_A)
  = frac(3, 2) N_A k / U_A − frac(3, 2) N_B k / U_B,
  $
  hence $U_A / N_A = U_B / N_B$.
  Likewise with $V_B = V − V_A$,
  $
  0 = pdv(S, V_A)
  = N_A k / V_A − N_B k / V_B,
  $
  hence $V_A / N_A = V_B / N_B$.

  Using equipartition for monatomic gases,
  $
  U_A = frac(3, 2) N_A k T_A,
  quad
  U_B = frac(3, 2) N_B k T_B,
  $
  gives $T_A = T_B$. Then $P = N k T / V$ implies $P_A = P_B$.
  Thus thermal equilibrium enforces both equal temperature and equal pressure across the movable wall.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Quadratic fluctuations*

  From $S_A$ and $S_B$,
  $
  pdv(S, U_A, U_A)
  = - frac(3, 2) N_A k / U_A^2
  - frac(3, 2) N_B k / U_B^2,
  $
  $
  pdv(S, U_A, V_A) = 0,
  quad
  pdv(S, V_A, V_A)
  = - N_A k / V_A^2
  - N_B k / V_B^2.
  $
  At the most probable macrostate,
  $
  U_A^\* = frac(N_A, N_A + N_B) U,
  quad
  V_A^\* = frac(N_A, N_A + N_B) V,
  $
  which yields
  $
  pdv(S, U_A, U_A)_\* =
  - frac(3 k (N_A + N_B)^3, 2 N_A N_B U^2),
  $
  $
  pdv(S, U_A, V_A)_\* = 0,
  quad
  pdv(S, V_A, V_A)_\* =
  - frac(k (N_A + N_B)^3, N_A N_B V^2).
  $

  Therefore,
  $
  Omega(U_A, V_A) ∝ op("exp")(
  - (U_A − U_A^\*)^2 / sigma_U^2
  - (V_A − V_A^\*)^2 / sigma_V^2
  ),
  $
  with
  $
  sigma_U ~ sqrt(frac(N_A N_B U^2, (N_A + N_B)^3))
  quad
  sigma_V ~ sqrt(frac(N_A N_B V^2, (N_A + N_B)^3))
  $
  This means fluctuations around the equilibrium split are sharply peaked.
]

#pagebreak()

#pbm("3")[
  *[14 pts]*
  In the class, we have mostly been discussing ideal gases made of the same type of particles. In this problem, we consider ideal gases made of different types of monatomic particles $A$ and $B$ with mass $m_A$ and $m_B$, respectively (for example, $A$ can be helium and $B$ can be argon). Suppose the two ideal gases are initially separated by a plate that does not allow either energy exchange or particle exchange (see Fig. 2). There is also no energy or particle exchange between the gases and the environment outside through the walls of the container. On the left side of the plate, the number of particles is $N_A$, the energy is $U_A$ and the volume is $V_A$. On the right side of the plate, the number of particles is $N_B$, the energy is $U_B$ and the volume is $V_B$. The two gases are in thermal equilibrium initially, and then the plate is removed.

  *(1) (3 points)* According to the equipartition theorem, what are the temperatures of the two ideal gases before the plate is removed? After the plate is removed and the system reaches thermal equilibrium again, what is the final temperature according to the equipartition theorem? What is $U_A'$, the final energy of particle type $A$ after thermal equilibrium is reached after the plate is removed?

  *(2) (5 points)* Use the result of part (1) to answer the following questions. What is the total entropy of the combined system before and after the plate is removed? What is their difference, which is also known as the entropy of mixing?

  *(3) (6 points)* In the previous parts, we have used the fact that the entire system will share a single final temperature after thermal equilibrium. In this part, we do not assume this, and we will derive it by using the fundamental assumption of statistical mechanics and the equipartition theorem. Suppose after the plate is removed, there is a macrostate where the energy of type-$A$ particles is $U_A'$ and the energy of type-$B$ particles is $U_B'$. From the total multiplicity of the entire system, calculate the most probable value of $U_A'$ and verify that it is identical to the answer obtained in part (1).

]

#solution[
  *Part (1): Equipartition temperatures*

  Initially, thermal equilibrium implies
  $
  U_A = frac(3, 2) N_A k T_i,
  quad
  U_B = frac(3, 2) N_B k T_i,
  $
  so
  $
  T_i = frac(2 U_A, 3 N_A k) = frac(2 U_B, 3 N_B k)
  $
  After mixing, the total energy $U = U_A + U_B$ is conserved, and the final temperature is
  $
  T_f = frac(2 (U_A + U_B), 3 (N_A + N_B) k)
  $
  Thus the final energy of species $A$ is
  $
  U_A' = frac(3, 2) N_A k T_f
  = frac(N_A, N_A + N_B) (U_A + U_B)
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Entropy of mixing*

  The entropy for species $X$ is
  $
  S_X = N_X k [
  ln(V_X / N_X)
  + frac(3, 2) ln(4π m_X U_X / (3 N_X h^2))
  + frac(5, 2)
  ].
  $
  Before mixing,
  $
  S_i = S_A(N_A, U_A, V_A) + S_B(N_B, U_B, V_B)
  $
  After mixing, both species occupy $V = V_A + V_B$, with energies
  $
  U_A' = frac(N_A, N_A + N_B) U,
  quad
  U_B' = frac(N_B, N_A + N_B) U,
  $
  so
  $
  S_f = S_A(N_A, U_A', V) + S_B(N_B, U_B', V)
  $

  The entropy of mixing is
  $
  Delta S = S_f − S_i
  = N_A k ln frac(V, V_A)
  + N_B k ln frac(V, V_B)
  + frac(3, 2) N_A k ln frac(U_A', U_A)
  + frac(3, 2) N_B k ln frac(U_B', U_B)
  $
  Since $U_A / N_A = U_B / N_B$ initially, we have
  $
  U_A'/U_A = U_B'/U_B = 1,
  $
  so
  $
  Delta S
  = N_A k ln frac(V_A + V_B, V_A)
  + N_B k ln frac(V_A + V_B, V_B)
  $
  The mixing entropy is purely configurational here.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Most probable $U_A'$*

  After removal, the total multiplicity is
  $
  Omega = f_A(N_A) f_B(N_B)
  V^(N_A + N_B) (U_A')^(3 N_A/2) (U_B')^(3 N_B/2)
  $
  with $U_B' = U − U_A'$. Maximizing $ln Omega$ gives
  $
  0 = pdv(ln Omega, U_A')
  = frac(3 N_A, 2 U_A')
  − frac(3 N_B, 2 (U − U_A'))
  $
  so
  $
  frac(U_A', N_A) = frac(U − U_A', N_B)
  $
  Hence
  $
  U_A' = frac(N_A, N_A + N_B) U,
  $
  matching part (1).
]

