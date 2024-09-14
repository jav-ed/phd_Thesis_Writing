#import "../../1_Fcns/0_Fcn_Main.typ": *


#let init_latex_figs(body) = {

 show outline.entry.where(level:1): it => {

    if it.element.has("kind") and it.element.kind == image {
    // if it.element.has("kind") and it.element.kind == "image_app" {

      repr(it)

    //   let loc = it.element.location()
    //   let supplement = it.element.supplement
    //   let caption = it.element.caption
    //   let fig_capt_nr = it.element.numbering

    //   let current_chapter = counter(heading).at(loc).first()
    //   let figure_number = counter(figure.where(kind: image)).at(loc)



    //   // Check if it's the first figure in a new chapter (excluding chapter 1)
    //   if current_chapter > 1 and figure_number.first() == 1 {

    //     // Check if the previous chapter had any figures
    //     let prev_chapter_figure = query(
    //       figure.where(kind: image).before(loc), 
    //       loc
    //     ).filter(f => counter(heading).at(f.location()).first() == current_chapter - 1)
        
    //     if prev_chapter_figure.len() > 0 {
    //       v(0.5em)
    //       line(length: 13%, 
    //         // stroke: (thickness: 0.5pt, paint: twc_Col.gray-300)
    //         stroke: (thickness: 0.5pt, paint: red)
    //         )
    //       v(0.5em)
    //     }
    //   }

      
    //   set text(size:default_Font_Size)
    //   v(0.05em)
    //   box(width: 100%, {
    //     [
    //       #box(width: 93%, {
    //         link(loc)[
    //           #it.body.children.at(2) // figure number
    //           #caption.body           // caption text
    //           ]
    //       })
    //       #h(1fr)
    //       #box(width: 5%, align(right, {
    //         link(loc, it.page)
    //       }))
    //     ]
    //   })

    } 
    
  }



/* --------------------------------- keep it -------------------------------- */
body
  
}