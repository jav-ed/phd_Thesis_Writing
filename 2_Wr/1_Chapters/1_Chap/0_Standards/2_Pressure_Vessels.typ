/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */



/* -------------------------------------------------------------------------- */
These guidelines cover tanks that contain high-pressure compressed gas. Depending on the pressure range, the chosen gas, the type of storage, the material of the container, and the area of application, specific standards can be found. A more detailed explanation of this will be given in the following section.



=== Fundamentals of Pressure Vessels <chap_1_0_3>
Besides the aviation, according to @chap_1_0_1, one of the other main domains in which #gl_("swith", pl:true) can splitted up, is the domain of the pressure vessels. Following this, this subsection will first provide general basics about pressure tanks. Then, some distinctions will be made so that only information relevant to #gl_("swith", pl:true) can be used for further work.
Finally, concrete standards for pressure vessels are given in @chap_1_0_6


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

The superordinate development stages of the pressure tank can be divided into tank types 
@barral2006hydrogen @Rivard2019 @Wang2021b @Jella2024 @Cheng2024 
. @fig_4 shows all four common tank types that are available in the free market economy.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/0_Tank_Types.png", 
  width: 100%),
  caption: [Common types of pressure vessels @Su2021.],
) <fig_4>


Contrary to the labeling in @fig_4, tank types are usually labeled with Roman numerals in the literature
@Wang2021b @Jella2024 @Cheng2024 @Rivard2019. 
Tank type V  @Air2023 @Air2023a had already been developed at the time of writing this thesis. However, it is the most expensive of all variants @Jaber2024. It consists exclusively of fiber-reinforced plastic, has no liner @Su2021. 
Type V weighs about 20% less than Type IV @Su2021 and according to @Moradi2019 used to withstand a lower maximum pressure.
However, more up to date literate @Cheng2024 states that the Type V can bear higher pressures than Type IV.
Yet, several engineering challenges needs to be overcome before they can be adopted commercially and offer a reliable alternative to Type IV tanks @Air2023.


/* ---------------------------- general statement --------------------------- */
From tank Type I to V, the weight decreases on the one hand, and on the other hand, the maximum bearable pressure as well as usally the costs increase.
/* ---------------------------------- costs --------------------------------- */
However, it is important such general statements need to be considered as rough view.
Type I hydrogen tanks are made of metal only @Su2021. 
Common metals used include steel and aluminium alloys. Because such hydrogen
tanks are the easiest to manufacture among the five types they are generally the cheapest variant @Cheng2024.
similar to Type I, Type II hydrogen tanks are also all-metal cylinders except that they have carbon fibre or glass fibre filament wrapped around their straight body part @Cheng2024.

However, considering the costs of the Types III and IV is more complex.
The Types III to V are more complex to be manufactured, which by itself increases the cost. 
Moreover the latter has an direct impact on how many companies can manufacture these types of tanks.
Especially for the tank Types III and IV there is a relationship between maximal allowed pressure, required material and material cost to consider.

In order to build some intuation for this initally some insights provided by @Mori2009 shall be viewed followed by some concrete compairsions made between tank Type III and IV.
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
  caption: [Comparison of (a) specific costs, (b) specific weights, and (c) specific sizes of the three types of commonly used hydrogen tanks for storing 1 kg hydrogen @Cheng2024.],
) <fig_12>


/* -------------------------------------------------------------------------- */
Thus general pricing infromation for exmaple were provided by @Wang2021b with saying that tank Type III and IV would cost 700 \$/kg and 633 \$/kg , respectively.

These statement are not acurate enough as can be shwon with some outcome of @Cheng2024. 
Because of latter and @Wang2021b clearly mentions that he cited @Rivard2019, the work of @Rivard2019 was 

 himself provided a link to a document that is not available under the provided link anymore. 
Manual search for the document based on its title and the authors only found one report that has a similar name, the same first two authors and year 2013 @Law2013.
The reasons why the original document is required is to understand what the general pricing of 700 \$/kg and 633 \$/kg  for the tank Types III and IV, respectively.


Neither @Wang2021b nor the often cited review paper @Rivard2019 explains what is meant with 700 \$/kg and 633 \$/kg  for the tank Types III and IV, respectively.




/* -------------------------------------------------------------------------- */

The reason for that among others are, different manaufacturere company have different prices.
Depending on the choice of the liner material different costs occure @Shin2023.
Next, desired maximal pressure deinfes the wall thickness of the tank.
The higher the desired bearable pressure, the more material is required, which increases material usage, consequently costs and weight.
To hihglight the complex nature of the costs, tank mass, pressure level and hydrogen storage capacties @KubilayKarayel2023 conducted multiple experimental tests, where tank Type I, III and IV were tested under different conudtions. 
The experimental variations and the results for thes tests undertaken with the tank Type IV are depicted in @fig_9. 

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_Pressure_Vessel/10_Experiment.jpg", 
  width: 77%),
  caption: [@KubilayKarayel2023.],
) <fig_9>

For the tank Type-IV hydrogen storage tanks @KubilayKarayel2023 concluded the following.
Increasing the pressure from 100 bar to 800 bar increased the hydrogen holding capacity by 457.7%. 
It also would have shown that there is more than 11.7 times increase in hydrogen holding capacity in Type-IV compared to Type-III hydrogen storage tanks.
Increasing the pressure from 100 bar to 800 bar increases the tank weight by 5.42 times. In addition, the tank weigh shows approximately 45% decrease in Type-IV storage tanks compared to Type-III tanks.


The choice of tank depends on the pressure range, weight, and cost. 

Different values for the maximum bearable pressure can be found in the literature. However, @tab_0 can be considered as guideline values. For K2H2, tank type IV has already been chosen and is defined as a non-changeable constant for the project.

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
    [V], [1000 @Cheng2024],

  ),

  kind: table,
  caption: [Maximum bearable pressure values according to @khzouz2020hydrogen.],
)<tab_0>



/* -------------------------- current applicaitons -------------------------- */
in various applications for the storage and transport of pressurized gases and liquids. 



// tank type applicaiton can be found at: https://www.mdpi.com/1996-1073/16/13/5233#B55-energies-16-05233, table 4 cars and trucks
// manufacturere mentioned as well
Pressure tanks are used, among other things, in transportation, aerospace, energy and environmental technology, as well as various other research and industrial sectors. For the aim of this thesis, however, it can be clearly stated that the propulsion of the small aircraft should be carried out by hydrogen (H2). Accordingly, this work will focus exclusively on pressure tanks for the storage of hydrogen (H2).





// TODO
// make clear which type of tank you want to use for the swiths

/* -------------------------------------------------------------------------- */


In summary, it can be said that there are different tank types that come into question for different requirements. For the K2H2 project, the choice has already been made; it should be a Type IV tank.