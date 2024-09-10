/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// TODO
#pagebreak()

=== mini test here

minsadfnasfs
afsafd
afsafdasf

// -------------------------------------------------------------------------- //
#context {
let elems_before = query(selector(heading).before(here()))
let elems_after = query(selector(heading).after(here()))

let ct_before = elems_before.last()
let ct_after = elems_after.first()


v(1em)
[Before El]
v(1em)
// [#elems_before]
[#repr(ct_before)]
// [#repr(ct_before.location().page())]

v(1em)
[After El]
v(1em)
// [#elems_after]
[#repr(ct_after)]

// -------------------------------------------------------------------------- //

// [#elems.at(0)]

// v(2em)
// if elems.len() > 1 {
//   [#elems.last()]
// }
// else{
//   [Nothing found]
// }

// [#repr(here())]


// let current_heading = query(heading, here())

// [#current_heading]
// if current_heading.len() > 0 {

//   let chosen_heading = current_heading.first()
//   [#chosen_heading.numbering #chosen_heading.body]
// }


}



== Research Enabler <chap_0_6>
This section provides context for the research environment that facilitated this study on #gl_("swith", pl:true). It outlines the funding sources that enabled this contribution to #gl_("swith",pl:true). By transparently presenting this information, readers can better understand the research ecosystem and form their own opinions on the study's context.

Thus, before delving deeper into research on #gl_("swith", pl:true), it is important to acknowledge the following:
The Federal Ministry for Economic Affairs and Climate Action sponsored the research project titled "Konzeptprüfstand für Kleinflugzeugflügel mit hochintegralen Hochdruckwasserstofftanks" under the identification number 20M2117B. This project was awarded to the TU Dresden, where the author of this thesis was employed and granted permission to utilize some of the project outcomes for doctoral research.
The project involved collaboration with an industry partner, Die IMA Materialforschung und Anwendungstechnik GmbH in Dresden, bringing valuable industry perspective to the research context.

As a result, this work received financial support from both the TU Dresden and the Federal Ministry for Economic Affairs and Climate Action. These institutions and partners provided the enabling factors for this research.
While expressing gratitude to all involved parties is significant, there is another crucial reason for disclosing this information. Research experts and readers might be interested in understanding the funding sources and collaborative context, as this knowledge could potentially inform their interpretation of the results. By providing these details transparently, readers are empowered to form their own opinions regarding the research environment.