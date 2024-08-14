

#import "3_Code/1_Fcns/0_Fcn_Main.typ": *

// documentation can be found at https://typst.app/docs/tutorial/writing-in-typst/

#set text(
  font: "New Computer Modern",
  size: default_Font_Size,
  
  lang: "de"
)
// #show link: set text(fill: blue)

// #set enum(indent: 0.7em)

// see: https://typst.app/docs/guides/page-setup-guide/
#set page(numbering: "1")
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")



// ----------------------------- report specific ---------------------------- //
// blocksatz = justify alignment
#set par(justify: true)

// TODO allow big figures to be shown across pages 
// #show figure: set block(breakable: true)

/* -------------------------------- Versions -------------------------------- */
// = Version 0
// #include "0_Manag/0_Tab_Of_Cont/0_Ver.typ"

// = Version 1
// #include "0_Manag/0_Tab_Of_Cont/1_Ver.typ"

// = Table of Contents
// #include "0_Manag/0_Tab_Of_Cont/2_Ver.typ"


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


#include "2_Wr/1_Chapters/0_Chap/0_File.typ"
#include "2_Wr/1_Chapters/0_Chap/1_File.typ"


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
// #include "2_Wr/100_Chapter/1_Glossary.typ"


// ----------------------------------- Bib ---------------------------------- //
#pagebreak()
#bibliography("1_Data/1_Bib/bib.bib")