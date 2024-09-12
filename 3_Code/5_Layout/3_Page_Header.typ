#import "../1_Fcns/0_Fcn_Main.typ": *

// note, regular text heading are not the same as page header
// the page header are at the very top of the page. it is not actual part of the reading text. the page headers that are inshallah dealt below are more for navigation, with name of current section, name of author, page or any other pattern that could reoccur on each page.


#let create_h_entry(
  proper_number,
  ct_element,
  ct_page,
  debug: none) = {

  if proper_number != none {

    set text(fill: twc_Col.gray-700)

    if debug == none {
    [#proper_number #h(0.03fr) #smallcaps(ct_element.body) #h(1fr) #ct_page]
    }

    else{

    [#proper_number #h(0.03fr) #smallcaps(ct_element.body) #debug #h(1fr) #ct_page]

    }
  }

  else{

    set text(fill: twc_Col.gray-700)

    if debug == none {
      [#smallcaps(ct_element.body) #h(1fr) #ct_page]
    }

    else{
      [#smallcaps(ct_element.body) #debug #h(1fr) #ct_page]

    }

  }

}


#let page_header(body) = [


  #set page( 
    header: context {

    // demands: 
    // 1) no page heading for chapters
    // 2) when the pags starts with a section or subsection take that
    // 3) other than that, take from past whatever lvl it might be. if the last level was 2, then heading should be that. if it was level 3 then level 3 shall be taken

    let b_debug = false

    let elems_before = query(selector(heading).before(here()))
    let elems_after = query(selector(heading).after(here()))

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

           if elems_before.len() > 0 {
              let ct_before = elems_before.last()
              let before_page = ct_before.location().page()
              
              // if before_page == ct_page {
                if ct_before.level == 1 {
                  [before page #before_page ct_page #ct_page]
                }
              // }
           }

          if b_debug == false {
            create_h_entry(proper_number, ct_after, ct_page)
          }
          else{
            create_h_entry(proper_number, ct_after, ct_page, debug: [afterxa #elems_before.last().body])
          }

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

              if b_debug == false {
                create_h_entry(proper_number, ct_before, ct_page)
              }
              else{
                create_h_entry(proper_number, ct_before, ct_page, debug: "before")

              }

            }

            // for entries that have no number like Glossary
            else{

              // if ct_before.level >= 2 {

              if b_debug == false {
                create_h_entry(none, ct_before, ct_page)
              }
              else{
                create_h_entry(none, ct_before, ct_page, debug: "no number before 0")
              }
              // }


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

          if b_debug == false {
            create_h_entry(proper_number, ct_before, ct_page)
          }
          else{
            create_h_entry(proper_number, ct_before, ct_page, debug: "before")
          }

        }

        // for entries that have no number like Glossary
        else{
          if b_debug == false {
            create_h_entry(none, ct_before, ct_page)
          }
          else{
            create_h_entry(none, ct_before, ct_page, debug: "no number before")
          }

        }

    }

    // line(length: 100%)
    // v(1em)

  })


  // -------------------------------- keept it -------------------------------- //

  #body


]



