#import "../1_Fcns/0_Fcn_Main.typ": *


/* ---------------------------------- tocs ---------------------------------- */
#import "1_Helper/4_Init_Toc.typ": *
#import "1_Helper/5_Toc_Latex.typ": *


/* ---------------------------------- figs ---------------------------------- */
#import "1_Helper/0_Inital_Fig_Latex.typ": *
#import "1_Helper/1_Fig_Latex.typ": *

/* ---------------------------------- tabs ---------------------------------- */
#import "1_Helper/2_Init_Tab_Latex.typ": *
#import "1_Helper/3_Tables_Latex.typ": *


#let multiple_tocs(body) = {

  /* ======================================================================== */
  /* ============================== regular toc ============================= */
  /* ======================================================================== */

  // first attempt
  // show: init_latex_toc

  // second attempt
  show: outex
  show outline: set par(leading: 1em) // For spacing between level-2+ entries

  // For spacing before level-1 entries
  set par(spacing: 3.5em)
  // show outline: set block(spacing: 3.5em) 

  // should be there 
  heading("Table of Contents", level:1, numbering:none)
  outline(
      // indent: auto, // activate for first attempt
      // title : "Table of Contents",
      title : none,
      // fill:   repeat[~~~.],  // none,
    )

  pagebreak(weak:true)

  // required for lists of figures/table 
  show outline: set par(leading: 1em) // For spacing between level-2+ entries
  show outline: set block(spacing: 1em) // For spacing before level-1 entries

 

  /* ======================================================================== */
  /* ============================== figure tocs ============================= */
  /* ======================================================================== */

  // the first attempt
  // show: bod => init_latex_figs(bod, [Figure])

  // the second attempt - should be more powerful
  // TODO - adding heading creates iteration issues
  // show: latex_figs

  heading("List of Figures", level:1, numbering:none)
  outline(
    // title: [List of Figures],
    title: none,
    // target: (figure.where(kind: image) figure.where(kind: "image_app"),
    target: figure.where(supplement: [Figure]),
  )

  pagebreak(weak:true)

  /* ======================================================================== */
  /* =============================== table toc ============================== */
  /* ======================================================================== */


  // inital attempt
  // show: init_latex_tables

  // second attempt - more latex like
  show: latex_tables

  heading("List of Tables", level:1, numbering:none)
  outline(
    // title: [List of Tables],
    title: none,
    // target: figure.where(kind: table),
    target: figure.where(supplement: [Table]),   

  )
  pagebreak(weak:true)



  // reset spacing between par, default is 1.2em
  set par(spacing: 1.2em)
  // -------------------------------- keep it ------------------------------- //
  body

  }