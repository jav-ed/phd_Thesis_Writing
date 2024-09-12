


#let def_page_footer(body, chapter_txt) = {

  // get all headers of level 1
  // for it set the footer
  set page(
    footer: context {


      let foot_note_content(ct_it) = {

          // [#smallcaps([Chapter: #ct_it.body]) #h(1fr) #counter(page).display("1")]
          [#smallcaps(chapter_txt) #h(1fr) #counter(page).display("1")]
      }

      /* ----------------------------- actual code ---------------------------- */
      let elems_before = query(selector(heading).before(here()))  // type array
      let elems_after = query(selector(heading).after(here()))

      let ct_page = here().page()

      // helper to detect the page number for "list of tables"
      let b_found_list_tables = state("x", -1)
      let list_tables_page = state("y", -1)

      if elems_before.len() > 0 {
        let ct_before = elems_before.last()
        let before_page = ct_before.location().page()

        if before_page == ct_page {

          // fastest approach - when there is only one header at all on one page
          if ct_before.level == 1 {
            // foot_note_content(ct_before)

            // before and till "list of tables" chapter
            if b_found_list_tables.get() == -1 {

              // list of tables detected
              let check =  lower(repr(ct_before.body)).contains("[list of tables]")
              if check{

                // update states
                b_found_list_tables.update(x => eval("1"))  
                list_tables_page.update(y => eval(str(ct_page)))
              }

              
            //  [#counter(page).display("- I -") the state is: #b_found_list_tables #lower(repr(ct_before.body)) and check #check and more #b_found_list_tables.get()]
            //  [#counter(page).display("- I -") the state is: #b_found_list_tables #lower(repr(ct_before.body)) and check #check toc nr #list_tables_page.get()]

              align(center)[#counter(page).display("- I -")]
            }

            // b_found_list_tables was found -> regular page numbering style
            else{

              // [#counter(page).display("1") the state is: #b_found_list_tables]
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