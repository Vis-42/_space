#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 9",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("4.5")[
  #grid(
    columns: (1fr, 2fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 38.png"), width:100%, border: false),
    [A uniform drum of radius $b$ and mass $M$ rolls without slipping down a plane inclined at angle $β$. Find the drum's acceleration along the plane.

    *Translation of the center of mass:*
    $ cases(
      M g sin β - f = M dot.double(X)_"CM" (t),
      N - M g cos β = M dot.double(Y)_"CM" (t)
    ) $

    *Motion with no slipping:* the contact is very rough $f ≤ μ_s N$
    $ dot(X)_"CM" (t) = b dot(φ)(t) = b ω(t) ⟹ dot.double(X)_"CM" (t) = b dot.double(φ)(t) = b dot(ω)(t) $],
  )
]

#solution[
*Position and force vectors:*
$ vb(R)_"CM" (t) = X_"CM" (t) vu(e)_x + b vu(e)_y $ <eq:position>

#grid(
  columns: (1fr, 2fr),
  gutter: 1em,
  [$ #h(10em) cases(
    vb(W)(t) = M g sin β vu(e)_x - M g cos β vu(e)_y,
    vb(f)(t) = -f(t) vu(e)_x,
    vb(N)(t) = N(t) vu(e)_y
  ) $
  ],
  [$ #h(6em) cases(
    vb(r)_W (t) = X_"CM" (t) vu(e)_x + b vu(e)_y,
    vb(r)_f (t) = X_"CM" (t) vu(e)_x,
    vb(r)_N (t) = X_"CM" (t) vu(e)_x) $],
)

*From Newton's second law:*
$ vb(F)(t) = M dot.double(vb(R))_"CM" (t) ⟹ cases(
  M g sin β - f(t) = M dot.double(X)_"CM" (t),
  N(t) - M g cos β = 0
) $ <eq:newton>

#line(length: 100%, stroke: 0.5pt + gray)
#hlg([*Approach 1*])

*Torque about center of mass:*
$ vb(τ)_"CM" (t) = sum_i [vb(r)_i (t) - vb(R)_"CM" (t)] × vb(F)_i (t) = -b f(t) vu(e)_z $

*Angular momentum about center of mass:*
$ vb(L)_"CM" (t) = vb(L)^"spin" (t) = -1/2 M b^2 ω(t) vu(e)_z $

Setting $vb(τ)_"CM" (t) = dot(vb(L))_"CM" (t)$:
$ b f(t) = 1/2 M b^2 dot(ω)(t) $ <eq:torque-balance>

*System of equations:*
$ cases(
  M g sin β - f(t) = M dot.double(X)_"CM" (t),
  N(t) - M g cos β = 0,
  b f(t) = 1/2 M b^2 dot(ω)(t),
  dot.double(X)_"CM" (t) = b dot(ω)(t)
) quad ⟹ cases(
  dot.double(X)_"CM" (t) = 2/3 g sin β,
  f(t) = display(1/3 M g sin β)
) $ <eq:solution>

#boxed[$ dot.double(X)_"CM" (t) = 2/3 g sin β $]


#line(length: 100%, stroke: 0.5pt + gray)
#hlg([*Approach 2*])

*Torque about contact point:*

$ vb(τ)_"contact" (t) = sum_i [vb(r)_i (t) - vb(r)_"contact" (t)] × vb(F)_i (t) = -M g b sin β vu(e)_z $

$ vb(L)_"contact" (t) = vb(L)^"orbital" (t) + vb(L)^"spin" (t) = -[M b dot(X)_"CM" (t) + 1/2 M b^2 ω(t)] vu(e)_z $

$ vb(τ)_"contact" (t) = dot(vb(L))_"contact" (t) $
$ ⟹ M g b sin β = M b dot.double(X)_"CM" (t) + 1/2 M b^2 dot(ω)(t) $ <eq:contact-torque>

*Final system:*
$ cases(
  M g sin β - f(t) = M dot.double(X)_"CM" (t),
  N(t) - M g cos β = 0,
  M g b sin β = M b dot.double(X)_"CM" (t) + 1/2 M b^2 dot(ω)(t),
  dot.double(X)_"CM" (t) = b dot(ω)(t)
) quad ⟹ cases(
  dot.double(X)_"CM" (t) = 2/3 g sin β,
  f(t) = display(1/3 M g sin β)
) $

#boxed[$ dot.double(X)_"CM" (t) = 2/3 g sin β $]
]

#pagebreak()

#pbm("4.6")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 39.png"), width:100%, border: false),
    [A uniform stick of length $ℓ$ and mass $M$, initially upright on a frictionless table, starts falling.

    Find the normal force from table as a function of $θ$ from the vertical.],
  )
]

#solution[
*From Newton's second law:*
$ vb(F)(t) = M dot.double(vb(R))_"CM" (t) ⟹ cases(
  0 = M dot.double(X)_"CM" (t),
  N(t) - M g = M dot.double(Y)_"CM" (t)
) $ <eq:newton-stick>

*Since there are no horizontal forces:*
$ dot.double(X)_"CM" (t) = 0 ⟹ dot(X)_"CM" (t) = dot(X)_"CM" (0) = 0 ⟹ X_"CM" (t) = X_"CM" (0) = 0 $

*Center of mass position:*
$ Y_"CM" (t) = ℓ/2 cos θ(t) ⟹ dot(Y)_"CM" (t) = -ℓ/2 dot(θ)(t) sin θ(t) $

$ ⟹ dot.double(Y)_"CM" (t) = -ℓ/2 dot.double(θ)(t) sin θ(t) - ℓ/2 dot(θ)^2(t) cos θ(t) $

*From the vertical force equation:*
$ N(t) = M g + M dot.double(Y)_"CM" (t) = M g - 1/2 M ℓ [dot.double(θ)(t) sin θ(t) + dot(θ)^2(t) cos θ(t)] $ <eq:normal-force>

*Using torque about center of mass:*
$ τ_"CM" (t) = I_"CM" dot.double(θ)(t) ⟹ ℓ/2 N(t) sin θ(t) = 1/12 M ℓ^2 dot.double(θ)(t) $

$ ⟹ N(t) = 1/6 M ℓ (dot.double(θ)(t))/(sin θ(t)) $ <eq:torque-relation>

*Equating the two expressions for $N(t)$:*
$ cases(
  N(t) = M g - display(1/2) M ℓ [dot.double(θ)(t) sin θ(t) + dot(θ)^2(t) cos θ(t)],
  N(t) = display(1/6) M ℓ display((dot.double(θ)(t))/(sin θ(t)))
) $

$ ⟹ dot.double(θ)(t) = (6 g)/ℓ sin θ(t) - 3 sin θ(t) [dot.double(θ)(t) sin θ(t) + dot(θ)^2(t) cos θ(t)] $

Rearranging:
$ (d)/(d t) [dot(θ)^2(t)] = 2 dot(θ)(t) dot.double(θ)(t) = 2 dot(θ)(t) {(6 g)/ℓ sin θ(t) - 3 sin θ(t) [dot.double(θ)(t) sin θ(t) + dot(θ)^2(t) cos θ(t)]} $

$ ⟹ (d)/(d t) [dot(θ)^2(t)] = -(d)/(d t) {(12 g)/ℓ cos θ(t) + 3 [dot.double(θ)(t) sin θ(t)]^2} $

Integrating and using initial conditions:
$ dot(θ)^2(t) + (12 g)/ℓ cos θ(t) + 3 [dot(θ)(t) sin θ(t)]^2 = C $

At $t = 0$: $θ(0) = 0$ and $dot(θ)(0) = 0$:
$ dot(θ)^2(0) + (12 g)/ℓ cos θ(0) + 3 [dot(θ)(0) sin θ(0)]^2 = C ⟹ C = (12 g)/ℓ $

Therefore:
$ dot(θ)^2(t) + (12 g)/ℓ cos θ(t) + 3 [dot(θ)(t) sin θ(t)]^2 = (12 g)/ℓ $

$ ⟹ dot(θ)^2(t) = (12 g)/ℓ (1 - cos θ(t))/(1 + 3 sin^2 θ(t)) $ <eq:angular-velocity>

From the angular velocity equation:
$ dot(θ)^2(t) = (12 g)/ℓ (1 - cos θ(t))/(1 + 3 sin^2 θ(t)) ⟹ dot.double(θ)(t) = (6 g)/ℓ sin θ(t) (4 - 6 cos θ(t) + 3 cos^2 θ(t))/[1 + 3 sin^2 θ(t)]^2 $

Substituting back into the normal force equation:
$ N(t) = M g - 1/2 M ℓ [dot.double(θ)(t) sin θ(t) + dot(θ)^2(t) cos θ(t)] = (4 - 6 cos θ(t) + 3 cos^2 θ(t))/[1 + 3 sin θ(t)]^2 M g $

#boxed[$ N(t) = (4 - 6 cos θ(t) + 3 cos^2 θ(t))/[1 + 3 sin^2 θ(t)]^2 M g $]
]
