#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 18",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("8.3")[
  Show that the Euler-Lagrange equation of motion is covariant under point transformation.
]

#solution[
  Consider a point transformation:
  $ macron(q)_j = macron(q)_j ({q_i}, t) quad => quad cal(L)({macron(q)_j, dot(macron(q))_j}, t) = cal(L)(macron(q)_j ({q_i}, t), dot(macron(q))_j ({q_i, dot(q)_i}, t), t) = cal(L)({q_i, dot(q)_i}, t) $

  Partial derivative with respect to $macron(q)_k$:
  $ pdv(cal(L), macron(q)_k) = sum_(j=1)^M [pdv(cal(L), macron(q)_j) pdv(macron(q)_j, macron(q)_k) + pdv(cal(L), dot(macron(q))_j) pdv(dot(macron(q))_j, macron(q)_k)] $

  Partial derivative with respect to $dot(macron(q))_k$:
  $ pdv(cal(L), dot(macron(q))_k) = sum_(j=1)^M pdv(cal(L), dot(macron(q))_j) pdv(dot(macron(q))_j, dot(macron(q))_k) = sum_(j=1)^M pdv(cal(L), dot(macron(q))_j) pdv(macron(q)_j, macron(q)_k) $

  Time derivative:
  $ dv(, t) (pdv(cal(L), dot(macron(q))_k)) = sum_(j=1)^M [dv(, t) (pdv(cal(L), dot(macron(q))_j)) pdv(macron(q)_j, macron(q)_k) + pdv(cal(L), dot(macron(q))_j) dv(, t) (pdv(macron(q)_j, macron(q)_k))] $

  Euler-Lagrange equation in barred coordinates:
  $ dv(, t) (pdv(cal(L), dot(macron(q))_k)) - pdv(cal(L), macron(q)_k) &= sum_(j=1)^M [dv(, t) (pdv(cal(L), dot(macron(q))_j)) pdv(macron(q)_j, macron(q)_k) + pdv(cal(L), dot(macron(q))_j) dv(, t) (pdv(macron(q)_j, macron(q)_k)) - pdv(cal(L), macron(q)_j) pdv(macron(q)_j, macron(q)_k) - pdv(cal(L), dot(macron(q))_j) pdv(dot(macron(q))_j, macron(q)_k)] \
  &= sum_(j=1)^M {pdv(macron(q)_j, macron(q)_k) [dv(, t) (pdv(cal(L), dot(macron(q))_j)) - pdv(cal(L), macron(q)_j)] + pdv(cal(L), dot(macron(q))_j) [dv(, t) (pdv(macron(q)_j, macron(q)_k)) - pdv(dot(macron(q))_j, macron(q)_k)]} \
  &= 0 $

  where we used the Euler-Lagrange equation in unbarred coordinates:
  $ pdv(cal(L), macron(q)_j) - dv(, t) (pdv(cal(L), dot(macron(q))_j)) = 0 $

  *Verification of the second term:*

  From $macron(q)_j = macron(q)_j ({q_i}, t)$:
  $ dv(, t) (pdv(macron(q)_j, macron(q)_k)) &= sum_(i=1)^M pdv(, q_i) (pdv(macron(q)_j, macron(q)_k)) dot(q)_i + pdv(, t) (pdv(macron(q)_j, macron(q)_k)) \
  &= sum_(i=1)^M pdv(, macron(q)_k) (pdv(macron(q)_j, q_i)) dot(q)_i + pdv(, macron(q)_k) (pdv(macron(q)_j, t)) \
  &= sum_(i=1)^M pdv(, macron(q)_k) (pdv(macron(q)_j, q_i) dot(q)_i) + pdv(, macron(q)_k) (pdv(macron(q)_j, t)) \
  &= pdv(, macron(q)_k) (sum_(i=1)^M pdv(macron(q)_j, q_i) dot(q)_i + pdv(macron(q)_j, t)) \
  & = pdv(, macron(q)_k) ((dif macron(q)_j)/(dif t)) = pdv(dot(macron(q))_j, macron(q)_k) $

  Therefore, the second term vanishes:
  $ dv(, t) (pdv(macron(q)_j, macron(q)_k)) - pdv(dot(macron(q))_j, macron(q)_k) = 0 $

  Hence, the Euler-Lagrange equation is covariant under point transformation:
  #boxed[$ dv(, t) (pdv(cal(L), dot(macron(q))_k)) - pdv(cal(L), macron(q)_k) = 0 $]
]
