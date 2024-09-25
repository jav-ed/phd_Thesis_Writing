
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
// ================================= subpar ================================= //
// ========================================================================== //
// for subfigures
// #import "@preview/subpar:0.1.1"
// https://github.com/tingerrr/subpar
// #subpar.grid(
//   figure(image("/assets/andromeda.jpg"), caption: [
//     An image of the andromeda galaxy.
//   ]), <a>,
//   figure(image("/assets/mountains.jpg"), caption: [
//     A sunset illuminating the sky above a mountain range.
//   ]), <b>,
//   columns: (1fr, 1fr),
//   caption: [A figure composed of two sub figures.],
//   label: <full>,
// )
