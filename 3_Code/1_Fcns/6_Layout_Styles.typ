/* --------------------------------- colors --------------------------------- */
// the doc of the following says that algo, that is shown above might be better, when it comes to page breaks
// #import "@preview/codelst:1.0.0": *

// A library of color palettes for Typst - tailwindcss colors: tailwind.sky-500
// see: https://github.com/typst/packages/tree/main/packages/preview/splash/0.4.0
#import "@preview/splash:0.4.0": *

// twc_Col.slate-50, twc_Col.gray-500, ...
#let twc_Col = tailwind

#let table_cl_header = twc_Col.green-400
#let table_cl_0 = twc_Col.slate-50
#let table_cl_1 = twc_Col.gray-300
// calc.rem()


// -------------------------------- hor line -------------------------------- //
// two hor lines above and beanth the actual text in the vertical center
#let hor_Line(text) = {

  line(length: 100%)
  v(-0.5em)
  [*#text*]
  v(-0.5em)
  line(length: 100%)

}


