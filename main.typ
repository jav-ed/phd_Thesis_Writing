

#import "3_Code/1_Fcns/0_Fcn_Main.typ": *
#import "3_Code/5_Layout/0_Layout_Main.typ":*

// Note, the order of the show and set rules are of high importance. If they are changed and the changes are not thought through, unexpected layout issues could occur. One example that was observed was: if the terxt_header and page_header are not set after the figure numbering or float_spacing, the page headers are shifted. So when you are in the chapter Methodology, it will not detect it properly. It detected this header to be on one page earlier.

// general rules for the moment are difficult to provide. if you need to add things and the rendeing beahviour is not as expected, you might need to change the order - in a even not quite obious way
#show: regular_layout


// ------------------------------- cover page ------------------------------- //
// for the cover page usally the page number is not displayed
#set page(numbering: none)
#include("2_Wr/11_To_Include/0_Cover_Page.typ")

// after the coverage page the page number inshallah can be activated again
#set page(numbering: "— I —")


// TODO allow big figures to be shown across pages
// #show figure: set block(breakable: true)

#show: float_text_spacing

/* -------------------- latex 1.1 figures, tables, eqs -------------------- */
#show: set_figure_numbering.with(new_format: "1.1", kind_type:image)
#show: set_figure_numbering.with(new_format: "1.1", kind_type:table)
#show: set_eqs_numbering.with(new_format: "1.1")

// appendix
#show: float_number_apend.with()


// --------------------------------- header -------------------------------- //
#show: text_header
#show: page_header
#show: doc => def_page_footer(doc, "Javed Arshad Butt - Thesis")



/* ---------------------------------- tocs ---------------------------------- */
// table of contents, list of figures, list of tables
#show: multiple_tocs

// ------------------------------- page footer ------------------------------ //
// must be after multiple_tocs, because it depends on the list of tables
// #show: doc => def_page_footesr(doc, "Javed Arshad Butt - Thesis")


/* -------------------------------------------------------------------------- */
// change type of numbering
#set page(numbering: "1")



// ========================================================================== //
// ================================== Main ================================== //
// ========================================================================== //

// --------------------------------- Preface -------------------------------- //
#include "2_Wr/0_Prerequire/0_Preface.typ"

// #include "2_Wr/11_To_Include/0_File.typ"


/* ========================================================================== */
/* ================================== Intro ================================= */
/* ========================================================================== */
#counter(heading).update(0)

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
#include "2_Wr/1_Chapters/1_Chap/0_Standards/1_Aero_Standards.typ"
#include "2_Wr/1_Chapters/1_Chap/0_Standards/2_Pressure_Vessels.typ"
#include "2_Wr/1_Chapters/1_Chap/0_Standards/3_Automotive.typ"
#include "2_Wr/1_Chapters/1_Chap/0_Standards/4_Patents.typ"
#include "2_Wr/1_Chapters/1_Chap/0_Standards/5_Various_Fields.typ"
#include "2_Wr/1_Chapters/1_Chap/0_Standards/6_Essential_Standards.typ"

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
// #show: appendix_manag
// #include "2_Wr/10_Appendix/0_File.typ"

/* -------------------------------- glossary -------------------------------- */
#include "2_Wr/3_Additional/1_Glossary.typ"


// ----------------------------------- Bib ---------------------------------- //
#pagebreak()

// see: https://typst.app/docs/reference/model/bibliography/#parameters-full
// and: https://typst.app/project/pQH6zuFPPL_G4NlIOLx9K-
#bibliography("1_Data/1_Bib/bib.bib",

// was modified and obtained through:https://github.com/citation-style-language/styles/blob/master/ieee.csl
style: "1_Data/1_Bib/0_CSLs/ieee.csl"

)

