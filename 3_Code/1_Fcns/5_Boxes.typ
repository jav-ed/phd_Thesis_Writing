// ========================================================================== //
// ====================== template for asking questions ===================== //
// ========================================================================== //

// ---------------------------- layout variables ---------------------------- //
#import "../5_Layout/0_Utils/0_Layout_Variables.typ": * 

// --------------------------------- helpers -------------------------------- //
#import "Helper/100_Helper_Main.typ": *

/* ---------------------------- 0_Chap/1_File.typ --------------------------- */
#let summary_(
    inpt_txt,
    // img_Path: "../../1_Data/2_Figures/1_Svgs/rocket.svg",
    img_Path: "../../1_Data/2_Figs/1_Highlighter/0_Pencil.svg",
    ) = {

        // see: https://typst.app/docs/reference/layout/box/
        [ 
        #v(1em)
        #line(length: 100%) #v(-0.5em)
         #box(
            height: 1.43em,
            image(img_Path),
            // stroke: 5pt + black,
            // outset: 20pt,
            // inset: 10pt,
            baseline: 20%

            )
            #h(0.33cm)
            // add the actual inpt_txt here - no empty line
             #underline(
                offset: 0.3em,
                extent:0.33em,
                stroke: (thickness: 0.2em, paint: green, cap: "round"),
                [*Summary*]) #v(0.5em) 
                #v(-0.7em) #line(length: 100%)
                #inpt_txt
            ]
    
        }




/* ------------------------------ ask_Questions ----------------------------- */
#let ask_Questions(
    question,
    // img_Path: "../../1_Data/2_Figures/1_Svgs/rocket.svg",
    img_Path: "../../1_Data/2_Figs/1_Highlighter/0_Pencil.svg",

    // because the main document is scaled with 1.17em -> adding here 1.17em will make it bigger than 1.17em -> somehow multiplicative effect. Thus  choose 1em here
    font_Size: 1em
    ) = {
    // adapt color
    set text(
        weight: "black",
        spacing: 127%,
        size: font_Size,
    )

    // see: https://typst.app/docs/reference/layout/block/
    block(
        // fill: luma(230),
        inset: 1em,
        width: 100%,
        radius: 5pt,
        stroke: 1pt + blue,
   
        // see: https://typst.app/docs/reference/layout/box/
        [#box(
            height: 1.43em,
            image(img_Path),
            // stroke: 5pt + black,
            // outset: 20pt,
            // inset: 10pt,
            baseline: 20%

            )
            #h(0.33cm)
            // add the actual question here - no empty line
            #question
            ]
    )
        }




