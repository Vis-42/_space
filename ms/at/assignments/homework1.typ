#import "../shared/_at.typ": *

#show: ad.with(
  title: "Homework 1",
  author: [Parth Bhargava · A0310667E],
  experiment: "",
  course: [*PC3267* \
  Biophysics II],
  title-page: false,
  decorative: true
)

#set math.equation(numbering: none)
#set math.cases(gap: 1em)

#let imath(body) = text(size: 1.1em)[#body]

#pbm("1")[
  Calculate $k_B T$ in unit of kcal/mol for 37 Celsius degree. The number you get may be used as a rough estimation of the energy of thermal fluctuations of biomolecules. Please compare this energy with the bonding energies for hydrogen bonds, and discuss stability of hydrogen bonds at 37 Celsius degree (i.e., around our body temperature).
]

#solution[
  *Compute $k_B T$*

  Convert to Kelvin: $T = 37° C = 310.15$ K.
  For per‑mole energies, $k_B T = R T$ with
  $R = 0.001987 text("kcal/mol·K")$,
  $
  k_B T = (0.001987) T
  $
  in kcal/mol. Therefore
  $
  k_B T ≈ 0.001987 · 310.15 ≈ 0.616 text("kcal/mol")
  $

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Compare with H‑bond energies*

  Typical hydrogen bonds are ~1–3 kcal/mol, i.e., a few $k_B T$.
  Hence a single H‑bond is marginal at 37 °C and can break due to thermal
  fluctuations; stability in DNA/proteins comes from many bonds plus stacking
  and hydrophobic effects acting cooperatively.
]

#pbm("2")[
  Suppose peptide chains are synthesized using a solution that contains 20 types of amino acids. The synthesized peptides are separated according to their length (molecular weight) using a centrifugal concentrator. Consider the sample for short peptides of five amino acids long. How many types of peptides of such a length may be expected in the sample?
]

#solution[
  *Counting argument*

  Each of the 5 positions is chosen independently from 20 amino acids (no
  constraints or bias assumed), so
  $
  20^5 = 3.2 × 10^6
  $
  distinct sequences (order matters and repeats are allowed).
]

#pagebreak()

#pbm("3")[
  How many codons at most out of nucleotides?
]

#solution[
  *Triplet count*

  A codon is an ordered triplet over 4 nucleotides, so
  $
  4^3 = 64
  $
  possible codons at most. Some codons are stops, so the number that encode
  amino acids is smaller, but the maximum number of codons is 64.
]

#pbm("4")[
  A DNA strand 5'-ATCGAA-3' forms a double helix with another strand 5'-TTCGAT-3'. Use the data given in the table below to estimate the free energy of the double helix for 37 Celsius degree. How does the duplex energy compare with $k_B T$ for the same temperature?

  #figure(
    image("../../../../_zss/d 184.png", width: 70%),
    caption: [Nearest‑neighbor ΔH° and ΔS° parameters at 1 M NaCl. Source: SantaLucia, PNAS 1998.],
    supplement: [Table]
  )
]

#solution[
  *Nearest‑neighbor sum*

  Nearest‑neighbor steps along 5'-ATCGAA-3' are AT/TA, CT/GA, CG/GC, GA/CT, AA/TT.
  Using SantaLucia (1998) nearest‑neighbor parameters (kcal/mol, cal/mol·K),
  add the two A–T terminal initiation terms and no symmetry correction:
  $
  Delta H° = (-7.2 -7.8 -10.6 -8.2 -7.9) + 2(2.3) = -37.1
  $
  $
  Delta S° = (-20.4 -21.0 -27.2 -22.2 -22.2) + 2(4.1) = -104.8
  $
  Then at $T=310.15$ K,
  $
  Delta G° = Delta H° - T Delta S°
  = -37.1 - 310.15(-104.8/1000)
  ≈ -4.60 text("kcal/mol")
  $
  where $1/1000$ converts cal/mol·K to kcal/mol·K.

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Compare with $k_B T$*

  With $k_B T ≈ 0.616$ kcal/mol, the stability scale is
  $
  Delta G°/(k_B T) ≈ -7.5
  $
  so the helix is thermodynamically stable at 37 °C.
]

#pbm("5")[
  In the table accompanying question 4, the enthalpy and entropy for AT/TA are different from those for TA/AT. What the reason?

  Tip: The two questions are like a project. You need read and understand the cited reference in PNAS all by yourself in order to answer the two questions.
]

#solution[
  *Physical basis*

  Nearest‑neighbor parameters depend on stacking orientation along the strand.
  AT/TA and TA/AT are reversed steps with different stacking geometry and
  electrostatics, so their ΔH° and ΔS° are not equal.
]

#pbm("6")[
  Consider a DNA double helix as illustrated below. A and B mark the two end of a strand. Is A the 3' end or 5' end?

  #figure(
    image("../../../../_zss/d 185.png", width: 70%),
    caption: [DNA double helix with labeled end A and B. Adapted from Alberts et al., Molecular Biology of the Cell.],
    supplement: [Figure]
  )
]

#pagebreak()

#solution[
  *End‑group chemistry*

  The 5' end carries a terminal phosphate, while the 3' end carries a free hydroxyl
  on the sugar. In the figure, the phosphate is at A, so A is the 5' end and B is
  the 3' end.
]

#pbm("7")[
  Three peptides form β sheets as shown below. A and B mark the two ends of one peptide. Is A end the C-terminus or N-terminus?

  #figure(
    image("../../../../_zss/d 186.png", width: 50%),
    caption: [β‑sheet with labeled peptide ends A and B. Adapted from Alberts et al., Molecular Biology of the Cell.],
    supplement: [Figure]
  )
]

#solution[
  *Backbone direction*

  The peptide backbone runs from N‑terminus (free amine) to C‑terminus (free carboxyl).
  The orientation in the figure follows the backbone N→C direction, so the end
  labeled A is the N‑terminus and B is the C‑terminus.
]

#pagebreak()

#pbm("8")[
  Chromosomes contain not only DNA but also proteins. What’s the DNA/protein mass ratio in chromosomes, roughly? And why so many proteins?
]

#solution[
  *Order‑of‑magnitude*

  The DNA:protein mass ratio in chromatin is roughly 1:1 (order unity).
  Proteins are needed to package DNA into nucleosomes, organize higher‑order
  structure, regulate gene expression, and support replication/repair. The
  comparable mass reflects tight DNA–protein association in chromatin.
]

#pbm("9")[
  Count the number of codons for each of the 20 amino acids. Tell whatever patterns you may recognize from the numbers and give your opinions on the possible reasons for the patterns.
]

#solution[
  *Degeneracy list*

  Codon degeneracy for the 20 amino acids (standard genetic code):
  #linebreak()
  6 codons: Leu, Ser, Arg
  #linebreak()
  4 codons: Ala, Gly, Pro, Thr, Val
  #linebreak()
  3 codons: Ile
  #linebreak()
  2 codons: Asn, Asp, Cys, Gln, Glu, His, Lys, Phe, Tyr
  #linebreak()
  1 codon: Met, Trp
  #linebreak()

  #line(length: 100%, stroke: (paint: colors.solution-fg.lighten(70%), thickness: 0.5pt))

  *Patterns*

  Patterns: degeneracy is highest for common amino acids; the third (wobble)
  position often varies without changing the amino acid, reducing the impact of
  point mutations and translation errors. Stop codons are separate and are not
  assigned to amino acids.
]
