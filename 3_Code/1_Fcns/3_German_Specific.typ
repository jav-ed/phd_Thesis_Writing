#let com = $, #h(0em)$


// in order to create subfigures, for the moment choose the approch shown in:
// https://github.com/typst/typst/issues/246#issuecomment-1910046540
#let subfigure( body, 
                pos: top + left, 
                dx: 0%, 
                dy: 0%, 
                caption: "", 

                // see styles of numbering:
                // https://typst.app/docs/reference/model/numbering/
                numbering: "(a)", 

                separator: none, 
                lbl: none, 
                supplement: none) = {

  let fig = figure(
    body, 
    caption: none, 
    kind: "subfigure", 
    supplement: none, 
    numbering: numbering, 
    outlined: false)
  
  let number = locate(loc => {
    let fc = query(
      selector(figure).before(loc), loc).last().counter.display(numbering)
    return fc 
  })
  if caption != "" and separator == none { separator = ":" }
  caption = [#set text(10pt); #supplement #number#separator #caption]

  return [ #fig #lbl #place(pos, dx: dx, dy: dy, caption)]
}

// ---------------------------------- reset --------------------------------- //
#show figure: it => {
  if it.kind != "subfigure" {
    locate(loc => {

      // q = array
      let q = query(figure.where(kind: "subfigure").after(loc), loc)
      
      // check whether array contains entries
      if q.len() > 0 {

        // reset the subfigure counter once out of the parent figure
        q.first().counter.update(0) 
      }
    })
  }
  it
}
// -------------------------------- VAR reset ------------------------------- //
#let resetFig() = {

  show figure: it => {
    if it.kind != "subfigure" {
      locate(loc => {
        let q = query(figure.where(kind: "subfigure").after(loc), loc)
        q.first().counter.update(0) // reset the subfigure counter once out of the parent figure

        // check whether array contains entries
        if q.len() > 0 {

          // reset the subfigure counter once out of the parent figure
          q.first().counter.update(0) 
        }

      })
    }
    set figure(numbering: 0)
  }



}

// -------------------------------- reference ------------------------------- //
#show ref: it => {
  if it.element != none and it.element.func() == figure and it.element.kind == "subfigure" {
    locate(loc => {
      let q = query(figure.where(outlined: true).before(it.target), loc).last()
      
      ref(q.label)
    })
  }
  it
}



// ------------------------------- placeholder ------------------------------ //
#let placeholder(body, width: 100%, height: none, inset: 10%, outset: -5%) = {
  if height == none { height = width }
  rect(width: width, height: height, inset: inset, outset: outset, radius: 20%, fill: rgb(1, 1, 1, 5%))[#align(center + horizon)[#body]]
}



// -------------------------------- hor line -------------------------------- //
// two hor lines above and beanth the actual text in the vertical center
#let hor_Line(text) = {

  line(length: 100%)
  v(-10pt)
  [*#text*]
  v(-10pt)
  line(length: 100%)

}


// ------------------------- colorful table entries ------------------------- //

#let col_X() = {
  set text(fill: red)
  [x]
}
#let col_Mid() = {
  set text(fill: blue)
  [$tilde$]
}
#let col_Gre() = {
  set text(fill: green)
  [$+$]
}