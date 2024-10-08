/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// TODO Title
=== Filtering Essential Standards<chap_1_0_6>
In previous @chap_1_0_5, an overview of standards from various areas using #gl_("cgh2", long:true) as fuel was presented. Building upon this list of options, this subsection aims to summarize the overarching categories of hydrogen applications and clearly identify the category in which #gl_("swith", long:true) is classified.
Subsequently, a systematic approach for narrowing down the extensive list to a few essential standards is introduced. 
These essential standards are selected based on their high potential applicability for #gl_("swith") certification. A comprehensive review of all standards is beyond the scope of this thesis. However, fundamental insights from non-aviation standards are presented to provide a basic understanding of potential tests that authorities might require for commercial certification of #gl_("swith", pl:true).
These insights are presented in a structured and concise manner, extracted from the essential standards to reinforce their relevance. Special attention is given to the burst test, considered a crucial component of certification. 
The analysis focuses on two key aspects: the safety factors required for the burst test and the maximum allowable nominal pressures. These parameters, derived from the findings, are critically evaluated to assess their implications for #gl_("swith") design and certification.


The three overarching categories that can be assumed to facilitate a rapid initial assessment of standards' applicability by experienced personnel are presented in @tab_9. These categories - Storage, Tank Type, and Locality - can be combined in various ways to create specific requirement profiles. For instance, a profile might include #emp_([mobile]) (Storage), #emp_([Type I]) (Tank Type), and either #emp_([air]) or #emp_([ground]) (Locality). The multitude of possible combinations necessitates careful standard selection to ensure precise alignment with the specific requirement profile. This approach allows for tailored standard application, crucial for addressing the unique demands of different hydrogen storage systems, including #gl_("swith").


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
    table.header[*Storage*][*Tank Type*][*Locality*],
    /* -------------- */
    [Stationary], [I], [Underwater],
    [Mobile], [II], [Underground],
    [], [III], [Ground],
    [], [IV], [Air],
    [], [V], [],
  ),

  kind: table,
  caption: [Overarching categories for hydrogen tank applications to guide standard selection.],
)<tab_9>


The choice for #gl_("swith", pl:true) is mobile, Type IV, and air. The rationale for selecting Type IV is detailed in @chap_1_0_3. While Type V tanks offer potential advantages, their current limited market share affects their viability. As Type V tanks gain prominence, it can be anticipated that their maturity and safety in application will increase. Consequently, more manufacturers may emerge, potentially reducing costs. Once these conditions are met, Type V could become the preferred option.
Comparing Type IV tanks against Types I to III, Type IV offers a significant weight advantage, particularly when contrasted with stationary Types I and II. A comprehensive analysis of the different types, including their use cases, advantages, disadvantages, and direct comparisons, is provided in @chap_1_0_3. It is important to emphasize that, at the time of writing this thesis, Type IV remains the optimal choice for #gl_("swith", pl:true).
Furthermore, the selection of Type IV is applicable to both smaller and larger aircraft. Given that aircraft are primarily designed for air transportation, with ground operations being secondary, the #emp_([mobile]) and #emp_([air]) categories can be considered constants, irrespective of the #gl_("swith") size.

The criteria by which the essential standards are to be determined are given in @tab_10. The order of the listing does not follow any weighting. The timeliness stems from the idea that the more recent the publication, the higher the probability that more knowledge from expert teams could be integrated. Standards are often revised precisely for this reason. When new insights become available, these can be seen as potential new requirements. The aim of standard issuers is always to ensure safety and functionality for people and the environment and to minimize existing gaps. It is also conceivable that existing requirements must be removed or adapted.


// -------------------------------------------------------------------------- //

The criteria for determining essential standards are presented in @tab_10. It is important to note that the order of these criteria does not imply any specific weighting. Timeliness, a key criterion, is based on the principle that more recent publications are likely to incorporate a greater breadth of knowledge from expert teams. This is often the driving force behind standard revisions: as new insights emerge, they may be integrated as potential new requirements.
The primary objective of standard-issuing bodies is to ensure safety and functionality for both people and the environment while minimizing existing gaps in regulation. 
This dynamic nature of standardization also means that existing requirements may need to be modified or even removed as understanding evolves. Consequently, the most recent standards often represent the most comprehensive and up-to-date guidance for technologies such as #gl_("swith", pl:true).


#figure(
  table(
    columns: (auto, auto),
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,

    
    /* --- header --- */
    table.header(table.cell(colspan:2, [*Criteria*])),
    /* -------------- */
    [1) Timeliness],
    [2) Actively developed],
    [3) Accessibility and availability],
    [4) Use in research and industry],
    [5) International recognition],
    [6) Europe-wide recognition],
    [7) Costs for acquisition],
    [8) Coverage of K2H2 requirements],
  ),

  kind: table,
  caption: [Criteria for selection of essential standards],
)<tab_10>



// TODO add the aerospace norms
The third point, accessibility from @tab_10, is an extremely important criterion, as even excellent standards have no value for research and industry if they cannot be obtained. Points 4-6 indicate experience and successful implementation. The more frequently a standard is used and functional vehicles can be constructed and approved, the more trustworthy this standard becomes. If a standard enjoys a trustworthy reputation, it can generally be assumed that the standard is internationally recognized. Europe-wide recognition becomes important if no standards can be found that have been able to acquire high international esteem. In this case, outside of Germany, the European area would be the next possible larger target group. Costs are particularly important for start-ups, small and medium-sized research and industry institutes. The last point is to ensure that the standard meets the requirements of K2H2 to a certain extent. Understandably, any standard that does not consider the mentioned point would be completely excluded.

In K2H2, three standards could be found that meet all criteria and complement each other. These are listed in @tab_11. Mandatory and optional tests from ISO 11119-3:2020 are given as an example in @tab_12 and @tab_13.




#figure(
  table(
    columns: (auto, 1fr),
    align: (col, row) => if col == 0 { right + horizon } else { left + horizon },
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,

    
    /* --- header --- */
    table.header[*Nr.*][*Essential Standards*],
    /* -------------- */
    [1)], [EC 406/2010],
    [2)], [ISO 19881:2018],
    [3)], [ISO 11119-3:2020],
  ),

  kind: table,
  caption: [Selection of the 3 essential standards for K2H2],
)<tab_11>


#figure(
  table(
    columns: (auto, 1fr),
    align: (col, row) => if col == 0 { right + horizon } else { left + horizon },
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,

    
    /* --- header --- */
    table.header[*Nr.*][*Mandatory Tests*],
    /* -------------- */
    [1)], [hydraulic proof pressure test (8.5.1), or hydraulic elastic expansion test (8.5.2)],
    [2)], [cylinder burst test (8.5.3)],
    [3)], [ambient temperature cycle test (8.5.4)],
    [4)], [environmental cycle test (8.5.6)],
    [5)], [flaw test (8.5.8)],
    [6)], [drop/impact test (8.5.9)],
    [7)], [high-velocity impact (gunfire) test (8.5.10)],
    [8)], [torque test on cylinder neck boss (8.5.13)],
    [9)], [leak test (8.5.15)],
    [10)], [pneumatic cycle test (8.5.16)],
    [11)], [resin shear strength (8.5.18)],
    [12)], [glass transition test (8.5.14)],
  ),

  kind: table,
  caption: [Mandatory tests from ISO 11119-3:2020],
)<tab_12>




#figure(
  table(
    columns: (auto, 1fr),
    align: (col, row) => if col == 0 { right + horizon } else { left + horizon },
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,

    
    /* --- header --- */
    table.header[*Nr.*][*Optional Tests*],
    /* -------------- */
    [1)], [vacuum test (8.5.5) (mandatory if a cylinder is to be exposed to a vacuum in service)],
    [2)], [environmentally assisted stress rupture test (8.5.7) (mandatory for cylinders with load-sharing glass or aramid fiber)],
    [3)], [permeability test (8.5.12) if cylinders are manufactured with non-metallic liners or without liners],
    [4)], [fire resistance test (8.5.11)],
    [5)], [salt water immersion test (8.5.14) (mandatory for cylinders used in underwater applications)],
  ),

  kind: table,
  caption: [Optional tests from ISO 11119-3:2020, if boundary conditions allow],
)<tab_13>


Next, important points of selected standards should be addressed. EC 406/2010 and ISO 19881:2018 are established regulations for the automotive industry. EC 406/2010 is available in several languages and valid for 50 geopolitical regions (islands and countries). Nevertheless, there are some objections to direct application to aviation. Firstly, the full title in English reads COMMISSION REGULATION (EU) No 406/2010 of 26 April 2010 implementing Regulation (EC) No 79/2009 of the European Parliament and of the Council on type-approval of hydrogen-powered motor vehicles. A vehicle is a vehicle. By definition, an airplane is also a vehicle. However, if the German translation of EC 406/2010 is read, the word vehicle is translated as "Kraftfahrzeug" (motor vehicle). This limits the applications to road vehicles. In other words, from the title definition in the English version itself, it is not clear whether aviation use would be legally permissible. In the title of ISO 19881:2018, the restriction to road-bound vehicles is unambiguously underlined: Gaseous hydrogen - Land vehicle fuel containers.

Secondly, ISO 19881:2018 is limited to tanks that are permanently attached to the vehicle. Thirdly, some tests require more than one test object. For example, ISO-11119-3, paragraph 8.2.1 states: "A minimum of 30 cylinders of the new design shall be made available for prototype testing". For K2H2, due to the innovation, only a single wing is available for experimental investigations. Fourthly, some prescribed requirements in EC 406/2010 and ISO 19881:2018, which are identical, could be too high for practical application. As an example, the criteria for the burst ratio with gaseous hydrogen from Table IV.3.6. (EC 406/2010) and 7.3.2 (ISO 19881:2018) are mentioned. The burst ratio is given in Equation (3). The variables pburst, factor and pwnp are referred to as the minimum burst pressure, a factor dependent on the fiber material, and as nominal operating pressure.

pburst ≥ factor · pwnp (3)

For glass, aramid and carbon, the factors are 3.5, 3.0 and 2.25. It follows that when using glass as fiber material, the hydrogen tank must be able to withstand three times the nominal pressure. If the nominal pressure for the K2H2 tank were set at 300 bar, the tank would have to withstand at least 900 bar. The high safety factors defined in EC 406/2010 and ISO 19881:2018 are technically very demanding. The higher the safety factors, the more material is needed to meet these requirements. More material means more mass and thus more weight. This is highly undesirable in aviation. Furthermore, the high-pressure gas tank testing facility of the European (GasTeF) in @Cebolla2019 states that it can test with a maximum internal pressure of 1050 bar. Depending on the fiber material, maximum working nominal pressures pmwnp between 300 and 465 bar can be achieved. However, if the factors of ISO 11119-3:2020 are considered, maximum working nominal pressures pmwnp between 437.5 and 525 bar are to be expected. The complete list of fiber material-dependent safety factors of both standards can be found in the denominator of the fractions in @tab_14. The maximum possible operating pressures, with a maximum test pressure of 1050 bar @Cebolla2019, depending on fiber material and standard, are also given in @tab_14.

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
    table.header[*Fiber material*][*pwnp EC 406/2010 ISO 19881:2018*][*pwnp ISO 11119-3:2020*],
    /* -------------- */
    [Glass], [1050/3.5 = 300 bar], [1050/2.4 = 437.5 bar],
    [Aramid], [1050/3.0 = 350 bar], [1050/2.1 = 500 bar],
    [Carbon], [1050/2.25 = 465 bar], [1050/2.0 = 525 bar],
  ),

  kind: table,
  caption: [Fiber material dependent safety factors (in the denominator of the fractions) and associated maximum allowable operating nominal pressure pwnp, when the maximum allowable test pressure of 1050 bar @Cebolla2019 is chosen],
)<tab_14>




In summary, it can be said that three essential standards could be selected for K2H2. The three filtered standards cannot be directly applied to aviation, but provide important indications for K2H2. It was also explained that the working nominal pressure, depending on the standard considered, can be chosen up to a maximum of 525 bar. This limitation is justified by the fact that existing test facilities cannot generate arbitrarily high pressures for experimental verification.



Furthermore, going into the individual points would not be purposeful, as this would involve too much time expenditure with comparatively very little information gain. Instead, the following section will explain how it was possible to narrow down from the many possible standards to a few.

Are various different areas that want to use hydrogen as a sustainable energy source. In some of these areas, there are only ideas, while others can already show initial concepts up to functional prototypes. Still others are already selling their technology commercially and have already received official approval. The more advanced industries have specific requirements that differ from aviation. Therefore, it is currently not possible to transfer existing concepts one-to-one to K2H2.
// -------------------------------------------------------------------------- //