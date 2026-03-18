#import "../shared/_at.typ": *

#show: ad.with(
  title: "Midterm Question Bank",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC2230* \
  Thermodynamics and Statistical Mechanics],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: "(1)")
#set math.cases(gap: 1em)

#let imath(body) = text(size: 1.1em)[#body]

= Module 1: Core Concepts & The Ideal Gas

#pbm("1")[
  *Conceptual: Thermodynamics vs Statistical Mechanics*

  State the fundamental difference between Thermodynamics and Statistical Mechanics. Give one example of a thermodynamic state function and explain how statistical mechanics interprets it microscopically.
]

#solution[
  Thermodynamics is a macroscopic theory: it relates state variables (such as $U, S, V, N$) without specifying microscopic dynamics. Statistical mechanics is microscopic: it derives macroscopic relations by counting microstates consistent with a macrostate.

  Example: entropy. Thermodynamics defines $S$ via reversible heat flow and state functions. Statistical mechanics defines
  $
  S = k ln Omega,
  $
  where $Omega$ is the multiplicity (number of microstates). This connects macroscopic irreversibility to microscopic counting.
]

#pbm("2")[
  *Conceptual: Ideal Gas Assumptions*

  State the two main assumptions required for a gas to be considered ideal (in terms of density and temperature), and explain physically what each assumption implies about interactions and quantum effects.
]

#solution[
  The ideal-gas assumptions are:
  1. *Low density:* the mean interparticle separation is large, so collisions are rare and interactions are negligible except during brief elastic collisions. This lets us treat particles as non-interacting point masses between collisions.
  2. *High temperature (or non-degenerate limit):* thermal de Broglie wavelength is small compared to the mean separation, so quantum statistics can be ignored and classical mechanics applies.
]

#pagebreak()

#pbm("3")[
  *Conceptual: Equipartition Theorem*

  State the Equipartition Theorem. Why does it fail at very low temperatures, and what physical mechanism resolves this failure?
]

#solution[
  Equipartition: for a system in thermal equilibrium, each quadratic degree of freedom contributes $frac(1, 2) k T$ to the average energy.

  It fails at very low $T$ because energy levels are quantized. When $k T$ is smaller than the spacing between levels, excited states are not thermally accessible. Quantum statistics suppress the contribution of those modes. The resolution is quantum mechanics: discrete spectra and Bose/Fermi occupation replace classical equipartition.
]

#pbm("4")[
  *Conceptual: Heat vs Work*

  Explain the difference between heat $Q$ and work $W$ from a microscopic perspective. Why are they path dependent?
]

#solution[
  Work is energy transfer through organized, macroscopic forces (e.g., moving a piston). Heat is energy transfer through random microscopic interactions with a thermal reservoir.

  Microscopically, work changes the Hamiltonian parameters (volume, fields), while heat exchanges energy through many stochastic micro-collisions. Both are path dependent because different microscopic pathways can transfer different amounts of energy even if the initial and final macrostates are the same.
]

#pbm("5")[
  *Conceptual: First Law of Thermodynamics*

  State the First Law of Thermodynamics and explain the meaning of each term for an ideal gas.
]

#solution[
  The First Law is
  $
  Delta U = Q - W,
  $
  where $U$ is internal energy, $Q$ is heat absorbed by the system, and $W$ is work done by the system.

  For an ideal gas, $U$ depends only on temperature, so $Delta U = n C_V Delta T$. Heat $Q$ changes internal energy and/or does work; work is associated with volume change against external pressure.
]

#pagebreak()

#pbm("6")[
  *Derivation: Pressure from Microscopic Mechanics*

  Derive the pressure of an ideal gas from Newtonian mechanics by considering elastic collisions with a wall. Show that
  $
  P = frac(N m ⟨v_x^2⟩, V).
  $
]

#solution[
  Consider a cubic container with length $L_x$ in the $x$ direction. For a molecule with velocity component $v_x$, the time between successive hits on the same wall is
  $
  Delta t = frac(2 L_x, v_x).
  $
  Each collision reverses momentum, so
  $
  Delta p_x = 2 m v_x.
  $
  Average force from one molecule is
  $
  F = frac(Delta p_x, Delta t) = frac(m v_x^2, L_x).
  $
  For $N$ molecules, the average force on area $A$ is
  $
  P = frac(1, A) sum_i frac(m v_(i,x)^2, L_x)
  = frac(N m ⟨v_x^2⟩, V),
  $
  since $V = L_x A$ and $⟨v_x^2⟩$ is the average over particles.
]

#pbm("7")[
  *Derivation: Ideal Gas Law*

  Using equipartition and the microscopic pressure formula, derive $P V = N k T$.
]

#solution[
  Equipartition gives
  $
  frac(1, 2) m ⟨v_x^2⟩ = frac(1, 2) k T.
  $
  Thus $m ⟨v_x^2⟩ = k T$. Substitute into
  $
  P = frac(N m ⟨v_x^2⟩, V)
  $
  to obtain
  $
  P = frac(N k T, V),
  $
  hence
  $
  P V = N k T.
  $
]

#pagebreak()

#pbm("8")[
  *Derivation: Isothermal Atmosphere*

  Derive the pressure gradient of an isothermal atmosphere in a gravitational field and show
  $
  dv(P, z) = -frac(m g, k T) P.
  $
]

#solution[
  Consider a slab of thickness $dif z$ and area $A$. Force balance gives
  $
  P(z) A - P(z + dif z) A = rho g A dif z,
  $
  so
  $
  -dif P = rho g dif z.
  $
  Thus
  $
  dv(P, z) = -rho g.
  $
  For an ideal gas, $P = n k T$ and $rho = m n$, so
  $
  rho = frac(m P, k T).
  $
  Substitution yields
  $
  dv(P, z) = -frac(m g, k T) P.
  $
]

#pbm("9")[
  *Derivation: Relation between $C_P$ and $C_V$*

  For an ideal gas, show that $C_P = C_V + N k$.
]

#solution[
  From the first law,
  $
  dif Q = dif U + P dif V.
  $
  At constant volume, $dif Q_(V) = dif U = N k frac(f, 2) dif T$, so $C_V = N k frac(f, 2)$.

  At constant pressure, $P dif V = N k dif T$ from $P V = N k T$, hence
  $
  dif Q_(P) = dif U + N k dif T.
  $
  Therefore
  $
  C_P = C_V + N k.
  $
]

#pagebreak()

#pbm("10")[
  *Derivation: Adiabatic Relation*

  Derive the condition $T V^(gamma - 1) = "const"$ for a reversible adiabatic expansion of an ideal gas.
]

#solution[
  For a reversible adiabatic process, $dif Q = 0$, so
  $
  dif U + P dif V = 0.
  $
  For an ideal gas, $dif U = N k frac(f, 2) dif T$ and $P = frac(N k T, V)$. Thus
  $
  N k frac(f, 2) dif T + frac(N k T, V) dif V = 0.
  $
  Divide by $N k T$:
  $
  frac(f, 2) frac(dif T, T) + frac(dif V, V) = 0.
  $
  With $gamma = 1 + frac(2, f)$, we have
  $
  frac(dif T, T) + (gamma - 1) frac(dif V, V) = 0.
  $
  Integrating gives
  $
  T V^(gamma - 1) = "const".
  $
]

= Module 2: Multiplicity & Entropy

#pbm("11")[
  *Conceptual: Microstate vs Macrostate*

  Define microstate and macrostate in statistical mechanics and give an example for a two-state paramagnet.
]

#solution[
  A microstate specifies the full microscopic configuration (e.g., each individual dipole orientation). A macrostate specifies only macroscopic quantities (e.g., total magnetization $M$ or number of up spins $N_↑$).

  Example: In a paramagnet with $N$ dipoles, the macrostate $N_↑$ counts how many are up; a microstate is one particular assignment of up/down spins that yields that $N_↑$.
]

#pagebreak()

#pbm("12")[
  *Conceptual: Fundamental Assumption*

  State the Fundamental Assumption of Statistical Mechanics and explain its role in equilibrium predictions.
]

#solution[
  The Fundamental Assumption states that for an isolated system with fixed $U, V, N$, all accessible microstates are equally probable.

  This allows the probability of a macrostate to be proportional to its multiplicity. Equilibrium is then identified with the most probable macrostate (maximum multiplicity).
]

#pbm("13")[
  *Conceptual: Sharp Peak of Most Probable Macrostate*

  Explain why the probability of a macroscopic system being in its most probable macrostate is essentially $1$, using the Gaussian peak width argument.
]

#solution[
  For large $N$, the multiplicity $Omega(M)$ near the maximum behaves like
  $
  Omega(M) ≈ Omega_* op("exp")(-frac((M - M_*)^2, sigma^2)).
  $
  The width $sigma$ typically scales as $sqrt(N)$, while the total number of macrostates scales as $N$. Thus the relative width is $frac(sigma, N) ~ frac(1, sqrt(N))$, which is extremely small for macroscopic $N$. Almost all probability mass concentrates near $M_*$.
]

#pbm("14")[
  *Conceptual: Statistical Entropy*

  State the statistical definition of entropy and explain why it is additive for independent subsystems.
]

#solution[
  Statistical entropy is
  $
  S = k ln Omega.
  $
  For independent subsystems, multiplicities multiply: $Omega = Omega_A Omega_B$. Therefore
  $
  S = k ln Omega = k ln Omega_A + k ln Omega_B = S_A + S_B.
  $
]

#pagebreak()

#pbm("15")[
  *Conceptual: Gibbs Paradox*

  Why must we divide the multiplicity of a monatomic gas by $N!$? What paradox does this resolve?
]

#solution[
  Particles of the same species are indistinguishable, so permutations of labels do not produce new physical microstates. Dividing by $N!$ removes overcounting.

  This resolves Gibbs’ paradox: without $N!$, mixing two identical gases would give a spurious entropy increase. With the correction, identical-gas mixing yields $Delta S = 0$.
]

#pbm("16")[
  *Derivation: Stirling’s Approximation*

  Write Stirling’s approximation and use it to simplify $ln(N!)$ for large $N$.
]

#solution[
  Stirling’s approximation:
  $
  ln(N!) ≈ N ln N - N.
  $
  Thus
  $
  ln(N!) = N ln N - N + O(ln N),
  $
  where the omitted term is small compared with $N$ for large systems.
]

#pbm("17")[
  *Derivation: Einstein Solid Multiplicity*

  Derive the multiplicity $Omega(N, q)$ for an Einstein solid with $N$ oscillators sharing $q$ energy quanta.
]

#solution[
  The problem is distributing $q$ identical quanta among $N$ oscillators. This is a stars-and-bars count:
  $
  Omega(N, q) = frac((q + N - 1)!, q! (N - 1)!).
  $
  This counts the number of nonnegative integer solutions to $q_1 + ... + q_N = q$.
]

#pbm("18")[
  *Derivation: Paramagnet Multiplicity*

  Derive the multiplicity $Omega(N, N_↑)$ of a two-state paramagnet with $N$ dipoles.
]

#solution[
  Choose which $N_↑$ dipoles are up:
  $
  Omega = frac(N!, N_↑! (N - N_↑)!).
  $
  This yields the multiplicity for a given magnetization $M = N_↑ - N_↓$.
]

#pbm("19")[
  *Derivation: Equilibrium Condition for Energy Exchange*

  Show that when two systems $A$ and $B$ can exchange energy, the most probable macrostate satisfies
  $
  pdv(S_A, U_A) = pdv(S_B, U_B).
  $
]

#solution[
  The total entropy is
  $
  S = S_A(U_A) + S_B(U_B),
  $
  with $U = U_A + U_B$ fixed. Maximize $S$ with respect to $U_A$:
  $
  0 = dv(S, U_A) = pdv(S_A, U_A) - pdv(S_B, U_B),
  $
  since $U_B = U - U_A$. Therefore
  $
  pdv(S_A, U_A) = pdv(S_B, U_B).
  $
]

#pbm("20")[
  *Derivation: Entropy of Mixing Identical Gases*

  Two identical ideal gases (same $N, V, T$) are separated by a partition. The partition is removed. Compute $Delta S$.
]

#solution[
  Because the gases are identical, removing the partition does not create new distinguishable microstates. The multiplicity before and after is the same when the $N!$ correction is included. Hence
  $
  Delta S = 0.
  $
]

= Module 3: Temperature, Pressure, and Chemical Potential

#pbm("21")[
  *Conceptual: Statistical Definitions*

  Give the statistical definitions (partial derivatives of $S$) for temperature $T$, pressure $P$, and chemical potential $μ$.
]

#solution[
  The definitions are
  $
  frac(1, T) = pdv(S, U)_(V,N),
  quad
  frac(P, T) = pdv(S, V)_(U,N),
  quad
  frac(-μ, T) = pdv(S, N)_(U,V).
  $
]

#pagebreak()

#pbm("22")[
  *Conceptual: Direction of Heat Flow*

  Using the statistical definition of temperature, explain why heat flows spontaneously from hot to cold.
]

#solution[
  For two systems exchanging energy, equilibrium requires
  $
  pdv(S_A, U_A) = pdv(S_B, U_B).
  $
  If initially $T_A > T_B$, then $frac(1, T_A) < frac(1, T_B)$. Increasing $U_A$ would increase $S$ less than increasing $U_B$, so total entropy increases when energy flows from hot (lower $pdv(S, U)$) to cold (higher $pdv(S, U)$). Thus heat flows from hot to cold to maximize $S$.
]

#pbm("23")[
  *Conceptual: Third Law*

  State the Third Law of Thermodynamics and explain what it implies for heat capacity as $T -> 0$.
]

#solution[
  The Third Law states that the entropy of a perfect crystal approaches a constant (often zero) as $T -> 0$. Thus $S$ becomes flat near $T = 0$, implying
  $
  C = T dv(S, T) -> 0
  $
  as $T -> 0$.
]

#pbm("24")[
  *Conceptual: Ideal Gas and the Third Law*

  Does a classical ideal gas obey the Third Law? Explain.
]

#solution[
  No. The classical Sackur–Tetrode entropy diverges as $T -> 0$ and depends on phase-space volume without quantum discreteness. The Third Law is restored only with quantum statistics and a proper low-temperature ground state.
]

#pbm("25")[
  *Conceptual: Chemical Potential*

  Explain the physical meaning of chemical potential. If $μ_A > μ_B$, which way do particles flow?
]

#solution[
  Chemical potential is the change in energy (or free energy) when adding a particle at fixed entropy and volume. Particles flow from higher $μ$ to lower $μ$ to increase total entropy (or reduce free energy), so if $μ_A > μ_B$, particles flow from $A$ to $B$.
]

#pbm("26")[
  *Derivation: Ideal Gas Energy from $S(U,V,N)$*

  Using $frac(1, T) = pdv(S, U)_(V,N)$ for a monatomic ideal gas, show that
  $
  U = frac(3, 2) N k T.
  $
]

#solution[
  For a monatomic ideal gas,
  $
  S = N k [
  ln frac(V, N)
  + frac(3, 2) ln frac(4 π m U, 3 N h^2)
  + frac(5, 2)
  ].
  $
  Differentiate at fixed $V, N$:
  $
  pdv(S, U) = N k frac(3, 2) frac(1, U).
  $
  Hence
  $
  frac(1, T) = frac(3 N k, 2 U)
  quad => quad
  U = frac(3, 2) N k T.
  $
]

#pbm("27")[
  *Derivation: Ideal Gas Law from Sackur–Tetrode*

  Using $frac(P, T) = pdv(S, V)_(U,N)$, derive $P V = N k T$ from the Sackur–Tetrode entropy.
]

#solution[
  From the same entropy,
  $
  pdv(S, V) = N k frac(1, V).
  $
  Thus
  $
  frac(P, T) = frac(N k, V)
  quad => quad
  P V = N k T.
  $
]

#pagebreak()

#pbm("28")[
  *Derivation: Chemical Potential of Ideal Gas*

  Using $μ = -T pdv(S, N)_(U,V)$, derive $μ$ for a monatomic ideal gas from Sackur–Tetrode.
]

#solution[
  Write $S = N k [ln frac(V, N) + frac(3, 2) ln frac(4 π m U, 3 N h^2) + frac(5, 2)]$. Differentiate w.r.t. $N$ at fixed $U, V$:
  $
  pdv(S, N) = k ln frac(V, N) - k + frac(3, 2) k ln frac(4 π m U, 3 N h^2) - frac(3, 2) k.
  $
  Combine constants:
  $
  pdv(S, N) = k ln[
  frac(V, N) (frac(4 π m U, 3 N h^2))^(3/2)
  ] - frac(5, 2) k.
  $
  Thus
  $
  μ = -T pdv(S, N)
  = -k T ln[
  frac(V, N) (frac(4 π m U, 3 N h^2))^(3/2)
  ] + frac(5, 2) k T.
  $
]

#pbm("29")[
  *Derivation: Einstein Solid $U(T)$*

  For an Einstein solid, use the definition of temperature to find $U(T)$ and show the high‑$T$ limit gives $U = N k T$.
]

#solution[
  For $Omega = frac((q + N - 1)!, q! (N - 1)!)$, Stirling gives
  $
  S = k[(q + N) ln(q + N) - q ln q - N ln N].
  $
  Let $q = frac(U, ħ ω)$ and define $x = frac(U, ħ ω)$:
  $
  frac(1, T) = pdv(S, U) = frac(k, ħ ω) ln(1 + frac(N, x)).
  $
  Invert to get
  $
  op("exp")(frac(ħ ω, k T)) = 1 + frac(N ħ ω, U),
  $
  hence
  $
  U = frac(N ħ ω, op("exp")(frac(ħ ω, k T)) - 1).
  $
  For $k T >> ħ ω$, $op("exp")(frac(ħ ω, k T)) ≈ 1 + frac(ħ ω, k T)$, so
  $
  U ≈ frac(N ħ ω, frac(ħ ω, k T)) = N k T.
  $
]

#pagebreak()

#pbm("30")[
  *Derivation: Einstein Solid Heat Capacity*

  Derive $C_V$ for an Einstein solid and show $C_V -> 0$ as $T -> 0$.
]

#solution[
  With $x = frac(ħ ω, k T)$,
  $
  U = frac(N ħ ω, op("exp")(x) - 1).
  $
  Then
  $
  C_V = dv(U, T)
  = N k frac(x^2 op("exp")(x), (op("exp")(x) - 1)^2).
  $
  As $T -> 0$, $x -> ∞$ and the dominant factor behaves like $x^2 e^(-x) -> 0$. Hence $C_V -> 0$.
]

= Module 4: Paramagnetism

#pbm("31")[
  *Definition: Paramagnet Energy*

  Write the total energy $U$ of a two-state paramagnet in a field $B$ in terms of $N_↑$ and $N_↓$.
]

#solution[
  Each dipole has energy $-μ B$ (up) or $+μ B$ (down). Thus
  $
  U = -μ B N_↑ + μ B N_↓
  = -μ B (N_↑ - N_↓)
  = -μ B M.
  $
]

#pbm("32")[
  *Derivation: Paramagnet Entropy*

  Using Stirling, derive $S(U, N, B)$ for a two-state paramagnet.
]

#solution[
  Multiplicity:
  $
  Omega = frac(N!, N_↑! N_↓!).
  $
  With $N_↑ = frac(N + M, 2)$ and $N_↓ = frac(N - M, 2)$,
  $
  S = k ln Omega
  ≈ k [N ln N - N_↑ ln N_↑ - N_↓ ln N_↓].
  $
  Since $U = -μ B M$, this gives $S(U, N, B)$ once $M = -frac(U, μ B)$ is substituted.
]

#pagebreak()

#pbm("33")[
  *Derivation: Temperature of Paramagnet*

  From the entropy in Problem 32, derive $T$ as a function of $U$.
]

#solution[
  Using $S(M)$ from the Stirling form,
  $
  pdv(S, M) = -frac(k, 2) ln frac(N + M, N - M).
  $
  With $U = -μ B M$,
  $
  pdv(S, U) = pdv(S, M) dv(M, U) = frac(k, 2 μ B) ln frac(N + M, N - M).
  $
  Thus
  $
  frac(1, T) = frac(k, 2 μ B) ln frac(N + M, N - M).
  $
]

#pbm("34")[
  *Derivation: $U(T)$ for Paramagnet*

  Invert the previous result to obtain $U(T)$ and show it involves $tanh$.
]

#solution[
  From
  $
  frac(1, T) = frac(k, 2 μ B) ln frac(N + M, N - M),
  $
  exponentiate to get
  $
  frac(N + M, N - M) = op("exp")(frac(2 μ B, k T)).
  $
  Solve for $M$:
  $
  M = N tanh(frac(μ B, k T)).
  $
  Since $U = -μ B M$,
  $
  U = -N μ B tanh(frac(μ B, k T)).
  $
]

#pagebreak()

#pbm("35")[
  *Derivation: Magnetization $M(T,B)$*

  Derive the magnetization and state the maximum possible magnetization and when it occurs.
]

#solution[
  From Problem 34,
  $
  M(T, B) = N tanh(frac(μ B, k T)).
  $
  The maximum magnetization is $M_max = N$ (all spins aligned) and occurs at $T -> 0^+$ for $B > 0$.
]

#pbm("36")[
  *Derivation: Heat Capacity of Paramagnet*

  Derive $C_B$ for a paramagnet at fixed $B$.
]

#solution[
  From
  $
  U = -N μ B tanh(frac(μ B, k T)),
  $
  differentiate:
  $
  C_B = dv(U, T)
  = N k (frac(μ B, k T))^2 frac(1, cosh^2(frac(μ B, k T))).
  $
]

#pbm("37")[
  *Conceptual: Negative Temperature*

  Explain mathematically why a two-state paramagnet can have negative temperature and interpret it physically.
]

#solution[
  The entropy $S(U)$ increases with $U$ up to $U = 0$ and then *decreases* for $U > 0$ because states near $M = -N$ are again fewer. Thus $pdv(S, U)$ becomes negative for high-energy states, implying
  $
  frac(1, T) = pdv(S, U) < 0
  $
  and $T$ is negative.

  Physically, negative temperature means the system is inverted (more spins against the field than with it) and is hotter than any positive-temperature system; it will dump energy to any positive-$T$ reservoir.
]

#pagebreak()

= Module 5: Thermodynamic Identity & Maxwell Relations

#pbm("38")[
  *Definition: Thermodynamic Identity*

  Write down the fundamental thermodynamic identity for $dif U$ and interpret each term.
]

#solution[
  The identity is
  $
  dif U = T dif S - P dif V + μ dif N.
  $
  It decomposes energy change into heat flow ($T dif S$), work ($-P dif V$), and chemical work ($μ dif N$).
]

#pbm("39")[
  *Conceptual: Exact vs Inexact Differentials*

  Explain the difference between an exact and an inexact differential. Give thermodynamic examples.
]

#solution[
  An exact differential is the differential of a state function, e.g., $dif U$ or $dif S$. Its integral depends only on endpoints.
  An inexact differential depends on the path, e.g., $dif Q$ or $dif W$.
]

#pbm("40")[
  *Clausius Inequality*

  State the Clausius inequality and the condition for equality.
]

#solution[
  Clausius:
  $
  integral frac(dif Q, T) <= Delta S.
  $
  Equality holds for a reversible process.
]

#pbm("41")[
  *Definitions: $H, F, G$*

  Define enthalpy $H$, Helmholtz free energy $F$, and Gibbs free energy $G$.
]

#solution[
  $
  H = U + P V,
  quad
  F = U - T S,
  quad
  G = U + P V - T S.
  $
]

#pagebreak()

#pbm("42")[
  *Derivation: Maxwell Relation from $dif U$*

  Starting from $dif U = T dif S - P dif V$, derive
  $
  pdv(T, V)_S = -pdv(P, S)_V.
  $
]

#solution[
  Treat $U = U(S, V)$. Then
  $
  dif U = pdv(U, S)_V dif S + pdv(U, V)_S dif V.
  $
  Identifying coefficients gives
  $
  T = pdv(U, S)_V,
  quad
  -P = pdv(U, V)_S.
  $
  Equality of mixed partials implies
  $
  pdv(T, V)_S = pdv^2(U, V, S) = -pdv(P, S)_V.
  $
]

#pbm("43")[
  *Derivation: Helmholtz Free Energy Maxwell Relation*

  Write $dif F$ and derive the associated Maxwell relation.
]

#solution[
  $F = U - T S$ gives
  $
  dif F = -S dif T - P dif V + μ dif N.
  $
  For fixed $N$, $F = F(T, V)$, so
  $
  S = -pdv(F, T)_V,
  quad
  P = -pdv(F, V)_T.
  $
  Mixed partials yield
  $
  pdv(S, V)_T = pdv(P, T)_V.
  $
]

#pagebreak()

#pbm("44")[
  *Derivation: Gibbs Free Energy Maxwell Relation*

  Write $dif G$ and derive the associated Maxwell relation.
]

#solution[
  $G = U + P V - T S$ gives
  $
  dif G = -S dif T + V dif P + μ dif N.
  $
  For fixed $N$, $G = G(T, P)$, so
  $
  S = -pdv(G, T)_P,
  quad
  V = pdv(G, P)_T.
  $
  Thus
  $
  pdv(S, P)_T = -pdv(V, T)_P.
  $
]

#pbm("45")[
  *Derivation: Entropy Change at Constant $V$*

  Show that for constant $V$ and $N$, $dif S = frac(C_V, T) dif T$.
]

#solution[
  At constant $V$, $dif Q = C_V dif T$ and for reversible processes $dif Q = T dif S$. Hence
  $
  dif S = frac(C_V, T) dif T.
  $
]

#pbm("46")[
  *Derivation: Inexactness of $dif Q$*

  Show that $dif Q = C_V dif T + P dif V$ is inexact for an ideal gas.
]

#solution[
  For an ideal gas, $C_V = C_V(T)$ and $P = frac(N k T, V)$, so
  $
  dif Q = C_V dif T + frac(N k T, V) dif V.
  $
  If $dif Q$ were exact, cross-derivatives would match:
  $
  pdv(C_V, V)_T = pdv(frac(N k T, V), T)_V = frac(N k, V).
  $
  But $C_V$ is independent of $V$, so the left side is zero. Hence $dif Q$ is inexact.
]

#pagebreak()

= Module 6: Applied Processes & Cycles

#pbm("47")[
  *Free Expansion*

  An ideal gas expands freely into a vacuum and doubles its volume. Find $W$, $Q$, $Delta U$, and $Delta S$. Explain why $Delta S > integral frac(dif Q, T)$.
]

#solution[
  Free expansion against vacuum gives $W = 0$. For an ideal gas, $U$ depends only on $T$, and the walls are insulated, so $Q = 0$ and $Delta U = 0$.

  The entropy change is computed along a reversible isothermal path:
  $
  Delta S = N k ln frac(V_2, V_1) = N k ln 2.
  $
  Since $Q = 0$, $integral frac(dif Q, T) = 0$ but $Delta S > 0$ because the process is irreversible.
]

#pbm("48")[
  *Irreversible Heating*

  A metal block at temperature $T_h$ is dropped into a large lake at temperature $T_c < T_h$. Set up the entropy change of the universe and show it is positive.
]

#solution[
  The block cools from $T_h$ to $T_c$, and the lake is a reservoir at $T_c$.
  For the block,
  $
  Delta S_("block") = integral_(T_h)^(T_c) frac(C, T) dif T.
  $
  Heat released is
  $
  Q = integral_(T_c)^(T_h) C dif T > 0,
  $
  so lake entropy change is
  $
  Delta S_("lake") = frac(Q, T_c).
  $
  Thus
  $
  Delta S_("univ") = Delta S_("block") + Delta S_("lake")
  = integral_(T_h)^(T_c) frac(C, T) dif T + frac(1, T_c) integral_(T_c)^(T_h) C dif T.
  $
  Since $frac(1, T_c) > frac(1, T)$ over the cooling path, the sum is positive, so $Delta S_("univ") > 0$.
]

#pagebreak()

#pbm("49")[
  *Heat‑Engine Cycle*

  Consider a cycle: (1) isothermal expansion at $T_h$ from $V_1$ to $V_2$; (2) isochoric cooling to $T_l$; (3) adiabatic compression back to $V_1$; (4) isochoric heating to $T_h$. Compute $W$, $Q$, and $Delta U$ for each step.
]

#solution[
  *Step 1 (isothermal at $T_h$)*:
  $
  W_1 = N k T_h ln frac(V_2, V_1),
  quad
  Delta U_1 = 0,
  quad
  Q_1 = W_1.
  $

  *Step 2 (isochoric cooling)*:
  $
  W_2 = 0,
  quad
  Delta U_2 = N k frac(f, 2) (T_l - T_h),
  quad
  Q_2 = Delta U_2.
  $

  *Step 3 (adiabatic compression)*:
  $
  Q_3 = 0,
  quad
  Delta U_3 = N k frac(f, 2) (T_h - T_l),
  quad
  W_3 = -Delta U_3.
  $

  *Step 4 (isochoric heating)*:
  $
  W_4 = 0,
  quad
  Delta U_4 = N k frac(f, 2) (T_h - T_l),
  quad
  Q_4 = Delta U_4.
  $
]

#pbm("50")[
  *Otto Cycle Efficiency*

  Derive the efficiency of an ideal Otto cycle in terms of the compression ratio, showing
  $
  e = 1 - (frac(V_2, V_1))^(gamma - 1).
  $
]

#solution[
  In an Otto cycle, heat is added and removed at constant volume:
  $
  Q_("in") = N k frac(f, 2) (T_3 - T_2),
  quad
  Q_("out") = N k frac(f, 2) (T_4 - T_1).
  $
  Thus
  $
  e = 1 - frac(Q_("out"), Q_("in")) = 1 - frac(T_4 - T_1, T_3 - T_2).
  $
  The adiabatic relations give
  $
  T_2 V_2^(gamma - 1) = T_1 V_1^(gamma - 1),
  quad
  T_3 V_2^(gamma - 1) = T_4 V_1^(gamma - 1).
  $
  Hence
  $
  frac(T_4, T_3) = frac(T_1, T_2) = (frac(V_2, V_1))^(gamma - 1).
  $
  Substituting into the efficiency expression yields
  $
  e = 1 - (frac(V_2, V_1))^(gamma - 1).
  $
]
