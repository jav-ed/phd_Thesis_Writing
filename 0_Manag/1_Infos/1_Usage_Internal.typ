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
one attempt for range
$ 288.15 "K " "to" 233.15 "K " $

easier approach
$ 288.15 "K" "to" 233.15 "K " $ 


or direclty
$ 288.15 "K to" 233.15 "K " $ 

again within "" you need at least two chards, otherwise you will get spacing issues



