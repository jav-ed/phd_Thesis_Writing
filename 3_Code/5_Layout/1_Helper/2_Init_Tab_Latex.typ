#import "../../1_Fcns/0_Fcn_Main.typ": *


#let init_latex_tables(body) = {

  show outline.entry.where(level:1): it => {

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
          line(length: 13%, 
            stroke: (thickness: 0.5pt, paint: twc_Col.gray-300)
            )
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


/* --------------------------------- keep it -------------------------------- */
body
  
}