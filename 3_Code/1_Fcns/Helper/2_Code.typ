// import from adapted source 
// the modification was required, because the border should take the full page 
// width and should display the lines properly
// #import "@preview/algo:0.3.3": algo, i, d, comment, code


// wont work with typst v. 12 - also inshallah not required for thesis
#import "../../../3_Code/2_Custom_Libs/algo.typ": code


/* ---------------- create code variable for reusing pruposes --------------- */
// see doc at: https://github.com/typst/packages/tree/main/packages/preview/algo/0.3.3
#let code = code.with(  
    // vertical lines to show that indention occurs
    // indent-guides: 0.01pt + gray,
    
    // shift the indent guides
    // indent-guides-offset: 35pt,

    // offsets top, right, bottom, left
    //  Size of inner padding.
    inset: 11pt,

    stroke: 1pt + black,
    radius: 5pt,

    // background, set to transparent
    fill: none,
    // fill: rgb(98%, 98%, 98%),

    // show line numbers
    line-numbers: true,

    block-align: left,

    // Vertical space between lines.
    // row-gutter: 5pt,

    // Space between line numbers and text.
    column-gutter: 11pt,

    // tab-size: 35,

    // Whether the element can break across pages. WARNING: indent guides may look off when broken across pages.
    breakable: false,

    // dictionary
    // main-text-styles: (
    //   font: "New Computer Modern",
    //   size: 15pt,
    // ),


    // dictionary
    // line-number-styles: (:)


    // body,
    )


