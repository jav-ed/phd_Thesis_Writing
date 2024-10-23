
#import "Helper/100_Helper_Main.typ": *

// get the variable that has the glossay keys, descirptions and so on
#import "../../2_Wr/3_Additional/2_Glossary_V.0.5.0.typ": glos_entry_list


/* ========================================================================== */
/* ================================ Glossary ================================ */
/* ========================================================================== */
// does not work with typst v. 12
// it includes the option to have the first letter of the key as upper, see fcn: gls_Upper_Jav
// #import "../../3_Code/2_Custom_Libs/glossarium_v_0_4_1.typ": * 
// avail functions:
// gl_("term", pl:true)
// gl_("term", long:true)


// works with typst version 12
// gls_Upper_Jav is not included here as with custom: glossarium_v_0_4_1
// source code: https://github.com/typst/packages/tree/main/packages/preview/glossarium/0.5.0
// the way of running this has changed from previous version: 0.4.1 to this version 0.5.0
#import "@preview/glossarium:0.5.0": make-glossary, register-glossary, print-glossary, gls, glspl

// ------------------------------ init_glossary ----------------------------- //
#let init_glossary(body) = {
    register-glossary(glos_entry_list)

    // ------------------------------- keep it ------------------------------ //
    body

}

// ----------------------------- output_glossary ---------------------------- //
#let output_glossary(body)= {

    // create clear seperation between content and glossary
    pagebreak()

    set heading(numbering: none)

    [= glossary]
    
    
    print-glossary(
        glos_entry_list
        )

    // ------------------------------- keep it ------------------------------ //
    body

}

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
// only with typst version 11 and glossarium_v_0_4_1
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

