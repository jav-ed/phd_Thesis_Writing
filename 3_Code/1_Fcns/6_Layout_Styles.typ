// -------------------------------- hor line -------------------------------- //
// two hor lines above and beanth the actual text in the vertical center
#let hor_Line(text) = {

  line(length: 100%)
  v(-0.5em)
  [*#text*]
  v(-0.5em)
  line(length: 100%)

}
