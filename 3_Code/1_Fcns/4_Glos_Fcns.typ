
/* ========================================================================== */
/* ================================ Glossary ================================ */
/* ========================================================================== */
// #import "@preview/glossarium:0.2.2": make-glossary, print-glossary, gls, glspl 
// #import "../../3_Code/1_Libs/glossarium.typ": * 
#import "../../3_Code/2_Custom_Libs/glossarium_v_0_4_1.typ": * 
#show: make-glossary


// avail functions:


// define default color for highlighting
#let color_Link = gray.darken(60%)
#let color_High = blue
#let color_Comment = green

// output and acronoym/gls
// used when a word shall be highlighted and also be be an acronym
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

