/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


// TODO proper title
=== Specific Standards from Various Fields <chap_1_0_5>

In the previous @chap_1_0_4 and @chap_1_0_3 in it was explained that the automotive industry is ahead of aviation in some areas and it could be observed that they pursue similar goals as aviation. 
Moreover it could be inspected that the usecase for hydorgen is vast.
While the automtive industry was highlighted, it could be monitored that the mobility sector itself is one of the domains that are targeting the secure, feasible and industrial application of hydrogen.
The goal of this subsection is provide a list of standardsn from various fields that could have potential linkings to #gl_("swith", long:true). 
For that it shall be clearly mentioned which domains. were chosen, backed by providing reasoning for choosing these domains.
Once a comprehensive listing is provided some essential standards shall be reasonably selected in the upcoming @chap_1_0_6.



During the whole @chap_1_0, it could be observed that there are many fields that desire a secure, feasible and industrial appliaction.
The automotive industry being one of them, especially hihglighted in @chap_1_0_3 and @chap_1_0_4.
Yet, the automtive industry is only one big domain under the bigger category of mobility.
Focusing on finding standards that could provide helpful insights for #gl_("swith")-relateable standards.
Two main reasons why focusing on mobility can be reagrded as areasoble apporachs hall be given.
First, the #gl_("swith", pl:true) are regular aircrafts with some special modifcations. Aircrafts themselfs are a subset of mobility. Because of the latter it can be assumed hydrogen powered aircrafts offer significant similarities with other mobility sector. One concrete example for that was provided in @chap_1_0_4 through the work of Opel, reported in @Bleser2012.
Second, economical impactful mobility sectors can be assumed to be regulated and supported through standards. Thus, availability for both, academic publications and science and goverment backed standards should be given.
Besides targeting the mobility sector another noteworthy approach could be to investigate available standards that are dedicated especially to hydrogen applications.
As laid out in many occasions in @chap_1_0, currently there is no single standard that could be used for the commerical certification of #gl_("swith", pl:true), and due to the sensibility found in the provided reasoning, both mentioned approaches shall be undertaken.

The automotive industry generally includes cars (motor vehicles), buses, and heavy goods transporters (trucks). The mobility sector on the other hand included automotive and other mentionowrthy sectors. Examples of other mobility industrial sectors for which the use of hydrogen as a potential future energy source is are listed in @tab_3. 
It is important to note that the mentioned industries are actively conducting research to realize hydrogen powered respective vehicles. 


#figure(
  table(
    columns: (auto, auto),
    align: center + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,
    
    /* --- header --- */
    table.cell(colspan: 2)[*Mobility Sector*],
    /* -------------- */

    [Cars  @link_hyundai_nexo_img @link_hyundai_ix35_img @link_toyota_mirai_ii_img @link_honda_clarity_img @link_mercedes_glc_img @Rath2019 @Fakhreddine2023 ],
    [Buses @Rath2019],
    [Trains @Fakhreddine2023 @Rath2019 @link_alstom ],
    [Motorcycles @Fakhreddine2023 @Rath2019 
     @DieterWeigl2015 @Weigl2011 @Hwang2012 @Hwang2010 @Weigl2008   
    ],
    [Aircrafts @Rath2019 @link_hydro_airbus],
    [Ships @Rath2019 @Ustolin2022],
    [Boats @Rath2019 @Ustolin2022 @Donatini2007 @Alfonsin2014],
    [Submarines @Ustolin2022  @barral2006hydrogen @Li2024a @Psoma2002],

    [Unmaned Aerial Vehicle (UAV) @Fakhreddine2023 @DeWagter2021 @Yan2023
    @Kucuk2024 @Tiseira2023 @Gavrilovic2024
    ],

    [Air taxi @Tiseira2023 @Desantes2022 @PonsPrats2022],
  ),

  kind: table,
  caption: [Concrete mobility domains for hydrogen application.],
)<tab_3>

The primary motivation across the mentioned domains can be assumed to be the same as in avaition.
It is to offer sustainable and affordable transportation to science, industry and  average consumer.
Even the average consumer is actively involved in burdening the environment, among others, through daily use of cars, ordering goods, flying to other cities and countries in vacany. 
A significant difference between aviation, and on ground mobility vehicles such as train, cars and motorcycles, lies in the environment conidtion of the pressure vessels. 
While motor vehicles operate on the ground and are thus not exposed to any large pressure difference, aircraft and other aircraft must be designed for different flight altitudes @Franco2011. 
This results in high pressure differences, which leads to higher loads in the structural design. 
Moreover, the temperature changes with the flight attitude, ranging from 288.15 K to 233.15 K or 15 $degree$C  to -50 $degree$C for an altitude from 0 km to 10 km cruise altitude.
According to @Rossow_2014 the maximal flight height is around 10 km to 13 km and according to @Filippone2010 most commercial airliners and business jets have final cruise altitudes well in beyond of 12 km (40,000 ft). Reaching from 0 km to 11 km the altitude range is called troposphere where the temperatre drops from 288.15 K or 15 $degree$C  to 216.65 K or -57 $degree$C.
From 11 km to 20 km the strarosphere is reached, where no difference in temperature is to be found.
So because the temperature remains constant between 11 km and 13 km, it can be said that aircrafts need to withstand constant temperatures between 288.15 K or 15 $degree$C  to 216.65 K or -57 $degree$C, but also variations within this range.
There are three common atmospheric models the ICAO- @link_icao_atmposhere and the  US-Standard Atmosphere @link_us_atmposhere as well as the Norm Atmosphere DIN 5450 @lecture_notes_Entwerfen_von_Verkehrsflugzeugen_I @Butt2021.
The temperatre provided above were obtained through the Norm Atmosphere DIN 5450.
Note, depending on the actual location of the airport temperature on ground can be very different. 
While 15 $degree$C might be accurate for some locations at some seasons, 15 $degree$C in Dubai in summer could be inacurrate.

Furthermore, similar to modern automtive Aviation is an area strongly dominated by lightweight construction. Thus, this information should be considered if hydorgen standards are taken from a non-lightweight focused are.
Generally, for the hydrogen-powered mobility domains for transport, a significant distinction can be made: is it a light or heavy mobility solution. An overview of some of the found standards and projects that deal with #gl_("cgh2") as fuel for the light mobile sector are provided in @tab_4. Comparables for heavy means of transportation are provided in @tab_5, pressure cylinders in general without a clearly defined case for mobile application in @tab_6, near-ground static pressure storage standards in @tab_7, and the hydrogen based standards provided by #gl_("iso", long:true) are given in @tab_8.


/* -------------------------------------------------------------------------- */
/* ----------------------------------- car ---------------------------------- */

#figure(
  table(
    columns: (0.8fr, 1fr, 1fr),
    align: left + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    /* --- header --- */
    table.header(
      table.cell(colspan: 3, align: center)[*Light-Duty vehicles*]
      ) ,
    /* -------------- */

    [#image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/3_Various_Fields/3_Car.jpg", width: 100%) @img_Toyota],
    
    [
      - EC79/2009 @EU_79_2009
      - EC406/2010 @EU_406_2010
      - UNECE R134 @EU_134
      - GTR No. 13 @GT_13
      - CSA/ANSI HGV 2-2014 (R2019) @ansi_2014
      - SAE J2579 @sae_j2579
      - KHK S0128 @iijima2015development
      - JARI S001 @jari_001 @global_registry
    ],
    [
      - JARI S002 @jari_002 @global_registry
      - JARI S003 @jari_003 @global_registry
      - EIHP @eihp
      - ISO 15869:2009, status: withdrawn @iso_15869
      - ISO 19881:2018, announced to be updated @iso_19881
      - ISO/DIS 19881, under development @iso_19881_New
    ],
  ),

  kind: table,
  caption: [Selection of standards for light-duty vehicles.],
)<tab_4>

/* ------------------------------- heavy-duty ------------------------------- */
#figure(
  table(
    columns: (auto, auto),
    align: left + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    /* --- header --- */
    table.header(
      table.cell(colspan: 2, align:center)[*Heavy-Duty vehicles*]),
    /* -------------- */

    [#image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/3_Various_Fields/7_H_Bus.png", width: 60%) @link_img_h2_bus],
    [
      - EC79/2009 @EU_79_2009
      - EC406/2010 @EU_406_2010
      - CSA/ANSI HGV 2-2014 (R2019) @ansi_2014
    ],
  ),

  kind: table,
  caption: [Selection of standards for heavy-duty vehicles.],
)<tab_5>

/* --------------------------- transportable tubes -------------------------- */
#figure(
  table(
    columns: (0.7fr, 1fr, 1fr),
    align: left + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    /* --- header --- */
    table.header(
      table.cell(colspan: 3, align:center)[*Transportable tubes*]),
    /* -------------- */

    [#image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/3_Various_Fields/5_Transport.jpg", width: 100%) @img_Transport],
    [
      
      - Agreement Concerning the International Carriage of Dangerous Goods by Road (ADR) @adr_2023
    
    ],
    [
      - EN 12245, status: withdrawn @din_en_12245
      - U.S. DOT @simon2007guidelines
      - Apragaz TPED @tped
      - ISO 11119-3:2020 @11119_3_ISO
      - ISO 17519:2019 @iso_17519
    ],
  ),

  kind: table,
  caption: [Selection of standards for transportable tubes.],
)<tab_6>


/* ----------------------------- ground storage ----------------------------- */
#figure(
  table(
    columns: (0.7fr, 1fr),
    align: left + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    /* --- header --- */
    table.header(
      table.cell(colspan: 2, align:center)[*Ground and stationary storage*]),
    /* -------------- */

    [#image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/3_Various_Fields/6_Ground.jpg", width: 100%) @img_Ground],
    [
      - Pressure Equipment Directive (PED) @eu_ped
      - American Society of Mechanical Engineers (ASME) @asme_hydro
      - EN 12245 @din_en_12245
      - ISO 19884 @iso_19884_1
    ],
  ),

  kind: table,
  caption: [Selection of standards for ground and stationary storage.],
)<tab_7>


// tables that are within figures shoud be breakable 
#show figure: set block(breakable: true)
#figure(
  table(
    columns: (0.3fr, 1fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,
  
    
    /* --- header --- */
    table.header[*ISO/TC 197 Hydrogen technologies*][*Description*],
    /* -------------- */

    [ISO/AWI 14687], [Hydrogen fuel quality — Product specification @iso_14687, status: available and new version under development @iso_14687_New],

    [ISO/AWI TR 15916], [Basic considerations for the safety of hydrogen systems @iso_15916, status: available and new version under development @iso_15916_New],
    
    [ISO/AWI 17268], [Gaseous hydrogen land vehicle refueling connection devices @iso_17268, status: available and new version under development @iso_17268_New],

    [ISO/AWI 19880-5], [Gaseous hydrogen — Fuelling stations — Part 5: Dispenser hoses and hose assemblies @iso_19880_5, status: available and new version under development @iso_19880_5_New],

    [ISO/CD 19880-6], [Gaseous hydrogen — Fueling stations — Part 6: Fittings @iso_19880_6, status: under development],

    [ISO/WD 19880-7], [Gaseous hydrogen — Fuelling stations — Part 7: O-rings @iso_19880_7, status: under development],

    [ISO/AWI 19880-8], [Gaseous hydrogen — Fuelling stations — Part 8: Fuel quality control @iso_19880_8, status: available and new version under development @iso_19880_8_New],

    [ISO/AWI 19880-9], [Gaseous hydrogen — Fuelling stations — Part 9: Sampling for fuel quality analysis @iso_19880_9],

    [ISO/AWI 19881], [Gaseous hydrogen — Land vehicle fuel containers @iso_19881, status: available and new version under development @iso_19881_New],

    [ISO/AWI 19882], [Gaseous hydrogen — Thermally activated pressure relief devices for compressed hydrogen vehicle fuel containers @iso_19882, status: available and new version under development @iso_19882_New],


    [ISO/AWI 19884-1], [Gaseous Hydrogen - Pressure vessels for stationary storage Part 1: Part 1: general requirements @iso_19884_1, status: under development],

    [ISO/AWI TR 19884-2 status: under development], [Gaseous Hydrogen - Pressure vessels for stationary storage Part 2: Material test data of class A materials (steels and aluminum alloys) compatible to hydrogen service @iso_19884_2, status: under development],

    [ISO/AWI TR 19884-3], [Gaseous Hydrogen - Pressure vessels for stationary storage Part 3: Pressure cycle test data to demonstrate shallow pressure cycle estimation methods @iso_19884_3,  status: under development],



    [ISO/CD 19885-1], [Gaseous hydrogen — Fuelling protocols for hydrogen-fuelled vehicles — Part 1: Design and development process for fuelling protocols @iso_19885_1, status: under development],

    [ISO/AWI 19885-2], [Gaseous hydrogen — Fuelling protocols for hydrogen-fuelled vehicles — Part 2: Definition of communications between the vehicle and dispenser control systems @iso_19885_2, status: under development],

    [ISO/AWI 19885-3], [Gaseous hydrogen — Fuelling protocols for hydrogen-fuelled vehicles — Part 3: High flow hydrogen fuelling protocols for heavy duty road vehicles @iso_19885_3, status: under development],




    [ISO/AWI 19887], [Gaseous Hydrogen — Fuel system components for hydrogen fuelled vehicles @iso_19887, status: under development],

    [ISO/AWI 22734-1], [Hydrogen generators using water electrolysis — Industrial, commercial, and residential applications — Part 1: General requirements, test protocols and safety requirements @iso_22734_1, status: under development],

    [ISO/AWI TR 22734-2], [Hydrogen generators using water electrolysis — Part 2: Testing guidance for performing electricity grid service @iso_22734_2, status: under development],
  ),
  kind: table,
  caption: [Standards following the ISO/TC 197 - Hydrogen technologies.],
)<tab_8>



Besides the #gl_("iso") having a focus on hydrogen, another reason why #gl_("iso") hydrogen based standards are mentioned is of the very good internationally reputation that the #gl_("iso") has. This increases the chances of partial to potentially full international recognition. 
As mention in the introduction of this subsection, the goal of of this subsection was to find potential #gl_("cgh2") standards, provide reasons for having chosen them and finally present them in an organised manner.
Filtering the standards that have the highest potential for providing information for a #gl_("swith") certification happens in the next @chap_1_0_6 based on some chosen criteria.  


#summary_([
It can be summarized that a hihg number of stanadrds could be found that deal with hydrogen. While some of the found standards are already in use, others are to be updated or were just announced and needs to be published for their first time. 
Regardless of their current status, it can be hihlgited once again, 
Narrowing down such a high number of hydrogen norms to the most promising needs an systematic approach. 
])
