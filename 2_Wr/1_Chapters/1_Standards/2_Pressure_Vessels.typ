/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Title was checked and is fine - inshallah
== Classification and Analysis of Hydrogen Pressure Vessels <chap_1_0_3>

Besides aviation, according to @chap_1_0_1, one of the other main domains into which #glspl("swith") can be divided is the domain of pressure vessels. Following this, this section will first provide general basics about pressure tanks. 
Then, an in-depth investigation into the different available tank types shall be presented. 
Given this thesis's focus on real-world application, particular attention will be paid to costs and current fields of application, both critical factors in practical implementations. 
Subsequently, a pathway for selecting the appropriate tank type for #glspl("swith") will be outlined. 
Linking back to industry standards, specific guidelines for pressure vessels are presented in @chap_1_0_5.

// -------------------------------------------------------------------------- //
The primary objective is to identify information that could enhance the state of the art for certifying #glspl("swith"). As motivated in @chap_1_0_1, this shall be achieved through commercially available standards. Pressure tanks can be regarded as the second major sub-area into which #glspl("swith") can be categorized. These specialized containers are designed to safely store and deliver compressed gases under high pressure.
The literature and patents reveal various pressure vessel geometries @Rosen2018 @blair2015composite @Jaber2024 @aceves2006advanced @Yersak2019 @Geuskens2011. One of the major motivations for developing conformable pressure vessels is to improve space utilization @aceves2006advanced. 
Consequently, fields focused on lightweight construction, such as aerospace and automotive @Czerwinski2021 @Wang2023a @Hou2023, or areas where space is at a premium, could significantly benefit from conformable pressure vessels.
While the aerospace industry is renowned for its emphasis on lightweight structures @Khan2024 @Chen2023 @Acanfora2023 @Okorie2023 @Seo2023, it also grapples with limited free space. Despite the substantial size of commercial aircraft, space remains a critical factor due some of the economic demands of civil aviation. Increased available space translates to either more paying passengers or additional cargo capacity. As a concrete example, conformable pressure vessels could be utilized to design structurally efficient pressure cabins for blended wing-body aircraft @Geuskens2011.
In the automotive sector, @aceves2006advanced suggests that vehicle range can be extended by 20% to 40%, depending on the geometry of the available space and the degree of vessel conformability. Beyond optimal space utilization, conformable pressure vessels also find applications in storing non-compressible liquids @Geuskens2011.

While conformable pressure vessels can assume various shapes, a demonstrative example is provided in @fig_10.


// -------------------------------------------------------------------------- //
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/1_Conformable_Tank.png", 
  width: 60%),
  caption: [Demonstrative example of a two-cell conformable tank from Thiokol @haaland2000high.],
) <fig_10>

Having acknowledged some of the advantages of conformable pressure vessels, an illustrative example of cylindrical pressure tanks that are commonly used is provided in @fig_8.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/0_Tank.png", 
  width: 77%),
  caption: [Illustrative example of the commonly used cylindrical shape for a hydrogen pressure vessel @link_Image_Type_4_Cylinder.],
) <fig_8>

// -------------------------------------------------------------------------- //

The development history of pressure cylinders, primarily sourced from @barral2006hydrogen, reveals a progression of technological advancements. Since the early 20th century, hydrogen (H#sub[2]) storage has evolved from seamless steel bottles to more sophisticated designs. By the late 1960s, steel tubes were introduced as an alternative storage method. However, this period also saw an increase in hydrogen embrittlement, a phenomenon extensively studied in recent literature @Li2020 @Jia2023 @Campari2023 @Meda2023 @Gong2022. Hydrogen embrittlement occurs when prolonged contact between metal and H#sub[2] leads to a deterioration of the metal's structural mechanical properties, including strength and elastic modulus.
Aluminum tanks emerged as an alternative to steel, offering improved resistance to embrittlement but at a significantly higher cost. To address the weight issues associated with steel bottles, engineers developed partial to complete composite wrapping techniques. This innovation led to substantial weight reductions, enabling the use of these pressure vessels in mobile applications @Jaber2024 @Rivard2019 @khzouz2020hydrogen @Elberry2021.
The next significant development involved replacing metallic liners with plastic ones @Wang2021b @Jella2024 @Cheng2024. In this design, composite winding encases the plastic liner. A detailed study comparing metallic and plastic liners, as well as differences among various plastics is given in @Su2021. 
Key findings include that metals, with their higher density, provide better resistance to H#sub[2]  diffusion. However, metals are heavier and more susceptible to embrittlement. The choice of plastic and the use of special effects, such as the tortuous effect (achieved by adding fillers), can significantly influence diffusion behavior. The primary objective in liner design is to minimize H#sub[2]  diffusion, thereby achieving the lowest possible diffusion rate.
The evolution of pressure tank design can be categorized into distinct tank types @barral2006hydrogen @Rivard2019 @Wang2021b @Jella2024 @Cheng2024. 
The four common tank types currently available in the commercial market are illustrated in @fig_4. This figure provides a visual representation of the technological progression elaborated, showcasing the structural differences between each tank type and their respective materials.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/5_Tank_Types.png", 
  width: 100%),
  caption: [Common types of pressure vessels @Su2021.],
) <fig_4>


It is important to note that, contrary to the labeling in @fig_4, tank types are conventionally designated using Roman numerals (I, II, III, IV) in literature @Wang2021b @Jella2024 @Cheng2024 @Rivard2019. At the time of writing this thesis, a Type V tank had also been developed @Air2023 @Air2023a. This latest iteration represents a significant advancement in pressure vessel technology, although it comes with certain trade-offs.
The Type V tank is characterized by its composition, consisting exclusively of #gls("cfrp", long:true) @Kassapoglou2013 @Rossow_2014 @Schuermann2007 @Mittelstedt2021 @Mittelstedt2022 @Hans_Bargel_2022 without a liner @Su2021. This design offers a notable weight reduction, with Type V tanks weighing approximately 20% less than their Type IV counterparts @Su2021. 
Initially, Type V tanks were reported to withstand lower maximum pressures compared to Type IV @Moradi2019. Yet, more recent literature @Cheng2024 indicates that Type V tanks can now bear higher pressures than Type IV, suggesting ongoing improvements in their design and manufacturing processes.
Despite these advancements, Type V tanks remain the most expensive variant among all tank types @Jaber2024. Moreover, their widespread commercial adoption faces several engineering challenges @Air2023. These hurdles must be overcome before Type V tanks can be considered a reliable and commercially viable alternative to the well-established Type IV tanks. The ongoing research and development in this area underscores the complex nature of pressure vessel technology and its potential for further innovation.


/* ---------------------------- general statement --------------------------- */
A general trend can be observed across the tank Types I to V: as the type number increases, there is a decrease in weight accompanied by an increase in maximum bearable pressure and, typically, in cost. 
However, it is important to consider such general statements, especially with regard to costs, as a rough overview.
Generally, it can be said that the tank Type II costs more than Type I, and that Types III, IV, and V cost more than Types I and II.
Type I tanks are made of metal only @Su2021, and common metals used include steel and aluminium alloys. Because such tanks are the easiest to manufacture among the five Types, they are generally the cheapest variant @Cheng2024 @khzouz2020hydrogen.
Furthermore, similar to Type I, Type II tanks are also all-metal cylinders, except that they have carbon fibre or glass fibre filament wrapped around their straight body part @Cheng2024.
Nonetheless, considering the costs of Types III and IV is more complex.
To build some intuition for this, initially some insights provided by @Mori2009 shall be examined, followed by concrete comparisons made between tank Types III and IV.
In @Mori2009 it could be shown that the tank Types III and IV require less than 40% of the thickness that tank Type I would need for the same given pressure value.
A visual depiction of this is given in @fig_11.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/2_Same_Pressure.jpg", 
  width: 50%),
  caption: [Required wall thickness for different tank types at a pressure of 350 bar. Normalized with respect to the Type I tank @Cheng2024 @Mori2009.],
) <fig_11>

// -------------------------------------------------------------------------- //
Less thickness means less material, which has a beneficial impact on reducing the tank's weight and raw material costs.
Furthermore, #gls("cfrp") has a lower density than steel and aluminum @Hans_Bargel_2022 @Schuermann2007 @Rossow_2014, which also contributes to weight reduction.
Thus, the composite tanks not only require less material than their steel counterparts but also achieve significant weight reduction due to the lower density of #gls("cfrp") compared to metal.

To observe some unexpected behavior that could arise when attempting to give general pricing rules for tank Types III and IV, results from @Cheng2024 shall be examined.
@Cheng2024 compared Type III tanks at 300 and 700 bar with a Type IV tank at 700 bar. 
Some of the important findings are depicted in @fig_12.
It can be observed that the manufacturing costs for the Type III tank increased depending on the desired pressure.
Specifically, the costs rose from 600 \$/kg for 350 bar to 1600 \$/kg for 700 bar. 
Comparing the costs of the 700 bar Type III and IV tanks, it can be noted that the Type IV is cheaper than the Type III.
Still, the Type III tank at 350 bar is still cheaper than the 700 bar Type IV tank.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/3_Type_3_4_Costs.jpg", 
  width: 100%),
  caption: [Comparison of (a) specific costs, (b) specific weights, and (c) specific sizes of three types of commonly used hydrogen tanks for storing 1 kg of hydrogen @Cheng2024.],
) <fig_12>


Next, @Shin2023a conducated a detailed comparison between the costs of the tank Type III and IV. 
It was concluded that the cost of the tank Type III was 46% higher than that
of the Type IV-a, where the appendix a was internally used in @Shin2023a to differciate between two different Type IV configurations.  
The provided reason for this outcome was the tank Type III incurred higher
manufacturing costs because of its aluminum liner material.
The alumium liner required a demanding high-temperature process, which had the highest energy costs.
The tank Type IV on the other hand used a plastic liner, which are simpler and less expensive to produce @Shin2023a.
// -------------------------------------------------------------------------- //

A detailed comparison between the costs of tank Types III and IV was conducted by @Shin2023a. 
Their study concluded that the cost of the tank Type III was 46% higher than that
of the Type IV-a, where the appendix 'a' was internally used to differentiate between two different Type IV configurations.  
The provided reason for this outcome was that the tank Type III incurred higher
manufacturing costs due to its aluminum liner material.
The aluminum liner required a demanding high-temperature process, which had the highest energy costs.
The tank Type IV, on the other hand, used a plastic liner, which is simpler and less expensive to produce @Shin2023a.
Literature sources including @Shin2023 (who are the same two authors as @Shin2023a), @Muthukumar2023, and @Wang2021b state that tank Types III and IV would cost 700 \$/kg and 633 \$/kg, respectively.
These resources provide this information in a tabular form but do not provide additional information.
This is problematic, as it is not clear which costs are included in the figures 700 \$/kg and 633 \$/kg.
These could include costs such as raw material, liner material, energy, labor, and other manufacturing costs.
The mentioned literature refers to @Rivard2019, and in this source itself, a link is provided that points to a 404 error message or file not found. 
A manual search for the document based on its title and authors only found one report that has a similar name, the same first two authors, and the year 2013 @Law2013.
The original document is required to understand the surrounding conditions, without which the general pricing of 700 \$/kg and 633 \$/kg for tank Types III and IV, respectively, obscures the intricate nature of the costs for these tank types.

While @Shin2023 provided the mentioned \$/kg costs, it also presents a literature review on the prices of hydrogen storage tanks that range from around \$500 to \$3600.
To underscore the scientific need for cost modeling, @Shin2023 additionally provides a literature review on this topic.
To highlight the fact that the choice of liner material for the tank Type IV is also important information, @tab_16 can be viewed.
The complete listing can be found in @Shin2023 or updated prices at @link_plastiker.

#figure(
  table(
    columns: (1fr, 1fr, 1fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,
    
    /* --- header --- */
    table.header[*Company*][*Liner Material*][*Raw Material Cost*],
    /* -------------- */
    [Hexagon Purus], [HDPE], [0.72 \$/kg],
    [Toyota], [PA6], [3.13 \$/kg],
    [Hyundai], [PA6], [3.13 \$/kg],

  ),

  kind: table,
  caption: [Selection of a few liner materials for commercially available hydrogen storage tanks of Type IV @Shin2023],
)<tab_16>

To conclude the analysis about the costs, especially for tank Types III and IV, the following can be said. 
The economic viability of each tank type depends on various factors, such as desired pressure, hydrogen storage capacity @KubilayKarayel2023, lightweight demands, raw material costs, and other manufacturing costs.
It is important to note that even if simplified statements like 633 \$/kg were backed up with all the required surrounding information, some important aspects still need to be considered.
The relationship between required tank mass and desired pressure is not linear, as shown with experimental tests in @KubilayKarayel2023.
Following that, the relationship between tank material costs and pressure is non-linear.
Furthermore, the relationship between hydrogen storage capacity and pressure is also non-linear @KubilayKarayel2023 @Yanxing2019.
The outcome of some experimental data from @KubilayKarayel2023 was used to display the relationship between hydrogen storage capacity and pressure for a tank Type IV in @fig_13.

/* ------------------------- generate plotly figures ------------------------ */
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/4_hydrogen_storage_type_4.svg", 
  width: 100%),
  caption: [Highlighting the non-linear relationship between pressure increase and gaseous hydrogen storage capacity @KubilayKarayel2023.],
) <fig_13>


/* -------------------------- current applicaitons -------------------------- */

Having examined some of the complex relationships between tank types, costs, and performance characteristics, it is essential to consider how existing real-world applications can be translated for #glspl("swith") applications.
One approachable method to infer insights for this decision is to consider pressure vessels in their current application fields @GonzalezGaray2022 @Schmidt2020.
Hydrogen pressure vessels are known to be required, among others, in submarines @barral2006hydrogen @Li2024a, aviation @link_hydro_airbus, personal vehicles @link_hyundai_nexo @Rath2019, and trains @link_alstom.
Furthermore, @Rath2019 provides a comprehensive list of additional hydrogen applications. Among them are additional examples for personal vehicles, electronic devices such as laptops and smartphones, military applications, and toys.

It has been shown that tank Types I and II are heavier than Types III - V. 
Due to the desire to reduce environmental impact and the cost of fuel or other driving energy in every mobility sector, these high weights are undesired.
Thus, tanks of Types I and II should be considered for stationary applications @barral2006hydrogen.
Consequently, the remaining lighter Types III - V are more favorable for mobile applications like in automotive or aerospace sectors.
Literature research confirms this statement, as shown in @tab_17.
It can be observed that the automotive sector solely makes use of tank types greater than II.
Furthermore provided examples in @tab_17 suggest that tank Type IV has the highest application rate for personal vehicles.

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto),
    align: center + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (x: 1em, y: 0.7em),
    stroke: none,
    
    /* --- header --- */
    table.header[*Specification*][*Hyundai NEXO (2018)*][*Hyundai ix35(2013)*][*Toyota MIRAI II (2021)*][*Honda Clarity (2016)*][*Mercedes Benz GLC (2017)*],
    /* -------------- */
    [Demonstrative Image], 
    [#image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/6_HMD_NEXO_21.png", fit:"cover")
    @link_hyundai_nexo_img],

    [#image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/7_hyundai.jpg", fit:"cover")
    @link_hyundai_ix35_img],

    [#image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/8_Toyota_mir.png", fit:"cover")
    @link_toyota_mirai_ii_img],

    [#image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/9_Honda.jpg", fit:"cover")
    @link_honda_clarity_img],

    [#image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/10_Mercedes.jpg", fit:"cover")
    @link_mercedes_glc_img],


    [Pressure [bar]], [700], [700], [700], [700], [700],
    [Tank Type], [ IV], [ IV], [ IV], [ III], [ IV],
    [Tank volume [liter]], [156.6 \ (52/52/52)], [140 \ (36/104)], [142.2 \ (52/25.3/64.9)], [141.3 \ (24/117)], [117 \ (-)],
    [Tank capacity [H#sub[2] kg]], [6.33], [5.64], [5.6], [5.46], [4.4],
    [Tank weight [kg] estimation], [111  \ (37/37/37)], [104  \ (36/104)], [-], [-], [-],
    [Gravimetric density [wt%]], [7.18], [6.43 ], [5.7 ], [-], [5.64],
    [Driving range [km]], [609], [415], [650], [589], [478],
  ),

  kind: table,
  caption: [Examples of hydrogen vehicles and employed hydrogen tank types. The full listing can be found in @Shin2023.],
)<tab_17>

Yet, the list could be incomplete and more examples could change that perspective.
However, as elaborated earlier, due to the higher liner costs of the tank Type III, generally, the costs of the tank Type III are higher than those of the tank Type IV @Shin2023a.
Moreover, as explained with @fig_12, for a pressure of 700 bar, the Type III not only cost more than the Type IV, but it also had a higher weight.
As a result, the tank Type IV currently allows to store the same mass of hydrogen while being lighter.
The latter translates into the tank Type IV offering a higher gravimetric density than the Type III.
This observation is confirmed by the gravimetric density values in @tab_17 and literature such as @khzouz2020hydrogen @Rivard2019 @Shin2023 @Barthelemy2017 @Hassan2021 @Wang2021b.
Concluding all the findings up to this point, it can be said that the only two remaining types of tanks that should be considered for an efficient application for #glspl("swith") are the Types IV and V.

// -------------------------------------------------------------------------- //

Next, a comparison between Type V and IV tanks shall be made to provide insight into which should be used when. First, it can be said that the costs of Type V are higher than Type IV. Secondly, as of writing this thesis, the availability of Type V tanks is very scarce.
The advantages of Type V over Type IV are that Type V is said to be 20% lighter @Su2021 and allows pressures up to 1000 bar @Cheng2024. Since the #gls("swith") is an aircraft, lightweight structures are kept highly desired. At first glance, the higher pressure would allow higher compression rates and thus enable more hydrogen storage. As a result, longer flight ranges could be achieved, and the outcome seems very positive.
However, careful consideration reveals that higher working pressure requires more effort to be put into safety aspects @Yanxing2019 @Klell2023 @Zheng2012. For #glspl("swith"), besides the internal pressure, additional external loads need to be withstood as well. 


The pursuit of developing a #gls("swith") is a pioneering project. Combining it with Type V tanks could lead to undesired safety concerns, as these tanks are not yet widely adopted commercially and still need development to be considered mature @Air2023 @Air2023a. Given the innovative nature of #gls("swith"), it is prudent to avoid combining it with non-mature technologies. Instead, Type IV vessels, which are more mature and actively used in commercial applications, present a safer option at this stage @Air2023.
Consequently, as of writing this thesis, #glspl("swith") should be operated with Type IV tanks. However, once enough progress is made with Type V tanks, safe utilization of the potential benefits can be expected, and Type IV can be switched to Type V for #glspl("swith").
//
// ------------------------------ to sum table ------------------------------ //
Finally, @tab_0 provides a concise overview of the tank types, including material information and maximum bearable pressure. Similar, though less detailed, information on maximum bearable pressure values for the tank types can be found in other sources, including @Wang2021b, @Jella2024, @Rivard2019, and @khzouz2020hydrogen
/* -------------------------------------------------------------------------- */


#figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    align: center + horizon,
    fill: (col, row) => if row <= 1 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (x: 1em, y: 0.7em),
    stroke: none,
    
    /* --- header --- */
    table.header(
      table.cell(rowspan: 2)[*Type*],
      table.cell(colspan: 3)[*Materials*], table.hline(stroke: 0.05em, start:1),
      table.cell(rowspan: 2)[*Maximum\ pressure (bar)*],
      [*Metal*],
      [*Composite*],
      [*Polymer*],
    ),
    /* -------------- */
    [I], [Steel/Al], [/], [/], [Al: 175\ Steel: 200],
    [II], [Steel/Al liner],[Filament windings around the cylinder part], [/], [Al/glass: 263\ Steel/carbon fibre: 299],
    [III], [Al/Steel liner],[Composite over-wrap (fibre glass/aramid or carbon fibre)], [/], [Al/glass: 305\ Al/aramid: 438\ Al/carbon: 700],

    [IV], [/], [Composite over-wrap (carbon fibre)], [Polymer liner], [350 (buses)\ 700],

    [V], [/], [Composite], [/], [1000]
  ),
  kind: table,
  caption: [Overview of tank types with maximal bearbale pressures @Cheng2024. ],
)<tab_0>


/* -------------------------------------------------------------------------- */

#summary_([
In summary, it can be said that there is a vast field of application for hydrogen pressure vessels.
Most of the application fields are driven by the uniform goal to reduce the negative impact on the environment.
Having shown especially the different areas of mobility, which are a major factor in economic and scientific growth, the undeniable importance of hydrogen pressure vessels could be underlined.
Furthermore, it could be observed that the #gls("swith") development can build upon currently available advances from other mobility sectors.
From the five known tank types, their current fields of applications, advantages, and disadvantages could be extracted. This analysis led to the conclusion that tank Type IV should be considered for #gls("swith") design due to its maturity, commercial availability, and balance between performance and safety concerns.
])