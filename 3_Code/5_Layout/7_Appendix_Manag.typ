
#import "1_Latex_Float_Numbering.typ": *


#let appendix_manag(body) = {

  pagebreak()

  // reset heading counter for Appendix
  counter(heading).update(0)

  // change numbering style for Appendix
  set heading(numbering: "A.1.1")

  // appenix equations numbering should be styled like: (A.1), (A.2);  (B.1), (B.2) and so 
  show: eq_number_appendix

  // init appendix
  heading(level: 1, numbering: none, "Appendix", supplement: [Appendix])

  // adapt counter for appendix sections
  // to have the following sections start with A.1, A.2, and so on
  counter(heading).update(1)

  // have Appendix Section A.1
  show heading.where(level: 1): set heading(supplement: [Appendix Chapter])
  show heading.where(level: 2): set heading(supplement: [Appendix Section])
  show heading.where(level: 3): set heading(supplement: [Appendix Subsection])

  // -------------------------------- keep it ------------------------------- //
  body


}
