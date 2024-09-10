

#import "3_Code/1_Fcns/0_Fcn_Main.typ": *
#import "3_Code/5_Layout/0_Layout.typ":*
#import "3_Code/5_Layout/1_Latex_Float_Numbering.typ":*
#import "3_Code/5_Layout/2_Latex_Float_Outline.typ":*
#import "3_Code/5_Layout/3_Header.typ":*




#set page("a4")

// blocksatz = justify alignment
#set par(
  justify: true,
  first-line-indent: 1em,
  linebreaks: "optimized")


// documentation can be found at https://typst.app/docs/tutorial/writing-in-typst/
#set text(
  font: "New Computer Modern",
  // font: "Platipy",
  size: default_Font_Size,

  lang: "en"
)

// #show link: set text(fill: blue)

// #set enum(indent: 0.7em)

// see: https://typst.app/docs/guides/page-setup-guide/
#set page(numbering: "— I —")
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")

 // --------------------------------- header -------------------------------- //
#show: header_style



// TODO allow big figures to be shown across pages
// #show figure: set block(breakable: true)

/* -------------------------------- Versions -------------------------------- */
// = Version 0
// #include "0_Manag/0_Tab_Of_Cont/0_Ver.typ"

// = Version 1
// #include "0_Manag/0_Tab_Of_Cont/1_Ver.typ"

// = Table of Contents
// #include "0_Manag/0_Tab_Of_Cont/2_Ver.typ"




// --------------------- latex 1.1 figures, tables, eqs --------------------- //
#show: set_figure_numbering.with(new_format: "1.1", kind_type:image)
#show: set_figure_numbering.with(new_format: "1.1", kind_type:table)
#show: set_eqs_numbering.with(new_format: "1.1")

/* ---------------------------------- tocs ---------------------------------- */
#show: float_tocs

#show: float_text_spacing

/* -------------------------- start from zero page -------------------------- */
#set page(numbering: "1")
#counter(page).update(1)



// #set page(
//   numbering: "1",
//   header: [
//     _Javed Arshad Butt_
//     #h(1fr)
//     #context heading
// ]
// )





// ========================================================================== //
// ================================= Trials ================================= //
// ========================================================================== //

// // see: https://github.com/platformer/typst-algorithms
// #include "10_Trials/0_Wr/0_Code.typ"

// // see: https://github.com/typst/packages/tree/main/packages/preview/colorful-boxes/1.2.0
// #include "10_Trials/0_Wr/1_Boxes.typ"

// #include "10_Trials/0_Wr/2_Callouts.typ"
// #include "10_Trials/0_Wr/3_Layouts.typ"
// #include "10_Trials/0_Wr/4_Colors.typ"
// #include "10_Trials/0_Wr/5_Emojis.typ"
// #include "10_Trials/0_Wr/6_Glossary_0.typ"
// #include "10_Trials/0_Wr/6_Glossary_1.typ"
// #include "10_Trials/0_Wr/6_Glossary_2.typ"

// -------------------------------- plotting -------------------------------- //
// #include "10_Trials/1_Plotting/0_Inp_Out.typ"
// #include "10_Trials/1_Plotting/1_Inp_Out.typ"
// #include "10_Trials/1_Plotting/2_Figures.typ"


// ========================================================================== //
// ================================== Main ================================== //
// ========================================================================== //
// #include "2_Wr/11_To_Include/0_File.typ"


/* ========================================================================== */
/* ================================== Intro ================================= */
/* ========================================================================== */
#include "2_Wr/1_Chapters/0_Chap/0_Intro.typ"
#include "2_Wr/1_Chapters/0_Chap/1_Motiv.typ"
#include "2_Wr/1_Chapters/0_Chap/2_Research_Objec.typ"
#include "2_Wr/1_Chapters/0_Chap/3_Work_Strucutre.typ"
#include "2_Wr/1_Chapters/0_Chap/4_Novelty.typ"
#include "2_Wr/1_Chapters/0_Chap/5_Research_Enabler.typ"

/* ---------------------------- State of the art ---------------------------- */
#include "2_Wr/1_Chapters/0_Chap/6_State_Of_Art.typ"

/* ========================================================================== */
/* =============================== Methodology ============================== */
/* ========================================================================== */
#include "2_Wr/1_Chapters/1_Chap/0_Methodology.typ"


/* -------------------------------- Standards ------------------------------- */
#include "2_Wr/1_Chapters/1_Chap/0_Standards/0_Standards.typ"
#include "2_Wr/1_Chapters/1_Chap/0_Standards/1_Pressure_Vessels.typ"
#include "2_Wr/1_Chapters/1_Chap/0_Standards/2_Aero_Standards.typ"
#include "2_Wr/1_Chapters/1_Chap/0_Standards/3_Automotive.typ"
#include "2_Wr/1_Chapters/1_Chap/0_Standards/4_Various_Fields.typ"
#include "2_Wr/1_Chapters/1_Chap/0_Standards/5_Essential_Standards.typ"
#include "2_Wr/1_Chapters/1_Chap/0_Standards/6_Patents.typ"

/* -------------------------------- Hydrogen -------------------------------- */
// #include "2_Wr/1_Chapters/1_Chap/1_Hydrogen/0_H2_Prop.typ"
// #include "2_Wr/1_Chapters/1_Chap/1_Hydrogen/1_Safety.typ"
// #include "2_Wr/1_Chapters/1_Chap/1_Hydrogen/2_Experiment.typ"
// #include "2_Wr/1_Chapters/1_Chap/1_Hydrogen/3_Pressurized_Body.typ"

// ------------------------------- introducion ------------------------------ //
// #include "2_Wr/0_Chap/0_File.typ"
// #include "2_Wr/0_Chap/1_File.typ"
// #include "2_Wr/0_Chap/2_File.typ"
// #include "2_Wr/0_Chap/3_File.typ"

// -------------------------------- chapter 1 ------------------------------- //
// #include "2_Wr/1_Chap/0_File.typ"
// #include "2_Wr/1_Chap/1_File.typ"
// #include "2_Wr/1_Chap/2_File.typ"
// #include "2_Wr/1_Chap/3_File.typ"
// #include "2_Wr/1_Chap/4_File.typ"
// #include "2_Wr/1_Chap/10_File.typ"


// -------------------------------- chapter 2 ------------------------------- //
// #include "2_Wr/2_Chap/0_Variables.typ"
// #include "2_Wr/2_Chap/1_Overwrite_Vars.typ"
// #include "2_Wr/2_Chap/2_Commenting.typ"
// #include "2_Wr/2_Chap/3_Com_Question.typ"


// -------------------------------- Appendix -------------------------------- //
// #include "2_Wr/10_Appendix/0_File.typ"

/* -------------------------------- glossary -------------------------------- */
#include "2_Wr/3_Additional/1_Glossary.typ"


// ----------------------------------- Bib ---------------------------------- //
#pagebreak()

// see: https://typst.app/docs/reference/model/bibliography/#parameters-full
// and: https://typst.app/project/pQH6zuFPPL_G4NlIOLx9K-
#bibliography("1_Data/1_Bib/bib.bib",
// style: "american-institute-of-aeronautics-and-astronautics"
style: "1_Data/1_Bib/0_CSLs/ieee.csl"
)

