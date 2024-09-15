
// see: https://typst.app/project/pXVuNLiIWKq_k8qs7A9Jyd

// --------------------------- Figures with "1.1" --------------------------- //
#let set_figure_numbering(it, new_format: none, kind_type: image) = {

  // Set chapter-relative numbering for images
  let image_numbering = super => numbering(
    new_format, 
    counter(heading).get().first(), 
    super)

  // Reset figure counter at each new chapter
  show heading.where(level: 1): it => counter(figure.where(kind: kind_type)).update(0) + it
  
  // Apply custom numbering to figures [images, tables, equations
  show figure.where(kind: kind_type): set figure(numbering: image_numbering)

  it

}

// ----------------------------- Eqs with "1.1" ----------------------------- //
#let set_eqs_numbering(it, new_format: none) = {

  // Set chapter-relative numbering for images
  let equation_numbering = super => numbering(
    new_format, 
    counter(heading).get().first(), 
    super)

  // Reset equation counter at each new chapter
  show heading.where(level: 1): it => counter(math.equation).update(0) + it

  set math.equation(numbering: equation_numbering)

  it

}


// --------------------------- float_number_apend --------------------------- //
#let float_number_apend(it) = {

  let new_format = "A.1"
  
  // reset chapter numbering
  
  // Set chapter-relative numbering for images
  let image_numbering = super => numbering(
    new_format, 
    counter(heading).get().first(), 
    super)

  // Reset figure counter at each new chapter, once if you want to access the figure counting through 
  // 1) figure.where(kind)
  // 2) accessing the figures through the supplement attribute
  show heading.where(level: 1): it => counter(figure.where(kind: "image_app")).update(0) + it
  show heading.where(level: 1): it => counter(figure.where(supplement: [Figure])).update(0) + it

  // Reset figure counter at each new chapter
  show heading.where(level: 1): it => counter(figure.where(kind: "table_apend")).update(0) + it
  show heading.where(level: 1): it => counter(figure.where(supplement: [Table])).update(0) + it

  
  // Apply custom numbering to figures [images, tables, equations
  show figure.where(kind: "image_app"): set figure(numbering: image_numbering)

  show figure.where(kind: "table_apend"): set figure(numbering: image_numbering)

  it

}


// --------------------------- eq_number_appendix --------------------------- //
#let eq_number_appendix(body) = {

  // Set chapter-relative numbering for equations
  let equation_numbering = super => numbering(
    "(A.1)", 
    counter(heading).get().first(), 
    super)

  // Reset equation counter at each new chapter
  show heading.where(level: 1): it => counter(math.equation).update(0) + it

  set math.equation(numbering: equation_numbering)

  // -------------------------------- keep it ------------------------------- //
  body
} 

// // --------------------------------- figures -------------------------------- //
// #import "@preview/i-figured:0.2.4"

// #let apply_i_figured(body) = {
//   show heading: i-figured.reset-counters
//   show figure: i-figured.show-figure

//   body
// }


// #show: apply_i_figured