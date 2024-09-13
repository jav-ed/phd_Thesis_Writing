/* -------------------------------------------------------------------------- */
#import "../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

#set heading(numbering: none)

= Appendix
Here is the appendix


#figure(
  image("../../1_Data/2_Figs/0_Content/1_Chap/1_Apus_Img.png", 
  width: 50%),
  caption: [Visualization of the APUS i2, demonstrating the practical application of #gl_("swith", pl:true) in commercial aircraft design @APUS_Image.],

  kind:"image_app",
  supplement: "Figure"
) <fig_apend_0>

here comes a table @tab_apend_0


#figure(
  table(
    columns: (0.3fr, 0.7fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,
    
    /* --- header --- */
    table.header[*Tank Type*][*Maximum bearable pressure [bar]*],
    /* -------------- */
    [I], [200],
    [II], [263],
    [III and IV], [300 – 700],

  ),

  kind: "table_apend",
  supplement: "Table",
  caption: [Maximum bearable pressure values according to @khzouz2020hydrogen.],
)<tab_apend_0>


$ sum_(k=1)^n k = (n(n+1)) / 2 $<eq_apend_0>