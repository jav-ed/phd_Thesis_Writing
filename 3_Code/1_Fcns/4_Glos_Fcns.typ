
#import "Helper/100_Helper_Main.typ": *

#import "../../2_Wr/3_Additional/1_Glossary.typ": glos_entry_list

/* ========================================================================== */
/* ================================ Glossary ================================ */
/* ========================================================================== */
// #import "@preview/glossarium:0.2.2": make-glossary, print-glossary, gls, glspl 
// #import "../../3_Code/1_Libs/glossarium.typ": * 
// #import "../../3_Code/2_Custom_Libs/glossarium_v_0_4_1.typ": * 

#import "@preview/glossarium:0.5.0": make-glossary, register-glossary, print-glossary, gls, glspl

// ------------------------------ init_glossary ----------------------------- //
#let init_glossary(body) = {
    register-glossary(glos_entry_list)
    show: make-glossary

    body
}

// ----------------------------- final_glossary ----------------------------- //
#let final_glossary()={

    // create clear seperation between content and glossary
    pagebreak()

    set heading(numbering: none)

    // adapt color
    // #show link: set text(fill: green.darken(30%))

    // only link color
    // #show link: set text(fill: blue)
    // #show link: set text(fill: color_Link)

    // color of key and description
    // #set text(fill: color_Link)
    // #set text(fill: gray.darken(70%))
    [= Glossary]

    print-glossary(
        glos_entry_list,

        // show all term even if they are not referenced, default to true
        show-all: true
    )


}


// avail functions:
// gl_("term", pl:true)
// gl_("term", long:true)



// output and acronoym/gls
// used when a word shall be highlighted and also is an acronym
#let em_Gl(inp, 
    color_High: color_High,
    emphasize: false,
    suffix: none) = {

    // adapt color
    set text(fill: color_High)

    // make it ialic: emphasize
    if emphasize{
        // emphaisze and track the acronym
        emph[#gls(inp, suffix:suffix)]
    }

    else{
        // track the acronym
        gls(inp, suffix:suffix)

    }
}

/* ------------------------------- default gls ------------------------------ */
#let gl_(inp, 
    color_Link: color_Link,
    first_Letter_Up: false,
    suffix:none,
    display:none, 
    long: false,

    // plural
    pl: false) = {

    // adapt color
    set text(fill: color_Link)

    // get the first letter upper case
    if  first_Letter_Up{
        gls_Upper_Jav(inp, suffix:suffix, display:display)

    }   
    else if pl{
      glspl(inp)
    }

    else{
        // track the acronym
        gls(inp, suffix:suffix, display:display, long:long)

    }
    
}

