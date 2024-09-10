#import "@preview/hydra:0.5.1": hydra


#import "../1_Fcns/0_Fcn_Main.typ": *


// note, regular heading are not the same as page header
// both are inshallah inlcuded below

#let create_h_entry(
  proper_number,
  ct_element,
  ct_page) = {

  if proper_number != none {

    [#proper_number #h(0.03fr) #smallcaps(ct_element.body) #h(1fr) #ct_page]
  }

  else{
    [#smallcaps(ct_element.body) #h(1fr) #ct_page]

  }

}


#let header_style(body) = [


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

  // ======================================================================== //
  // ============================== page header ============================= //
  // ======================================================================== //

  #set page( 
    margin: (
      left: 3.5cm,
      right: 2cm,
      bottom: 3cm,
      top: 3cm
    ), 
    numbering: "1", 
    header: context {

    // demands: 
    // 1) no page heading for chapters
    // 2) when the pags starts with a section or subsection take that
    // 3) other than that, take from past whatever lvl it might be. if the last level was 2, then heading should be that. if it was level 3 then level 3 shall be taken

    let elems_before = query(selector(heading).before(here()))
    let elems_after = query(selector(heading).after(here()))

    let b_before_active = false
    let ct_page = here().page()

    if elems_after.len() > 0 {
      let ct_after = elems_after.first()
      let after_page = ct_after.location().page()

      // the found header is on the same page as the current active page
      if ct_page == after_page {

        // header is only desired for level >= 2, that is, no heading for chapters
        if ct_after.level >= 2 {

          // a proper manual counting needs to be done
          let proper_number = numbering(ct_after.numbering, ..counter(heading).at(ct_after.location()))

          create_h_entry(proper_number, ct_after, ct_page)

        }
      }
      // current page has no header at all. thus, the header needs to be obatained from the before section
      // from the previous page get the last section, which could be anything [lvl >= 1]. so, we also take chapters from the previous page
      else{

          if elems_before.len() > 0 {
            let ct_before = elems_before.last()
            let before_page = ct_before.location().page()

            if ct_before.numbering != none {

              // a proper manual counting needs to be done
              let proper_number = numbering(ct_before.numbering, ..counter(heading).at(ct_before.location()))

              create_h_entry(proper_number, ct_before, ct_page)

            }

            // for entries that have no number like Glossary
            else{
              create_h_entry(none, ct_before, ct_page)

            }

        }

      }
      
    }
    // is expected to be the last section (what ever lvl), like for example the Bibliography, Appendix or what ever the current last section might be
    else if elems_before.len() > 0 {
        let ct_before = elems_before.last()
        let before_page = ct_before.location().page()

        if ct_before.numbering != none {

          // a proper manual counting needs to be done
          let proper_number = numbering(ct_before.numbering, ..counter(heading).at(ct_before.location()))

          create_h_entry(proper_number, ct_before, ct_page)

        }

        // for entries that have no number like Glossary
        else{
          create_h_entry(none, ct_before, ct_page)

        }

    }

    // line(length: 100%)
    // v(1em)

  })


  // -------------------------------- keept it -------------------------------- //

  #body


]



