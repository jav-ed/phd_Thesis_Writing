/* -------------------------------------------------------------------------- */
#import "../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


Refering see: https://typst.app/docs/reference/meta/ref/

= header <id_To_Ref>

Note, the reference should be done with @id_To_Ref

= Beginnings <beginning>
In @beginning we prove @pythagoras.
$ a^2 + b^2 = c^2 $ <pythagoras>


// -------------------------------- Glossary -------------------------------- //
// note this function is obtained though modification of the lib:

// see: https://github.com/typst/packages/blob/main/packages/preview/glossarium/0.2.2/example/example.typ

// and: https://github.com/typst/packages/tree/main/packages/preview/glossarium/0.2.2

#gl_("inshallah") \
// gl_("term", pl:true)
// gl_("term", long:true)


// -------------------------------- Equations ------------------------------- //
== Equations

// have it defined somewhere
#set math.equation(numbering: "(1)")


access the refernce @eq_0.

// will have a numbering
$ kappa_op("krit") <= 0 hat 4 $ <eq_0>

// will NOT have a number shown, because of the removed whitespace at $$
$kappa_op("krit") <= 0 hat 4$ <eq_0>

// --------------------------------- Figures -------------------------------- //

#figure(
  image("../../1_Data/2_Figures/1_Ch_Figs/0_Ch/1_Water_Air.png", 
  width: 100%),
  caption: [Krümmungen über Biegemomenten für unterschiedliche Füllmedien und Inndendrücke aufgetragen @Liu2019],
) <fig_1>



// ---------------------------------- units --------------------------------- //

// see: https://github.com/typst/packages/tree/main/packages/preview/unify/0.4.3
#import "@preview/unify:0.4.3": num,qty,numrange,qtyrange, unit


// unit("")       // can be used for si units -> but op and upright could do the same thing
// op("")         // multiple letters
// upright("M")   // single letter

// op can be used within equations when more than one letter is used -> NOT for one single letter
// unit can be used like $unit(m) == unit("meter")$ --> so unit can be also used for one single letter. It probaly makes use of $	upright("m")$
// $op("leng") >> 6,6 unit("meter")$

// use $num("12512e5")$ for longer numbers for longer digits, it adds thousdans seperation and e5 can be used 
$num("12512e5")$ 

// for 1/m we need the op operator
// op does the same thing as unit, when op is used with more than 2 letters -> this is only true for letters --> when having letters/vars we need to have at least two chars to get a proper math visual using op.
// when it comes to digitis/numbers, one single char of a number is good enough
// op("leng(letters) >= 2") for proper math visual
// op("len(digits" >= 1)    for proper math visual --> for digitis it works out of the box as expected
// for single letter/char/var that are not digits you can either use unit or upright
($kappa space.thin[ op("1/m")]$) 


// -------------- work with si units without additional package ------------- //
// instead of using unify, use space and upright
// $ 15 upright("m ")$ - make sure to have at least 2 characters when upright is used, otherwise use 
// $ 15 space upright("m")$ - this version seems to be identical as the one above


// there is a special dealing with ranges
// $ 288.15 "K " space "to" space 233.15 "K " $ 

// this vesion with upright(" to") comes close to the above one, however, it is not the same
// use the following
// $ 288.15 "K " upright(" to") space 233.15 "K " $ or


// both versions are the same, either one free char space or use a space before. a space after the to has no impact
// $ 288.15 "K " upright(" to") space 233.15 "K " $
// $ 288.15 space upright("K") space "to" space 233.15 space upright("K") $

// however the following mixture will not produce the very same output
// $ 288.15 "K " space "to" space 233.15 "K " $

// an arbitrary mix is not fine, thus try to use the first of the two fine versions:
// $ 288.15 "K " upright(" to") space 233.15 "K " $
