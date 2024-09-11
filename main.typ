

#import "3_Code/1_Fcns/0_Fcn_Main.typ": *
#import "3_Code/5_Layout/0_Layout_Main.typ":*


#show: regular_layout
#pagebreak()

#set page(
  footer: context {

    let elems_before = query(selector(heading).before(here()))
    let elems_after = query(selector(heading).after(here()))

    let ct_page = here().page()

    let first_header = query(selector(heading)).first()
    let first_header_page = first_header.location().page()

    if ct_page <= first_header_page{

      if ct_page == first_header_page {
        if elems_before.len() > 0 {
          let ct_before = elems_before.first()
          if ct_before.level == 1 {

            // [#first_header.body its page is #first_header.location().page()]
            // set align(left)
            [#ct_page]

          }

        }
      }

    }

    // after the first header was found
    else if ct_page > first_header_page {
      if elems_after.len() > 0 {
        let ct_after_first = elems_after.first()
        [#elems_before.last().body]
      }
      

    }


    // [#first_header.body its page is NOT #first_header.location().page()]


    // if elems_before.len() > 0 {
    //   let ct_before_first = elems_before.first()

    //   [#ct_before_first.body len of: #elems_before.len()]

    //   if ct_before_first.level == 1 {
    //     let before_page = ct_before_first.location().page()
    //     if ct_page == before_page {
          
    //       // [#ct_before_first.body]  
    //       set align(center)
    //       counter(page).display("1")
    //     }

    //   }
    // }

    /* -------------------------------- after ------------------------------- */
    // if elems_after.len() > 0 {
    //   let ct_after_first = elems_after.first()
    //   [#ct_after_first.body]
    // }
    

  }
)



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

