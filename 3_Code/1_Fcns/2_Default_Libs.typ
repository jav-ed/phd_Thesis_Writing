
// ========================================================================== //
// ================================ SI UNITS ================================ //
// ========================================================================== //
// see: https://github.com/typst/packages/tree/main/packages/preview/unify/0.4.3
#import "@preview/unify:0.6.0": num,qty,numrange,qtyrange, unit


// unit("")       // can be used for si units -> but op and upright could do the same thing
// op("")         // multiple letters
// upright("M")   // single letter

// op can be used within equations when more than one letter is used -> NOT for one single letter
// unit can be used like $unit("m") == unit("meter")$ --> so unit can be also used for one single letter. It makes use of $	upright("m")$
// $op("leng") >> 6,6 unit("meter")$ or $op("leng") >> 6,6 unit("m")$

// use $num("12512e5")$ for longer numbers for longer digits, it adds thousdans seperation and e5 can be used 

// available units: https://github.com/ChHecker/unify/blob/main/units-en.csv

// $unit("m")$ --> m
// $unit("cm")$ --> cm, for centimeter,the c is considered as the prefix and it is possible to combine prefixes with the actual units
// possible prefies are: https://github.com/ChHecker/unify/blob/main/prefixes-en.csv

// ------------------------------- alternative ------------------------------ //
// instead of using unify, use space and upright
// $ 15 upright("m ")$ - make sure to have at least 2 characters when upright is used, otherwise use 
// $ 15 space upright("m")$ - this version seems to be identical as the one above


// there is a special dealing with ranges
// $ 288.15 upright("K ") space upright("to") space 233.15 upright("K ") $ 

// this vesion with upright(" to") comes close to the above one, however, it is not the same
// $ 288.15 upright("K ") upright(" to") space 233.15 upright("K ") $ or


// both versions are the same, either one free char space or use a space before. a space after the to has no impact
// $ 288.15 upright("K ") upright(" to") space 233.15 upright("K ") $
// $ 288.15 space upright("K") space upright("to") space 233.15 space upright("K") $

// however the following mixture will not produce the very same output
// $ 288.15 upright("K ") space upright("to") space 233.15 upright("K ") $

// an arbitrary mix is not fine, thus try to use the first of the two fine versions:
// $ 288.15 upright("K ") upright(" to") space 233.15 upright("K ") $


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
