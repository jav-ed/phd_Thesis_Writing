
// ========================================================================== //
// ================================ SI UNITS ================================ //
// ========================================================================== //
// see: https://github.com/typst/packages/tree/main/packages/preview/unify/0.4.3
#import "@preview/unify:0.4.3": num,qty,numrange,qtyrange, unit


// unit("")       // can be used for si units -> but op and upright could do the same thing
// op("")         // multiple letters
// upright("M")   // single letter

// op can be used within equations when more than one letter is used -> NOT for one single letter
// unit can be used like $unit(m) == unit("meter")$ --> so unit can be also used for one single letter. It probaly makes use of $	upright("m")$
// $op("leng") >> 6,6 unit("meter")$

// use $num("12512e5")$ for longer numbers for longer digits, it adds thousdans seperation and e5 can be used 

// ========================================================================== //
// ================================= tables ================================= //
// ========================================================================== //
// see: https://typst.app/universe/package/tablex
#import "@preview/tablex:0.0.8": *

// --------------------------------- example -------------------------------- //
// #tablex(
//   columns: 4,
//   align: center + horizon,
//   auto-vlines: false,

//   // indicate the first two rows are the header
//   // (in case we need to eventually
//   // enable repeating the header across pages)
//   header-rows: 2,

//   // color the last column's cells
//   // based on the written number
//   map-cells: cell => {
//     if cell.x == 3 and cell.y > 1 {
//       cell.content = {
//         let value = int(cell.content.text)
//         let text-color = if value < 10 {
//           red.lighten(30%)
//         } else if value < 15 {
//           yellow.darken(13%)
//         } else {
//           green
//         }
//         set text(text-color)
//         strong(cell.content)
//       }
//     }
//     cell
//   },

//   /* --- header --- */
//   rowspanx(2)[*Username*], colspanx(2)[*Data*], (), rowspanx(2)[*Score*],
//   (),                 [*Location*], [*Height*], (),
//   /* -------------- */

//   [John], [Second St.], [180 cm], [5],
//   [Wally], [Third Av.], [160 cm], [10],
//   [Jason], [Some St.], [150 cm], [15],
//   [Robert], [123 Av.], [190 cm], [20],
//   [Other], [Unknown St.], [170 cm], [25],
// )