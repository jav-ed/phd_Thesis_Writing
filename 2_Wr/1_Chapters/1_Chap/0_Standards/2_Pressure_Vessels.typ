/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

=== Pressure Vessel Fundamentals <chap_1_0_3>
Besides the aviation, according to @chap_1_0_1, one of the other main domains in which #gl_("swith", pl:true) can splitted up, is the domain of the pressure vessels. Following this, this subsection will first provide general basics about pressure tanks. Then a depth investigation intot the different available tank Types shall be given.
Since for practical applciaiton costs and current field of applicaitons are of high importance, they are adressed.
Having provided basis, a pathway for chosing the right tank Type for #gl_("swith", pl:true) shall be given. 
Linking back to standrds, concrete standards for pressure vessels are given in @chap_1_0_6


The goal is to find information that could help to improve the state of the art for certifiying #gl_("swith",pl:true). 
As motivated in @chap_1_0_6 this shall be done through commercially available standrds. Pressure tank can be regarded as the second major sub-area into which #gl_("swith", pl:true) can be distrbuted. 
Pressure tanks are special containers used to store compressed gas.
In literature and patents different pressure vessel geometries can be found 
@Rosen2018 @blair2015composite @Jaber2024 @aceves2006advanced @Yersak2019 @Geuskens2011.
One of the main reason why conformable pressure vessels are desired is to improve space utilization @aceves2006advanced. 
Thus, the field of light-weigth construction
like aerospace and automotive 
@Czerwinski2021 @Wang2023a @Hou2023
 or fields where space is limited could benefit from conformable pressure vessels.
While the aerospace industry is commonly known for its focus on light-weigth strucutres 
@Khan2024 @Chen2023 @Acanfora2023 @Okorie2023 @Seo2023, 
it also has limited free space.
Reagrdless of the big sizes of commercially available aircraft, due to the economical demands of civil aviation, space matters.
More available space means either more paying passengers or more carago that can transported. 
As an concrete example, conformable pressure vessels could be utlized to design structurally efficient pressure cabin for blended wing–bodies @Geuskens2011.
For automotive, according to @aceves2006advanced the range can be extended between 20% - 40%
depending on the geometry of the available space and the level of conformability of the vessel.
Besides optimital space utilization conformable pressure vessels can be used when the fluid is not a a compressible gas, but liquid @Geuskens2011.
There are many shapes conformable pressure vessel can take, however, a deomnstrative example is provided in @fig_10.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/1_Conformable_Tank.png", 
  width: 60%),
  caption: [Deomnstrative of an two cell conformable tank from Thiokol @haaland2000high.],
) <fig_10>

Having acknolwedged some of the advantages of conformable pressure vessels, an illustrative example of the commonly cylinderical pressure tank tanks is provided in @fig_8.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/0_Tank.png", 
  width: 77%),
  caption: [Illustrative example of the commonly used cylinderical shape of for a hydrogen pressure vessel @link_Image_Type_4_Cylinder.],
) <fig_8>

/* --------------------- from here to continue inshallah -------------------- */

Next, with @barral2006hydrogen as the main source, briefly the development history of pressure cylinders shall be mentioned. Since the beginning of the 20th century, hydrogen (H2) has been stored in seamless steel bottles. Around the end of the 1960s, steel tubes could also be used. At this time, hydrogen embrittlement
@Li2020 @Jia2023 @Campari2023 @Meda2023 @Gong2022
was increasingly encountered. The latter states that, through sufficiently long contact between metal and H2, the metal begins to embrittle or the structural mechanical properties, such as strength and E-modulus, are weakened.
Aluminum tanks were the alternative at the time, which, however, cost significantly more.
With the aim of reducing the weight of the steel bottles, a partial to complete composite wrapping of the steel bottles was carried out. Due to the weight savings, the wrapped pressure vessels could now also be used mobile @Jaber2024 @Rivard2019 @khzouz2020hydrogen @Elberry2021. 
The next step in development was to replace the metallic liner with plastic
@Wang2021b @Jella2024 @Cheng2024
. The composite winding is wrapped around the plastic liner.
The extent to which a metallic liner differs from a plastic liner and what differences exist between the individual plastics is presented in a detailed study among others in @Su2021. 
However, the most important points are: Metal has a higher density, making it more difficult for H2 to diffuse out. The disadvantage of metal, on the other hand, is its higher weight and embrittlement. 
Depending on the choice of plastic and utilization of special effects, such as the tortuous effect (addition of fillers), significant influence can be taken on the diffusion behavior. The goal is to let as little H2 diffuse out as possible or to obtain the lowest possible diffusion rate.

The superordinate development stages of the pressure tank can be divided into tank Types 
@barral2006hydrogen @Rivard2019 @Wang2021b @Jella2024 @Cheng2024. 
The four common tank types that are available in the free market economy are depicted in @fig_4.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/5_Tank_Types.png", 
  width: 100%),
  caption: [Common types of pressure vessels @Su2021.],
) <fig_4>


Contrary to the labeling in @fig_4, tank Types are usually labeled with Roman numerals (I,II, III, IV) in the literature
@Wang2021b @Jella2024 @Cheng2024 @Rivard2019. 
Tank type V  @Air2023 @Air2023a had already been developed at the time of writing this thesis. However, it is the most expensive of all variants @Jaber2024. It consists exclusively of fiber-reinforced plastic, has no liner @Su2021. 
Type V weighs about 20% less than Type IV @Su2021 and according to @Moradi2019 used to withstand a lower maximum pressure.
However, more up to date literate @Cheng2024 states that the Type V can bear higher pressures than Type IV.
Yet, several engineering challenges needs to be overcome before they can be adopted commercially and offer a reliable alternative to Type IV tanks @Air2023.


/* ---------------------------- general statement --------------------------- */
From tank Type I to V, the weight decreases on the one hand, and on the other hand, the maximum bearable pressure as well as usally the costs increase.
However, it is important to consider such general statements espeically with regard to the costs as rough view.
Generally it can be said that the tank Type II costs more than the Type I and that the Types II IV and V costs more than the Types I and II. 
First Type I tanks are made of metal only @Su2021 and common metals used include steel and aluminium alloys. Next, because such tanks are the easiest to manufacture among the five types they are generally the cheapest variant @Cheng2024.
Furhtermore similar to Type I, Type II tanks are also all-metal cylinders except that they have carbon fibre or glass fibre filament wrapped around their straight body part @Cheng2024.
However, considering the costs of the Types III and IV is more complex.
// -------------------------------------------------------------------------- //

In order to build some intuation for this, initally some insights provided by @Mori2009 shall be viewed followed by some concrete compairsions made between tank Type III and IV.
Starting with @Mori2009, he showed  that the Types III and IV tanks require less than 40% of the thickness that Type I tanks would need for a given pressue value.
The visual depiction of this is given in @fig_11.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/2_Same_Pressure.jpg", 
  width: 50%),
  caption: [Required wall thickness for different tank types for a pressure of 350 bar. Normalised with respect to the Type I tank @Cheng2024 @Mori2009.],
) <fig_11>

Less thickness means less material, which has a benefical impact on reducing tank's weight and reducing raw material costs.
Next, #gl_("cfrp", long:true) has lower density than steel and aluminum @Hans_Bargel_2022 @Schuermann2007 @Rossow_2014, which also has an weight reduciton impact.
Thus, the weight of the composite tanks, not only require less material than the steel coutnerpart, but also because #gl_("cfrp") has a lower density than metal, again gains significant weight reduction.


Next, in order to see some unexpected behavior that could arise when attempting to give general pricing rules for tank Type III and IV, results from @Cheng2024 shall be viewed.
For that @Cheng2024 tested compared Type III with 300 and 700 bar with one Type IV 700 bar. 
Important findings are depicted in @fig_12.
It can be obsevered that the manufacturing costs for the tank Type III increased depending on the desired pressure.
The impact on that the costs of cost 600 \$/kg for 350 bar increased to 1600 \$/kg for 700 bar. 
Comapring the costs of the 700 bar tank Type III and IV, it can be noted that the Type IV is cheaper than the Type III.
However, the Type III for 350 bar is still cheaper than the 700 bar Type IV.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/3_Type_3_4_Costs.jpg", 
  width: 100%),
  caption: [Comparison of (a) specific costs, (b) specific weights and (c) specific sizes of the three types of commonly used hydrogen tanks for storing 1 kg hydrogen @Cheng2024.],
) <fig_12>


Next, @Shin2023a conducated a detailed comparison between the costs of the tank Type III and IV. 
It was concluded that the cost of the tank Type III was 46% higher than that
of the type IV-a, where the appendix a was internally used in @Shin2023a to differciate between two different type IV configurations.  
The provided reason for this outcome was the tank Type III incurred higher
manufacturing costs because of its aluminum liner material.
The alumium liner required a demanding high-temperature process, which had the highest energy costs.
The tank Type IV on the other hand used a plastic liner, which are simpler and less expensive to produce @Shin2023a.
// -------------------------------------------------------------------------- //

Literature like @Shin2023, who are the same two authors of @Shin2023a, @Muthukumar2023 and @Wang2021b state that that tank Type III and IV would cost 700 \$/kg and 633 \$/kg , respectively.
Mentioned resouces provide these infromation in a tabular form, but do not provide addition informaiton.
This is problematic, since it is not clear which costs are included in the numbers 700 \$/kg and 633 \$/kg.
Costs such as raw material, liner material, energy, labor and other manufactoring costs.
The mentioned literature refer to @Rivard2019 and in @Rivard2019 itself a link to to a document that return a 404 error message or file not found. 
Manual search for the document based on its title and the authors only found one report that has a similar name, the same first two authors and year 2013 @Law2013.
The reasons why the original document is required is to understand the surroudning conitions, whom without, the  general pricing of 700 \$/kg and 633 \$/kg  for the tank Types III and IV, respectively, hide the intricate nature of the cost of the tank Types III and IV.

While @Shin2023 provided the mentioned \$/kg costs, it also provides a literature on the prices of hydrogen storage tanks that range from around \$500 to \$3600.
To underscore the scientific need for the cost modeling, @Shin2023 additionaly provides a literate review on cost modeling.
To hihglight the fact that also the choice of the liner material for the tank Type IV is an important informaiton to provide @tab_16 can be viewed.
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
  caption: [Selection of a few liner materials for Type IV commercial hydrogen storage tanks @Shin2023],
)<tab_16>

To conclude the analyis about the costs especially for the tank Types III and IV, the following can be said. 
Which type of tank is more economical depends on various factors, such as desired pressure, hydrogen storage capacity @KubilayKarayel2023, light-weight demands, raw material costs and other manufactoring costs.
Also, it is important to note that even if simplified statements like 633 \$/kg would be backed up with all the required surroudning information some important aspects need to be considered.
The relationship between required tank mass and desired pressure is not linear as shown with experimental tests in @KubilayKarayel2023.
Following that, the costs of tank material costs and pressure is non-linear.
Furthermore the relationship between hydrogen storage capacity and pressure is also non-linear @KubilayKarayel2023 @Yanxing2019.
The outcome of some expiremntal data from @KubilayKarayel2023 were taken to display the relationship  between hydrogen storage capacity and pressure for a tank Type IV.

/* ------------------------- generate plotly figures ------------------------ */
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/4_hydrogen_storage_type_4.svg", 
  width: 97%),
  caption: [Highlighing the non-linear relationship between pressure rise and gaseous hydrogen storage @KubilayKarayel2023.],
) <fig_13>



/* -------------------------- current applicaitons -------------------------- */
One approachable method to infer insights for deciding on a potential tank type for #gl_("swith", pl:true) is to consider pressure vessel in their current application fields @GonzalezGaray2022 @Schmidt2020.
Hydrogen pressure vessel are known to be required among others in Submarine @barral2006hydrogen @Li2024a, aviation @link_hydro_airbus, personal vehicle  @link_hyundai_nexo @Rath2019, train @link_alstom
Furthermore  @Rath2019 a comprehensive list of addiotnal hydrogen applications is given. Among them are additional examples for personal vehicles, electronical devices laptop, smartphone, military applications and  toys 

It has been shown that tank Types I and II are  heavier than the Types III - V. 
Due to the deire to reduce the environmental impact and reduce the cost of fuel or other driving engery in every mobility sector these high weights are undesired.
Thus, tank of the Type I and II should be considered for statioanry application @barral2006hydrogen.
Consequently, the remaining lighter Types III - V are more favourable for mobile application like in automtive or aerospace.
Literatzure research confirms this statement as shown in @tab_17.
It can be obsevered that automotive soley makes use of the tanks Type greater than II.
The provided examples suggest that the tank Type IV has the highgest applicaiton rate for personal vehicles.

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
    [#image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/6_HMD_NEXO_21.png", fit:"cover")
    @link_hyundai_nexo_img],

    [#image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/7_hyundai.jpg", fit:"cover")
    @link_hyundai_ix35_img],

    [#image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/8_Toyota_mir.png", fit:"cover")
    @link_toyota_mirai_ii_img],

    [#image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/9_Honda.jpg", fit:"cover")
    @link_honda_clarity_img],

    [#image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/10_Mercedes.jpg", fit:"cover")
    @link_mercedes_glc_img],


    [Pressure [bar]], [700], [700], [700], [700], [700],
    [Tank Type], [ IV], [ IV], [ IV], [ III], [ IV],
    [Tank volume [liter]], [156.6 \ (52/52/52)], [140 \ (36/104)], [142.2 \ (52/25.3/64.9)], [141.3 \ (24/117)], [117 \ (-)],
    [Tank capacity [H2 kg]], [6.33], [5.64], [5.6], [5.46], [4.4],
    [Tank weight [kg] estimation], [111  \ (37/37/37)], [104  \ (36/104)], [-], [-], [-],
    [Gravimetric density [wt%]], [7.18], [6.43 ], [5.7 ], [-], [5.64],
    [Driving range [km]], [609], [415], [650], [589], [478],
  ),

  kind: table,
  caption: [Examples of hydrogen vehicles and employed hydrogen tank types. The full listing can be found in @Shin2023.],
)<tab_17>

Yet, the list could be incomplete and more examples could change that perspecitve. 
However, as elabored erlier due to the higher liner costs of the tank Type III, generally, the costs of the tank Type III are higher than of the tank Type IV @Shin2023a.
Moreover, as explained with @fig_12, for a pressure of 700bar, the Type III not only costed more than the Type IV, but it also had a higher weight.
As a result, the tank Type IV currently allows to store the same mass of hydrogen while being lighter.
The latter translates into that the tank Type IV offers a higher gravimetric density than the Type III.
This observation is confirmed by the gravimetric density values in @tab_17 and literature like @khzouz2020hydrogen @Rivard2019 @Shin2023 @Barthelemy2017 @Hassan2021.
Concluding all the findings up to here, it can be said that the only two remaining Types of tanks that should be considered for an efficient application for #gl_("swith", pl:true)  are the Types IV and V.

Next, a compartison between the Type V and IV shall be made to give some insight, which should be used when.
First, it can be said that the costs of the Type V are higher than the Type IV. 
Secondly, as of writign this thesis, the availbility of the tank Type V is very scarce.
The advantages of the Type V over the tank Type IV are that the Type V is said to be 20% lighter @Su2021 and allowing pressures up to 1000 bar @Cheng2024.
Since #gl_("swith", pl:true) is an aircraft, lightweight structres are hihgly desired.
Next, on the first glance, the higher pressure would allow higher compression rates and thus allow more hydrogen to store.
As a result, longer fligh ranges could be achieved and the outcome seems very postive.
However, a careful consideration exhibits that, the higher the working pressure the more effort needs to be put on safety aspects @Yanxing2019 @Klell2023 @Zheng2012.
For #gl_("swith", pl:true) beside the internal pressure, additional external loads needs to be withstood as well.
Thus, making use of a Type V tank for a #gl_("swith") at the current progress is not advised.
The pursue of developing a #gl_("swith") is a pioneers project and the tank Type V are not yet widely adopted commercial and still needs development to be considered mature @Air2023 @Air2023a.
Combing a pioneers project with a non a mature technology should be abstained from, due to safety concerns.
The tank Type IV vessels are more mature and actively used in commercial applications @Air2023. 
Thus, as of writing this thesis, #gl_("swith", pl:true) should be operated with tank Type IV.
However, once enough progress is made with tank Type V, safe utilization of the potential beenfits can be expected, the tank Type IV can be switched to Type V for #gl_("swith", pl:true) 


// ------------------------------ to sum table ------------------------------ //
A comprehnsive overview about the tank Types with material infromation as well as maximal bearable pressure is provided in @tab_0.

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
  caption: [Overview of tank Types with maximal bearbale pressures @Cheng2024. ],
)<tab_0>


/* -------------------------------------------------------------------------- */

In summaray it can be said that there is a vast field of application for hydrogen pressure vessels.
Most of the applicaiton fields are driven by the uniform goal to reduce the negative impact on the environmental.
Having showed especially the different areas of mobility which are a major factor of economical and scientific growth the undebinable importance of hydrogen pressure vessels could be underlined.
Furthermore, it could be observed that the #gl_("swith") developement can build upon current available advances from other mobility sectors.
From the V known tank Types, their current fields of applications, advantages and disadvantgges could be extracted, such that it could be explained why the tank Type IV should be considered for #gl_("swith") design.

