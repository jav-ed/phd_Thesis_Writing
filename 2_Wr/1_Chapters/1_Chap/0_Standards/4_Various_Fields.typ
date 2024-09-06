/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


=== II.6 Specific Standards from Various Fields

In the section "Preliminary Development of a Structural Integral Tank from Automotive Engineering," it was already explained that the automotive industry is ahead of aviation in some areas and pursues similar goals as aviation in some areas. Due to similar thought processes, the search was extended to other branches. Therefore, in the following, some important standards from other areas that use high-pressure tanks as a power source will be specified. In addition to these, standards for tanks in mobile applications, independent of a specific branch, will also be mentioned. Furthermore, ISO standards dealing with hydrogen applications will be named.

The automotive industry generally includes cars (motor vehicles), buses, and heavy goods transporters (trucks). Examples of other industrial sectors for which the use of hydrogen as a future energy source is conceivable are listed in @tab_3. It is important to note that some of these industries are actively conducting research to realize hydrogen propulsion. The motivation is the same as in aviation. The mobility and transport economic sectors are of central importance for the economy and private households. The average consumer is actively involved in burdening the environment through daily use of cars, ordering goods, etc. As these industries are heavily used, correspondingly high environmental damage occurs.


#figure(
  tablex(
    columns: 2,
    header-rows: 1,

    /* --- header --- */
    [*Number*], [*Potential Industry*],
    /* -------------- */

    [1.], [Small to large ships],
    [2.], [Boats],
    [3.], [Motorcycles],
    [4.], [Trains (Alstom)],
    [5.], [Quadrocopters or similar small aircraft variations],
    [6.], [Innovative flying taxis for individuals and families],
  ),

  kind: table,
  caption: [Hydrogen as an energy source for propulsion of potential industries besides aviation],
)<tab_3>


A significant difference between aviation, automobile, and motorcycle construction lies in the placement of the pressure vessels. While motor vehicles operate on the ground and are thus not exposed to any large pressure difference, aircraft and other aircraft must be designed for different flight altitudes. This results in high pressure differences, which leads to higher loads in the structural design. Rail vehicles, on the one hand, do not have the mentioned problem of pressure difference. On the other hand, it can be claimed that trains generally have more freely available space than aircraft. Aviation is an area strongly dominated by lightweight construction. The structure should be as light as possible while fulfilling all structural requirements with safety factors. In addition, the space should be ideally utilized so that the economic yield can be optimized by taking as many passengers and/or cargo as possible. Quadrocopters and innovative flying taxis are still too far from implementation to be comparable with functional and long-tested technologies.

For the mobile use of hydrogen-powered means of transport, a significant distinction can be made: is it a light or heavy mobility solution. @tab_4 provides an overview of some of the found standards and projects that deal with compressed hydrogen as fuel for the light mobile sector. Comparables for heavy means of transportation, pressure cylinders in general without a clearly defined case for mobile application, and near-ground static pressure storage standards are given in 
//
// TODO
// render it properly --> not Table 1 Tabkle 2 Table 3 but Table 1 -3
@tab_5 @tab_6 @tab_7
. Before further statements are made about the already mentioned standards, the ISO (International Organization for Standardization) standards, which deal exclusively with hydrogen, should be listed in Table 15.



/* -------------------------------------------------------------------------- */
/* ----------------------------------- car ---------------------------------- */

#figure(
  tablex(
    columns: 3,
    header-rows: 1,

    /* --- header --- */
    [*Light-Duty vehicles*], [], [],
    /* -------------- */

    [#image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/3_Car.jpg", width: 100%)],
    [
      - EC79/2009
      - EC406/2010
      - UNECE R134
      - GTR\#13
      - CSA/ANSI HGV 2-2014 (R2019)
      - SAE J2579
      - KHK S0128
    ],
    [
      - JARI S002 and S003 is under development
      - EIHP
      - Betten 9
      - ISO 15869:2009, status: withdrawn
      - ISO 19881:2018, will be updated
    ],
  ),

  kind: table,
  caption: [Selection of norms for light-duty vehicles],
)<tab_4>

/* ------------------------------- heavy-duty ------------------------------- */
#figure(
  tablex(
    columns: 2,
    header-rows: 1,

    /* --- header --- */
    [*Heavy-Duty vehicles*], [],
    /* -------------- */

    [#image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/4_Truck.jpg", width: 60%)],
    [
      - EC79/EU406
      - CSA/ANSI HGV 2-2014 (R2019)
    ],
  ),

  kind: table,
  caption: [Selection of norms for heavy-duty vehicles],
)<tab_5>

/* --------------------------- transportable tubes -------------------------- */
#figure(
  tablex(
    columns: 3,
    header-rows: 1,

    /* --- header --- */
    [*Transportable tubes*], [], [],
    /* -------------- */

    [#image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/5_Transport.jpg", width: 100%)],
    [
      - EN 12245
      - ADR
      - U.S. DOT
    ],
    [
      - Apragaz TPED
      - ISO 11119-3:2020
      - ISO 17519:2019
    ],
  ),

  kind: table,
  caption: [Selection of norms for transportable tubes],
)<tab_6>


/* ----------------------------- ground storage ----------------------------- */
#figure(
  tablex(
    columns: 2,
    header-rows: 1,

    /* --- header --- */
    [*Ground and stationary storage*], [],
    /* -------------- */

    [#image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/6_Ground.jpg", width: 100%)],
    [
      - PED
      - ASME
      - EN 12245
      - ISO 19884
    ],
  ),

  kind: table,
  caption: [Selection of norms for ground and stationary storage],
)<tab_7>

#figure(
  tablex(
    columns: (30%, 70%),
    header-rows: 1,
    align: left,
    inset: 6pt,
    // fill: (_, row) => if row == 0 { rgb("#90EE90") } else if odd(row) { luma(240) } else { white },

    /* --- header --- */
    [*ISO/TC 197 Hydrogen technologies*], [*Description*],
    /* -------------- */

    [ISO/AWI 14687], [Hydrogen fuel quality — Product specification, status: available and new version under development],
    [ISO/AWI TR 15916], [Basic considerations for the safety of hydrogen systems, status: available and new version under development],
    [ISO/AWI 17268], [Gaseous hydrogen land vehicle refueling connection devices, status: available and new version under development],
    [ISO/AWI 19880-5], [Gaseous hydrogen — Fuelling stations — Part 5: Dispenser hoses and hose assemblies, status: available and new version under development],
    [ISO/CD 19880-6], [Gaseous hydrogen — Fueling stations — Part 6: Fittings, status: under development],
    [ISO/WD 19880-7], [Gaseous hydrogen — Fuelling stations — Part 7: O-rings, status: under development],
    [ISO/AWI 19880-8], [Gaseous hydrogen — Fuelling stations — Part 8: Fuel quality control],
    [ISO/AWI 19880-9], [Gaseous hydrogen — Fuelling stations — Part 9: Sampling for fuel quality analysis],
    [ISO/AWI 19881], [Gaseous hydrogen — Land vehicle fuel containers, status: available and new version under development],
    [ISO/AWI 19882], [Gaseous hydrogen — Thermally activated pressure relief devices for compressed hydrogen vehicle fuel containers, status: available and new version under development],
    [ISO/WD 19884], [Gaseous hydrogen — Cylinders and tubes for stationary storage],
    [ISO/CD 19885-1], [Gaseous hydrogen — Fuelling protocols for hydrogen-fuelled vehicles — Part 1: Design and development process for fuelling protocols, status: under development],
    [ISO/AWI 19885-2], [Gaseous hydrogen — Fuelling protocols for hydrogen-fuelled vehicles — Part 2: Definition of communications between the vehicle and dispenser control systems],
    [ISO/AWI 19885-3], [Gaseous hydrogen — Fuelling protocols for hydrogen-fuelled vehicles — Part 3: High flow hydrogen fuelling protocols for heavy duty road vehicles],
    [ISO/AWI 19887], [Gaseous Hydrogen — Fuel system components for hydrogen fuelled vehicles, status: under development],
    [ISO/AWI 22734-1], [Hydrogen generators using water electrolysis — Industrial, commercial, and residential applications — Part 1: General requirements, test protocols and safety requirements],
    [ISO/AWI TR 22734-2], [Hydrogen generators using water electrolysis — Part 2: Testing guidance for performing electricity grid service],
  ),
  kind: table,
  caption: [Standards following the ISO/TC 197 - Hydrogen technologies],
)<tab_8>

[Tables 11-15 with various standards are included here]

The ISO has a very good reputation internationally. This increases the chances of partial to potentially full international recognition. The standards for compressed hydrogen will only be listed. Discussing the individual points would not be purposeful, as this would involve too much time expenditure with comparatively very little information gain. Instead, the following section will explain how it was possible to narrow down from the many possible standards to a few.

It can be summarized that there are various different areas that want to use hydrogen as a sustainable energy source. In some of these areas, there are only ideas, while others can already show initial concepts up to functional prototypes. Still others are already selling their technology commercially and have already received official approval. The more advanced industries have specific requirements that differ from aviation. Therefore, it is currently not possible to transfer existing concepts one-to-one to K2H2.