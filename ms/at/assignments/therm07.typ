#import "../shared/_at.typ": *

#show: ad.with(
  title: "Assignment 7",
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
  *[20 pts]*
  In class, we have learnt the Gibbs--Duhem relation, i.e., $S dif T - V dif P + N dif mu = 0$. To better understand the meaning of this relation, in this problem, we explicitly check this relation for a monatomic ideal gas. Denote the particle number of this gas by $N$, the energy of the gas by $U$ and the volume of the gas by $V$. The entropy of this gas as a function of $N$, $U$ and $V$ is
  $
  S(N, U, V) = N k [
  ln(
  frac(V, N)
  (frac(4 π m U, 3 N h^2))^(3\/2)
  )
  + frac(5, 2)
  ]
  $ <eq:ST>
  where $m$ is the mass of a particle.

  *(1) (2 points)* Calculate the temperature $T$, pressure $P$ and chemical potential $mu$ of this gas. Express the answer in terms of $N$, $U$ and $V$.

  *(2) (4 points)* Calculate the three differentials $dif T$, $dif P$ and $dif mu$. Express the answer in terms of $N$, $U$ and $V$ as well as their differentials $dif N$, $dif U$ and $dif V$.

  *(3) (4 points)* Explicitly show that $S dif T - V dif P + N dif mu = 0$ using the results of part (2).

  *(4) (2 points)* In the above, we express everything in terms of $N$, $U$ and $V$ and their differentials. Below we would like to express everything in terms of $P$, $T$ and $V$ and their differentials. Write down the expressions of $S$, $N$ and $mu$ in terms of $P$, $T$ and $V$.

  *(5) (4 points)* Calculate the differential $dif mu$. Express the answer in terms of $P$, $T$ and $V$ and their differentials.

  *(6) (4 points)* Explicitly show that $S dif T - V dif P + N dif mu = 0$ using the results of part (5).
]

#solution[
  *Part (1): $T$, $P$, $mu$ from the Sackur--Tetrode equation*

  Expand @eq:ST by separating logarithms:
  $
  S = N k [ln V + frac(3, 2) ln frac(4 π m U, 3 h^2) - frac(5, 2) ln N + frac(5, 2)]
  $ <eq:Sexp>

  *Temperature* via #imath[$1\/T = pdv(S, U)_(V, N)$]:
  $
  frac(1, T) = N k dot frac(3, 2) dot frac(1, U) = frac(3 N k, 2 U) quad ==> quad T = frac(2 U, 3 N k)
  $ <eq:T>

  *Pressure* via #imath[$P\/T = pdv(S, V)_(U, N)$]:
  $
  frac(P, T) = frac(N k, V) quad ==> quad P = frac(N k T, V) = frac(2 U, 3 V)
  $ <eq:P>

  *Chemical potential* via #imath[$mu = -T pdv(S, N)_(U, V)$]. Differentiating @eq:Sexp:
  $
  pdv(S, N)_(U, V) = k [ln V + frac(3, 2) ln frac(4 π m U, 3 h^2) - frac(5, 2) ln N + frac(5, 2)] + N k (- frac(5, 2 N))
  $
  $
  = k [ln V + frac(3, 2) ln frac(4 π m U, 3 h^2) - frac(5, 2) ln N] = frac(S, N) - frac(5, 2) k
  $
  Therefore
  $
  mu = -T (frac(S, N) - frac(5, 2) k) = -frac(T S, N) + frac(5, 2) k T = -k T ln [frac(V, N) (frac(4 π m U, 3 N h^2))^(3\/2)]
  $ <eq:mu>

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Differentials $dif T$, $dif P$, $dif mu$*

  From @eq:T, $T = 2 U \/ (3 N k)$:
  $
  dif T = frac(2, 3 N k) dif U - frac(2 U, 3 N^2 k) dif N
  $ <eq:dT>

  From @eq:P, $P = 2 U \/ (3 V)$:
  $
  dif P = frac(2, 3 V) dif U - frac(2 U, 3 V^2) dif V
  $ <eq:dP>

  For $dif mu$, write #imath[$mu = -frac(2 U, 3 N) f$] where #imath[$f = ln V + frac(3, 2) ln U + frac(3, 2) ln frac(4 π m, 3 h^2) - frac(5, 2) ln N$].

  Note that $S = N k (f + 5\/2)$, so $f = S\/(N k) - 5\/2$. Taking the total differential of $mu$:
  $
  pdv(mu, U)_(N, V) = -frac(2, 3 N) f - frac(2 U, 3 N) dot frac(3, 2 U) = -frac(2 f + 3, 3 N)
  $
  $
  pdv(mu, V)_(N, U) = -frac(2 U, 3 N V)
  $
  $
  pdv(mu, N)_(U, V) = frac(2 U, 3 N^2) f + frac(2 U, 3 N) dot frac(5, 2 N) = frac(2 U, 3 N^2) (f + frac(5, 2)) = frac(2 U S, 3 N^3 k)
  $
  Hence
  $
  dif mu = -frac(2 f + 3, 3 N) dif U - frac(2 U, 3 N V) dif V + frac(2 U S, 3 N^3 k) dif N
  $ <eq:dmu>

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Verification of $S dif T - V dif P + N dif mu = 0$*

  Substituting @eq:dT, @eq:dP, @eq:dmu:

  *Coefficient of $dif U$:*
  $
  frac(2 S, 3 N k) - frac(2 V, 3 V) + N dot (- frac(2 f + 3, 3 N)) = frac(2 S, 3 N k) - frac(2, 3) - frac(2 f + 3, 3)
  $
  Since $S\/(N k) = f + 5\/2$, this becomes
  $
  frac(2(f + 5\/2), 3) - frac(2, 3) - frac(2 f + 3, 3) = frac(2 f + 5, 3) - frac(2, 3) - frac(2 f + 3, 3) = 0 quad checkmark
  $

  *Coefficient of $dif V$:*
  $
  0 - V (- frac(2 U, 3 V^2)) + N (- frac(2 U, 3 N V)) = frac(2 U, 3 V) - frac(2 U, 3 V) = 0 quad checkmark
  $

  *Coefficient of $dif N$:*
  $
  S (- frac(2 U, 3 N^2 k)) - 0 + N dot frac(2 U S, 3 N^3 k) = -frac(2 U S, 3 N^2 k) + frac(2 U S, 3 N^2 k) = 0 quad checkmark
  $

  All three coefficients vanish, so $S dif T - V dif P + N dif mu = 0$. $square.filled$

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (4): $S$, $N$, $mu$ in terms of $P$, $T$, $V$*

  From @eq:T and @eq:P: $U = 3 N k T\/2$ and $N = P V\/(k T)$. Substituting into the Sackur--Tetrode equation, the argument of the logarithm simplifies since
  #imath[$frac(V, N) = frac(k T, P)$] and #imath[$frac(4 π m U, 3 N h^2) = frac(2 π m k T, h^2)$].

  $
  S = frac(P V, T) [ln frac(k T, P) + frac(3, 2) ln frac(2 π m k T, h^2) + frac(5, 2)]
  $ <eq:SPTV>
  $
  N = frac(P V, k T)
  $ <eq:NPTV>
  $
  mu = -k T [ln frac(k T, P) + frac(3, 2) ln frac(2 π m k T, h^2)]
  $ <eq:muPTV>

  Note that $mu$ depends only on $P$ and $T$, not on $V$.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (5): Differential $dif mu$ in terms of $dif P$, $dif T$, $dif V$*

  Since $mu(P, T)$ is independent of $V$, we need only $pdv(mu, T)_P$ and $pdv(mu, P)_T$.

  Write #imath[$mu = -k T [frac(5, 2) ln T + ln frac(k, P) + frac(3, 2) ln frac(2 π m k, h^2)]$]. Let #imath[$alpha = ln frac(k, P) + frac(3, 2) ln frac(2 π m k, h^2)$] (depends on $P$, not $T$). Then $mu = -k T (frac(5, 2) ln T + alpha)$.

  $
  pdv(mu, T)_P = -k (frac(5, 2) ln T + alpha) - k T dot frac(5, 2 T) = -k (frac(5, 2) ln T + alpha + frac(5, 2))
  $
  Comparing with @eq:SPTV and @eq:NPTV, #imath[$S\/N = k(frac(5, 2) ln T + alpha + frac(5, 2))$], so
  $
  pdv(mu, T)_P = -frac(S, N)
  $
  $
  pdv(mu, P)_T = -k T dot (- frac(1, P)) = frac(k T, P) = frac(V, N)
  $
  Therefore
  $
  dif mu = -frac(S, N) dif T + frac(V, N) dif P
  $ <eq:dmuPTV>

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (6): Verification of $S dif T - V dif P + N dif mu = 0$*

  Substituting @eq:dmuPTV:
  $
  S dif T - V dif P + N (-frac(S, N) dif T + frac(V, N) dif P) = S dif T - V dif P - S dif T + V dif P = 0
  $
  $square.filled$
]

#pagebreak()

#pbm("2")[
  *[20 pts]*
  In class we have considered various fluids and will consider more, including the ideal gas and van der Waals fluids, where the latter can be either a gas or liquid. In general, a fluid is a thermodynamic system that can be fully characterized by its temperature $T$, volume $V$ and particle number $N$. For example, the pressure $P$ can be written as a function of these variables, $P(T, V, N)$.

  *(1) (5 points)* The equation of state for the ideal gas is $P V = N k T$. Calculate #imath[$V pdv(P, V)_(T, N) + N pdv(P, N)_(T, V)$] for an ideal gas.

  *(2) (10 points)* The equation of state for the van der Waals fluid is
  $
  (P + a frac(N^2, V^2))(V - N b) = N k T
  $
  with $a$ and $b$ two constants. Calculate #imath[$V pdv(P, V)_(T, N) + N pdv(P, N)_(T, V)$] for a van der Waals fluid.

  *(3) (5 points)* Consider a general fluid that may not be an ideal gas or van der Waals fluid. Can the value of #imath[$V pdv(P, V)_(T, N) + N pdv(P, N)_(T, V)$] for this fluid be different from the answers you obtain in parts (1) and (2)? If yes, give an example of such a fluid and show that the value there is indeed different from both part (1) and part (2). If no, give a proof of why the value cannot be different.
]

#solution[
  *Part (1): Ideal gas*

  From $P = N k T\/V$:
  $
  pdv(P, V)_(T, N) = -frac(N k T, V^2) quad ==> quad V pdv(P, V)_(T, N) = -frac(N k T, V) = -P
  $
  $
  pdv(P, N)_(T, V) = frac(k T, V) quad ==> quad N pdv(P, N)_(T, V) = frac(N k T, V) = P
  $
  Therefore
  $
  V pdv(P, V)_(T, N) + N pdv(P, N)_(T, V) = -P + P = 0
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Van der Waals fluid*

  Solving for $P$:
  $
  P = frac(N k T, V - N b) - frac(a N^2, V^2)
  $
  $
  pdv(P, V)_(T, N) = -frac(N k T, (V - N b)^2) + frac(2 a N^2, V^3)
  $
  $
  V pdv(P, V)_(T, N) = -frac(N k T V, (V - N b)^2) + frac(2 a N^2, V^2)
  $
  $
  pdv(P, N)_(T, V) = frac(k T, V - N b) + frac(N k T b, (V - N b)^2) - frac(2 a N, V^2)
  $
  $
  N pdv(P, N)_(T, V) = frac(N k T, V - N b) + frac(N^2 k T b, (V - N b)^2) - frac(2 a N^2, V^2)
  $
  Adding:
  $
  V pdv(P, V) + N pdv(P, N) = frac(N k T, V - N b) [1 - frac(V, V - N b) + frac(N b, V - N b)] + frac(2 a N^2, V^2) - frac(2 a N^2, V^2)
  $
  The bracket simplifies:
  $
  1 - frac(V, V - N b) + frac(N b, V - N b) = 1 + frac(-V + N b, V - N b) = 1 - 1 = 0
  $
  Hence
  $
  V pdv(P, V)_(T, N) + N pdv(P, N)_(T, V) = 0
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): General fluid --- the answer is always zero*

  The result cannot differ from parts (1) and (2). The proof follows from the fact that pressure is an intensive quantity, so $P(T, V, N)$ is homogeneous of degree 0 in $(V, N)$ at fixed $T$:
  $
  P(T, lambda V, lambda N) = P(T, V, N) quad forall lambda > 0
  $
  By Euler's theorem for homogeneous functions, a function $f(x_1, x_2)$ that is homogeneous of degree $n$ satisfies $sum_i x_i pdv(f, x_i) = n f$. With $n = 0$, $x_1 = V$, and $x_2 = N$:
  $
  V pdv(P, V)_(T, N) + N pdv(P, N)_(T, V) = 0 dot P = 0
  $
  This holds for any fluid whose pressure is intensive. $square.filled$
]
