#import "../shared/_at.typ": *

#show: ad.with(
  title: "Worksheet 2",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3261* \
  Classical Mechanics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#pbm("1.2")[
  Show that the acceleration of a particle moving along a trajectory $vb(r)(t)$ is given by
  $ a(t) = (dot(v)(t)) vu(e)_T + (v^2(t))/(rho) vu(e)_N $,
  where $rho equiv 1\/kappa$ is its radius of curvature.
]

#solution[
  *Velocity vector:*

  The velocity vector is:
  $ v(t) = dot(vb(r))(t) = dot(s)(t) (partial vb(r))/(partial s) = v(t) vu(e)_T $

  *Acceleration vector:*

  Taking the time derivative of the velocity:
  $ a(t) &= dot(v)(t) \
  & = dot(v)(t) vu(e)_T + v(t) dot(vu(e)_T)(t) \
  & = dot(v)(t) vu(e)_T + v(t) dot(s)(t) (partial vu(e)_T)/(partial s) \
  & = dot(v)(t) vu(e)_T + v^2(t) kappa vu(e)_N \
  & = dot(v)(t) vu(e)_T + (v^2(t))/(rho) vu(e)_N $

  where we used the definition of curvature $kappa = |(partial vu(e)_T)/(partial s)|$ and the fact that $(partial vu(e)_T)/(partial s) = kappa vu(e)_N$, and $rho = 1\/kappa$ is the radius of curvature.
]

#pagebreak()

#pbm("1.3")[
  Find the tangent, normal and binormal vectors, as well as curvature and torsion for the circular helix.
]

#solution[
  *Position vector:*

  The position vector of the circular helix is:
  $ vb(r)(t) = a cos(omega t) vu(e)_x + a sin(omega t) vu(e)_y + b omega t vu(e)_z $

  where $a$, $b$, and $omega$ are constants.

  *Velocity and speed:*

  $ dot(vb(r))(t) = -a omega sin(omega t) vu(e)_x + a omega cos(omega t) vu(e)_y + b omega vu(e)_z $

  The arc length parameter:
  $ s(t) = integral_0^t |dot(vb(r))(tau)| "d" tau = omega sqrt(a^2 + b^2) t $

  Therefore:
  $ dot(s)(t) = omega sqrt(a^2 + b^2) $

  *Tangent vector:*

  $ vu(e)_T(t) &= (partial vb(r)(s))/(partial s) = (dot(vb(r))(t))/(dot(s)(t)) \
  & = 1/(sqrt(a^2 + b^2)) (-a sin(omega t) vu(e)_x + a cos(omega t) vu(e)_y + b vu(e)_z) $

  *Normal vector and curvature:*

  Taking the derivative of the tangent vector:
  $ dot(vu(e)_T)(t) = (a omega)/(sqrt(a^2 + b^2)) (-cos(omega t) vu(e)_x - sin(omega t) vu(e)_y) $

  Converting to arc length parameter:
  $ (partial vu(e)_T(t))/(partial s) = dot(vu(e)_T)(t) / dot(s)(t) = a/(a^2 + b^2) (-cos(omega t) vu(e)_x - sin(omega t) vu(e)_y) $

  The curvature is:
  $ kappa(t) = |(partial vu(e)_T(t))/(partial s)| = a/(a^2 + b^2) $

  The normal vector is:
  $ vu(e)_N(t) = 1/(kappa(t)) (partial vu(e)_T(t))/(partial s) = -cos(omega t) vu(e)_x - sin(omega t) vu(e)_y $

  *Binormal vector:*

  $ vu(e)_B(t) &= vu(e)_T(t) times vu(e)_N(t) \
  & = 1/(sqrt(a^2 + b^2)) (b sin(omega t) vu(e)_x - b cos(omega t) vu(e)_y + a vu(e)_z) $

  *Torsion:*

  Taking the derivative of the binormal vector:
  $ dot(vu(e)_B)(t) = (b omega)/(sqrt(a^2 + b^2)) (cos(omega t) vu(e)_x + sin(omega t) vu(e)_y) $

  Converting to arc length parameter:
  $ (partial vu(e)_B(t))/(partial s) = dot(vu(e)_B)(t) / dot(s)(t) = b/(a^2 + b^2) (cos(omega t) vu(e)_x + sin(omega t) vu(e)_y) $

  Using the Frenet-Serret formula $(partial vu(e)_B)/(partial s) = -tau vu(e)_N$:
  $ tau(t) = -vu(e)_N(t) dot (partial vu(e)_B(t))/(partial s) = b/(a^2 + b^2) $

  Alternatively, we can compute:
  $ dot(vu(e)_N)(t) = omega (sin(omega t) vu(e)_x - cos(omega t) vu(e)_y) $

  Converting to arc length:
  $ (partial vu(e)_N(t))/(partial s) = dot(vu(e)_N)(t) / dot(s)(t) = 1/(sqrt(a^2 + b^2)) (sin(omega t) vu(e)_x - cos(omega t) vu(e)_y) $

  Using the relationship $tau = vu(e)_B dot (partial vu(e)_N)/(partial s)$:
  $ tau(t) = vu(e)_B(t) dot (partial vu(e)_N(t))/(partial s) = b/(a^2 + b^2) $

  *Summary:*

  $ cases(
    vu(e)_T(t) &= 1/(sqrt(a^2 + b^2)) (-a sin(omega t) vu(e)_x + a cos(omega t) vu(e)_y + b vu(e)_z), \
    vu(e)_N(t) &= -cos(omega t) vu(e)_x - sin(omega t) vu(e)_y, \
    vu(e)_B(t) &= 1/(sqrt(a^2 + b^2)) (b sin(omega t) vu(e)_x - b cos(omega t) vu(e)_y + a vu(e)_z), \
    kappa(t) &= a/(a^2 + b^2), \
    tau(t) &= b/(a^2 + b^2)
  ) $
]

#pagebreak()

#pbm("1.4")[
  Establish the relationship between unit basis vectors $(vu(e)_rho, vu(e)_phi)$ of the polar coordinate system and the unit basis vectors $(vu(e)_x, vu(e)_y)$ of the Cartesian coordinate system.
]

#solution[
  *Transformation from Cartesian to polar:*

  The position vector in Cartesian coordinates is:
  $ vb(r) = x vu(e)_x + y vu(e)_y = rho cos phi vu(e)_x + rho sin phi vu(e)_y $

  The unit basis vectors in polar coordinates are defined as:
  $ cases(
    vu(e)_rho &= (partial vb(r))/(partial rho) / (|(partial vb(r))/(partial rho)|) = cos phi vu(e)_x + sin phi vu(e)_y, \
    vu(e)_phi &= (partial vb(r))/(partial phi) / (|(partial vb(r))/(partial phi)|) = -sin phi vu(e)_x + cos phi vu(e)_y
  ) $

  *Inverse transformation:*

  To find the inverse transformation, we solve for $(vu(e)_x, vu(e)_y)$ in terms of $(vu(e)_rho, vu(e)_phi)$. The transformation matrix has determinant $cos^2 phi + sin^2 phi = 1$, so its inverse is:
  $ cases(
    vu(e)_x &= cos phi vu(e)_rho - sin phi vu(e)_phi, \
    vu(e)_y &= sin phi vu(e)_rho + cos phi vu(e)_phi
  ) $

]

#pagebreak()

#pbm("1.5")[
  Express the velocity and acceleration vectors in 2D polar coordinates.
]

#solution[
  *Position vector:*

  In polar coordinates, the position vector is:
  $ vb(r)(t) = rho(t) vu(e)_rho $

  *Time derivatives of basis vectors:*

  From the relationship:
  $ cases(
    vu(e)_rho &= cos phi(t) vu(e)_x + sin phi(t) vu(e)_y, \
    vu(e)_phi &= -sin phi(t) vu(e)_x + cos phi(t) vu(e)_y
  ) $

  Taking time derivatives:
  $ cases(
    dot(vu(e)_rho)(t) &= -dot(phi)(t) sin phi(t) vu(e)_x + dot(phi)(t) cos phi(t) vu(e)_y = dot(phi)(t) vu(e)_phi, \
    dot(vu(e)_phi)(t) &= -dot(phi)(t) cos phi(t) vu(e)_x - dot(phi)(t) sin phi(t) vu(e)_y = -dot(phi)(t) vu(e)_rho
  ) $

  *Velocity vector:*

  Taking the time derivative of the position vector:
  $ v(t) &= dot(vb(r))(t) \
  & = dot(rho)(t) vu(e)_rho + rho(t) dot(vu(e)_rho)(t) \
  & = dot(rho)(t) vu(e)_rho + rho(t) dot(phi)(t) vu(e)_phi $

  *Acceleration vector:*

  Taking the time derivative of the velocity:
  $ a(t) &= dot(v)(t) \
  & = dot.double(rho)(t) vu(e)_rho + dot(rho)(t) dot(vu(e)_rho)(t) + dot(rho)(t) dot(phi)(t) vu(e)_phi + rho(t) dot.double(phi)(t) vu(e)_phi + rho(t) dot(phi)(t) dot(vu(e)_phi)(t) \
  & = dot.double(rho)(t) vu(e)_rho + dot(rho)(t) dot(phi)(t) vu(e)_phi + dot(rho)(t) dot(phi)(t) vu(e)_phi + rho(t) dot.double(phi)(t) vu(e)_phi - rho(t) dot(phi)^2(t) vu(e)_rho \
  & = [dot.double(rho)(t) - rho(t) dot(phi)^2(t)] vu(e)_rho + [rho(t) dot.double(phi)(t) + 2 dot(rho)(t) dot(phi)(t)] vu(e)_phi $

  *Summary:*

  $ cases(
    v(t) &= dot(rho)(t) vu(e)_rho + rho(t) dot(phi)(t) vu(e)_phi, \
    a(t) &= [dot.double(rho)(t) - rho(t) dot(phi)^2(t)] vu(e)_rho + [rho(t) dot.double(phi)(t) + 2 dot(rho)(t) dot(phi)(t)] vu(e)_phi
  ) $
]

#pagebreak()

#pbm("1.6")[
  Express the spherical unit basis vectors $(vu(e)_r, vu(e)_theta, vu(e)_phi)$ in terms of Cartesian unit basis vectors $(vu(e)_x, vu(e)_y, vu(e)_z)$.
]

#solution[
  *Position vector in spherical coordinates:*

  The position vector in Cartesian coordinates is:
  $ vb(r) = x vu(e)_x + y vu(e)_y + z vu(e)_z = r sin theta cos phi vu(e)_x + r sin theta sin phi vu(e)_y + r cos theta vu(e)_z $

  *Partial derivatives:*

  $ cases(
    (partial vb(r))/(partial r) &= sin theta cos phi vu(e)_x + sin theta sin phi vu(e)_y + cos theta vu(e)_z, \
    (partial vb(r))/(partial theta) &= r cos theta cos phi vu(e)_x + r cos theta sin phi vu(e)_y - r sin theta vu(e)_z, \
    (partial vb(r))/(partial phi) &= -r sin theta sin phi vu(e)_x + r sin theta cos phi vu(e)_y
  ) $

  *Magnitudes:*

  $ cases(
    |(partial vb(r))/(partial r)| &= sqrt(sin^2 theta cos^2 phi + sin^2 theta sin^2 phi + cos^2 theta) = sqrt(sin^2 theta + cos^2 theta) = 1, \
    |(partial vb(r))/(partial theta)| &= r sqrt(cos^2 theta cos^2 phi + cos^2 theta sin^2 phi + sin^2 theta) = r sqrt(cos^2 theta + sin^2 theta) = r, \
    |(partial vb(r))/(partial phi)| &= r sin theta sqrt(sin^2 phi + cos^2 phi) = r sin theta
  ) $

  *Unit basis vectors:*

  $ cases(
    vu(e)_r &equiv (partial vb(r))/(partial r) / (|(partial vb(r))/(partial r)|) = sin theta cos phi vu(e)_x + sin theta sin phi vu(e)_y + cos theta vu(e)_z, \
    vu(e)_theta &equiv (partial vb(r))/(partial theta) / (|(partial vb(r))/(partial theta)|) = cos theta cos phi vu(e)_x + cos theta sin phi vu(e)_y - sin theta vu(e)_z, \
    vu(e)_phi &equiv (partial vb(r))/(partial phi) / (|(partial vb(r))/(partial phi)|) = -sin phi vu(e)_x + cos phi vu(e)_y
  ) $

  *Verification of right-handed coordinate system:*

  The scalar triple product should equal 1:
  $ vu(e)_r dot (vu(e)_theta times vu(e)_phi) = 1 $
  
  This can be verified by direct computation using the expressions above.

  This confirms that the basis vectors form a right-handed orthonormal coordinate system.

  *Summary:*

  $ cases(
    vu(e)_r &= sin theta cos phi vu(e)_x + sin theta sin phi vu(e)_y + cos theta vu(e)_z, \
    vu(e)_theta &= cos theta cos phi vu(e)_x + cos theta sin phi vu(e)_y - sin theta vu(e)_z, \
    vu(e)_phi &= -sin phi vu(e)_x + cos phi vu(e)_y
  ) $
]

