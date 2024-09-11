
#import "../1_Fcns/0_Fcn_Main.typ": *


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
    }
     
    else {
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


  /* ------------------------------- keep that ------------------------------ */
  #body



]