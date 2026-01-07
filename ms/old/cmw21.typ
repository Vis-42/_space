#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 21",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("8.9")[
  A simple pendulum of mass $m$ and length $ell$ is subjected to a linear resistance force $vb(F) = -gamma vb(v)$ with $gamma > 0$.

  Obtain the equation of motion with suitable generalized coordinates.
]

#solution[
  *Choose generalized coordinate:*

  We use the angle $theta$ as the generalized coordinate, measured from the vertical downward direction.

  *Position and velocity in Cartesian coordinates:*

  $ cases(
    x &= ell sin theta quad &=> quad dot(x) &= ell dot(theta) cos theta,
    y &= -ell cos theta quad &=> quad dot(y) &= ell dot(theta) sin theta
  ) $

  *Lagrangian:*

  The velocity is:
  $ vb(v) = dot(x) vu(e)_x + dot(y) vu(e)_y = ell dot(theta) cos theta vu(e)_x + ell dot(theta) sin theta vu(e)_y $

  $ |vb(v)|^2 = ell^2 dot(theta)^2 (cos^2 theta + sin^2 theta) = ell^2 dot(theta)^2 $

  Kinetic energy:
  $ T = m/2 |vb(v)|^2 = m/2 ell^2 dot(theta)^2 $

  Potential energy:
  $ U = m g y = -m g ell cos theta $

  Lagrangian:
  $ L(theta, dot(theta)) = m/2 ell^2 dot(theta)^2 + m g ell cos theta $

  *Resistance force:*

  The resistance force is:
  $ vb(F)_"res" = -gamma vb(v) = -gamma ell dot(theta) cos theta vu(e)_x - gamma ell dot(theta) sin theta vu(e)_y $

  *Generalized force:*

  The generalized force corresponding to $theta$ is:
  $ cal(Q)_theta = vb(F)_"res" dot pdv(vb(r), theta) $

  where:
  $ pdv(vb(r), theta) = pdv(, theta) (x vu(e)_x + y vu(e)_y) = ell cos theta vu(e)_x + ell sin theta vu(e)_y $

  Therefore:
  $ cal(Q)_theta &= (-gamma ell dot(theta) cos theta vu(e)_x - gamma ell dot(theta) sin theta vu(e)_y) dot (ell cos theta vu(e)_x + ell sin theta vu(e)_y) \
  &= -gamma ell dot(theta) cos theta dot ell cos theta - gamma ell dot(theta) sin theta dot ell sin theta \
  &= -gamma ell^2 dot(theta) (cos^2 theta + sin^2 theta) \
  &= -gamma ell^2 dot(theta) $

  *Euler-Lagrange equation with non-conservative force:*

  $ dv(, t) (pdv(L, dot(theta))) - pdv(L, theta) = cal(Q)_theta $

  Computing the partial derivatives:
  $ cases(
    pdv(L, dot(theta)) &= m ell^2 dot(theta),
    pdv(L, theta) &= -m g ell sin theta
  ) $

  The equation becomes:
  $ m ell^2 dot.double(theta) - (-m g ell sin theta) = -gamma ell^2 dot(theta) $

  $ m ell^2 dot.double(theta) + m g ell sin theta = -gamma ell^2 dot(theta) $

  Dividing by $m ell^2$:
  #boxed[$ dot.double(theta) + gamma/m dot(theta) + g/ell sin theta = 0 $]

  This is the equation of motion for a damped pendulum.

  *For small angles* ($sin theta approx theta$):
  #boxed[$ dot.double(theta) + gamma/m dot(theta) + g/ell theta approx 0 $]

  This is the equation for a damped harmonic oscillator with:
  - Damping coefficient: $gamma \/ m$
  - Natural frequency: $omega_0 = sqrt(g \/ ell)$
]

#pagebreak()

#pbm("8.10")[
  Show that the Galilean transformation is a gauge transformation for the Lagrangian of a system of $N$ particles interacting via central potentials. Identify the gauge function.

  *Lagrangian:*
  $ L({vb(r)_alpha, dot(vb(r))_alpha}) = sum_(alpha=1)^N m_alpha/2 dot(vb(r))_alpha dot dot(vb(r))_alpha - 1/2 sum_(alpha=1)^N sum_(beta eq.not alpha) U_(alpha beta) (|vb(r)_alpha - vb(r)_beta|) $

  *Galilean transformation:*
  $ vb(r)_alpha (t) -> vb(r)'_alpha (t) = vb(r)_alpha (t) + vb(V) t $
]

#solution[
  *Transform the velocities:*

  Under the Galilean transformation:
  $ vb(r)'_alpha (t) = vb(r)_alpha (t) + vb(V) t $

  Taking the time derivative:
  $ dot(vb(r))'_alpha (t) = dot(vb(r))_alpha (t) + vb(V) $

  *Transform the kinetic energy:*

  $ T' &= sum_(alpha=1)^N m_alpha/2 dot(vb(r))'_alpha dot dot(vb(r))'_alpha \
  & = sum_(alpha=1)^N m_alpha/2 (dot(vb(r))_alpha + vb(V)) dot (dot(vb(r))_alpha + vb(V)) \
  & = sum_(alpha=1)^N m_alpha/2 [dot(vb(r))_alpha dot dot(vb(r))_alpha + 2 dot(vb(r))_alpha dot vb(V) + vb(V) dot vb(V)] \
  & = sum_(alpha=1)^N m_alpha/2 dot(vb(r))_alpha dot dot(vb(r))_alpha + sum_(alpha=1)^N m_alpha dot(vb(r))_alpha dot vb(V) + sum_(alpha=1)^N m_alpha/2 vb(V) dot vb(V) $

  *Transform the potential energy:*

  The potential depends only on relative positions:
  $ |vb(r)'_alpha - vb(r)'_beta| = |(vb(r)_alpha + vb(V) t) - (vb(r)_beta + vb(V) t)| = |vb(r)_alpha - vb(r)_beta| $

  Therefore, the potential energy is unchanged:
  $ U'({vb(r)'_alpha}) = U({vb(r)_alpha}) $

  *Transformed Lagrangian:*

  $ L'({vb(r)'_alpha, dot(vb(r))'_alpha}) &= T' - U' \
  & = sum_(alpha=1)^N m_alpha/2 dot(vb(r))_alpha dot dot(vb(r))_alpha + sum_(alpha=1)^N m_alpha dot(vb(r))_alpha dot vb(V) + sum_(alpha=1)^N m_alpha/2 vb(V) dot vb(V) - U \
  & = L({vb(r)_alpha, dot(vb(r))_alpha}) + sum_(alpha=1)^N m_alpha dot(vb(r))_alpha dot vb(V) + sum_(alpha=1)^N m_alpha/2 vb(V) dot vb(V) $

  *Express in primed coordinates:*

  Since $dot(vb(r))_alpha = dot(vb(r))'_alpha - vb(V)$ and $vb(r)_alpha = vb(r)'_alpha - vb(V) t$:

  $ L'({vb(r)'_alpha, dot(vb(r))'_alpha}) = L({vb(r)'_alpha, dot(vb(r))'_alpha}) + sum_(alpha=1)^N m_alpha dot(vb(r))'_alpha dot vb(V) - sum_(alpha=1)^N m_alpha vb(V) dot vb(V) + sum_(alpha=1)^N m_alpha/2 vb(V) dot vb(V) $

  $ L'({vb(r)'_alpha, dot(vb(r))'_alpha}) = L({vb(r)'_alpha, dot(vb(r))'_alpha}) + sum_(alpha=1)^N m_alpha dot(vb(r))'_alpha dot vb(V) - sum_(alpha=1)^N m_alpha/2 vb(V) dot vb(V) $

  *Identify as gauge transformation:*

  A gauge transformation has the form:
  $ L' = L + (dif Lambda)/(dif t) $

  where $Lambda$ is the gauge function. We need:
  $ (dif Lambda)/(dif t) = sum_(alpha=1)^N m_alpha dot(vb(r))'_alpha dot vb(V) - sum_(alpha=1)^N m_alpha/2 vb(V) dot vb(V) $

  Rewriting:
  $ (dif Lambda)/(dif t) = -sum_(alpha=1)^N m_alpha vb(V) dot dot(vb(r))'_alpha + sum_(alpha=1)^N m_alpha/2 vb(V) dot vb(V) $

  *Integrate to find gauge function:*

  $ (dif Lambda)/(dif t) = -vb(V) dot dv(, t) [sum_(alpha=1)^N m_alpha vb(r)'_alpha] + sum_(alpha=1)^N m_alpha/2 vb(V) dot vb(V) $

  Integrating:
  #boxed[$ Lambda = -vb(V) dot sum_(alpha=1)^N m_alpha vb(r)'_alpha + sum_(alpha=1)^N m_alpha/2 (vb(V) dot vb(V)) t + "const" $]

  Alternatively, dropping the constant and primes:
  #boxed[$ Lambda({vb(r)_alpha}, t) = -sum_(alpha=1)^N m_alpha vb(r)_alpha dot vb(V) + 1/2 (sum_(alpha=1)^N m_alpha) |vb(V)|^2 t $]

  *Conclusion:* The Galilean transformation is indeed a gauge transformation, meaning that both Lagrangians give the same equations of motion, as they must for physical consistency (the laws of physics are the same in all inertial frames).
]

#pagebreak()

#pbm("9.1")[
  Starting from $g = g(u, y)$, perform a Legendre transformation to another function $h = h(x, v)$.

  *Given:* $f = f(x, y)$ with $dif f = u dif x + v dif y$

  *First transformation ($f -> g$):*
  $ u = pdv(f, x)_y quad => quad x = x(u, y) $
  $ g(u, y) equiv f(x(u, y), y) - x(u, y) u $
  $ dif g = -x dif u + v dif y $
]

#solution[
  *Starting point:*

  We have $g = g(u, y)$ with differential:
  $ dif g = -x dif u + v dif y $

  From this differential, we identify:
  $ cases(
    x &= -pdv(g, u)_y,
    v &= pdv(g, y)_u
  ) $

  *Choose new independent variables:*

  We want to transform from $(u, y)$ to $(x, v)$. This requires:
  - $u$ should become a dependent variable (function of $x$ and $v$)
  - $y$ should become a dependent variable (function of $x$ and $v$)

  This means we need to perform two Legendre transformations: one to change $u -> x$ and another to change $y -> v$.

  *Legendre transformation to change both variables:*

  The Legendre transformation from $g(u, y)$ to $h(x, v)$ is:
  $ h(x, v) equiv g(u(x, v), y(x, v)) + u(x, v) x - y(x, v) v $

  *Calculate the differential of $h$:*

  Taking the total differential:
  $ dif h = dif g + (u dif x + x dif u) - (y dif v + v dif y) $

  Substituting $dif g = -x dif u + v dif y$:
  $ dif h = (-x dif u + v dif y) + (u dif x + x dif u) - (y dif v + v dif y) $

  $ dif h = u dif x - y dif v $

  *Identify partial derivatives:*

  From $dif h = u dif x - y dif v$, we have:
  $ cases(
    u &= pdv(h, x)_v,
    -y &= pdv(h, v)_x quad => quad y = -pdv(h, v)_x
  ) $

  *Summary of transformations:*

  Starting from $f(x, y)$ with $dif f = u dif x + v dif y$:

  #boxed[
  $ cases(
    "First:" quad &g(u, y) = f - u x\, quad &dif g = -x dif u + v dif y,
    "Second:" quad &h(x, v) = g + u x - v y\, quad &dif h = u dif x - y dif v
  ) $
  ]

  Combining the two transformations:
  $ h(x, v) = [f - u x] + u x - v y = f - v y $

  #boxed[$ h(x, v) = f(x, y(x, v)) - v y(x, v) $]

  with differential $dif h = u dif x - y dif v$.

  *Alternative formulation:*

  We could also write:
  $ h(x, v) = -[v y - f(x, y)] $

  or in terms of $g$:
  #boxed[$ h(x, v) = g(u(x, v), y(x, v)) + u(x, v) x - y(x, v) v $]

  *Verification:*
  $ dif h &= pdv(g, u)_y dif u + pdv(g, y)_u dif y + u dif x + x dif u - y dif v - v dif y \
  &= -x dif u + v dif y + u dif x + x dif u - y dif v - v dif y \
  &= u dif x - y dif v quad checkmark $
]
