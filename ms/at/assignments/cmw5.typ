#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 5",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("2.5")[
  A projectile of mass $m$ is launched from the origin with initial velocity $v_0$ at an angle $θ_0$ to the horizontal. The projectile experiences a linear drag force with coefficient $k$ and is subject to uniform gravity $g$.

  The equations of motion are:
  $ m dot.double(x) = -k dot(x), quad m dot.double(y) = -m g - k dot(y) $

  with initial conditions $x(0) = y(0) = 0$, $dot(x)(0) = v_0 cos θ_0$, and $dot(y)(0) = v_0 sin θ_0$.

  The solutions to these equations are:
  $ dot(x)(t) = v_0 cos θ_0 e^(-k t/m), quad x(t) = (m v_0 cos θ_0)/k (1 - e^(-k t/m)) $

  $ dot(y)(t) = -(m g)/k + (v_0 sin θ_0 + (m g)/k) e^(-k t/m) $

  $ y(t) = -(m g t)/k + (m/k)(v_0 sin θ_0 + (m g)/k)(1 - e^(-k t/m)) $

  The flight time $T$ is determined by the condition $y(T) = 0$, which gives:
  $ (ε sin θ_0 + 1)(1 - e^(-k T/m)) - (k T)/m = 0 $

  where $ε ≡ (k v_0)/(m g)$ is a dimensionless parameter.

  Determine the range $R = x(T)$ as a perturbative expansion in $ε$ up to order $cal(O)(ε^2)$, expressing your answer in the form:
  $ R = R_0 [1 + a_1 ε + a_2 ε^2 + cal(O)(ε^3)] $

  where $R_0$ is the range in the absence of drag.
]

#solution[
  *Perturbative expansion of flight time*

  We begin by finding the flight time $T$ as a perturbative expansion in the dimensionless parameter $ε ≡ (k v_0)/(m g)$. The flight time equation from $y(T) = 0$ is:
  $ (ε sin θ_0 + 1)(1 - e^(-k T/m)) - (k T)/m = 0 $

  We propose an expansion for $T$ of the form:
  $ T = (2 v_0 sin θ_0)/g (1 + c_1 ε + c_2 ε^2 + cal(O)(ε^3)) $

  where the leading term $(2 v_0 sin θ_0)/g$ is the flight time in the absence of drag. Substituting $k/m = ε g/v_0$:
  $ (ε sin θ_0 + 1)(1 - e^(-(ε g T)/v_0)) - ε (g T)/v_0 = 0 $

  Substituting our expansion for $T$:
  $ (ε sin θ_0 + 1){1 - exp[-2 ε sin θ_0 (1 + c_1 ε + c_2 ε^2 + cal(O)(ε^3))]} - 2 ε sin θ_0 (1 + c_1 ε + c_2 ε^2 + cal(O)(ε^3)) = 0 $

  Define the function:
  $ f(ε) ≡ (ε sin θ_0 + 1){1 - exp[-2 ε sin θ_0 (1 + c_1 ε + c_2 ε^2)]} - 2 ε sin θ_0 (1 + c_1 ε + c_2 ε^2) $

  For this to hold identically in $ε$, we need $f(ε) = 0$ to all orders. Computing the Taylor expansion about $ε = 0$:
  $ cases(
    f^((0)) (0) = 0,
    f^((1)) (0) = 0,
    f^((2)) (0) = 0,
    f^((3)) (0) = -4 sin^2 θ_0 (3 c_1 + sin θ_0),
    f^((4)) (0) = 16 sin^2 θ_0 (sin^2 θ_0 - 3 c_1^2 - 3 c_2)
  ) $

  The first three derivatives vanish automatically. Setting the next two derivatives to zero:
  $ cases(
    3 c_1 + sin θ_0 = 0,
    sin^2 θ_0 - 3 c_1^2 - 3 c_2 = 0
  ) $

  Solving these equations:
  $ cases(
    c_1 = display(-1/3 sin θ_0),
    c_2 = display(2/9 sin^2 θ_0)
  ) $

  Therefore:
  $ T = (2 v_0 sin θ_0)/g [1 - 1/3 ε sin θ_0 + 2/9 ε^2 sin^2 θ_0 + cal(O)(ε^3)] $

  *Perturbative expansion of range*

  The range is given by $R = x(T)$:
  $ R = (m v_0 cos θ_0)/k (1 - e^(-k T/m)) = (v_0^2 cos θ_0)/(ε g) (1 - e^(-(ε g T)/v_0)) $

  Substituting our expression for $T$:
  $ R = (v_0^2 cos θ_0)/(ε g) {1 - exp[-2 ε sin θ_0 (1 + c_1 ε + c_2 ε^2 + cal(O)(ε^3))]} $

  To find the expansion of $R$, we compute the Taylor series. The leading term is found using L'Hôpital's rule:
  $ lim_(ε → 0) (v_0^2 cos θ_0)/(ε g) {1 - exp[-2 ε sin θ_0 (1 + c_1 ε + c_2 ε^2)]} = (2 v_0^2 sin θ_0 cos θ_0)/g $

  This is the range without drag, as expected. Computing the derivatives and evaluating the Taylor series with our values of $c_1$ and $c_2$:

  #boxed[$ R = (2 v_0^2 sin θ_0 cos θ_0)/g [1 - 4/3 ε sin θ_0 + 14/9 ε^2 sin^2 θ_0 + cal(O)(ε^3)] $]

  The drag reduces the range, with the first-order correction proportional to $ε sin θ_0$ and the second-order correction proportional to $ε^2 sin^2 θ_0$.
]

#pagebreak()

#pbm("2.6")[
  A charged particle of mass $m$ and charge $q$ moves in a uniform magnetic field $vb(B) = B_0 vu(e)_y$. The equations of motion in the $x z$ plane are:
  $ cases(
    dot.double(x)(t) = -ω dot(z)(t),
    dot.double(z)(t) = ω dot(x)(t)
  ) $

  where $ω ≡ (q B_0)/m$ is the cyclotron frequency.

  Consider the proposed solutions:
  $ cases(
    x(t) = C_1 cos ω t + C_2 sin ω t + C_0,
    z(t) = D_1 cos ω t + D_2 sin ω t + D_0
  ) $

  (a) Show that the six constants $(C_0, C_1, C_2, D_0, D_1, D_2)$ are not all independent by deriving the coupling constraints imposed by the equations of motion.

  (b) Apply the initial conditions $x(0) = x_0$, $dot(x)(0) = 0$, $z(0) = z_0$, and $dot(z)(0) = v_(z 0)$ to determine the complete solution for $x(t)$ and $z(t)$.
]

#solution[
  *Part (a): Coupling constraints*

  We verify that the proposed solutions satisfy the equations of motion and determine the constraints on the six constants. Differentiating the proposed form $x(t) = C_1 cos ω t + C_2 sin ω t + C_0$:
  $ dot(x)(t) = -C_1 ω sin ω t + C_2 ω cos ω t $
  $ dot.double(x)(t) = -C_1 ω^2 cos ω t - C_2 ω^2 sin ω t $

  Similarly, for $z(t) = D_1 cos ω t + D_2 sin ω t + D_0$:
  $ dot(z)(t) = -D_1 ω sin ω t + D_2 ω cos ω t $

  Substituting into the first equation of motion $dot.double(x) = -ω dot(z)$:
  $ -C_1 ω^2 cos ω t - C_2 ω^2 sin ω t = -ω(-D_1 ω sin ω t + D_2 ω cos ω t) $
  $ -C_1 ω^2 cos ω t - C_2 ω^2 sin ω t = ω^2 D_1 sin ω t - ω^2 D_2 cos ω t $

  Comparing coefficients of $cos ω t$ and $sin ω t$:
  $ cases(
    "coeff. of" cos ω t: quad -C_1 ω^2 = -ω^2 D_2 quad ⟹ quad C_1 = D_2,
    "coeff. of" sin ω t: quad -C_2 ω^2 = ω^2 D_1 quad ⟹ quad C_2 = -D_1
  ) $

  Therefore, the general solution is:
  $ cases(
    x(t) = C_1 cos ω t + C_2 sin ω t + C_0,
    z(t) = -C_2 cos ω t + C_1 sin ω t + D_0
  ) $

  Only four constants $(C_0, C_1, C_2, D_0)$ are independent; the coupling constraints $D_2 = C_1$ and $D_1 = -C_2$ reduce the six apparent constants to four.

  *Part (b): Application of initial conditions*

  Applying the initial conditions at $t = 0$:
  $ cases(
    x(0) = C_1 + C_0 = x_0,
    dot(x)(0) = C_2 ω = 0,
    z(0) = -C_2 + D_0 = z_0,
    dot(z)(0) = C_1 ω = v_(z 0)
  ) $

  From the second equation: $C_2 = 0$.

  From the fourth equation: $C_1 = display((v_(z 0))/ω)$.

  From the first equation: $C_0 = x_0 - C_1 = x_0 - display((v_(z 0))/ω)$.

  From the third equation: $D_0 = z_0 + C_2 = z_0$.

  Substituting these values:
  #boxed[$ cases(
    x(t) = x_0 + display((v_(z 0))/ω) (cos ω t - 1),
    z(t) = z_0 + display((v_(z 0))/ω) sin ω t
  ) $]

  This describes circular motion in the $x z$ plane. The particle moves in a circle of radius $r = v_(z 0)/ω$ centered at $(x_0 - v_(z 0)/ω, z_0)$ with angular frequency $ω$, which is the cyclotron frequency for a charged particle in a magnetic field.
]
