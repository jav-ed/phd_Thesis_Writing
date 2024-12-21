// Based on https://github.com/EpicEricEE/typst-plugins/blob/6b823f5212fe07bb09f71b5eb9cab02d528a5c2a/outex/src/outex.typ#L8-L27

// See conversation on discord (11.09.2024): https://discord.com/channels/1054443721975922748/1088372909111783525/threads/1283352970549002240

// inshallah works fine with typst v 0.12.0 -> should not work with typst v 0.11.0

#import "../../1_Fcns/0_Fcn_Main.typ": *


#let latex_figs(
  body, 
  gap: 1em,
  fill-pad: (left: 0.5em, right: 1em),
  bold:true,
  space:true,
  search_supplement: [Figure]
) = {

  // counting helper, required when we set heading counter manually to other values, like for example before starting with the appendix
  // let chap_counter_helper = counter("0")
  let chap_counter_helper = state("x", 1)

  show outline.entry: it => { 
    
    // [#repr(it)]
    
    let gap = 1em
    let fill-pad = (left: 0.5em, right: 1em)
    let bold = true
    let space = true

    // Convert fill-pad to dict
    let fill-pad = if type(fill-pad) == dictionary {(
      left: fill-pad.at("left", default: 0pt),
      right: fill-pad.at("right", default: 0pt)
    )} else {(
      left: fill-pad,
      right: fill-pad
    )}

    // current element
    let ct_elem = it.element

    let loc = ct_elem.location()
    let current_chapter = counter(heading).at(loc).first()
    // let figure_number = counter(figure.where(kind: image)).at(loc)
    let figure_number = counter(figure.where(supplement: search_supplement)).at(loc)



    if current_chapter > 1 {
      chap_counter_helper.update(x=> x+1)
      // [counter: #context repr(chap_counter_helper.get()) ]
    }

    context {
      let ct_counter_val = chap_counter_helper.get()

      // Check if it's the first figure in a new chapter (excluding chapter 1) and special treatment for the Appendix - heading counting was set to zero
      if ct_counter_val > 1 and figure_number.first() == 1 {

        // Check if the previous chapter had any figures
        let prev_chapter_figure = query(
          figure.where(supplement: search_supplement).before(loc)).filter(f => counter(heading).at(f.location()).first() == current_chapter - 1)

        // since ct_counter_val > 1 , the current_chapter can only be == 1 again, if we have mopdifed the heading manually, for example we are in the appendix now 
        if current_chapter == 1 {

          // this should be the case
          if prev_chapter_figure.len() == 0 {

            // manually catch cases like apendix, where we would have the heading counter reseted
            prev_chapter_figure = (1,2)
          }

        }
        
        if prev_chapter_figure.len() > 0 {
          v(1em)
          line(length: 13%, 
            stroke: (thickness: 0.5pt, paint: twc_Col.gray-300)
            )
          v(1em)
        }
      }

    }

    // ------------------------- outside of context ------------------------- //

    // [#repr(et)]
    // if ct_elem.numbering != none{
    //   [#repr(ct_elem.numbering)]
    // }


    // let number = if ct_elem.numbering != none {
    //   numbering(ct_elem.numbering, ..ct_elem.counter.at(ct_elem.location()))
    // }

    // get the number
    let number = if ct_elem.numbering != none {
      it.body.children.at(2)
    }

    let page = {
      let page-numbering = ct_elem.location().page-numbering()
      if page-numbering == none { page-numbering = "1" }
      numbering(page-numbering, ct_elem.location().page())
    }

    
    context {

      let number-width = measure(number).width
      let page-width = measure(page).width


      
      // Keep track of the maximum widths of the numbering and page.
      let state = state("outex:0.1.0/figure/" + repr(ct_elem.kind), (
        number-width: 0pt,
        page-width: 0pt,
      ))

      state.update(state => {(
        page-width: calc.max(state.page-width, page-width),
        number-width: calc.max(state.number-width, number-width)
      )})

      // Add links
      let linked = link.with(ct_elem.location())
      let number = linked(number)
      let title = linked(ct_elem.caption.body)
      let page = linked(page)

      // Render with final state
      let state = state.final()
      let number-width = state.number-width
      let page-width = state.page-width

      box(grid(
        columns: (number-width, gap, 1fr, page-width),
        align(end, number),
        [],
        pad(
          right: fill-pad.right,
          title + box(width: 1fr, pad(left: fill-pad.left, it.fill))
        ),
        align(bottom + end, page)
      ))

     // --------------------------- inside context -------------------------- //
  
    }

  }


body


}