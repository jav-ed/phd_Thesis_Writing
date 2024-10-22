

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


