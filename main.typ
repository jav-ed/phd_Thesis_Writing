// some infos at 0_Manag/4_Compilation

#import "3_Code/1_Fcns/0_Fcn_Main.typ": *
#import "3_Code/5_Layout/0_Layout_Main.typ":*


// Note, the order of the show and set rules are of high importance. If they are changed and the changes are not thought through, unexpected layout issues could occur. One example that was observed was: if the terxt_header and page_header are not set after the figure numbering or float_spacing, the page headers are shifted. So when you are in the chapter Methodology, it will not detect it properly. It detected this header to be on one page earlier.

// general rules for the moment are difficult to provide. if you need to add things and the rendeing beahviour is not as expected, you might need to change the order - in a even not quite obious way
#show: regular_layout

// inital registration of the glossary
#show: init_glossary

// ------------------------------- cover page ------------------------------- //
// for the cover page usally the page number is not displayed
#set page(numbering: none)
#include("2_Wr/11_To_Include/0_Cover_Page.typ")

// after the coverage page the page number inshallah can be activated again
#set page(numbering: "— I —")

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



/* -------------------------------------------------------------------------- */
// change type of numbering
#set page(numbering: "1")


// Font Tester - New Computer Modern is inshallah the best choice, keep it
// #include "1_Data/4_Fonts/100_Trials/0_Font_Trial.typ"


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

// link color changed here in order not to effect the link color of the tocs
#show link: set text(fill: color_Link)



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
#include "2_Wr/1_Chapters/1_Chap/0_Standards/4_Various_Fields.typ"
#include "2_Wr/1_Chapters/1_Chap/0_Standards/5_Essential_Standards.typ"

/* -------------------------------- Hydrogen -------------------------------- */
#include "2_Wr/1_Chapters/1_Chap/1_Hydrogen/0_H2_Prop.typ"
#include "2_Wr/1_Chapters/1_Chap/1_Hydrogen/1_Safety.typ"
#include "2_Wr/1_Chapters/1_Chap/1_Hydrogen/2_Experiment.typ"
#include "2_Wr/1_Chapters/1_Chap/1_Hydrogen/3_Pressurized_Body.typ"

// ---------------------- loadcase and curvature study ---------------------- //
#include "2_Wr/1_Chapters/1_Chap/2_Loadcase/0_Loadcase.typ"
#include "2_Wr/1_Chapters/1_Chap/2_Loadcase/1_Curv_Theory.typ"
#include "2_Wr/1_Chapters/1_Chap/2_Loadcase/2_Curv_3D.typ"
#include "2_Wr/1_Chapters/1_Chap/2_Loadcase/3_Curv_2D.typ"
#include "2_Wr/1_Chapters/1_Chap/2_Loadcase/4_Physical_Load.typ"
#include "2_Wr/1_Chapters/1_Chap/2_Loadcase/5_Physical_Collet.typ"

// ------------------------------ optimization ------------------------------ //
#include "2_Wr/1_Chapters/1_Chap/3_Optimization/0_Discretize_Aero.typ"
#include "2_Wr/1_Chapters/1_Chap/3_Optimization/1_Get_Aero.typ"
#include "2_Wr/1_Chapters/1_Chap/3_Optimization/2_Beam_Model.typ"
#include "2_Wr/1_Chapters/1_Chap/3_Optimization/3_Optim_Basics.typ"
#include "2_Wr/1_Chapters/1_Chap/3_Optimization/4_Beam_Opti.typ"


// --------------------------------- results -------------------------------- //
#include "2_Wr/1_Chapters/2_Chap/0_Results/0_Res_Init.typ"
#include "2_Wr/1_Chapters/2_Chap/0_Results/1_Cases_B.typ"
#include "2_Wr/1_Chapters/2_Chap/0_Results/2_Cases_C.typ"

// ------------------------------- discussion ------------------------------- //
#include "2_Wr/1_Chapters/3_Chap/0_Discuss/0_Discus.typ"

// -------------------------------- Appendix -------------------------------- //
#show: appendix_manag
#include "2_Wr/10_Appendix/0_Beam_Valid.typ"

/* -------------------------------- glossary -------------------------------- */
#show: output_glossary

// ----------------------------------- Bib ---------------------------------- //
#pagebreak()

// #set page(columns: 2)

// // For spacing before level-1 entries
// #set par(spacing: 0.5em)

// see: https://typst.app/docs/reference/model/bibliography/#parameters-full
// and: https://typst.app/project/pQH6zuFPPL_G4NlIOLx9K-
#bibliography("1_Data/1_Bib/bib.bib",

// was modified and obtained through:https://github.com/citation-style-language/styles/blob/master/ieee.csl
style: "1_Data/1_Bib/0_CSLs/ieee.csl"

)

