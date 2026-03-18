#set page(
  paper: "us-letter",
  margin: (top: 1in, bottom: 1in, left: 1in, right: 1in)
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
  fill: black
)

#set par(
  justify: true,
  leading: 1em
)

#let section(title) = {
  text(size: 13pt, weight: "bold")[#title]
  v(0.4em)
}

#text(size: 16pt, weight: "bold")[Personal Statement] \
#text(size: 11pt)[Parth Bhargava | bhargava.parth07\@gmail.com | National University of Singapore]

#v(0.6em)

Physics draws me in because it uncovers structure where, at first sight, there seems only disorder. The core of my interest is interdisciplinary physics that can be interpreted and visualized in statistical, geometrical, and mechanical ways, making the abstract tangible. I keep returning to the moment when a complicated system becomes legible and the story of it can be told in geometry, in phase space, or in a clean model that makes its logic visible. That is why I am drawn to chaos theory, network science, nonlinear dynamics, and biophysical systems. These fields all emerge from the same philosophy, and they are connected by the tools that help map patterns without sanding away what makes them complex. I am early in my training, and an REU is the place where I can learn how to turn that intuition into a focused question, carry it through a full research cycle, and communicate the results clearly.

My path into these questions has been grounded in experimental physics, where the distance between theory and measurement is a discipline of its own. In a Hall effect study on germanium, I identified carrier types and measured mobility using both Hall voltage and magnetoresistance. The moment those two paths agreed was when the result became real to me, and it taught me to trust a claim only after it survives a second, independent check. In X-ray diffraction experiments, I determined lattice constants and identified an unknown crystal via structural fingerprinting, and the uncertainty propagation forced me to confront calibration limits rather than treat them as background noise. In magnetic moment measurements with a Helmholtz coil, I calibrated the field constant through multiple independent methods and corrected a mistaken assumption by showing that torque scales with the square of diameter, not linearly. These projects taught me that the most honest model is the one willing to be revised by data, and that the gap between expectation and observation is often where the real insight lives. They also taught me how to document a process clearly, which is essential for working in a research group and for making work reproducible.

I have also learned to look for that same honesty in computation. I built a 3D simulation in Python of a quantum wavepacket moving through a one-dimensional potential barrier, with axes for position and the real and imaginary components of the wave function. That visualization made interference and tunneling feel concrete in a way that static plots never did. It also forced me to confront the way numerical choices shape outcomes. An early version of the code looked stable but produced reflections I could not explain. Tracing the problem back to boundary conditions pushed me to rebuild the simulation and changed how I think about what counts as a real result in numerical work. That experience confirmed my interest in modeling as a way to turn abstract equations into geometric behavior that can be interrogated and trusted, and it prepared me to contribute to a group project that involves simulation, data cleaning, or parameter sweeps.

The questions that follow from this are broad by necessity. I want to understand how deterministic rules can produce behavior that is effectively unpredictable, how network structure shapes feedback and robustness, and how biological systems balance stability with sudden transitions. I am also interested in fluid dynamics and physics-informed neural networks because they sit at the intersection of physical law, computation, and pattern formation. What ties these interests together is emergence, how local interactions build global structure, and how we decide whether that structure is genuine or just an accumulation of correlations. In a 10 week program, I want to take one of these themes and make it concrete, for example by testing a dynamical model against data, mapping parameter regimes, or comparing competing models with clear statistical checks and visual diagnostics.

At this stage, I am building the mathematical and computational depth needed to engage these questions seriously. My coursework has covered classical mechanics, electromagnetism, quantum mechanics, and mathematical methods, and I have worked to connect those foundations with data analysis, modeling, and visualization. I want research environments that value careful framing of questions, explicit modeling assumptions, and the iterative process of refining those assumptions in response to evidence. I am especially interested in mentorship that emphasizes how to move from qualitative fascination to precise, testable inquiry, and how to decide what is worth simplifying and what must be kept intact. I also value collaborative work, where the habit of explaining a result clearly is treated as part of the science.

I hope to contribute the habits I have developed through experimental physics: careful measurement, explicit error budgeting, and a willingness to revise models when the evidence demands it. I also bring a growing computational skillset, a commitment to interdisciplinary thinking, and persistence in the face of ambiguity. Above all, I want to learn how to ask better questions about complex systems, and how to turn those questions into models that are both rigorous and genuinely illuminating. I am excited to work in a setting where that chain from observation to model to geometry to interpretation remains intact, and where learning how to make complexity legible is a shared goal.
