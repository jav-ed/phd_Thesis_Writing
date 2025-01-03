/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Word rep ins. done

/* ------------------------------ Introduction ------------------------------ */
= Introduction <chap_0>
The introduction begins with an initial background of the niche field of #gls("swith", long:true) in @chap_0_1. This offers readers with a foundational overview of the research field, while a detailed examination of the subject is 
given in @chap_0_7.
Following an introduction to #glspl("swith"), @chap_0_2 examines the motivation underlying this work. @chap_0_3 delineates the overall objectives of the research. @chap_0_4 outlines the structural organization of this thesis, offering readers a systematic overview of the covered topics.
@chap_0_5 addresses the novel contributions and importance of this work. The introduction also includes @chap_0_6, which 
enables transparency regarding the research funding sources and acknowledges all financial support.


/* ---------------------------- Inital Background --------------------------- */
== Initial Background <chap_0_1>

This section introduces the concept of #gls("swith", long:true), providing a foundational definition for the subsequent elaborations. While comprehensive technical details about #glspl("swith") are presented in @chap_0_7, this initial overview establishes the essential principles necessary for understanding the research context. By introducing core concepts before delving into technical complexities, this approach facilitates comprehension for readers across different levels of expertise in the field.

The aviation industry is actively pursuing improvements in various aspects, with a significant focus on reducing environmental impact 
@Rupcic2023 @Afonso2023 @Ansell2023 @Abrantes2024 @Ficca2023.
Among the numerous options being researched, this work explores the application of hydrogen as a potential solution. In this context, hydrogen would replace conventional fuel (kerosene) as the power source for aircraft
@Rupcic2023 @Afonso2023 @Ansell2023 @Ficca2023 
@Manigandan2023 @Mueller2023 @Degirmenci2023 @Eissele2023.
When working with hydrogen, engineers currently have two economically viable options @Klell2018[p.~109] @Klell2023[p.~107] @Bosu2024: gaseous 
//
@Manigandan2023 @Yusaf2024 @Meissner2023 
//
and liquid hydrogen 
//
@Manigandan2023 @Degirmenci2023 @Eissele2023 @Yusaf2024  @Adler2024 @Tiwari2024. 
This work focuses on gaseous hydrogen. To achieve operational flight ranges, the hydrogen must be stored at elevated pressures. Following the principle of gas compressibility, increased pressure allows for greater hydrogen mass storage within a given volume. These storage conditions necessitate the development of structurally robust containment systems.

One conventional approach involves designating a dedicated space for hydrogen tanks within the aircraft structure @Eissele2023 @Adler2024. An alternative method maintains the existing aircraft configuration while incorporating additional external storage space. This external storage solution is illustrated in @fig_0.

#figure(
  image("../../../1_Data/2_Figs/0_Content/0_Chap/1_Long_Short.jpeg", 
  width: 77%),
  caption: [Example of non-integrated hydrogen tank placement on an existing aircraft configuration @Adler2024.],
) <fig_0>


The specific location for placing these tanks is complex and depends on numerous factors
@Eissele2023 @Adler2024 @Onorato2022
@Prewitz2023 @Huete2021 @Huete2022 @Cipolla2022. 
Yet, an alternative approach involves integrating high-pressure hydrogen tanks structurally inside the fuselage
@Onorato2022 @Huete2021 @Baroutaji2019 @Verstraete2013 @onorato2021fuel.
This research focuses on the structural integration of high-pressure hydrogen tanks into the wing structure. This integration establishes a structural connection through which loads are distributed between the tanks and the wing. More specifically, when the wing experiences lift distribution, part of the load transfers to the hydrogen tanks.
Conversely, deformations induced by the internal pressure of the tanks generate stresses in the wing skin. These structural connections establish specific load paths in the interface regions between wing and tanks. 

An illustrative example of the wing of a #gls("swith") is provided in @fig_1. While the wing skin typically envelops the pressure tanks completely in #glspl("swith"), the view in @fig_1 is intentionally unobstructed to clearly show the location of the four hydrogen tubes.

#figure(
  image("../../../1_Data/2_Figs/0_Content/0_Chap/0_Wing_Tube.png", 
  width: 100%),
  caption: [Conceptual illustration of a #gls("swith") configuration, highlighting the integration of four hydrogen pressure tubes.],
) <fig_1>

When working with #glspl("swith"), it is crucial to understand the implications arising from the key differences between regular aircraft and non-wing structure-integrated hydrogen tank aircraft. As mentioned earlier, the integration of high-pressure hydrogen tanks into the wing structure introduces unique challenges. The initial assessment involves the modification of space arrangement and mass distribution required for secure tank placement.

Beyond these spatial and mass-related aspects, a fundamental distinguishing feature of #glspl("swith") is the addition of high pressure loads to the wing structure. This characteristic sets them apart from both conventional aircraft and those with non-integrated hydrogen tanks. 
The wings of #glspl("swith") must withstand not only the usual aerodynamic loads but also the newly added pressure loads from the integrated tanks. Depending on the internal pressure values, these pressure loads may have a greater structural impact on the wing than the aerodynamic loads themselves. 
Such combined loading conditions necessitate a comprehensive 
methodology to the design, analysis, and testing of #glspl("swith"). 
The interplay between aerodynamic and pressure loads presents both challenges and opportunities for innovation in aircraft structural design. 
These factors require thorough implementation in numerical simulations, certification standards, and experimental structural validation tests.