
#import "../1_Fcns/0_Fcn_Main.typ": *


// ----------------------------- regular_layout ----------------------------- //
#let regular_layout(body) = {

  set page(
    paper:"a4",
    numbering: "— I —",
    margin: (
      left: 3.5cm,
      right: 2cm,
      bottom: 3cm,
      top: 3cm
      ), 
    )

  // blocksatz = justify alignment
  set par(
    justify: true,
    first-line-indent: 1em,
    linebreaks: "optimized",
    // leading: 0.65em
    // hanging-indent: 1em

    )


  // documentation can be found at https://typst.app/docs/tutorial/writing-in-typst/
  set text(
    font: "New Computer Modern",
    // font: "Platipy",
    size: default_Font_Size,

    lang: "en"
  )

  // space between different paragrpahs
  set block(above:1.6em)

  // #show link: set text(fill: blue)

  // #set enum(indent: 0.7em)

  // see: https://typst.app/docs/guides/page-setup-guide/
  set heading(numbering: "1.1.1")
  set math.equation(numbering: "(1)")




  /* -------------------------------- keep it ------------------------------- */
  body
}