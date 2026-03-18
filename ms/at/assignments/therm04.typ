#import "../shared/_at.typ": *

#show: ad.with(
  title: "Assignment 4",
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
  In the class, we have learnt that the microscopic definition of the temperature is #imath[$frac(1, T) = pdv(S, U)$]. In this problem, we strengthen our understanding of this concept by reconsidering the example of two interacting Einstein solids (see Fig. 1). In particular, we will check whether the temperature of the combined system is indeed the same as the temperature of each system after thermal equilibrium. Suppose the two Einstein solids $A$ and $B$ are made of $N_A$ and $N_B$ harmonic oscillators, respectively, and all these harmonic oscillators have frequency $ω$. Suppose initially the energy of $A$ and $B$ are $U_(A,i) = q_A ħ ω$ and $U_(B,i) = q_B ħ ω$, respectively, where $q_(A,B)$ is an integer much larger than $N_(A,B)$. These two Einstein solids are isolated from the environment, but they can have energy exchange so that they reach thermal equilibrium after some time.

  #grid(
    columns: (1fr, 2fr),
    gutter: 1em,
    figure(
      image("../../../../_zss/d 178.png", width: 80%),
      caption: [Two Einstein solids that are isolated from the environment, but they can have energy exchange.],
      supplement: [Figure]
    ),
    [
      *(1) (4 points)* Use the equipartition theorem to calculate the temperature after reaching thermal equilibrium.

      *(2) (4 points)* In the limit $q_(A,B) >> N_(A,B)$, the multiplicity of the Einstein solid is
      $
      Omega_(A,B) = (frac(e q_(A,B), N_(A,B)))^(N_(A,B))
      $
      Use the fundamental assumption of statistical mechanics to show that in the most probable macrostate, which is also the thermal equilibrium state, #imath[$frac(U_A, N_A) = frac(U_B, N_B)$]. Also, find the entropy $S$ of this state.

      *(3) (5 points)* Use the fundamental definition of temperature, #imath[$frac(1, T) = pdv(S, U)$] to calculate the temperature of the combined system after thermal equilibrium, where $U$ is the total energy. Verify that this temperature is the same as in part (1).
    ],
  )
]

#solution[
  *Part (1): Equipartition temperature*

  Each 1-D harmonic oscillator has one kinetic and one potential quadratic degree of freedom, so by the equipartition theorem each oscillator carries average energy $frac(1,2) k T + frac(1,2) k T = k T$. The total energy is therefore
  $
  U = (N_A + N_B) k T.
  $
  Since the total energy is conserved, $U = (q_A + q_B) ħ ω$, and the equilibrium temperature is

  #boxed[$ T = frac((q_A + q_B) ħ ω, (N_A + N_B) k) $]


  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Most probable macrostate and entropy*

  By the fundamental assumption, the equilibrium macrostate maximizes the total multiplicity. The total multiplicity is
  $
  Omega = Omega_A Omega_B = (frac(e q_A, N_A))^(N_A) (frac(e q_B, N_B))^(N_B),
  $
  with $q = q_A + q_B$ fixed so that $q_B = q − q_A$. Taking the derivative of $ln Omega$ with respect to $q_A$,
  $
  ln Omega = N_A ln(frac(e q_A, N_A)) + N_B ln(frac(e q_B, N_B)),
  $
  $
  = N_A (1 + ln q_A − ln N_A) + N_B (1 + ln q_B − ln N_B),
  $
  with $q_B = q − q_A$ and constants independent of $q_A$ kept explicit.
  $
  0 = pdv(ln Omega, q_A)
  = frac(N_A, q_A) − frac(N_B, q_B),
  $
  hence

  #boxed[$ frac(q_A, N_A) = frac(q_B, N_B)
  quad => quad
  frac(U_A, N_A) = frac(U_B, N_B) $]

  This means energy distributes uniformly per oscillator at equilibrium. The entropy is
  $
  S = k ln Omega
  = k [N_A (1 + ln (frac(q_A, N_A))) + N_B (1 + ln (frac(q_B, N_B)))].
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Temperature from $S(U)$*

  From part (2), the equilibrium condition #imath[$frac(q_A, N_A) = frac(q_B, N_B)$] gives
  $
  q_A = frac(N_A, N_A + N_B) q,
  quad
  q_B = frac(N_B, N_A + N_B) q.
  $
  Substituting into $S$ and simplifying (both terms share the same #imath[$frac(q, N_A + N_B)$]),
  $
  S = k (N_A + N_B) [
  1 + ln frac(q, N_A + N_B)
  ].
  $
  Writing $q = frac(U, ħ ω)$,
  $
  S = k (N_A + N_B) [
  1 + ln frac(U, (N_A + N_B) ħ ω)
  ].
  $
  Applying the fundamental definition of temperature,
  $
  frac(1, T) = pdv(S, U)
  = frac(k (N_A + N_B), U),
  $
  so

  #boxed[$ T = frac(U, (N_A + N_B) k)
  = frac((q_A + q_B) ħ ω, (N_A + N_B) k) $]

  which matches part (1), confirming consistency between equipartition and the statistical-mechanical definition of temperature.
]



#pbm("2")[
  *[13 pts]*
  In the class, we have been mainly focusing on the high-temperature limit of the Einstein solid. In particular, we see that in this limit the heat capacity of an Einstein solid agrees with the equipartition theorem. In this problem, we study the heat capacity of an Einstein solid at a generic temperature. Suppose the Einstein solid is made of $N$ harmonic oscillators, and its energy $U = q ħ ω$, where $q$ is a non-negative integer.

  *(1) (3 points)* Assuming $q >> 1$ and $N >> 1$, show that the entropy of an Einstein solid is
  $
  S(N, U) = k [
  (frac(U, ħ ω) + N) ln (frac(U, ħ ω) + N)
  − (frac(U, ħ ω)) ln (frac(U, ħ ω))
  − N ln N
  ].
  $ <eq:ein-entropy>

  *(2) (5 points)* Use the fundamental definition of temperature #imath[$frac(1, T) = pdv(S, U)$] to calculate the temperature as a function of $N$ and $U$. Based on this result, show that the energy $U$ as a function of $N$ and the temperature $T$ is
  $
  U(N, T) = frac(N ħ ω, op("exp")(frac(ħ ω, k T)) − 1)
  $ <eq:ein-energy>
  Show that this result agrees with the equipartition theorem at high temperatures.

  *(3) (5 points)* Use the above result to calculate the heat capacity of an Einstein solid. Is this result compatible with the third law of thermodynamics, which, in the present context, means that the specific heat capacity of a system should vanish at zero temperature?
]

#solution[
  *Part (1): Entropy from multiplicity*

  The number of ways to distribute $q$ quanta among $N$ oscillators is
  $
  Omega = frac((q + N − 1)!, q! (N − 1)!)
  $
  Taking $ln$ and applying Stirling ($ln n! ≈ n ln n − n$ for $n >> 1$),
  $
  S = k ln Omega
  ≈ k [
  (q + N) ln(q + N) − q ln q − N ln N
  ].
  $
  Substituting $q = frac(U, ħ ω)$ gives the stated result.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Temperature and $U(T)$*

  Let $x = frac(U, ħ ω)$ so that #imath[$dif U = ħ ω dif x$]. Then
  $
  S/k = (x + N) ln(x + N) − x ln x − N ln N.
  $
  Differentiating with respect to $U$,
  $
  frac(1, T) = pdv(S, U)
  = frac(k, ħ ω) [ln(x + N) − ln x]
  = frac(k, ħ ω) ln(1 + frac(N, x)).
  $
  Substituting back $x = frac(U, ħ ω)$,
  $
  frac(1, T) = frac(k, ħ ω) ln(1 + frac(N ħ ω, U)).
  $
  Inverting: $op("exp")(frac(ħ ω, k T)) = 1 + frac(N ħ ω, U)$, so

  #boxed[$ U = frac(N ħ ω, op("exp")(frac(ħ ω, k T)) − 1) $]

  *High-temperature check:* For $k T >> ħ ω$, expand $op("exp")(frac(ħ ω, k T)) ≈ 1 + frac(ħ ω, k T)$, giving
  $
  U ≈ frac(N ħ ω, frac(ħ ω, k T)) = N k T,
  $
  which agrees with the equipartition theorem ($k T$ per oscillator).

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Heat capacity*

  Define $x = frac(ħ ω, k T)$. Equivalently, let $p = frac(ħ ω, k T)$, so
  #imath[$dv(T, p) = -frac(k T^2, ħ ω)$] and #imath[$dv(p, T) = -frac(p, T)$]. Then
  $
  U = frac(N ħ ω, op("exp")(p) − 1).
  $
  Taking the chain rule,
  #imath[$C = dv(U, T) = dv(U, p) dv(p, T)$],
  $
  dv(U, p) = -frac(N ħ ω op("exp")(p), (op("exp")(p) − 1)^2),
  $
  so

  #boxed[$ C = N k frac(p^2 op("exp")(p), (op("exp")(p) − 1)^2) $]

  *Third-law check:* As $T → 0$, $p → ∞$, and the dominant factor is $frac(p^2 e^p, (e^p)^2) = p^2 e^(-p) → 0$. Formally, $lim_(p→∞) p^2 / e^p = 0$ by applying L'Hôpital twice, so $C → 0$. This is consistent with the third law of thermodynamics.
]

#pagebreak()

#pbm("3")[
  *[14 pts]*
  In the class, we have learnt how to use the heat capacity $C$ to measure the change of the entropy when the temperature of the system is increased from $T_1$ to $T_2$, via @eq:entropy-change,
  $
  S(T_2) − S(T_1) =
  integral_(T_1)^(T_2) frac(C, T) dif T
  $ <eq:entropy-change>
  We have also learnt that the energy of a paramagnet made of $N$ two-state dipoles under a magnetic field $B$ is $U = −μ B M$, where the magnetization $M$ is the difference between the number of up-pointing dipoles and the number of down-pointing dipoles, and heat capacity of such a paramagnet is
  $
  C = frac(N k (frac(μ B, k T))^2, cosh^2(frac(μ B, k T)))
  $
  In this problem, we will see some rather fun application of these results.

  *(1) (4 points)* At zero temperature, the system wants to be in its lowest energy state. Suppose the magnetic field $B > 0$, for what value of $M$ will the system have the lowest energy? If the energy of the system is taken to be the lowest energy, what is the multiplicity and entropy of the system? Is this result compatible with the third law of thermal dynamics, which, in the present context, means that the entropy density of a system vanishes at zero temperature?

  *(2) (5 points)* If $B = 0$, what is the multiplicity and entropy of the system? Is this result compatible with the third law of thermodynamics, which states that the entropy density of a system vanishes at zero temperature?
  Remark: The case with $B = 0$ is an artificially fine tuned situation where all states have the same energy.

  *(3) (5 points)* Even if $B ≠ 0$, the entropy in the infinite temperature limit $T = ∞$ can be effectively viewed as the entropy for the case where $B = 0$, as obtained in part (2). To see it, notice that by dimensional analysis the entropy must depend on the temperature $T$ and magnetic field $B$ through $S(N, T, B) = k f(N, frac(μ B, k T))$, where $f$ is some function. So $S(N, T = ∞, B ≠ 0) = S(N, T ≠ 0, B = 0) = k f(N, 0)$. Now, use the information in this problem to obtain the answer of the integral @eq:param-int
  $
  I(a) =
  integral_(0)^(∞) dif x frac((frac(a, x))^2, x cosh^2(frac(a, x)))
  $ <eq:param-int>
  where $a$ is an arbitrary nonzero real number.
  Remark: Sometimes physics can help us understand some seemingly complicated mathematics very simply. Personally, I do not even dare to think about calculating this integral without the help of physics!
]

#solution[
  *Part (1): $T = 0$, $B > 0$*

  The energy $U = -μ B M$ is minimized when $M$ is maximized. For $B > 0$, lowering the energy means aligning dipoles with the field, so the ground state is all spins up. Since each dipole is either up or down, the maximum magnetization is $M = +N$ (all dipoles aligned with the field). In this state there is only one configuration, so $Omega = 1$ and
  $
  S = k ln 1 = 0.
  $
  The entropy density $S/N = 0$ vanishes, which is compatible with the third law.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): $B = 0$*

  When $B = 0$, the energy $U = -μ B M = 0$ is independent of $M$, so every spin configuration has the same energy. Each of the $N$ dipoles has 2 states, giving
  $
  Omega = 2^N,
  quad
  S = k ln 2^N = N k ln 2.
  $
  The entropy density $S/N = k ln 2 ≠ 0$ does not vanish, so this is *not* compatible with the third law. This reflects the artificially fine-tuned degeneracy: with $B = 0$, there is no energetic preference for any configuration, preventing the system from selecting a unique ground state.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Evaluating the integral*

  From parts (1) and (2), we know $S(T=0, B>0) = 0$ and $S(T=∞, B≠0) = N k ln 2$ (since at infinite temperature, $frac(μ B, k T) → 0$, recovering the $B=0$ result). Using @eq:entropy-change,
  $
  S(∞) − S(0)
  = integral_(0)^(∞) frac(C, T) dif T
  = N k ln 2.
  $
  Substituting the heat capacity $C = frac(N k (frac(μ B, k T))^2, cosh^2(frac(μ B, k T)))$ and writing $a = frac(μ B, k)$,
  $
  integral_(0)^(∞) frac(C, T) dif T
  = N k integral_(0)^(∞) dif T frac((frac(a, T))^2, T cosh^2(frac(a, T)))
  = N k · I(a).
  $
  Comparing with $N k ln 2$,

  #boxed[$ I(a) = ln 2 $]

  for any nonzero $a$.
]
