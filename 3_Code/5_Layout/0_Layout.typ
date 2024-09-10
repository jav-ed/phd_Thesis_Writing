


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
  // TODO




  // ------------------------------- keep that ------------------------------ //
  body

  }

