#import "_at.typ": *

#show: ad.with(
  title: "Worksheet 11",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("5.4")[
  Show that the total mechanical energy with time-independent potential energy is a constant of motion.
]

#solution[
  *Given relationships:*
  $ E(t) ≡ U(vb(r)(t)) + T(t), #h(2em) vb(F)(vb(r)) = -grad U(vb(r)), #h(2em) vb(F)(vb(r)(t)) = m dot.double(vb(r))(t) $

  *Taking the time derivative of total energy:*
  $ (dd E(t))/(dd t) &= dd/(dd t) [U(vb(r)(t)) + m/2 dot(vb(r))(t) · dot(vb(r))(t)] \
  &= grad U(vb(r)(t)) · dot(vb(r))(t) + m dot.double(vb(r))(t) · dot(vb(r))(t) \
  &= -vb(F)(vb(r)(t)) · dot(vb(r))(t) + vb(F)(vb(r)(t)) · dot(vb(r))(t) \
  &= 0 #h(2em) $

  Therefore, the total mechanical energy is conserved when the potential energy is time-independent.
]


#pbm("5.5")[
  The electrostatic force on a point charge $q$ located at $vb(r)$ due to a fixed point charge $Q$ at the origin is given by $ vb(F)(vb(r)) = (Q q)/(4 π ε_0 r^2) vu(e)_r $ Show that it is conservative and find the corresponding potential energy.
]

#solution[
*Given force:*
$ vb(F)(vb(r)) = (Q q)/(4 π ε_0 r^2) vu(e)_r ≡ f(r) vu(e)_r, #h(2em) "where" #h(1em) f(r) = (Q q)/(4 π ε_0 r^2) $

*Testing for conservativity using curl:*
$ grad × vb(F)(vb(r)) = 1/(h_1 h_2 h_3) det(mat(
  display(h_1 vu(e)_r), display(h_2 vu(e)_θ), display(h_3 vu(e)_φ);
  display(pdv(,r)), display(pdv(,θ)), display(pdv(,φ));
  display(h_1 F_r), display(h_2 F_θ), display(h_3 F_φ)
)) = 1/(r^2 sin θ) det(mat(
  display(vu(e)_r), display(r vu(e)_θ), display(r sin θ vu(e)_φ);
  display(pdv(,r)), display(pdv(,θ)), display(pdv(,φ));
  display(f(r)), display(0), display(0)
)) = 0 #h(1em)  $

*Computing the gradient of potential energy:*
$ grad U(vb(r)) &= 1/h_1 pdv(U(r),r) vu(e)_r + 1/h_2 pdv(U(r),θ) vu(e)_θ + 1/h_3 pdv(U(r),φ) vu(e)_φ \
  &= pdv(U(r),r) vu(e)_r + 1/r pdv(U(r),θ) vu(e)_θ + 1/(r sin θ) pdv(U(r),φ) vu(e)_φ \
  &= dd/(dd r) [- integral_(r_0)^r f(r') dd r'] vu(e)_r = -f(r) vu(e)_r #h(1em)  $

*Therefore:*
$ vb(F)(vb(r)) = -grad U(vb(r)) = f(r) vu(e)_r #h(1em)  $

*Computing the potential energy:*
$ U(r) &= - integral_(r_0)^r f(r') dd r' = - display((Q q)/(4 π ε_0)) integral_(r_0)^r display(1/(r'^2)) dd r' \
  &= - display((Q q)/(4 π ε_0)) lr([- 1/r']_(r_0)^r) = display((Q q)/(4 π ε_0)) lr((1/r - 1/r_0)) #h(1em)  $

The electrostatic force is conservative, and the corresponding potential energy is $ U(r) = (Q q)/(4 π ε_0) (1/r - 1/r_0) $.
]

#pbm("5.6")[
  Show that the total mechanical energy with time-dependent potential energy is not a constant of motion.
]

#solution[
  We have,
$ &cases(T(t) = display(1/2) m dot(vb(r))(t) · dot(vb(r))(t),
  U(vb(r), t) = - display(integral)_(r_0)^vb(r) vb(F)(vb(r)', t) · dd vb(r)')\
  ⟹&cases(dd T = m dot.double(vb(r))(t) · dot(vb(r))(t) dd t = vb(F)(vb(r)(t), t) · dot(vb(r))(t) dd t = -grad U(vb(r)(t), t) · dd vb(r),
    dd U = grad U(vb(r)(t), t) · dd vb(r) + display(pdv(U(vb(r)(t), t),t)) dd t) $

So,
$ dd E &= dd T + dd U = pdv(U(vb(r)(t), t),t) dd t ⟹  dv(E(t),t) &= pdv(U(vb(r)(t), t),t) ≠ 0 #h(1em)  $

Therefore, when the potential energy has explicit time dependence, the total mechanical energy is *not* conserved.
]
