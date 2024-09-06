#let default_Font_Size = 1.17em
// #let default_Font_Size = 1em



/* ---------------------------- table helper fcns --------------------------- */

#let tab_Frame(line_thickness) = (x, y) => (


  left: if x > 0 { (paint: black,
        thickness: line_thickness, 
        dash: "solid", 
        cap: "round",
  ) },
  top: if y > 0 { (paint: black,
        thickness: line_thickness, 
        dash: "solid", 
        cap: "round",
  ) },
  bottom: (paint: black,
        thickness: line_thickness, 
        dash: "solid", 
        cap: "round",
  ),
)
