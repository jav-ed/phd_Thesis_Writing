/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


// Title was checked and is fine - inshallah
=== Specific Standards from Various Fields <chap_1_0_5>
In previous @chap_1_0_4 and @chap_1_0_3, it was explained that the automotive industry is ahead of aviation in some areas, and it was observed that both sectors pursue similar goals. Moreover, it was demonstrated that the use cases for hydrogen are vast. While the automotive industry was highlighted, it was noted that the mobility sector as a whole is one of the domains targeting the secure, feasible, and industrial application of hydrogen.
The goal of this subsection is to provide a list of standards from various fields that could have potential links to #gl_("swith", long:true). To achieve this, the domains chosen shall be clearly mentioned, supported by reasoning for their selection. Once a comprehensive listing is provided, some essential standards shall be reasonably selected in the upcoming @chap_1_0_6.

Throughout @chap_1_0, it was observed that many fields desire a secure, feasible, and industrial application of hydrogen. The automotive industry, being one of them, was especially highlighted in @chap_1_0_3 and @chap_1_0_4. However, the automotive industry is only one significant domain under the broader category of mobility.
The focus is on finding standards that could provide helpful insights for #gl_("swith")-related standards. Two main reasons for focusing on mobility can be regarded as reasonable approaches:
First, #gl_("swith", pl:true) are regular aircraft with some special modifications. Aircraft themselves are a subset of mobility. Due to this, it can be assumed that hydrogen-powered aircraft offer significant similarities with other mobility sectors. A concrete example of this was provided in @chap_1_0_4 through the work of Opel, as reported in @Bleser2012.
Second, economically impactful mobility sectors can be assumed to be regulated and supported through standards. Thus, availability for both academic publications and science and government-backed standards should be given.
Besides targeting the mobility sector, another noteworthy approach could be to investigate available standards that are dedicated specifically to hydrogen applications. As laid out on many occasions in @chap_1_0, currently there is no single standard that could be used for the commercial certification of #gl_("swith", pl:true). Due to the sensibility found in the provided reasoning, both mentioned approaches shall be undertaken.

The automotive industry generally includes cars (motor vehicles), buses, and heavy goods transporters (trucks). The mobility sector, on the other hand, encompasses the automotive industry and other noteworthy sectors. Examples of other mobility industrial sectors for which hydrogen is being considered as a potential future energy source are listed in @tab_3. 
It is important to note that the mentioned industries are actively conducting research to realize hydrogen-powered vehicles in their respective domains.


#figure(
  table(
    columns: (auto, auto),
    // left for better readability
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
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

    [Cars @link_hyundai_nexo_img @link_hyundai_ix35_img @link_toyota_mirai_ii_img @link_honda_clarity_img @link_mercedes_glc_img @Rath2019 @Fakhreddine2023 ],
    [Buses @Rath2019],
    [Trains @Fakhreddine2023 @Rath2019 @link_alstom ],
    [Motorcycles @Fakhreddine2023 @Rath2019 @DieterWeigl2015 @Weigl2011 @Hwang2012 @Hwang2010 @Weigl2008],
    [Aircraft @Rath2019 @link_hydro_airbus],
    [Air taxis @Tiseira2023 @Desantes2022 @PonsPrats2022],
    [Unmanned Aerial Vehicles (UAVs) \ @Fakhreddine2023 @DeWagter2021 @Yan2023 @Kucuk2024 @Tiseira2023 @Gavrilovic2024],
    [Ships @Rath2019 @Ustolin2022],
    [Boats @Rath2019 @Ustolin2022 @Donatini2007 @Alfonsin2014],
    [Submarines @Ustolin2022 @barral2006hydrogen @Li2024a @Psoma2002],
  ),

  kind: table,
  caption: [Concrete mobility domains considering hydrogen application and relevant literature.],
)<tab_3>

The primary motivation across the mentioned domains can be assumed to be the same as in aviation. It is to offer sustainable and affordable transportation to science, industry, and the average consumer. The average consumer is actively involved in burdening the environment through various transportation-related activities, including daily car use, consumption of shipped goods, and air travel for business and leisure.
A significant difference between aviation and ground mobility vehicles such as trains, cars, and motorcycles lies in the environmental conditions of the pressure vessels. While motor vehicles operate on the ground and are thus not exposed to large pressure differences, aircraft must be designed for different flight altitudes @Franco2011. This results in high pressure differences, which lead to higher loads in the structural design.


Moreover, the temperature changes with flight altitude, ranging from $15 space degree.c upright(" to") space hyph.minus 50 space degree.c $ ($288.15 upright("K ") upright(" to") space 233.15 upright("K ") $)
for an altitude from $0  upright("km") upright(" to") space 10  upright("km") $
cruise altitude. According to @Rossow_2014, the maximal flight height is around $10 upright("km") upright(" to") space 13 upright("km")$, and according to @Filippone2010, most commercial airliners and business jets have final cruise altitudes well beyond $12 upright("km") ( approx 40,000 upright("ft"))$. From $0 upright("km") upright(" to") space 11 upright("km")$, the altitude range is called the troposphere, where the temperature drops from $288.15 upright("K ") upright(" to") space 216.65 upright("K ")$ ($15 degree.c upright(" to") space hyph.minus 56.5 degree.c$).
From $11 upright("km") upright(" to") 20 upright("km")$, the stratosphere is reached, where no difference in temperature is observed. As the temperature remains constant between $11 upright("km") upright(" and") 13 upright("km")$, it can be said that aircraft need to withstand temperatures between $288.15 upright("K ")$ ($15 degree.c$) and $216.65 upright("K ")$ ($hyph.minus 56.5 degree.c$), as well as variations within this range.


There are three common atmospheric models: the ICAO Standard Atmosphere @link_icao_atmposhere, the US Standard Atmosphere @link_us_atmposhere, and the Norm Atmosphere DIN 5450 @lecture_notes_Entwerfen_von_Verkehrsflugzeugen_I @Butt2021. The temperatures provided above were obtained using the Norm Atmosphere DIN 5450.
It is important to note that the actual ground temperature can vary significantly depending on the airport's location. While 15 $degree$C might be accurate for some locations during certain seasons, it could be highly inaccurate for others. For instance, 15 $degree$C in Dubai during summer would be considerably lower than the typical temperatures experienced in that region.
Furthermore, similar to the modern automotive industry, aviation is an area strongly dominated by lightweight construction. Thus, this information should be considered when adopting hydrogen standards from non-lightweight-focused areas.
Generally, for hydrogen-powered mobility domains in transport, a distinction can be made between light and heavy mobility solutions. An overview of some of the identified standards and projects that deal with #gl_("cgh2") as fuel for the light mobile sector is provided in @tab_4. Comparable standards for heavy means of transportation are presented in @tab_5. Standards for pressure cylinders in general for mobile application, are listed in @tab_6. Near-ground static pressure storage standards are outlined in @tab_7, and the hydrogen-based standards provided by #gl_("iso", long:true) are given in @tab_8.

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
      table.cell(colspan: 3, align: center)[*Light-Duty Vehicles*]
      ) ,
    /* -------------- */

    [#image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/3_Various_Fields/3_Car.jpg", width: 100%) @img_Toyota],
    
    [
      - EC 79/2009 @EU_79_2009
      - EC 406/2010 @EU_406_2010
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
      table.cell(colspan: 2, align:center)[*Heavy-Duty Vehicles*]),
    /* -------------- */

    [#image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/3_Various_Fields/7_H_Bus.png", width: 60%) @link_img_h2_bus],
    [
      - EC 79/2009 @EU_79_2009
      - EC 406/2010 @EU_406_2010
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
      table.cell(colspan: 3, align:center)[*Transportable Tubes*]),
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
      table.cell(colspan: 2, align:center)[*Ground and Stationary Storage*]),
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
    table.header[*ISO/TC 197 Hydrogen Technologies*][*Description*],
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
  caption: [Standards following ISO/TC 197 - Hydrogen technologies.],
)<tab_8>



Besides #gl_("iso")'s focus on hydrogen, another reason for mentioning #gl_("iso") hydrogen-based standards is the organization's excellent international reputation. This increases the chances of partial to potentially full international recognition of these standards.
As mentioned in the introduction of this subsection, the goal was to identify potential #gl_("cgh2") standards, provide reasons for their selection, and present them in an organized manner. The process of filtering the standards with the highest potential for providing information relevant to #gl_("swith") certification will be addressed in @chap_1_0_6, based on specific criteria.


#summary_([
It can be summarized that a high number of standards dealing with hydrogen have been identified. While some of these standards are already in use, others are in the process of being updated or have just been announced and are yet to be published for the first time.
Regardless of their current status, it should be highlighted once again that narrowing down such a high number of hydrogen norms to the most promising ones requires a systematic approach. This systematic evaluation will be crucial in identifying the standards most relevant to #gl_("swith") certification.
])
