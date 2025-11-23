#import "_at.typ":*

#show: ad.with(
  title: "Personal Statement for SEP",
  author: "Parth Bhargava",
  experiment: "Round 1 Application",
  course: "Applying to ETH, EPFL, UT Austin, UC, Cornell",
  title-page: false
)


Physics draws me in because it uncovers structure where, at first sight, there seems only disorder. I have been especially fascinated by areas such as fluid dynamics, complex systems, nonlinear dynamics, and physics-informed neural networks (PINNs), because they reveal patterns that are not obvious but become striking once approached with the right tools. What excites me is the ability to make the abstract tangible: to use mathematics, computation, and physical insight to visualize phenomena that cannot be held in the hand but that nonetheless describe the way the world behaves. This act of drawing parallels between disciplines—seeing how ideas from PINNs echo those in complex systems or nonlinear dynamics—pushes me to think in new ways about emergence, intrinsic properties, and the construction of models that capture essential truths about natural and engineered systems.

At NUS, my education has given me both conceptual grounding and practical training. A course in experimental physics introduced me to the care required when moving from theoretical expectation to measurable outcome. Working with apparatus demanded attention to detail, adaptability, and a readiness to learn from results that did not immediately align with predictions. That experience taught me the importance of iteration and patience, qualities that I now recognize as central to any scientific investigation.

Outside of coursework, I pursued a computational project that became one of the most formative experiences of my undergraduate studies so far. I simulated the propagation of a quantum wavepacket through a one-dimensional potential barrier using Python. To represent the dynamics fully, I constructed a three-dimensional visualization: one axis for position, and the other two for the real and imaginary components of the wave function. This representation illuminated interference and tunneling in a way that standard two-dimensional plots could not capture. The project was self-directed, developed without the framework of a formal course, and it pushed me to build skills in numerical methods, visualization, and debugging while deepening my intuition for quantum phenomena. It also showed me how physics can be made vivid through computation, turning abstract mathematics into a concrete picture of dynamical behavior.

What excites me about methods such as PINNs is their potential to solve problems that evade analytical or classical numerical solutions. By embedding physical laws directly into the architecture of neural networks, these approaches offer a way to merge rigor with adaptability. For me, the promise lies not only in efficiency but in perspective: they encourage new ways of thinking about how constraints and patterns interact, and they resonate with ideas from nonlinear dynamics and complex systems where emergent structures appear out of simple rules. Exploring such connections feels like standing at the boundary between established physics and new methodologies, where the language of one field illuminates the questions of another.

The Student Exchange Program offers a chance to experience how such ideas are pursued in different academic and cultural contexts. What I look forward to most is the opportunity to interact with professors and peers who work on problems aligned with my interests. Every research community has its own ways of framing questions, designing models, and testing results. Exposure to this diversity of approaches will broaden how I think about problems, and conversations with peers will sharpen my ability to communicate complex ideas clearly. Even a short-term collaboration, or simply attending seminars and discussions, can plant seeds that grow into future projects and directions. I value the prospect of building these connections early in my academic path, so that the perspectives I gather now can guide my later decisions about research focus and graduate study.

The experience of exchange extends beyond the laboratory and seminar room. Universities are living environments where culture, people, and place shape the rhythm of intellectual life. I want to see how students and faculty in another setting build community, how their institutions balance tradition with innovation, and how everyday interactions—whether in a classroom, over coffee, or in informal discussions—contribute to the way ideas evolve. Experiencing these dimensions firsthand is essential to a holistic education. It situates physics not as an isolated pursuit but as one embedded in human networks, institutions, and cultures.

Looking ahead, I plan to continue into graduate study, and SEP can serve as a window into the environments where such work thrives. Being immersed in a new academic culture will help me gauge how I respond to different research settings, what kinds of problems I find most engaging, and where I can best contribute. It will also give me a clearer sense of the skills I need to cultivate further—whether in computation, experimentation, or the theoretical framing of problems. These insights are difficult to gain in the abstract; they come most vividly from direct experience.

Physics, at its core, is about confronting the unknown with clarity and persistence. I know I am still at the beginning of this process. My studies so far, along with projects like the quantum wavepacket simulation, have given me glimpses of how rewarding it can be to probe beneath the surface of equations and experiments. SEP represents the next step: a chance to test myself in new contexts, to learn from people whose approaches differ from mine, and to participate, however briefly, in research communities that extend beyond national and institutional boundaries.

In joining this program, I hope to bring with me the curiosity and initiative that have guided my work so far, while gaining a broader perspective on both physics and its place in the world. The chance to explore fluid dynamics, nonlinear dynamics, complex systems, and PINNs within a new academic and cultural environment is one I value deeply, not only for the technical growth it will foster but for the connections and perspectives it will make possible. The exchange is not just about learning techniques or theories; it is about experiencing how physics is lived and practiced in different places, and allowing that experience to shape the researcher—and person—I am becoming.

#v(1em)
#align(right)[
  _Word count: #{
    let content = read("cv.typ")
    let words = content.split(regex("\\s+")).filter(w => w.len() > 0 and not w.starts-with("#"))
    str(words.len() - 52)
  } words (approx.)_
]
