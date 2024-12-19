/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


// TODO
// Needs to be reviewed in depth
// if working with LLM, you might to provide it the pdf of the content, such that is knows what we are talking about - inshallah
/* ------------------------------ Introduction ------------------------------ */
= Introduction <chap_0>
In the starting chapter of this work, first some inital background regarding the niche field shall be given 
in @chap_0_1. 
This aims to give the reader a broad overview of the field of research.
The deeper look into this subject can inshallah be found in 
@chap_0_7 and 
//
//TODO add ref to the whole chapter 2
// @chap_0_7 
Once a rough understanding of #gls("swith", long:true), pronounced sweet, is obtained, the motivation behind this work shall be explained in @chap_0_2.
The next @chap_0_3 shall outline the overall goals of this work. The reader can refer to it for gaining a quick overview about the topics that are covered.
In @chap_0_4 the systematic strucutre of writing this thesis is given.
The following @chap_0_5 highlights the novelty and significance of this work.
Finally in @chap_0_6 the financial funding is made transparent such that the reader can decide for himself whether any manipulation from outside occured.


/* ---------------------------- Inital Background --------------------------- */
== Initial Background <chap_0_1>

In this section, a concise definition of the term #gls("swith", long:true) shall be provided. Detailed information about #glspl("swith") can be found in @chap_0_7
The rationale for beginning with a brief definition of #gls("swith") is to approach the topic systematically. Presenting an overall concept first is generally easier to comprehend, especially for non-specialists. Once the basics are properly understood, in-depth knowledge becomes more accessible.

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
This work focuses on gaseous hydrogen. To achieve a feasible flight range, the hydrogen must be stored under very high pressure. A simplified explanation is that gas can be compressed, and high pressure allows for storing comparatively more hydrogen within a given constant volume. Due to the high pressure, pressure-resistant hydrogen storage systems are required.

The obvious approach would be to allocate a secure space for storing hydrogen tanks within the aircraft
@Eissele2023 @Adler2024.
Another approach would be to keep the given configuration and add some additional space.
An illustrative example of the latter is given in @fig_0.

#figure(
  image("../../../1_Data/2_Figs/0_Content/0_Chap/1_Long_Short.jpeg", 
  width: 77%),
  caption: [Illustrative example of how an existing aircraft configuration can be kept and non-integrated hydrogen tanks could be added @Adler2024.],
) <fig_0>


The specific location for placing these tanks is complex and depends on numerous factors
@Eissele2023 @Adler2024 @Onorato2022
@Prewitz2023 @Huete2021 @Huete2022 @Cipolla2022
. However, an alternative approach involves integrating high-pressure hydrogen tanks structurally inside the fuselage
@Onorato2022 @Huete2021 @Baroutaji2019 @Verstraete2013 @onorato2021fuel
.
This work, on the other hand, deals with the structural integration of the high-pressure hydrogen tanks to the wing.
As a consequence of this structural connection, loads are shared between the tanks and the wing.
More specifically, when the wing experiences lift distribution, part of the load is transferred to the hydrogen tanks. Conversely, acceptable deformations caused by the high pressure within the tanks will exert stress on the wing skin. The structural connections between the wing and tanks create load paths in the connection areas.
An illustrative example of the wing of a #gls("swith") is provided in @fig_1. While the wing skin typically envelops the pressure tanks completely in #glspl("swith"), the view in @fig_1 is intentionally unobstructed to clearly show the location of the four hydrogen tubes.

#figure(
  image("../../../1_Data/2_Figs/0_Content/0_Chap/0_Wing_Tube.png", 
  width: 100%),
  caption: [Illustrative example of the wing of a #gls("swith").],
) <fig_1>

When working with #glspl("swith"), it is crucial to understand the implications arising from the key difference between regular aircraft or non-wing structure-integrated hydrogen tank aircraft. As mentioned earlier, the integration of high-pressure hydrogen tanks into the wing structure introduces unique challenges. To emphasize this critical point:
Placing hydrogen tanks securely in the aircraft requires modifying space arrangement and alters mass distribution. 
However, the distinguishing feature of #glspl("swith") is the addition of high pressure loads to the wing structure. 
This characteristic sets them apart from both conventional aircraft and those with non-integrated hydrogen tanks. 
The wings of #glspl("swith") must withstand not only the usual aerodynamic loads but also the newly added pressure loads from the integrated tanks. In some cases, these pressure loads might have a greater structural impact on the wing than the aerodynamic loads themselves.
This fundamental difference underscores the importance of a comprehensive approach to the design, analysis, and testing of #glspl("swith"). The interplay between aerodynamic and pressure loads presents both challenges and opportunities for innovation in aircraft structural design.
This insight, among others, must be incorporated into numerical simulations, certification standards, and experimental structural validation tests for #glspl("swith").