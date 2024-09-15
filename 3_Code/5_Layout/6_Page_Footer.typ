
#import "../1_Fcns/0_Fcn_Main.typ": *


#let def_page_footer(body, chapter_txt) = {

  // helper to detect the page number for "list of tables"
  let list_table_counter = counter("0")
  let list_tables_page = state("y", -1)
  
  // get all headers of level 1
  // for it set the footer
  set page(
    footer: context {


      let foot_note_content(ct_it) = {

          set text(fill: twc_Col.gray-700)
          // [#smallcaps([Chapter: #ct_it.body]) #h(1fr) #counter(page).display("1")]
          [#smallcaps(chapter_txt) #h(1fr) #counter(page).display("1")]
      }

      /* ----------------------------- actual code ---------------------------- */
      let elems_before = query(selector(heading).before(here()))  // type array
      let elems_after = query(selector(heading).after(here()))

      let ct_page = here().page()

      if elems_before.len() > 0 {

        let ct_before = elems_before.last()
        let before_page = ct_before.location().page()

        if before_page == ct_page {

          // fastest approach - when there is only one header at all on one page
          if ct_before.level == 1 {

            
            let ct_numbering_style =  ct_before.location().page-numbering()
            let page_counter_styled = counter(page).display(ct_numbering_style)

            // should be the starting till and incluse the list of tables, that is, inshallah everything before preface
            if ct_numbering_style == "— I —"{
            //  [#counter(page).display("- I -") #lower(repr(ct_before.body))]
              align(center)[#page_counter_styled]

            }
            // regular pages after list of tables, that is, inshallah starting with preface
            else{
              foot_note_content(ct_before)

            }

          }

          // possible that multiple headers are found in the same page
          else if ct_before.level >= 2 {

            //reverse the order, such that we can go from last last-1, last-2, last-3 in asecednign order
            let rev_before_elems = elems_before.rev()

            // last was already checked - so remove it  --> does not work as desired, thus let is iterate it again over it
            // rev_before_elems = rev_before_elems.remove(0)

            for ct_it in rev_before_elems{
              // get the page of the new element
              let ct_it_page = ct_it.location().page()

              // is it still on the same page
              if ct_it_page == ct_page {

                // if the new element is on the page and has a level 1
                if ct_it.level == 1 {

                  foot_note_content(ct_it)

                  // leave the loop
                  break
                }
              }

            }

          }
        }
      }


    /* ---------------------------------- end --------------------------------- */
    }
  )


    /* -------------------------------- keep it ------------------------------- */
    body

  }