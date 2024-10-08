

// ---------------------------- layout variables ---------------------------- //
#import "../5_Layout/0_Utils/0_Layout_Variables.typ": * 

// --------------------------------- helpers -------------------------------- //
#import "Helper/100_Helper_Main.typ": *


/* ------------------------------- import fcns ------------------------------ */
#import "2_Default_Libs.typ": *
#import "3_German_Specific.typ": *
#import "4_Glos_Fcns.typ": *
#import "5_Boxes.typ": *



// algo
// glossarium


// import from adapted source 
// the modification was required, because the border should take the full page 
// width and should display the lines properly
// #import "@preview/algo:0.3.3": algo, i, d, comment, code
#import "../../3_Code/2_Custom_Libs/algo.typ": code
// #import ../2_Custom_Libs/algo.typ": code


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




/* --------------------------------- emojis --------------------------------- */
// import emojis, see: https://typst.app/docs/reference/symbols/emoji/
// #import emoji: *

// #let c_Emoji = emoji



/* ------------------------------ default emph ------------------------------ */
#let emp_(inp, 
    color_High: color_High,
    emphasize: false) = {

    // adapt color
    set text(fill: color_High)

    // make it italic: emphasize
    if emphasize{
        emph[#inp]
        }
        
    else{
        [#inp]
    }
        
}

// ------------------------------- commenting ------------------------------- //
#let comment(inp, 
    color_Comment: color_Comment,
    emphasize: true) = {

    // adapt color
    set text(fill: color_Comment)

    // make it italic: emphasize
    if emphasize{
        emph[#inp]
        }
        
    else{
        [#inp]
    }
        
}

/* ========================================================================== */
/* ================================= figures ================================ */
/* ========================================================================== */


#let fig_(
  content,
  caption: none,
  label: none
  ) = {
  [
    #figure(
        block(
            fill: luma(230),
            inset: 8pt,
            radius: 4pt,
            width: 50%,
            content
        ),
      caption: caption
    ) #label
  ]
}


