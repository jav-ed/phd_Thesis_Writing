
#import "../1_Fcns/0_Fcn_Main.typ": *



// ========================================================================== //
// =============================== logo_adder =============================== //
// ========================================================================== //
#let logo_adder(chap_add, it) = (

  table(
    columns: (1fr,0.3fr),
    stroke: none,
    align: (center+horizon, right+horizon),
    column-gutter:0.5em,

    [
      #if chap_add != none {
        chap_add 
        v(0.01em)  
        v(-1em)

      }

      #set align(center)
      #set par(
        justify: false,
        first-line-indent: 0em,
        linebreaks: "optimized",
        )
      #set text(size: 2em, weight: "bold")
      #smallcaps(it)

    ],

    image("../../1_Data/2_Figs/2_Others/0_Cover/2_Swith.svg", width: 100%)
  )


)


// the title headers are the regular big headers in the text, that is text headers. they are NOT in the starting of the page. the headers that are talked about are #chapter #
#let text_header(body) = [


  // get latex style for referencing - inshallah
  // the supplement could not be changed expect like the 3 lines below
  // working with heading:it => { // here the supplement are already generated, not outside where we can control what shall be generated}
  #show heading.where(level: 1): set heading(supplement: [Chapter])
  #show heading.where(level: 2): set heading(supplement: [Section])
  #show heading.where(level: 3): set heading(supplement: [Subsection])

  // ======================================================================== //
  // ================================ heading =============================== //
  // ======================================================================== //
  #show heading.where(level: 1): it => {

    // pagebreak(weak: true)

    // see: https://forum.typst.app/t/why-is-the-page-counter-in-the-background-of-my-page-wrong-after-using-counter-update/531/11?u=quachpas
    // or see conversation: https://discord.com/channels/1054443721975922748/1296100370795335700
    pagebreak(weak: true)
    // if the even page contains nothing but the counter update,
    // it doesn't work. An invisible dot fixes this; since this
    // page is by definition otherwise empty, the dot shouldn't
    // affect anything.
    hide[.]

    // [#it.fields()]
    set text(size: default_Font_Size, weight: "bold")
    v(4em)  // Add some vertical space

    if it.numbering == none {

      // ----------------------- special case appendix ---------------------- //
      if it.supplement != none and "Appendix" in it.supplement.text {
        //  repr(type(it.supplement.text))
        let chap_add = "Additional Materials"
        logo_adder(chap_add, it)
      }

      // ----------------------- non numbered headings ---------------------- //
      else {
        // For excluded headings, just return the original heading without modifications

        let chap_add = none
        logo_adder(chap_add, it)
        
        // block(width: 100%)[
        //     #set align(center)
        //     #set text(size: 2em, weight: "bold")
        //     #smallcaps(it)
        //   ]

      }
    }
     
    else {
      // For all other level 1 headings, apply the custom formatting
      
      let chap_add = none

      // Could be Appendix
      // if it.numbering.contains("A.1.1") {
      if it.numbering == none and it.supplement == "Appendix" {
        //  chap_add = "Appendix"
         chap_add = "Additional Materials"
      }

      // Could be Prefix
      else if it.numbering.contains("I.1.1") {
         chap_add = none
      }

      // Should be regular chapters
      else if it.numbering.contains("1.1.1") {
         chap_add = "Chapter"
      }

      logo_adder(chap_add, it)


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


  /* ------------------------------- keep that ------------------------------ */
  #body



]