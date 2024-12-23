
#import "1_Latex_Float_Numbering.typ":*
#import "2_Latex_Outlines.typ":*
#import "3_Page_Header.typ":*
#import "4_Text_Header.typ":*
#import "5_Regular_Things.typ":*
#import "6_Page_Footer.typ":*
#import "7_Appendix_Manag.typ":*



/* ========================================================================== */
/* =========================== float_text_spacing =========================== */
/* ========================================================================== */
#let float_text_spacing(body) = {


  // --------------------- space between text and figures --------------------- //
  show figure.where(kind: image): it => {
    v(0.75em, weak:false)
    it
    v(0.75em, weak:false)

  }
  // ---------------------- space between text and tables --------------------- //
  show figure.where(kind: table): it => {
    v(0.75em, weak:false)
    it
    v(0.75em, weak:false)

  }


  // ------------------------ space betwen text and eqs ----------------------- //




  // ------------------------------- keep that ------------------------------ //
  body

  }

