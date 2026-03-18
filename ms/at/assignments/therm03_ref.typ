#import "../shared/_at.typ": *

#show: ad.with(
  title: "Assignment 3 Reference",
  author: [A0224805J],
  experiment: "",
  course: [*PC2135* \
  Thermodynamics and Statistical Mechanics],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("1")[
  *Problem 1*

  *(1)* The multiplicities are
  $
  Omega_A
  = frac(N_A!, ((N_A + M_A)/2)! ((N_A − M_A)/2)!),
  quad
  Omega_B
  = frac(N_B!, ((N_B + M_B)/2)! ((N_B − M_B)/2)!).
  $
  Since the subsystems are independent,
  $
  Omega = Omega_A Omega_B.
  $
  The entropy is
  $
  S = k_B ln Omega = S_A + S_B.
  $

  *(2)* Apply Stirling:
  $
  ln Omega_A
  ≈ N_A ln N_A
  − (N_A + M_A)/2 ln((N_A + M_A)/2)
  − (N_A − M_A)/2 ln((N_A − M_A)/2),
  $
  and similarly for $B$. Thus
  $
  S ≈ k_B [
  N_A ln N_A
  − (N_A + M_A)/2 ln((N_A + M_A)/2)
  − (N_A − M_A)/2 ln((N_A − M_A)/2)
  \ 
  + N_B ln N_B
  − (N_B + M_B)/2 ln((N_B + M_B)/2)
  − (N_B − M_B)/2 ln((N_B − M_B)/2)
  ].
  $
  With $M = M_A + M_B$, the extremum condition is
  $
  0 = pdv(S, M_A)
  = frac(k_B, 2) ln frac(N_A − M_A, N_A + M_A)
  − frac(k_B, 2) ln frac(N_B − M_B, N_B + M_B),
  $
  so
  $
  frac(N_A + M_A, N_A − M_A)
  = frac(N_B + M_B, N_B − M_B)
  quad => quad
  frac(M_A, N_A) = frac(M_B, N_B).
  $

  *(3)* Taylor expand around $M_A = M_A^\*$:
  $
  S = S^\* + pdv(S, M_A)_(*) delta M_A
  + frac(1, 2) pdv(pdv(S, M_A), M_A)_(*) (delta M_A)^2 + O((delta M_A)^3).
  $
  The linear term vanishes at the maximum. The second derivative is
  $
  pdv(pdv(S, M_A), M_A)
  = -frac(k_B, 2)[
  1/(N_A + M_A) + 1/(N_A − M_A)
  + 1/(N_B + M_B) + 1/(N_B − M_B)
  ].
  $
  Using $M_A^\*/N_A = M_B^\*/N_B$ and $M = M_A^\* + M_B^\*$ gives
  $
  S = S^\* − frac(k_B, 2)
  frac((N_A + N_B)^3, N_A N_B (N_A + N_B + M)(N_A + N_B − M))
  (delta M_A)^2 + O((delta M_A)^3).
  $
  Thus
  $
  Omega(delta M_A) ∝ op("exp")(
  - (delta M_A)^2 / sigma^2
  ),
  quad
  sigma^2 ~
  frac(N_A N_B (N_A + N_B + M)(N_A + N_B − M), (N_A + N_B)^3).
  $
]

#pagebreak()

#pbm("2")[
  *Problem 2*

  *(1)* Since the subsystems are independent,
  $
  Omega = Omega_A Omega_B,
  quad
  S = k_B ln Omega = S_A + S_B.
  $
  Hence
  $
  S = N_A k_B [
  ln( (V_A / N_A) (4π m U_A / (3 N_A h^2))^(3/2) )
  + 5/2
  ]
  + N_B k_B [
  ln( (V_B / N_B) (4π m U_B / (3 N_B h^2))^(3/2) )
  + 5/2
  ].
  $

  *(2)* With $U = U_A + U_B$,
  $
  pdv(S, U_A)
  = frac(3, 2) k_B [N_A/U_A − N_B/U_B] = 0
  quad => quad
  U_A/N_A = U_B/N_B.
  $
  With $V = V_A + V_B$,
  $
  pdv(S, V_A)
  = k_B [N_A/V_A − N_B/V_B] = 0
  quad => quad
  V_A/N_A = V_B/N_B.
  $
  Equipartition gives $U_A = (3/2) N_A k_B T_A$ and $U_B = (3/2) N_B k_B T_B$,
  so $T_A = T_B$. Then $P = N k_B T / V$ implies $P_A = P_B$.

  *(3)* At the most probable macrostate,
  $
  U_A^\* = frac(N_A, N_A + N_B) U,
  quad
  V_A^\* = frac(N_A, N_A + N_B) V.
  $
  The second derivatives are
  $
  pdv(pdv(S, U_A), U_A)
  = - frac(3, 2) k_B (N_A/U_A^2 + N_B/U_B^2),
  $
  $
  pdv(pdv(S, U_A), V_A) = 0,
  quad
  pdv(pdv(S, V_A), V_A)
  = - k_B (N_A/V_A^2 + N_B/V_B^2).
  $
  Substituting $U_A^\*, V_A^\*$ yields the stated coefficients and Gaussian widths
  $
  sigma_U ~ sqrt(frac(N_A N_B U^2, (N_A + N_B)^3)),
  quad
  sigma_V ~ sqrt(frac(N_A N_B V^2, (N_A + N_B)^3)).
  $
]

#pagebreak()

#pbm("3")[
  *Problem 3*

  *(1)* Equipartition gives
  $
  U_A = frac(3, 2) N_A k_B T,
  quad
  U_B = frac(3, 2) N_B k_B T,
  $
  so initially $T_i = 2U_A/(3 N_A k_B) = 2U_B/(3 N_B k_B)$.
  After mixing,
  $
  T_f = frac(2 (U_A + U_B), 3 (N_A + N_B) k_B),
  quad
  U_A' = frac(3, 2) N_A k_B T_f
  = frac(N_A, N_A + N_B) (U_A + U_B).
  $

  *(2)* Before mixing,
  $
  S_i = S_A(N_A, U_A, V_A) + S_B(N_B, U_B, V_B).
  $
  After mixing, both species occupy $V = V_A + V_B$ and have energies
  $
  U_A' = frac(N_A, N_A + N_B) U,
  quad
  U_B' = frac(N_B, N_A + N_B) U,
  $
  so
  $
  S_f = S_A(N_A, U_A', V) + S_B(N_B, U_B', V).
  $
  Therefore
  $
  Delta S = N_A k_B ln frac(V_A + V_B, V_A)
  + N_B k_B ln frac(V_A + V_B, V_B),
  $
  since $U_A'/U_A = U_B'/U_B = 1$ under the initial equilibrium condition.

  *(3)* The total multiplicity after mixing scales as
  $
  Omega ∝ V^(N_A + N_B) (U_A')^(3 N_A/2) (U_B')^(3 N_B/2),
  $
  with $U_B' = U − U_A'$. Maximizing $ln Omega$ gives
  $
  0 = pdv(ln Omega, U_A')
  = frac(3 N_A, 2 U_A') − frac(3 N_B, 2 (U − U_A')),
  $
  hence
  $
  U_A' = frac(N_A, N_A + N_B) U,
  $
  matching part (1).
]

#pagebreak()

#pbm("4")[
  *Problem 4 (note from author)*

  I am not convinced of my answer in P3(2), and I believe the argument in P3(3) is flawed. The reason is as follows: I would not take $U_A ∈ (U_A, U_A + dif u)$ and $U_B ∈ (U_B, U_B − dif u)$ in the product of phase‑space volumes without a careful derivation. A more explicit derivation is to compute the total momentum‑space volume by convolution,
  $
  Omega ∝ V^N / (N_A! N_B!)
  ·
  integral_0^(U_T)
  (2 m_A u)^(3 N_A/2 − 1)
  (2 m_B (U_T − u))^(3 N_B/2 − 1)
  dif u,
  $
  which yields the same scaling law and recovers the standard expression after evaluating the Beta function.
]
