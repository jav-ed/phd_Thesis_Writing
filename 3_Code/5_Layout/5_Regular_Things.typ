
#import "../1_Fcns/0_Fcn_Main.typ": *

#import "0_Utils/0_Layout_Variables.typ": * 



// ----------------------------- regular_layout ----------------------------- //
#let regular_layout(body) = {

  set page(
    paper:"a4",
    numbering: "— I —",
    margin: (
      left: 3.5cm,
      right: 2cm,
      bottom: 2.7cm,
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
    font: chosen_font,
    // font: "Platipy",
    size: default_Font_Size,
    weight: font_weight,

    lang: "en"
  )

  // space between different paragrpahs
  set block(above:1.6em)

  // show link: set text(fill: blue)
  
  // the version with regular brakets () looks better 
  // set math.mat(delim: "[")
  set math.mat(column-gap: 0.7em)
  set math.mat(row-gap: 0.6em)

  // #set enum(indent: 0.7em)

  // see: https://typst.app/docs/guides/page-setup-guide/
  set heading(numbering: "1.1.1")
  set math.equation(numbering: "(1)")

  set quote(block: true)

  // allow tables and figure to be displayed across pages, that is, tables are broken properly to the next page
  show figure: set block(breakable: true)


  /* -------------------------------- keep it ------------------------------- */
  body
}