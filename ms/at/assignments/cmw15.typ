#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 15",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("7.3")[
  #grid(
    columns: (1fr, 2fr),
    gutter: 1em,
    fig(image("../../../../_zss/d 66.png"), width:80%, border: false),
    [A point particle of mass $m$ attached to a massless rod of length $ell$ rotates about a frictionless pivot in a plane.

    *Holonomic constraints:* particle is constrained to move in the $x y$-plane and length of the rod is fixed
    $ cases(
      f_1 (x, y, z, t) &= z(t) = 0,
      f_2 (x, y, z, t) &= x^2 (t) + y^2 (t) - ell^2 = 0
    ) $

    One degree of freedom; two possible generalized coordinates are: (1) $q_1 = x$; or (2) $q_1 = theta$

    Use d'Alembert's principle to obtain respective equations of motion for $x(t)$ and $theta(t)$.],
  )
]

#solution[
  #hlg[*Method 1:*] *Using $x$ as the generalized coordinate*

  We have,
  $ x^2 (t) + y^2 (t) - ell^2 = 0 quad => quad cases(
    delta y = display((x(t))/(sqrt(ell^2 - x^2 (t)))) delta x,
    dot.double(y)(t) = display((x^2 (t) dot.double(x)(t) + dot(x)^2 (t))/(sqrt(ell^2 - x^2 (t)))) + display((dot(x)^2 (t) x^2 (t))/([ell^2 - x^2 (t)]^(3\/2)))
  ) $

  Position: $vb(r)(t) = x(t) vu(e)_x + y(t) vu(e)_y$

  Applied force: $vb(F)^((A)) (t) = -m g vu(e)_y$

  D'Alembert's principle:
  $ [vb(F)^((A)) (t) - m dot.double(vb(r)) (t)] dot delta vb(r) = 0 $

  $ => dot.double(x)(t) delta x + dot.double(y)(t) delta y + g delta y = 0 $

  $ = > dot.double(x)(t) + [dot.double(y)(t) + g] (x(t)/(sqrt(ell^2 - x^2 (t))) = 0 $)

  Finally,
  #boxed[$ dot.double(x)(t) = (x(t) dot(x)^2 (t))/(ell^2 - x^2 (t)) - g/ell^2 x(t) sqrt(ell^2 - x^2 (t)) $]

  #hlg[*Method 2:*] *Using $theta$ as the generalized coordinate*

  From constraint:
  $ vb(r)(t) = ell sin theta(t) vu(e)_x - ell cos theta(t) vu(e)_y $

  $ cases(
    dot.double(vb(r)) (t) = ell[dot.double(theta)(t) cos theta(t) - dot(theta)^2 (t) sin theta(t)] vu(e)_x + ell[dot.double(theta)(t) sin theta(t) + dot(theta)^2 (t) cos theta(t)] vu(e)_y,
    delta vb(r) = pdv(vb(r), theta) delta theta = ell delta theta[cos theta(t) vu(e)_x + sin theta(t) vu(e)_y]
  ) $

  D'Alembert's principle:
  $ [vb(F)^((A)) (t) - m dot.double(vb(r)) (t)] dot delta vb(r) = 0 $

  $ => -m g ell sin theta(t) delta theta - m ell^2 [dot.double(theta)(t)(cos^2 theta(t) + sin^2 theta(t))] delta theta = 0 $

  $ => -m g ell sin theta(t) - m ell^2 dot.double(theta)(t) = 0 $

  Finally,
  #boxed[$ dot.double(theta)(t) + g/ell sin theta(t) = 0 $]
]
