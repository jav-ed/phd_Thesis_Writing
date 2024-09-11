#import "../../1_Fcns/0_Fcn_Main.typ": *

// issue is that the dots are not vertically aligned. they should create a vertical line

#let init_latex_toc(body) = {

  // the first level shall not have the dots
  show outline.entry.where(
    level: 1
  ): it => {
    v(2em, weak: true)
    set text(size:1.1em, weight: "bold")
    it.body
    h(1fr)
    link(it.element.location(), [#it.page])
  }

  // lvl 2
  show outline.entry.where(level: 2): it => {
    it.body
    box(width: 1fr, repeat[~~~.])
    h(1em)
    it.page
  }

  // lvl 3
  show outline.entry.where(level: 3): it => {
    it.body
    box(width: 1fr, repeat[~~~.])
    h(1em)
    it.page
  }


/* --------------------------------- keep it -------------------------------- */
body
  
}