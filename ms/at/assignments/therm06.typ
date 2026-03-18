#import "../shared/_at.typ": *

#show: ad.with(
  title: "Assignment 6",
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
  *[40 pts]*
  In class, we have learnt how an engine and a refrigerator work. In this problem, we strengthen our understanding of it by applying the ideas we discuss in class to air conditioners. An air conditioner can be viewed as a refrigerator, which remove heat from a room (at lower temperature $T_1$) to the outside (at higher temperature $T_2$). For simplicity, suppose the air conditioner performs a reversible Carnot cycle. The power of this air conditioner is $P$ at work, that is, when it is working, it does work $P$ per unit time.

  *(1) (8 points)* Why must the air conditioner be placed in the window of the room, rather than in the middle of the room?

  *(2) (8 points)* Suppose the air conditioner takes heat $q_1$ from the room and gives heat $q_2$ to the outside per unit time. For this ideal Carnot air conditioner, what is the coefficient of performance $(q_1/P)$ for this air condition? Express the answer in terms of $T_1$ and $T_2$.

  *(3) (8 points)* Because $T_2 > T_1$, there will be heat flowing from the outside into the room. Suppose the heat flowing from the outside into the room satisfies Newton’s law: $q = A(T_2 − T_1)$, where $q$ is the heat flowing into the room per unit time, and $A$ is a constant. Assume the temperature in the room is uniform and the air conditioner is working continuously, calculate $T_1$ in terms of $T_2$, $P$ and $A$.

  *(4) (8 points)* In reality the air conditioner may stop working if the room reaches the desired temperature. Suppose the air conditioner only works 30% of time, and this is just enough to remain the temperature of the room to be $20° C$ while the temperature outside is $30° C$. Now in order to keep the room temperature to be $20° C$, what can the highest temperature of the outside be? (Hint: at the highest temperature the air conditioner needs to work continuously.)

  *(5) (8 points)* In the winter some air conditioners can be used in the opposite way as in the summer, that is, it takes heat from the colder outside and gives heat to the warmer room. Suppose in this case the power of the air conditioner is still $P$, and Newton’s heat conduction constant $A$ also does not change. In order to keep the room temperature to be $20° C$, what can the lowest temperature of the outside be? (Hint: at the lowest temperature the air conditioner needs to work continuously.)
]

#solution[
  *Part (1): Placement of the air conditioner*

  A refrigerator moves heat from cold to hot by doing work. If the unit were placed in the middle of the room, both the cold side and hot side would dump heat into the same air volume. The net effect would be *heating* the room, because the work input becomes additional heat. Placing it in a window allows the cold side to absorb heat from the room while the hot side rejects that heat (plus work) to the outside.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (2): Carnot coefficient of performance*

  For a reversible refrigerator,
  $
  frac(q_2, q_1) = frac(T_2, T_1),
  $
  and energy balance gives
  $
  P = q_2 - q_1.
  $
  Substitute $q_2 = q_1 frac(T_2, T_1)$:
  $
  P = q_1 (frac(T_2, T_1) - 1) = q_1 frac(T_2 - T_1, T_1).
  $
  Hence the coefficient of performance is
  $
  frac(q_1, P) = frac(T_1, T_2 - T_1).
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (3): Steady-state room temperature with heat leak*

  At steady state with continuous operation, heat removed equals heat leaking in:
  $
  q_1 = A (T_2 - T_1).
  $
  Using part (2),
  $
  q_1 = P frac(T_1, T_2 - T_1).
  $
  Equate and solve:
  $
  P frac(T_1, T_2 - T_1) = A (T_2 - T_1)
  quad => quad
  P T_1 = A (T_2 - T_1)^2.
  $
  Let $x = T_2 - T_1 > 0$. Then
  $
  P (T_2 - x) = A x^2
  quad => quad
  A x^2 + P x - P T_2 = 0.
  $
  Taking the positive root,
  $
  x = frac(-P + sqrt(P^2 + 4 A P T_2), 2 A),
  $
  so
  $
  T_1 = T_2 - frac(-P + sqrt(P^2 + 4 A P T_2), 2 A).
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (4): Highest outside temperature*

  When the unit runs only 30% of the time at $T_1 = 20° C$, $T_2 = 30° C$, the average cooling is
  $
  q_1^("avg") = 0.3 P frac(T_1, T_2 - T_1).
  $
  This balances the heat leak $A (T_2 - T_1)$, so
  $
  A = frac(0.3 P T_1, (T_2 - T_1)^2).
  $
  At the highest outside temperature, the unit runs continuously, so
  $
  P T_1 = A (T_2^{max} - T_1)^2.
  $
  Eliminate $A$:
  $
  (T_2^{max} - T_1)^2
  = frac(P T_1, A)
  = frac(P T_1, 0.3 P T_1) (T_2 - T_1)^2
  = frac(1, 0.3) (T_2 - T_1)^2.
  $
  With $T_2 - T_1 = 10° C$, we get
  $
  T_2^{max} - T_1 = frac(1, sqrt(0.3)) · 10° C ≈ 18.26° C,
  $
  so
  $
  T_2^{max} ≈ 38.3° C.
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Part (5): Lowest outside temperature in heating mode*

  In heating mode, the room receives heat $q_2$ while the unit extracts $q_1$ from outside. For a reversible refrigerator,
  $
  frac(q_2, q_1) = frac(T_1, T_2),
  quad
  P = q_2 - q_1,
  $
  so
  $
  q_2 = P frac(T_1, T_1 - T_2).
  $
  The heat loss from the room to the outside is still
  $
  A (T_1 - T_2).
  $
  At the lowest outside temperature with continuous operation,
  $
  P frac(T_1, T_1 - T_2) = A (T_1 - T_2),
  $
  giving
  $
  P T_1 = A (T_1 - T_2)^2.
  $
  Using the same $A$ from part (4),
  $
  (T_1 - T_2^{min})^2 = frac(1, 0.3) (10° C)^2,
  $
  so
  $
  T_2^{min} = T_1 - frac(1, sqrt(0.3)) · 10° C ≈ 20° C - 18.26° C ≈ 1.7° C.
  $
]
