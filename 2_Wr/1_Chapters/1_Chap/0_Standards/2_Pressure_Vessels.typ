/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */






=== Fundamentals of Pressure Vessels <chap_1_0_3>



=== II.3 Fundamentals of Pressure Vessels

This section will first provide general basics about pressure tanks. Then, distinctions will be made so that only information relevant to #gl_("swith", pl:true) (Structural Integral Hydrogen Fuel Tanks) can be used for further work.

Pressure tanks are special containers used in various applications for the storage and transport of pressurized gases and liquids. Pressure tanks are used, among other things, in transportation, aerospace, energy and environmental technology, as well as various other research and industrial sectors. For the K2H2 project, however, it can be clearly stated that the propulsion of the small aircraft should be carried out by hydrogen (H2). Accordingly, this work will focus exclusively on pressure tanks for the storage of hydrogen (H2).

The paper @barral2006hydrogen briefly reports on the development history of pressure cylinders. This will be briefly described below. Since the beginning of the 20th century, H2 has been stored in seamless steel bottles. Around the end of the 1960s, steel tubes could also be used. At this time, the so-called hydrogen embrittlement was increasingly encountered. The latter states that, through sufficiently long contact between metal and H2, the metal begins to embrittle or the structural mechanical properties, such as strength and E-modulus, are weakened.

Aluminum tanks were the alternative at the time, which, however, cost significantly more. With the aim of reducing the weight of the steel bottles, a partial to complete composite wrapping of the steel bottles was carried out. Due to the weight savings, the wrapped pressure vessels could now also be used mobile. The next step in development was to replace the metallic so-called liner with plastic. The composite winding is wrapped around the plastic liner.

The extent to which a metallic liner differs from a plastic liner and what differences exist between the individual plastics is presented in a detailed study in @Su2021. However, the most important points are: Metal has a higher density, making it more difficult for H2 to diffuse out. The disadvantage of metal, on the other hand, is its higher weight and embrittlement. Depending on the choice of plastic and utilization of special effects, such as the tortuous effect (addition of fillers), significant influence can be taken on the diffusion behavior. The goal is to let as little H2 diffuse out as possible or to obtain the lowest possible diffusion rate.

The superordinate development stages of the pressure tank can be divided into tank types. @fig_4 shows all four common tank types that are available in the free market economy. Contrary to the labeling in @fig_4, tank types are usually labeled with Roman numerals in the literature. Tank type V had already been developed at the time of writing this report. However, it is the most expensive of all variants. It consists exclusively of fiber-reinforced plastic, has no liner @Su2021, and is currently mainly used for military purposes.


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/0_Tank_Types.png", 
  width: 100%),
  caption: [Common types of pressure vessels @Su2021.],
) <fig_4>


From tank type I to IV, the weight decreases on the one hand, and on the other hand, the maximum bearable pressure as well as the costs increase. Type V weighs about 20% less than Type IV @Su2021, but can only withstand a lower maximum pressure. The choice of tank depends on the pressure range, weight, and cost. Different values for the maximum bearable pressure can be found in the literature. However, @tab_0 can be considered as guideline values. For K2H2, tank type IV has already been chosen and is defined as a non-changeable constant for the project.

/* -------------------------------------------------------------------------- */

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

  kind: table,
  caption: [Maximum bearable pressure values according to @khzouz2020hydrogen.],
)<tab_0>
/* -------------------------------------------------------------------------- */


In summary, it can be said that there are different tank types that come into question for different requirements. For the K2H2 project, the choice has already been made; it should be a Type IV tank.