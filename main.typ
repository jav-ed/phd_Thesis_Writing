

#import "3_Code/1_Fcns/0_Fcn_Main.typ": *
#import "3_Code/5_Layout/0_Layout.typ":*
#import "3_Code/5_Layout/1_Latex_Float_Numbering.typ":*

#import "@preview/hydra:0.5.1": hydra

#set page("a4")

// blocksatz = justify alignment
#set par(
  justify: true,
  first-line-indent: 1em,
  linebreaks: "optimized")


// documentation can be found at https://typst.app/docs/tutorial/writing-in-typst/
#set text(
  font: "New Computer Modern",
  size: default_Font_Size,

  lang: "en"
)

// #show link: set text(fill: blue)

// #set enum(indent: 0.7em)

// see: https://typst.app/docs/guides/page-setup-guide/
#set page(numbering: "— I —")
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")


// get latex style for referencing - inshallah
// the supplement could not be changed expect like the 3 lines below
// working with heading:it => { // here the supplement are already generated, not outside where we can control what shall be generated}
#show heading.where(level: 1): set heading(supplement: [Chapter])
#show heading.where(level: 2): set heading(supplement: [Section])
#show heading.where(level: 3): set heading(supplement: [Subsection])


#show heading.where(level: 1): it => {

  pagebreak(weak: true)
  // [#it.fields()]
  set text(size: default_Font_Size, weight: "bold")
  v(4em)  // Add some vertical space

  if it.numbering == none {
    // For excluded headings, just return the original heading without modifications
    
    block(width: 100%)[
        #set align(center)
        #set text(size: 2em, weight: "bold")
        #smallcaps(it)
      ]
    

  } else {
    // For all other level 1 headings, apply the custom formatting
    
    block(width: 100%)[
      #set align(center)
      Chapter
      #v(0.01em)
      #set align(center)
      #v(-1em)
      #set text(size: 2em, weight: "bold")
      #smallcaps(it)
    ]
  
  }

  v(3em)  // Add some vertical space after the heading

}

#show heading.where(level: 2): it => [
  // #it.fields()
  #v(1em)  // Add some vertical space
  #smallcaps(it)
  #v(1em)  // Add some vertical space after the heading
]

#show heading.where(level: 3): it => [
  // #it.fields()
  #v(1em)  // Add some vertical space
  #smallcaps(it)
  #v(1em)  // Add some vertical space after the heading
]


#set page( 
  margin: (y: 6em), numbering: "1", 
  header: context {

    if (hydra(3) != none){
      emph(hydra(3))
      h(1fr) 
      // counter(page)
    }

    else if (hydra(2) != none){
      emph(hydra(2))
      h(1fr) 
      // counter(page)

    }
    else if (hydra(1) != none){
      emph(hydra(skip-starting:true, book: false, 1))
      h(1fr)
      // counter(page)

    }


  // line(length: 100%)
})





// ----------------------------- report specific ---------------------------- //





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

// the first level shall not have the dots
#show outline.entry.where(
  level: 1
): it => {
  v(2em, weak: true)
  set text(size:1.1em, weight: "bold")
  it.body
  h(1fr)
  link(it.element.location(), [#it.page])
}


#outline(
  indent: auto,
  title : "Table of Contents",
  fill:   repeat[~~~.],  // none,
)



// #table_of_contents()


#pagebreak(weak:true)



// ------------------------------- toc figure ------------------------------- //
// #show outline.entry.where(level:1): it => {
// it.fields()
// }

#show outline.entry.where(level:1): it => {

  if it.element.has("kind") and it.element.kind == image {

    let loc = it.element.location()
    let supplement = it.element.supplement
    let caption = it.element.caption
    let fig_capt_nr = it.element.numbering

    let current_chapter = counter(heading).at(loc).first()
    let figure_number = counter(figure.where(kind: image)).at(loc)



    // Check if it's the first table in a new chapter (excluding chapter 1)
    if current_chapter > 1 and figure_number.first() == 1 {

      // Check if the previous chapter had any tables
      let prev_chapter_figure = query(
        figure.where(kind: image).before(loc), 
        loc
      ).filter(f => counter(heading).at(f.location()).first() == current_chapter - 1)
      
      if prev_chapter_figure.len() > 0 {
        v(0.5em)
        [------------------]
        v(0.5em)
      }
    }

    // repr(it)
    set text(size:default_Font_Size)
    v(0.05em)
    box(width: 100%, {
      [
        #box(width: 95%, {
          link(loc)[
            #it.body.children.at(2) // figure number
            #caption.body           // caption text
            ]
        })
        #h(1fr)
        #box(width: 5%, align(right, {
          link(loc, it.page)
        }))
      ]
    })

  } 
  
}


#outline(
  title: [List of Figures],
  target: figure.where(kind: image),
)


#pagebreak(weak:true)

// -------------------------------- toc table ------------------------------- //
#show outline.entry.where(level:1): it => {

  if it.element.has("kind") and it.element.kind == table {

    // [#it.fields()]
    let loc = it.element.location()
    let supplement = it.element.supplement
    let caption = it.element.caption
    let current_chapter = counter(heading).at(loc).first()
    let table_number = counter(figure.where(kind: table)).at(loc)

    // Check if it's the first table in a new chapter (excluding chapter 1)
    if current_chapter > 1 and table_number.first() == 1 {

      // Check if the previous chapter had any tables
      let prev_chapter_tables = query(
        figure.where(kind: table).before(loc), 
        loc
      ).filter(f => counter(heading).at(f.location()).first() == current_chapter - 1)
      
      if prev_chapter_tables.len() > 0 {
        v(0.5em)
        [------------------]
        v(0.5em)
      }
    }

    // repr(it)
    set text(size:default_Font_Size)
    v(0.05em)
    box(width: 100%, {
      [
        #box(width: 95%, {
          link(loc)[
            #it.body.children.at(2) // table number
            #caption.body           // caption text
            ]
        })
        #h(1fr)
        #box(width: 5%, align(right, {
          link(loc, it.page)
        }))
      ]
    })

  } 
  
}

#outline(
  title: [List of Tables],
  target: figure.where(kind: table),
)
#pagebreak(weak:true)


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

