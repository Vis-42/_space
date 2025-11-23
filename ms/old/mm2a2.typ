#import "_at.typ": *

#set math.equation(numbering: "(1)")

#show: ad.with(
  title: "Assignment 2 - Solutions",
  author: "Parth Bhargava",
  experiment: "Mathematical Methods in Physics II",
  course: "PC3274A",
  title-page: false,
  decorative: true
)

= PC3274A Assignment 2 - Solutions

#pex("1a: Affine Transformations - Part (a)", [
  We need to show that the curve in the o′-frame takes the form:
  $arrow(r)'(t) = B^(-1) dot A(t) dot arrow(r)_0 - B^(-1)(theta) dot arrow(c)$
])

#sol[
Using the affine structure property:
$Omega(o, sigma(t)) = Omega(o, o') + Omega(o', sigma(t))$

Rearranging:
$Omega(o', sigma(t)) = Omega(o, sigma(t)) - Omega(o, o')$

In the o-frame:
- $Omega(o, sigma(t)) = arrow(r)(t) = A(t) dot arrow(r)_0$
- $Omega(o, o') = arrow(c) = c^1 arrow(e)_1 + c^2 arrow(e)_2$

Therefore:
$Omega(o', sigma(t)) = A(t) dot arrow(r)_0 - arrow(c)$

Now we need to express this in the o′-frame basis. The basis transformation is:
$vec(arrow(e)_1, arrow(e)_2) = B^T (theta) vec(arrow(f)_1, arrow(f)_2)$

where $B(theta) = mat(cos theta, -sin theta; sin theta, cos theta)$

Any vector $arrow(v) = v^1 arrow(e)_1 + v^2 arrow(e)_2$ in the o-frame becomes $arrow(v) = v'^1 arrow(f)_1 + v'^2 arrow(f)_2$ in the o′-frame where:
$vec(v'^1, v'^2) = B^(-1)(theta) vec(v^1, v^2)$

Applying this transformation:
$arrow(r)'(t) = B^(-1)(theta) dot [A(t) dot arrow(r)_0 - arrow(c)] = B^(-1)(theta) dot A(t) dot arrow(r)_0 - B^(-1)(theta) dot arrow(c)$

✓ *Result proven.*
]

#pex("1b: Affine Transformations - Part (b)", [
  We need to evaluate the tangent vectors and show: $arrow(macron(V)) = B(theta) dot arrow(macron(V))'$
])

#sol[
In the o-frame:
$arrow(macron(V)) = (d arrow(r))/(d t) = d/(d t)[A(t) dot arrow(r)_0] = A'(t) dot arrow(r)_0$

where:
$A'(t) = mat(-sin t, cos t; -cos t, -sin t)$

So:
$arrow(macron(V)) = vec(-x^1_0 sin t + x^2_0 cos t, -x^1_0 cos t - x^2_0 sin t)$

In the o′-frame:
$arrow(macron(V))' = (d arrow(r)')/(d t) = B^(-1)(theta) dot A'(t) dot arrow(r)_0$

To verify the relation:
$B(theta) dot arrow(macron(V))' = B(theta) dot B^(-1)(theta) dot A'(t) dot arrow(r)_0 = I dot A'(t) dot arrow(r)_0 = arrow(macron(V))$

✓ *Relation verified.*
]

#pex("2a: Integral Curves - Part (a)", [
  Given vector field: $macron(V) = x^2 frac(partial, partial x^1) - x^1 frac(partial, partial x^2)$

  Show that the integral curve through $(x^1_0, x^2_0)$ is:
  - $x^1(t) = x^1_0 cos t + x^2_0 sin t$
  - $x^2(t) = -x^1_0 sin t + x^2_0 cos t$
])

#sol[
The integral curves satisfy the system:
$(d x^1)/(d t) = x^2, space.quad (d x^2)/(d t) = -x^1$

Taking the derivative of the first equation:
$(d^2 x^1)/(d t^2) = (d x^2)/(d t) = -x^1$

This gives us the harmonic oscillator equation:
$(d^2 x^1)/(d t^2) + x^1 = 0$

General solution: $x^1(t) = A cos t + B sin t$

Using initial conditions:
- At $t=0$: $x^1(0) = x^1_0 => A = x^1_0$
- From $(d x^1)/(d t) = x^2$: At $t=0$: $x^2(0) = x^2_0 = B$

Therefore:
$x^1(t) = x^1_0 cos t + x^2_0 sin t$

From $(d x^1)/(d t) = x^2$:
$x^2(t) = -x^1_0 sin t + x^2_0 cos t$

✓ *Solution verified by substitution into the original system.*
]

#pex("2b: Integral Curves - Part (b)", [
  Show that integral curves are circles of radius $sqrt((x^1_0)^2 + (x^2_0)^2)$ around the origin.
])

#sol[
Computing the distance from the origin:
$(x^1(t))^2 + (x^2(t))^2 = (x^1_0 cos t + x^2_0 sin t)^2 + (-x^1_0 sin t + x^2_0 cos t)^2$

Expanding:
$= (x^1_0)^2 cos^2 t + 2x^1_0 x^2_0 sin t cos t + (x^2_0)^2 sin^2 t$
$+ (x^1_0)^2 sin^2 t - 2x^1_0 x^2_0 sin t cos t + (x^2_0)^2 cos^2 t$

$= (x^1_0)^2(cos^2 t + sin^2 t) + (x^2_0)^2(sin^2 t + cos^2 t)$

$= (x^1_0)^2 + (x^2_0)^2 = "constant"$

✓ *The integral curves are circles with radius $r = sqrt((x^1_0)^2 + (x^2_0)^2)$*
]

#pex("3a: Vector Field Compositions - Part (a)", [
  Show that $W circle V$ does not satisfy the Leibniz rule.
])

#sol[
For $W circle V$ to be a vector field, it must satisfy:
$(W circle V)(f g) = f(W circle V)(g) + g(W circle V)(f)$

Computing the left side:
$(W circle V)(f g) = W(V(f g)) = W(f V(g) + g V(f))$

Using linearity and Leibniz rule for W:
$= W(f)V(g) + f W(V(g)) + W(g)V(f) + g W(V(f))$

The right side would be:
$f(W circle V)(g) + g(W circle V)(f) = f W(V(g)) + g W(V(f))$

Comparing: The extra terms $W(f)V(g) + W(g)V(f)$ appear on the left side.

✓ *Therefore, $W circle V$ violates the Leibniz rule and is not a vector field.*
]

#pex("3b: Vector Field Compositions - Part (b)", [
  Show that the Lie bracket $[V,W] = V circle W - W circle V$ satisfies the Leibniz rule.
])

#sol[
$[V,W](f g) = (V circle W)(f g) - (W circle V)(f g)$

$= V(W(f g)) - W(V(f g))$

$= V(f W(g) + g W(f)) - W(f V(g) + g V(f))$

Expanding using the Leibniz rule:
$= V(f)W(g) + f V(W(g)) + V(g)W(f) + g V(W(f))$
$- [W(f)V(g) + f W(V(g)) + W(g)V(f) + g W(V(f))]$

Rearranging terms:
$= f[V(W(g)) - W(V(g))] + g[V(W(f)) - W(V(f))]$
$+ [V(f)W(g) - W(f)V(g)] + [V(g)W(f) - W(g)V(f)]$

The bracketed terms cancel due to symmetry considerations, leaving:
$= f[V,W](g) + g[V,W](f)$

✓ *The Lie bracket satisfies the Leibniz rule and is therefore a vector field.*
]

#pex("4a: Tensor Products - Part (a)", [
  $(k_1 + k_2) times.circle k_3 = k_1 times.circle k_3 + k_2 times.circle k_3$
])

#sol[
*Proof:*
For any vectors $v, w in V$:
$[(k_1 + k_2) times.circle k_3](v,w) = (k_1 + k_2)(v) dot k_3(w)$
$= [k_1(v) + k_2(v)] dot k_3(w)$
$= k_1(v) dot k_3(w) + k_2(v) dot k_3(w)$
$= (k_1 times.circle k_3)(v,w) + (k_2 times.circle k_3)(v,w)$

✓ *Property proven.*
]

#pex("4b: Tensor Products - Part (b)", [
  $k_1 times.circle (k_2 + k_3) = k_1 times.circle k_2 + k_1 times.circle k_3$
])

#sol[
*Proof:*
$[k_1 times.circle (k_2 + k_3)](v,w) = k_1(v) dot (k_2 + k_3)(w)$
$= k_1(v) dot [k_2(w) + k_3(w)]$
$= k_1(v) dot k_2(w) + k_1(v) dot k_3(w)$
$= (k_1 times.circle k_2)(v,w) + (k_1 times.circle k_3)(v,w)$

✓ *Property proven.*
]

#pex("4c: Tensor Products - Part (c)", [
  $(alpha k_1) times.circle k_2 = alpha(k_1 times.circle k_2)$
])

#sol[
*Proof:*
$[(alpha k_1) times.circle k_2](v,w) = (alpha k_1)(v) dot k_2(w)$
$= alpha k_1(v) dot k_2(w)$
$= alpha[k_1(v) dot k_2(w)]$
$= alpha[(k_1 times.circle k_2)(v,w)]$

✓ *Property proven.*
]

#pex("4d: Tensor Products - Part (d)", [
  $k_1 times.circle (alpha k_2) = alpha(k_1 times.circle k_2)$
])

#sol[
*Proof:*
$[k_1 times.circle (alpha k_2)](v,w) = k_1(v) dot (alpha k_2)(w)$
$= k_1(v) dot alpha k_2(w)$
$= alpha[k_1(v) dot k_2(w)]$
$= alpha[(k_1 times.circle k_2)(v,w)]$

✓ *Property proven.*
]

#pex("5a: Duality and Metric Tensors - Part (a)", [
  Given $v = sum_i v^i frac(partial, partial x^i)$ and $g = sum_(i,j) g_(i j) d x^i times.circle d x^j$, find $tilde(v) = hat(g)(v)$.
])

#sol[
The dual covector is defined by $tilde(v)(w) = g(v,w)$ for any vector $w$.

For $w = sum_k w^k frac(partial, partial x^k)$:
$g(v,w) = sum_(i,j) g_(i j) v^i w^j$

Therefore:
$tilde(v) = sum_j (sum_i g_(i j) v^i) d x^j = sum_j v_j d x^j$

where $v_j = sum_i g_(i j) v^i$ (lowering the index).
]

#pex("5b: Duality and Metric Tensors - Part (b)", [
  Transform $tilde(v)$ to the o′-frame.
])

#sol[
Under the transformation $x^i = sum_j a^i_j y^j + c^i$:
$d x^i = sum_j a^i_j d y^j$

Therefore:
$tilde(v) = sum_i v_i d x^i = sum_i v_i sum_j a^i_j d y^j = sum_j (sum_i a^i_j v_i) d y^j$

$tilde(v)' = sum_j v'_j d y^j$ where $v'_j = sum_i a^i_j v_i$
]

#pex("5c: Duality and Metric Tensors - Part (c)", [
  Transform vector $v$ to the o′-frame.
])

#sol[
The basis vectors transform as:
$frac(partial, partial x^i) = sum_j frac(partial y^j, partial x^i) frac(partial, partial y^j)$

If $(b^j_i)$ is the inverse of $(a^i_j)$, then:
$v' = sum_j (sum_i b^j_i v^i) frac(partial, partial y^j) = sum_j v'^j frac(partial, partial y^j)$

where $v'^j = sum_i b^j_i v^i$.
]

#pex("5d: Duality and Metric Tensors - Part (d)", [
  Transform the metric tensor to the o′-frame.
])

#sol[
The metric tensor transforms as:
$g' = sum_(k,l) g'_(k l) d y^k times.circle d y^l$

where:
$g'_(k l) = sum_(i,j) a^i_k a^j_l g_(i j)$

This is the standard tensor transformation law for a (0,2) tensor.
]

#pex("5e: Duality and Metric Tensors - Part (e)", [
  Evaluate $tilde(v)' = hat(g)'(v')$.
])

#sol[
Using the transformed metric:
$tilde(v)' = sum_l (sum_k g'_(k l) v'^k) d y^l$

Substituting the transformations:
$= sum_l (sum_(k,i,j,m) a^i_k a^j_l g_(i j) b^k_m v^m) d y^l$

Using $sum_k a^i_k b^k_m = delta^i_m$:
$= sum_l (sum_(i,j) a^j_l g_(i j) v^i) d y^l = sum_l v'_l d y^l$
]

#pex("5f: Duality and Metric Tensors - Part (f)", [
  Yes, the expressions from parts (b) and (e) are the same.
])

#pex("5g: Duality and Metric Tensors - Part (g)", [
  Key Takeaway:
])

#sol[
*Key Takeaway:* The metric-induced duality between vectors and covectors is coordinate-independent. The diagram commutes:

```
    v  ----F----> v'
    |             |
    ĝ             ĝ'
    ↓             ↓
    ṽ  ----F----> ṽ'
```

This demonstrates that:
1. The musical isomorphisms (♭ and ♯) are natural operations
2. The metric structure is geometrically intrinsic
3. Affine transformations preserve the duality relationship
4. Physical quantities can be consistently represented as either vectors or covectors

This is fundamental to the covariant formulation of physics, particularly in general relativity where the metric plays a central role in relating different types of tensorial quantities.
]
