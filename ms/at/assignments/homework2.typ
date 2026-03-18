#import "../shared/_at.typ": *

#show: ad.with(
  title: "Homework 2",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3267* \
  Biophysics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#let imath(body) = text(size: 1.1em)[#body]

#pbm("1")[
  Consider a molecule of a folded globular (ball-shaped) protein of mass $1.66 times 10^(-22)$ kg and radius 3 nm in a solution at temperature 37.0° Celsius. The viscosity of the solution is $1.00 times 10^(-3)$ Ns/m².

  *(1)* If the protein molecule is in thermal equilibration with the solution environment, and undergoes Brownian motion, what is the root-mean-square speed ($sqrt(chevron.l v^2 chevron.r)$) of the protein molecule (consider 1-dimensional Brownian motion for simplicity)?

  *(2)* What is the frictional coefficient of the protein molecule?

  *(3)* What is the viscous force for the protein molecule if it moves in a directional motion with the speed as big as the root-mean-square speed found in (1)?

  *(4)* What is the gravitational force of the protein? Compare the gravitational force to the viscous force found in (3), and tell what it means for the motion of the protein molecule.
]

#solution[
  *Part (1): RMS speed from equipartition*

  For one-dimensional Brownian motion, equipartition assigns #imath[$frac(1, 2) k_B T$] of kinetic energy to the single translational degree of freedom:
  $
  frac(1, 2) m chevron.l v^2 chevron.r = frac(1, 2) k_B T
  $
  Solving for the RMS speed,
  $
  v_("rms") = sqrt(frac(k_B T, m))
  $
  With $T = 37.0° "C" = 310.15$ K, $m = 1.66 times 10^(-22)$ kg, and $k_B = 1.381 times 10^(-23)$ J/K:
  $
  v_("rms") = sqrt(frac(1.381 times 10^(-23) times 310.15, 1.66 times 10^(-22))) = sqrt(25.8) ≈ 5.08 text(" m/s")
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Stokes frictional coefficient*

  For a sphere of radius $r$ moving through a fluid of viscosity $eta$, Stokes' law gives
  $
  gamma = 6 pi eta r = 6 pi (1.00 times 10^(-3))(3 times 10^(-9)) ≈ 5.65 times 10^(-11) text(" Ns/m")
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Viscous force at RMS speed*

  If the protein translates with speed $v_("rms")$, the viscous drag force is
  $
  F_("visc") = gamma v_("rms") = (5.65 times 10^(-11))(5.08) ≈ 2.87 times 10^(-10) text(" N")
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (4): Gravitational force and comparison*

  $
  F_("grav") = m g = (1.66 times 10^(-22))(9.81) ≈ 1.63 times 10^(-21) text(" N")
  $
  The ratio is
  $
  frac(F_("grav"), F_("visc")) ≈ frac(1.63 times 10^(-21), 2.87 times 10^(-10)) ≈ 5.7 times 10^(-12)
  $
  Gravity is weaker than the viscous drag by roughly 12 orders of magnitude. At the molecular scale, inertia and gravity play no dynamical role; the motion of the protein is entirely governed by thermal fluctuations and viscous friction, placing it firmly in the overdamped (low Reynolds number) regime.
]

#pbm("2")[
  Consider a globular protein with a radius $r = 10$ nm and a molecular weight of 8 kilo Daltons diffusing inside a human cell. Suppose the cell is 5 micrometers across and is under a constant temperature of 37° Celsius. The viscosity of the cellular medium is $10^(-2)$ Ns/m².

  *(1)* What are the frictional coefficient and the diffusion coefficient for the protein?

  *(2)* How long does it take, on average, for the protein to diffuse across the entire cell, namely for the root-mean-square displacement of the protein molecule to cover the cell's size?

  *(3)* What is the relaxation time for this protein in the cell?

  *(4)* How does the relaxation time compare to the drift time obtained from question (2)?
]

#solution[
  *Part (1): Friction and diffusion coefficients*

  Stokes friction coefficient:
  $
  gamma = 6 pi eta r = 6 pi (10^(-2))(10 times 10^(-9)) ≈ 1.88 times 10^(-9) text(" Ns/m")
  $
  The Einstein relation connects diffusion to friction:
  $
  D = frac(k_B T, gamma) = frac(1.381 times 10^(-23) times 310.15, 1.88 times 10^(-9)) ≈ 2.27 times 10^(-12) text(" m²/s")
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Diffusion time across the cell*

  For one-dimensional diffusion, the mean-square displacement grows as #imath[$chevron.l x^2 chevron.r = 2 D t$]. Setting the RMS displacement equal to the cell diameter $L = 5 mu$m:
  $
  L^2 = 2 D t quad => quad t = frac(L^2, 2 D) = frac((5 times 10^(-6))^2, 2 times 2.27 times 10^(-12)) ≈ 5.5 text(" s")
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Relaxation time*

  The inertial relaxation time is #imath[$tau = m slash gamma$]. Converting the molecular weight:
  $
  m = 8000 times 1.66 times 10^(-27) ≈ 1.33 times 10^(-23) text(" kg")
  $
  $
  tau = frac(m, gamma) = frac(1.33 times 10^(-23), 1.88 times 10^(-9)) ≈ 7.0 times 10^(-15) text(" s") ≈ 7 text(" fs")
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (4): Comparison of timescales*

  $
  frac(t_("diff"), tau) ≈ frac(5.5, 7.0 times 10^(-15)) ≈ 7.8 times 10^(14)
  $
  The diffusion time exceeds the relaxation time by $tilde 10^(15)$ times. The protein loses all memory of its initial velocity in femtoseconds, whereas traversing the cell by diffusion takes seconds. On every biologically relevant timescale, inertia is irrelevant and the motion is purely diffusive (overdamped).
]

#pbm("3")[
  From the diffusion equation we have obtained the concentration as a Gaussian distribution as follows. Here we consider one-dimensional space for simplicity, with $N$ as the total number of Brownian particles (identical copies) and $D$ their diffusion coefficient.
  $
  c(x, t) = frac(N, sqrt(4 pi D t)) e^(-x^2 slash (4 D t))
  $

  *(1)* Prove that integrating the concentration distribution recovers the particle number $N$:
  $
  integral_(-infinity)^(+infinity) c(x, t) dif x = N
  $

  *(2)* Prove that the average displacement is zero:
  $
  chevron.l x chevron.r = frac(1, N) integral_(-infinity)^(+infinity) x thin c(x, t) dif x = 0
  $
]

#solution[
  *Part (1): Total particle number*

  Substitute the Gaussian form:
  $
  integral_(-infinity)^(+infinity) c(x, t) dif x = frac(N, sqrt(4 pi D t)) integral_(-infinity)^(+infinity) e^(-x^2 slash (4 D t)) dif x
  $
  Introduce the substitution $u = frac(x, sqrt(4 D t))$ so that $dif x = sqrt(4 D t) thin dif u$:
  $
  = frac(N, sqrt(4 pi D t)) dot sqrt(4 D t) integral_(-infinity)^(+infinity) e^(-u^2) dif u = frac(N, sqrt(pi)) dot sqrt(pi) = N
  $
  where we used the standard Gaussian integral #imath[$integral_(-infinity)^(+infinity) e^(-u^2) dif u = sqrt(pi)$]. $square.filled$

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Mean displacement vanishes*

  $
  chevron.l x chevron.r = frac(1, N) integral_(-infinity)^(+infinity) x thin c(x, t) dif x = frac(1, sqrt(4 pi D t)) integral_(-infinity)^(+infinity) x e^(-x^2 slash (4 D t)) dif x
  $
  The integrand $f(x) = x e^(-x^2 slash (4 D t))$ is the product of the odd function $x$ and the even function $e^(-x^2 slash (4 D t))$, so $f(x)$ is odd: $f(-x) = -f(x)$. The integral of an odd function over the symmetric domain $(-infinity, +infinity)$ is identically zero:
  $
  chevron.l x chevron.r = 0
  $
  Physically, diffusion from a point source is equally probable in both directions, so the mean displacement vanishes even though the mean-square displacement $chevron.l x^2 chevron.r = 2 D t$ grows with time. $square.filled$
]

#pagebreak()

#pbm("4")[
  Following the treatment of charge screening in the lecture notes, prove the following relations.

  *(a)* In the Debye--Hückel (linearised) regime, the ion concentration difference at the surface is
  $
  c_+(0) - c_-(0) = -frac(sigma, Z e lambda_D)
  $
  where $sigma$ is the surface charge density, $Z e$ the ion charge, and $lambda_D$ the Debye length.

  *(b)* In the same linear regime,
  $
  c_+(x) + c_-(x) = 2 c_infinity
  $
]

#solution[
  *Part (a): Concentration difference at the surface*

  In the Debye--Hückel model the electrostatic potential near a uniformly charged planar surface decays exponentially:
  $
  phi(x) = phi_0 thin e^(-x slash lambda_D) quad (x >= 0)
  $
  Gauss's law at the surface relates the field to the surface charge density:
  $
  epsilon lr(dv(phi, x)|)_(x=0) = -sigma
  $
  Evaluating the derivative gives $-epsilon phi_0 slash lambda_D = -sigma$, so
  $
  phi_0 = frac(sigma lambda_D, epsilon)
  $
  In the linearised Boltzmann approximation ($Z e phi << k_B T$), the ion concentrations are
  $
  c_(plus.minus)(x) ≈ c_infinity (1 minus.plus frac(Z e phi(x), k_B T))
  $
  At $x = 0$:
  $
  c_+(0) - c_-(0) ≈ -frac(2 c_infinity Z e phi_0, k_B T) = -frac(2 c_infinity Z e, k_B T) dot frac(sigma lambda_D, epsilon)
  $
  The Debye length satisfies #imath[$lambda_D^2 = frac(epsilon k_B T, 2 c_infinity Z^2 e^2)$], giving $epsilon k_B T = 2 c_infinity Z^2 e^2 lambda_D^2$. Substituting:
  $
  c_+(0) - c_-(0) = -frac(2 c_infinity Z e thin sigma lambda_D, 2 c_infinity Z^2 e^2 lambda_D^2) = -frac(sigma, Z e lambda_D)
  $
  $square.filled$

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (b): Total ion concentration is uniform*

  Adding the two linearised expressions:
  $
  c_+(x) + c_-(x) ≈ c_infinity (1 - frac(Z e phi, k_B T)) + c_infinity (1 + frac(Z e phi, k_B T)) = 2 c_infinity
  $
  The first-order terms in the potential cancel exactly. Within the Debye--Hückel approximation, the total ion concentration remains spatially uniform at $2 c_infinity$ even though the individual species are redistributed by the electric field. $square.filled$
]

#pagebreak()

#pbm("5")[
  Following the treatment of charge screening in the lecture notes, prove the following relations.

  *(a)* Prove that the cation concentration satisfies
  $
  c_+(x) = frac(1, 2) [frac(rho(x), Z e) + sqrt(frac(rho(x)^2, Z^2 e^2) + 4 c_infinity^2)]
  $

  *(b)* Prove that the anion concentration satisfies
  $
  c_-(x) = frac(1, 2) [-frac(rho(x), Z e) + sqrt(frac(rho(x)^2, Z^2 e^2) + 4 c_infinity^2)]
  $

  *(c)* Prove that $c_+(x)$ is always above $c_infinity$.

  *(d)* Prove that $c_-(x)$ is always below $c_infinity$.
]

#solution[
  *Parts (a) and (b): Exact concentrations from Boltzmann*

  From the full (non-linearised) Boltzmann distributions, #imath[$c_+(x) = c_infinity e^(-Z e phi slash k_B T)$] and #imath[$c_-(x) = c_infinity e^(+Z e phi slash k_B T)$], two exact algebraic identities follow.

  *Identity 1 --- product:*
  $
  c_+(x) dot c_-(x) = c_infinity^2 thin e^(-Z e phi slash k_B T) dot e^(+Z e phi slash k_B T) = c_infinity^2
  $

  *Identity 2 --- charge density:*
  $
  rho(x) = Z e [c_+(x) - c_-(x)] quad ==> quad c_+(x) - c_-(x) = frac(rho(x), Z e)
  $

  Let $d equiv c_+ - c_- = rho slash (Z e)$ and $s equiv c_+ + c_-$. From the product identity:
  $
  c_+ dot c_- = frac(s^2 - d^2, 4) = c_infinity^2 quad ==> quad s = sqrt(d^2 + 4 c_infinity^2) = sqrt(frac(rho^2, Z^2 e^2) + 4 c_infinity^2)
  $
  where $s > 0$ since both concentrations are positive. Solving the linear system $c_+ + c_- = s$, $c_+ - c_- = d$:
  $
  c_+(x) = frac(s + d, 2) = frac(1, 2) [frac(rho, Z e) + sqrt(frac(rho^2, Z^2 e^2) + 4 c_infinity^2)]
  $
  $
  c_-(x) = frac(s - d, 2) = frac(1, 2) [-frac(rho, Z e) + sqrt(frac(rho^2, Z^2 e^2) + 4 c_infinity^2)]
  $
  $square.filled$

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (c): $c_+(x) >= c_infinity$*

  Consider a negatively charged surface, the standard biological context (e.g.\ a cell membrane). The screening cloud carries a net positive charge density, so $rho(x) >= 0$ and hence $d = rho slash (Z e) >= 0$.

  From the Boltzmann factor directly: the electrostatic potential is $phi(x) <= 0$ near a negative surface, so
  $
  c_+(x) = c_infinity e^(-Z e phi slash k_B T) = c_infinity e^(Z e |phi| slash k_B T) >= c_infinity
  $
  since the exponent is non-negative. Equality holds only at $x -> infinity$ where $phi -> 0$. $square.filled$

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (d): $c_-(x) <= c_infinity$*

  From the product identity, #imath[$c_- = c_infinity^2 slash c_+$]. Since $c_+(x) >= c_infinity$ (part (c)):
  $
  c_-(x) = frac(c_infinity^2, c_+(x)) <= frac(c_infinity^2, c_infinity) = c_infinity
  $
  Physically, counterions (cations near a negative surface) accumulate above their bulk concentration while co-ions (anions) are repelled below their bulk concentration. This charge separation constitutes the electric double layer. $square.filled$
]

#pbm("6")[
  A molecule of a folded globular (ball-shaped) protein of radius 3 nm undergoes electrophoresis in a solution at temperature 25.0° Celsius. The protein molecule has a mass of $1.66 times 10^(-22)$ kg and carries a net positive charge of $4.80 times 10^(-19)$ C. An electric field of $5.20 times 10^8$ N/C is applied along the $x$ direction to induce a constant-speed electrophoresis of the protein molecule along the $x$ direction. The viscosity of the solution is $1.00 times 10^(-3)$ Ns/m².

  *(1)* What is the average speed of the protein molecule along the $x$ direction?

  *(2)* What is the root-mean-square (rms) speed for the protein molecule along $x$, $y$ and $z$ directions?

  *(3)* Suppose an experiment is done to record positions of many molecules of the same protein undergoing the same electrophoresis at different time $t$. Then the protein's mean-square displacement is counted along each direction, and $log chevron.l x^2 chevron.r$, $log chevron.l y^2 chevron.r$, $log chevron.l z^2 chevron.r$ are plotted versus $log(t)$ to yield the slope $alpha$ for each direction. What are the $alpha$ values for $x$, $y$, and $z$ direction?
]

#solution[
  *Part (1): Drift speed from force balance*

  At terminal (constant) speed the electric driving force equals viscous drag:
  $
  q E = gamma v_("drift")
  $
  With Stokes friction #imath[$gamma = 6 pi eta r = 6 pi (10^(-3))(3 times 10^(-9)) ≈ 5.65 times 10^(-11)$ Ns/m]:
  $
  v_("drift") = frac(q E, gamma) = frac(4.80 times 10^(-19) times 5.20 times 10^8, 5.65 times 10^(-11)) ≈ 4.41 text(" m/s")
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): RMS thermal speed*

  Equipartition for each translational degree of freedom gives #imath[$frac(1,2) m chevron.l v_i^2 chevron.r = frac(1,2) k_B T$], so
  $
  v_("rms") = sqrt(frac(k_B T, m))
  $
  This is identical for all three directions ($x$, $y$, $z$) since the thermal velocity distribution is isotropic and independent of the applied field. With $T = 298.15$ K:
  $
  v_("rms") = sqrt(frac(1.381 times 10^(-23) times 298.15, 1.66 times 10^(-22))) ≈ 4.98 text(" m/s")
  $
  The RMS thermal speed is comparable to the drift speed, indicating that the protein experiences significant thermal fluctuations even during electrophoresis.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): MSD scaling exponents*

  Along $y$ and $z$ there is no applied force, so the motion is purely diffusive:
  $
  chevron.l y^2 chevron.r = 2 D t, quad chevron.l z^2 chevron.r = 2 D t quad ==> quad alpha_y = alpha_z = 1
  $

  Along $x$, the protein drifts at constant speed $v_("drift")$ while simultaneously diffusing. The two contributions to the MSD are independent:
  $
  chevron.l x^2 chevron.r = (v_("drift") t)^2 + 2 D t = v_("drift")^2 t^2 + 2 D t
  $
  At long times the ballistic (drift) term $∝ t^2$ dominates the diffusive term $∝ t$, so
  $
  log chevron.l x^2 chevron.r ≈ 2 log t + "const" quad ==> quad alpha_x = 2
  $
  The crossover occurs at $t^* = 2 D slash v_("drift")^2$; for $t >> t^*$ the motion along $x$ is ballistic.
]

#pbm("7")[
  A protein domain is unfolded under a mechanical force. The unfolded polypeptide is 50 nm long when fully stretched. The persistence length is 0.4 nm. Suppose the two ends of the unfolded polypeptide are held at a distance of 25 nm. Use the worm-like chain formula to calculate the force the polypeptide exerts at the ends.
]

#solution[
  The Marko--Siggia interpolation formula for a worm-like chain gives the entropic force as a function of fractional extension $z = x slash L_c$:
  $
  f = frac(k_B T, l_p) [frac(1, 4(1 - z)^2) - frac(1, 4) + z]
  $
  Here $L_c = 50$ nm (contour length), $l_p = 0.4$ nm (persistence length), and $x = 25$ nm, so $z = 0.5$. The dimensionless force factor evaluates to
  $
  frac(1, 4(1 - 0.5)^2) - frac(1, 4) + 0.5 = frac(1, 4 dot 0.25) - 0.25 + 0.5 = 1.0 - 0.25 + 0.5 = 1.25
  $
  At room temperature ($T = 298$ K), #imath[$k_B T ≈ 4.12 times 10^(-21)$ J] and #imath[$k_B T slash l_p ≈ 1.03 times 10^(-11)$ N], so
  $
  f = 1.03 times 10^(-11) times 1.25 ≈ 1.29 times 10^(-11) text(" N") ≈ 12.9 text(" pN")
  $
  This is within the typical range of forces measured in single-molecule mechanical unfolding experiments (1--100 pN).
]


#pbm("8")[
  *(Optional question)*

  The linear thermal expansion coefficient for a material is #imath[$alpha = frac(1, L) dv(L, T)$], in which $L$ is the end-to-end length and $T$ the temperature.

  *(1)* Use the Marko--Siggia formula to derive $alpha$ for a worm-like-chain polymer under a constant stretching force $f$.

  *(2)* Is $alpha$ positive or negative? Explain the physical meaning of your result.
]

#solution[
  *Part (1): Derivation of $alpha$*

  The Marko--Siggia formula gives
  $
  f = frac(k_B T, l_p) h(z), quad h(z) equiv frac(1, 4(1 - z)^2) - frac(1, 4) + z
  $
  where $z = L slash L_c$ is the fractional extension. Define the dimensionless force
  $
  xi equiv frac(f l_p, k_B T) = h(z)
  $
  At constant applied force $f$ (and constant persistence length $l_p$), $xi$ depends on $T$ as #imath[$xi = f l_p slash (k_B T)$]. Differentiating:
  $
  dv(xi, T) = -frac(f l_p, k_B T^2) = -frac(xi, T)
  $
  Since $xi = h(z)$, the chain rule gives
  $
  dv(xi, T) = h'(z) dv(z, T) quad ==> quad dv(z, T) = -frac(xi, T h'(z))
  $
  where
  $
  h'(z) = dv(h, z) = frac(1, 2(1 - z)^3) + 1
  $
  The thermal expansion coefficient is
  $
  alpha = frac(1, L) dv(L, T) = frac(1, z L_c) dot L_c dv(z, T) = frac(1, z) dv(z, T)
  $
  Substituting the result above:
  $
  alpha = -frac(xi, z T h'(z)) = -frac(h(z), z T [frac(1, 2(1 - z)^3) + 1])
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Sign and physical interpretation*

  Since $h(z) > 0$, $z > 0$, $T > 0$, and $h'(z) > 0$ for all $0 < z < 1$, we have
  $
  alpha < 0
  $
  The polymer _contracts_ when heated under constant tension.

  This is the hallmark of entropic elasticity: stretching a polymer reduces its conformational entropy, and raising the temperature amplifies the entropic restoring force ($f_("entropic") ∝ T$). At a fixed applied force, the stronger thermal tendency to maximize entropy pulls the chain ends closer together, reducing the extension. This is the molecular origin of the Gough--Joule effect observed in rubber, where a rubber band under tension contracts when heated --- the opposite of ordinary thermal expansion in crystalline solids, which is driven by anharmonic interatomic potentials.
]
