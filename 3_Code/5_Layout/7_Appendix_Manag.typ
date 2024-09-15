
#import "1_Latex_Float_Numbering.typ": *


#let appendix_manag(body) = {

  // reset heading counter for Appendix
  counter(heading).update(0)

  // change numbering style for Appendix
  set heading(numbering: "A")

  // appenix equations numbering should be styled like: (A.1), (A.2);  (B.1), (B.2) and so 
  show: eq_number_appendix


  // -------------------------------- keep it ------------------------------- //
  body


}
