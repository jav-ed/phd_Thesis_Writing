

#import "3_Code/1_Fcns/0_Fcn_Main.typ": *
#import "3_Code/5_Layout/0_Layout_Main.typ":*


#show: regular_layout
#pagebreak()

// see: https://typst.app/docs/guides/page-setup-guide/
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")

 // --------------------------------- header -------------------------------- //
#show: page_header
#show: text_header


// TODO allow big figures to be shown across pages
// #show figure: set block(breakable: true)

// --------------------- latex 1.1 figures, tables, eqs --------------------- //
#show: set_figure_numbering.with(new_format: "1.1", kind_type:image)
#show: set_figure_numbering.with(new_format: "1.1", kind_type:table)
// #show: set_eqs_numbering.with(new_format: "1.1")

/* ---------------------------------- tocs ---------------------------------- */


#show: multiple_tocs

#show: float_text_spacing


#set page(
  footer: context {

    let elems_before = query(selector(heading).before(here()))
    let elems_after = query(selector(heading).after(here()))

    let ct_page = here().page()

    if elems_after.len() > 0 {
      let ct_after = elems_after.first()
      let after_page = ct_after.location().page()

      // the found header is on the same page as the current active page
      if ct_page == after_page {

        [Fxa0 #ct_after.body]

      }
      // current page has no header at all. thus, the header needs to be obatained from the before section
      // from the previous page get the last section, which could be anything [lvl >= 1]. so, we also take chapters from the previous page
      else{

          if elems_before.len() > 0 {
            let ct_before = elems_before.last()
            let before_page = ct_before.location().page()

            if ct_before.level == 1 {
              if before_page == ct_page {
                // set align(center)
                // counter(page).display()
                [Fxa1 #ct_before.body]
              }
            }
          }

      }
      
    }
    // is expected to be the last section (what ever lvl), like for example the Bibliography, Appendix or what ever the current last section might be
    else if elems_before.len() > 0 {
        let ct_before = elems_before.last()
        let before_page = ct_before.location().page()

        if ct_before.level == 1 {
          if before_page == ct_page {
            set align(center)
            counter(page).display()
          }
        }

    }

  }
)



// change type of numbering
#set page(numbering: "1")




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
// TODO generates issue, where it will not automatically detect [27]-[29]
// style: "1_Data/1_Bib/0_CSLs/ieee.csl"
style: "1_Data/1_Bib/0_CSLs/ieee_Backup.csl"
)

