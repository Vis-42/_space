#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 12",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("5.7")[
  A ball $P$ of mass $2m$ is suspended by two light inextensible strings of length $a$ from two sliders $Q$ and $R$, each of mass $m$, which can move on a smooth horizontal rail. The system moves symmetrically so that $O$, the midpoint of $Q$ and $R$, remains fixed and $P$ moves on the downward vertical through $O$. Initially, the system is released from rest with the three particles in a straight line and with the strings taut. Ignore gravitational forces between masses.

  #fig(image("../../../../_zss/d 41.png"), width:60%, border: false)

  *Tension forces* exerted by the inextensible strings do zero work in total. Why?

  Derive the first order differential equation governing the dynamics of the system.
]

#solution[
  *Proof that tension forces do zero work:*

  Given that $[vb(r)_alpha (t) - vb(r)_beta (t)] dot [vb(r)_alpha (t) - vb(r)_beta (t)] = "constant"$,

  $ dv(, t) [vb(r)_alpha (t) - vb(r)_beta (t)] dot [vb(r)_alpha (t) - vb(r)_beta (t)] = 0 $

  $ => [dot(vb(r))_alpha(t) - dot(vb(r))_beta(t)] dot [vb(r)_alpha (t) - vb(r)_beta (t)] + [vb(r)_alpha (t) - vb(r)_beta (t)] dot [dot(vb(r))_alpha(t) - dot(vb(r))_beta(t)] = 0 $

  $ => 2[vb(r)_alpha (t) - vb(r)_beta (t)] dot [dot(vb(r))_alpha(t) - dot(vb(r))_beta(t)] = 0 $

  $ => [vb(r)_alpha (t) - vb(r)_beta (t)] dot [dot(vb(r))_alpha - dot(vb(r))_beta ) = 0 $

  The string tension $vb(f)_(alpha beta)$ is parallel to $(vb(r)_alpha - vb(r)_beta)$, so $vb(f)_(alpha beta) dot (dot(vb(r))_alpha - dot(vb(r))_beta)= 0$.

  Therefore,
  $ W = integral_(t_1)^(t_2) vb(f)_(alpha beta) (t) dot dot(vb(r))_alpha(t) dif(t) + integral_(t_1)^(t_2) vb(f)_(beta alpha) (t) dot dot(vb(r))_beta(t) dif(t) = integral_(t_1)^(t_2) vb(f)_(alpha beta) (t) dot [dot(vb(r))_alpha(t) - dot(vb(r))_beta(t)] dif(t) = 0 $

  This shows that tension forces exerted by inextensible strings do zero work in total.

  *Dynamics of the system:*

  For the three-particle system, we set up coordinates with $O$ at origin. Due to symmetric motion, $Q$ and $R$ (mass $m$ each) move equal distances from $O$ along $y$-axis, while $P$ (mass $2m$) moves vertically below $O$. With string length $a$ and angle $theta$ from vertical:

  $ cases(
    vb(r)_1 (t) = vb(r)_R (t) = -a cos theta(t) vu(e)_y,
    vb(r)_2 (t) = vb(r)_Q (t) = +a cos theta(t) vu(e)_y,
    vb(r)_3 (t) = vb(r)_P (t) = -a sin theta(t) vu(e)_z
  ) quad => quad cases(
    dot(vb(r))_1(t) = +a dot(theta)(t) sin theta(t) vu(e)_y,
    dot(vb(r))_2(t) = -a dot(theta)(t) sin theta(t) vu(e)_y,
    dot(vb(r))_3(t) = -a dot(theta)(t) cos theta(t) vu(e)_z
  ) $

  The kinetic energy is:
  $ T(t) &= 1/2 m a^2 dot(theta)^2 sin^2 theta + 1/2 m a^2 dot(theta)^2 sin^2 theta + 1/2 (2m) a^2 dot(theta)^2 cos^2 theta \
  &= m a^2 dot(theta)^2 (sin^2 theta + cos^2 theta) = m a^2 dot(theta)^2 (t) $

  The potential energy due to gravity (taking rail level as reference):
  $ U^"ext" (vb(r)_1 (t), vb(r)_2 (t), vb(r)_3 (t)) = m g dot 0 + m g dot 0 + 2m g(-a sin theta(t)) = -2m g a sin theta(t) $

  The external non-conservative forces (rail normal forces) do zero work: $W_"nc" = 0$

  For internal constraint forces (string tensions), since the strings are inextensible: $W_"strings" = 0$

  Since all constraint forces do zero work: $U^"int" (vb(r)_1 (t), vb(r)_2 (t), vb(r)_3 (t)) = 0$

  The total energy is:
  $ E(t) = -2m g a sin theta(t) + m a^2 dot(theta)^2 (t) $

  *Initially* (particles in straight line, released from rest): $theta(0) = 0$, $dot(theta) (0) = 0$

  $ E(0) = m a^2 dot 0^2 - 2m g a sin(0) = 0 $

  By conservation of energy,
  $ E(t) = E(0) = 0 quad => quad m a^2 dot(theta)^2 (t) - 2m g a sin theta(t) = 0 $

  #boxed[$ dot(theta)^2 (t) - (2g)/a sin theta(t) = 0 $]
]

#pbm("5.8")[
  A block of mass $m$ is projected from $x(0) = +a$ with $dot(x)(0) = -u$ along the $x$-axis under action of a spring with spring constant $k$. Obtain the first order differential equation governing the dynamics of the block and solve for $x(t)$.
]

#solution[
  The total energy of the system is:
  $ E(t) = U(x(t)) + 1/2 m dot(x)^2 (t) = 1/2 k x^2 (t) + 1/2 m dot(x)^2 (t) $

  At $t = 0$:
  $ E equiv E(0) = 1/2 k a^2 + 1/2 m u^2 > 0 $

  By conservation of energy:
  $ & quad 1/2 k x^2 (t) + 1/2 m dot(x)^2 (t) = E\
   & = > dot(x)(t) = plus.minus sqrt(2/m) sqrt(E - 1/2 k x^2 (t)) \
   & = > dot(x)(t) = -sqrt(2/m) sqrt(E - 1/2 k x^2 (t)) quad quad [because dot(x) (0) = -u < 0]\
   & = > dv(x, sqrt(E - 1/2 k x^2)) = -sqrt(2/m) dif(t) \
   & = > integral_a^x (dif(x')/(sqrt(E - 1/2 k (x')^2))) = -sqrt(2/m) t \
   & = > t = -sqrt(m/k) [arcsin(sqrt(k/(2E)) x) - arcsin(sqrt(k/(2E)) a)] \
   & = > -sqrt(k/m) t = arcsin(sqrt(k/(2E)) x) - arcsin(sqrt(k/(2E)) a) \
   & = > arcsin(sqrt(k/(2E)) x) = -sqrt(k/m) t + arcsin(sqrt(k/(2E)) a) \
   & = > sqrt(k/(2E)) x = sin[-sqrt(k/m) t + arcsin(sqrt(k/(2E)) a)] \
   & = > x(t) = sqrt((2E)/k) sin[-sqrt(k/m) t + arcsin(sqrt(k/(2E)) a)] $

  Substituting $E = 1/2 k a^2 + 1/2 m u^2$ and using trigonometric identities:

  $ & quad x(t) = sqrt(a^2 + (m u^2)/k) sin[-sqrt(k/m) t + arcsin(a/(sqrt(a^2 + (m u^2)/k)))] \
   & = > x(t) = sqrt(a^2 + (m u^2)/k) [sin(arcsin(a/(sqrt(a^2 + (m u^2)/k)))) cos(sqrt(k/m) t) \ & #h(4cm) - cos(arcsin(a/(sqrt(a^2 + (m u^2)/k)))) sin(sqrt(k/m) t)] \
   & = > x(t) = sqrt(a^2 + (m u^2)/k) [a/(sqrt(a^2 + (m u^2)/k)) cos(sqrt(k/m) t) - (sqrt((m u^2)/k))/(sqrt(a^2 + (m u^2)/k)) sin(sqrt(k/m) t)] $

  #boxed[$ x(t) = a cos(sqrt(k/m) t) - sqrt(m/k) u sin(sqrt(k/m) t) $]
]

#pagebreak()

#pbm("5.9")[
  Derive the expression for the approximate period for small amplitude oscillations about $x = x_0$.
]

#solution[
  For small oscillations about an equilibrium point $x_0$, we expand the potential in a Taylor series:
  $ U(x)≈U(x_0) + 1/2 U''(x_0) (x - x_0)^2 $

  where $U'(x_0) = 0$ at equilibrium. Let $A$ be the amplitude of oscillation, so the turning points are $x_1 = x_0 - A$ and $x_2 = x_0 + A$.

  The energy at the turning points is:
  $ E = U(x_1) = U(x_0) + 1/2 U''(x_0) (x_1 - x_0)^2 = U(x_0) + 1/2 U''(x_0) A^2 $
  $ E = U(x_2) = U(x_0) + 1/2 U''(x_0) (x_2 - x_0)^2 = U(x_0) + 1/2 U''(x_0) A^2 $

  Therefore:
  $ E - U(x) = U(x_0) + 1/2 U''(x_0) A^2 - [U(x_0) + 1/2 U''(x_0) (x - x_0)^2] $
  $ = > E - U(x) = 1/2 U''(x_0) [A^2 - (x - x_0)^2] $

  The period is given by:
  $ T = 4 sqrt(m/2) integral_(x_0)^(x_0 + A) (dif(x))/(sqrt(E - U(x))) $

  $ = > T = 4 sqrt(m/2) integral_(x_0)^(x_0 + A) (dif(x))/(sqrt(1/2 U''(x_0) [A^2 - (x - x_0)^2])) $

  $ = > T = 4 sqrt(m/(U''(x_0))) integral_(x_0)^(x_0 + A) (dif(x))/(sqrt(A^2 - (x - x_0)^2)) $

  Making the substitution $x - x_0 = A u$:
  $ = > T = 4 sqrt(m/(U''(x_0))) integral_0^1 (A dif(u))/(sqrt(A^2 - A^2 u^2)) $

  $ = > T = 4 sqrt(m/(U''(x_0))) integral_0^1 (dif(u))/(sqrt(1 - u^2)) $

  The integral evaluates to:
  $ integral_0^1 (dif(u))/(sqrt(1 - u^2)) = [arcsin(u)]_0^1 = arcsin(1) - arcsin(0) = pi/2 - 0 = pi/2 $

  Therefore:
  #boxed[$ T = 2 pi sqrt(m/(U''(x_0))) $]
]

#pagebreak()

#pbm("5.10")[
  Obtain a second order differential equation for $x(t)$ for the inverted harmonic oscillator with $E > 0$ and initial conditions $x(0)$ and $dot(x)(0)$. Solve for $x(t)$.
]

#solution[
  For the inverted harmonic oscillator, the potential is:
  $ U(x) = -1/2 m omega_0^2 x^2 $

  The total energy is:
  $ E(t) = 1/2 m dot(x)^2 (t) - 1/2 m omega_0^2 x^2 (t) $

  At $t = 0$:
  $ E = 1/2 m dot(x)^2 (0) - 1/2 m omega_0^2 x^2 (0) $

  To find the second-order differential equation, we differentiate the energy equation:
  $ dv(E, t) = m dot(x)(t) dot.double(x)(t) - m omega_0^2 x(t) dot(x)(t) = 0 $

  $ => m dot(x)(t)[dot.double(x)(t) - omega_0^2 x(t)] = 0 $

  Since energy is conserved and $dot(x)(t) eq.not 0$ (for $E > 0$):
  $ dot.double(x)(t) - omega_0^2 x(t) = 0 $

  This is the second-order differential equation. The general solution is:
  $ x(t) = C_1 cosh(omega_0 t) + C_2 sinh(omega_0 t) $

  Applying initial conditions:
  $ cases(
    x(0) = C_1 cosh(0) + C_2 sinh(0) = C_1,
    dot(x) (0) = omega_0 C_1 sinh(0) + omega_0 C_2 cosh(0) = omega_0 C_2
  ) quad => quad cases(
    C_1 = x(0),
    C_2 = display((dot(x) (0))/omega_0)
  ) $

  Therefore:
  #boxed[$ x(t) = x(0) cosh(omega_0 t) + (dot(x) (0))/omega_0 sinh(omega_0 t) $]

  *Alternative Method:* From conservation of energy:
  $ 1/2 m dot(x)^2 (t) - 1/2 m omega_0^2 x^2 (t) = E $

  $ = > dot(x)^2 (t) = (2E)/m + omega_0^2 x^2 (t) $

  $ = > dot(x)(t) = plus.minus sqrt((2E)/m + omega_0^2 x^2 (t)) $

  For the inverted harmonic oscillator with $E > 0$, the motion is unbounded. We choose the positive sign for $t > 0$:
  $ dv(x, t) = sqrt((2E)/m + omega_0^2 x^2) $

  $ = > (dif x)/(sqrt((2E)/m + omega_0^2 x^2)) = dif t $

  $ = > t = integral_(x(0))^(x(t)) (dif x')/(sqrt((2E)/m + omega_0^2 (x')^2)) quad quad ["Let" alpha = sqrt((2E)/(m omega_0^2))] $

  $ = > t = integral_(x(0))^(x(t)) (dif x')/(sqrt(omega_0^2 (alpha^2 + (x')^2))) $

  $ = > t = 1/omega_0 integral_(x(0))^(x(t)) (dif x')/(sqrt(alpha^2 + (x')^2)) $

  $ = > t = 1/omega_0 [sinh^(-1)(x'/alpha)]_(x(0))^(x(t)) quad quad ["using standard integral"] $

  $ = > t = 1/omega_0 [sinh^(-1)((x(t))/alpha) - sinh^(-1)((x(0))/alpha)] $

  $ = > omega_0 t = sinh^(-1)((x(t))/alpha) - sinh^(-1)((x(0))/alpha) $

  $ = > sinh^(-1)((x(t))/alpha) = omega_0 t + sinh^(-1)((x(0))/alpha) $

  $ = > (x(t))/alpha = sinh[omega_0 t + sinh^(-1)((x(0))/alpha)] $

  $ = > x(t) = alpha sinh[omega_0 t + sinh^(-1)((x(0))/alpha)] $

  $ = > x(t) = alpha[sinh(omega_0 t) cosh(sinh^(-1)((x(0))/alpha)) + cosh(omega_0 t) sinh(sinh^(-1)((x(0))/alpha))] $

  $ = > x(t) = alpha[sinh(omega_0 t) sqrt(1 + ((x(0))/alpha)^2) + cosh(omega_0 t) (x(0))/alpha] quad quad ["using" sinh^(-1) "identities"] $

  $ = > x(t) = x(0) cosh(omega_0 t) + 1/omega_0 sqrt((2E)/m + x(0)^2) sinh(omega_0 t) $

  #boxed[$ x(t) = x(0) cosh(omega_0 t) + (dot(x) (0))/omega_0 sinh(omega_0 t) $]
]
