/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */




=== Aviation Standards <chap_1_0_2>
In the last @chap_1_0_1 it was explained why standards are important in general and why they are also especially important for #gl_("swith", long:true).
It was mentioned that currently there is no single standard available that could be used to either support the design of #gl_("swith", long:true) or guide the desgining and conducting the strucutral validation test.
Since theren are no rules for a strucutral validation available, there is also no authority that could grant any certication for flying with a #gl_("swith").
Yet, the the goal of this thesis is to provide some inital work that can be used by industry, scieticits, aerospace certifcation authorities or standard institutions to build upon this work and helping in closing this gap.
Additional motivation for the need for standards for #gl_("swith", pl:true) as well as a possible next step to it was provided in @chap_1_0_1.
More concretely it could be extrapolated that #gl_("swith", pl:true) consits of multiple subfileds. These include aircraft, hydrogen and pressure vessel and all of the, have their own standards. 
Based on this, in this subsection the focus will set on the important stanadrds that are used in aviation.
First the commonly used and available standards for aviation shall be provided. 
Afterwards it shall be elaborated in which manner the found stanadrds might be applicable with regards to #gl_("swith", pl:true).
Finally, some standards that are announced to be worked on and relaed in fiture shall be mentioend and examined wheter after their availibitly they could used for #gl_("swith") certication. 
/* -------------------------------------------------------------------------- */

//TODO
/* --------------------------- continue from here --------------------------- */

Starting with this subsection it shall be reiterated, as the time of writing this thesis, there is no single standard available that would be pretained to the certifcaiton of #gl_("swith", pl:true).
Certification means more than burocarcy work. It means that local or global aviation authorties allow the usage of a #gl_("swith"). 
Only with it a commerical application of a #gl_("swith") is possible. Coming to sub-area in which the #gl_("swith") can be classified, that is, aviation.

In aviation, aircraft are classified according to various factors, including their region of certification, maximum takeoff mass, and type of aircraft.
The region of certification refers to the geographical location in which the aircraft is to be approved and operated. 
There are different approval authorities and regulations depending on which country or region the aircraft is to be approved in. In Europe, for example, the #gl_("easa", long:true) @EASA_Homepage @Mensen2013 is responsible for the approval of aircraft, while in the USA, the Federal Aviation Administration (FAA) @FAA_Homepage @Mensen2013 is responsible for this task. 
The Maximum Takeoff Weight (MTOW) refers to the maximum weight an aircraft can safely carry
for takeoff and flight, with distinct MTOW classes defined within the standards based
on the aircraft's size and performance.
The general type of flying object refers to the category of the aircraft, such as commercial aircraft, helicopter, small aircraft, and military aircraft @Purton2014 @olivotto2012certification .

This thesis is written in Germany, thus, the focus is mainly on European standards. 
While there are differences between However, it is common knowledge that for example that the US standards do not differ in many areas from European standards @Mensen2013. 
This similarity stretches to the extent that even the numbering of the documents and their respective paragraphs align. Detailed analysis in their simmilarties and differences can be found among others in @Kun2011 @Ramadhanti2024.

The European Union has established uniform standards for the aviation industry that are binding for all member states. This ensures a uniform basis for the operation of aircraft and safety in air traffic.  European aviation standards are referred to as #gl_("cs", long:true) @Mensen2013 @EASA_CS_Genereral. 
The standards among these which might be classified as relevant to #gl_("swith", pl:true) are #gl_("cs")-23 @EASA_CS_23, #gl_("cs")-25 @EASA_CS_25, #gl_("cs")-27 @EASA_CS_27, and #gl_("cs")-29 @EASA_CS_23. 
The #gl_("cs")-23, for instance, can be applied for the certification of a small aircraft that falls within specific criteria regarding its category, maximum take-off mass and passenger capacity.
However, exceeding these criteria may require the application of #gl_("cs")-25, 
#gl_("cs")-23 differs from #gl_("cs")-25 essentially in that #gl_("cs")-23 places less demanding requirements on aircraft performance and equipment than #gl_("cs")-25. 
Another difference is that #gl_("cs")-25 requires a more detailed examination of the aircraft structure, fuel supply, electrical systems, flight control, and other systems. This is because larger aircraft generally have more complex systems and are therefore exposed to higher risks.
Nevertheless, the intent of this thesis is not to delve into a comprehensive explanation of the #gl_("cs") standards, as such an exhaustive explanation would exceed the scope of this document. 
Instead, @tab_15, which enumerates #gl_("swith")-relevant and several additional #gl_("cs") standards alongside their respective application fields, should suffice as a suitable reference.  

#figure(
  table(
    columns: (auto, 1fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,
    
    /* --- header --- */
    table.header[*#gl_("cs")*][*Field of application*],
    /* -------------- */
    [#gl_("cs")-22 @EASA_CS_22], [Sailplanes and Powered Sailplanes],
    [#gl_("cs")-23 @EASA_CS_23], [Normal, Utility, Aerobatic and Commuter Aeroplanes],
    [#gl_("cs")-25 @EASA_CS_25], [Large Aeroplanes],
    [#gl_("cs")-26 @EASA_CS_26], [Additional airworthiness specifications for operations],
    [#gl_("cs")-27 @EASA_CS_27], [Small Rotorcraft],
    [#gl_("cs")-29 @EASA_CS_29], [Large Rotorcraft],
    [#gl_("cs")-31GB  @EASA_CS_31GB], [Gas Balloons],
    [#gl_("cs")-31HB  @EASA_CS_31HB], [Hot Air Balloons],
    [#gl_("cs")-31TGB @EASA_CS_31TGB], [Tethered Gas Balloons],

    [#gl_("cs")-LSA  @EASA_CS_LSA], [Light Sport Aeroplanes],
    [#gl_("cs")-P @EASA_CS_P], [Propellers],
    [#gl_("cs")-VLA @EASA_CS_VLA], [Very Light Aeroplanes, see also #gl_("cs")-23],
    [#gl_("cs")-VLR @EASA_CS_VLR], [Very Light Rotorcraft],
  ),

  kind: table,
  caption: [Some EU civil aviation #gl_("cs", long:true) standards and their main application field.],
)<tab_15>

Next, closer attention shall be paid to the two most suited #gl_("cs",pl:true), that is, the #gl_("cs")-23 and #gl_("cs")-25. The #gl_("cs")-23 can be used for small aircraft certification. Since #gl_("swith",pl:true) are neither restricted to small sized nor to big sized aircrafts, the #gl_("cs")-23 is a suiteable candiate to infer potential infromation for a desired #gl_("swith")-certication.
 Compared to #gl_("cs")-25, which is intended for regular commercial and civil large aircraft, the #gl_("cs")-23  comes with significantly fewer restrictions. Fewer restrictions also mean fewer topics that are addressed and elaborated on. 
 High standard detailing could offer valuable advantages, especially in terms of safety aspects. Furthermore, concrete ideas for conducting a structural test could also be given, for example, to answer the following questions:

- Which measurement technology is allowed, which is preferred and why?
- What possibilities exist to phsically introducing loads?
- Which points can be neglected in detail if important and core aspects are reliably proven?

In #gl_("cs")-23, the author of this work was unable to extrapolate information that would be valid for a high-pressure hydrogen container. 
It is quite possible that this will be adjusted in the coming years, as #gl_("cs")-23  could be adapted for hydrogen-powered aircraft. Therefore, the statement made above should be considered only in the context of #gl_("cs")-23  Version 2018. Search terms such as high-pressure containers, hydrogen in all its states of aggregation, and other gases, such as helium, were also consulted to build on possible knowledge from #gl_("cs")-23 . The core result is that no helpful knowledge could be gained from #gl_("cs")-23  for #gl_("swith", pl:true).

In #gl_("cs")-25  Amendment 27, under point CS 25.1453, there is information on the topic: Protection of oxygen equipment from rupture. It requires that the chosen working pressure of the oxygen bottles can also be withstood by the bottle. In addition, the maximum operating pressure must be able to withstand the maximum normal operating pressure, the transient pressures and pressure surges, the tolerances of the pressure limiting devices, and possible pressure fluctuations in normal operating conditions. Transient pressures or pressure surges would not need to be considered unless they would exceed the maximum normal operating pressure multiplied by 1-10. Furthermore, the temperature influence and a proof of strength are addressed. Specifically, the following 3 requirements are made for the proof of strength:

+ Compliance with the test and burst factors from @tab_1. The test and burst factors from #gl_("cs")-25 are obtained through CS25.1453 and are to be used when working with the maximum operating pressure.
+ Duration of compliance with the test pressure is at least 2 minutes. There should be no leaks or permanent deformations.
+ The burst pressure must be maintained for at least 1 minute and must not cause bursting within said time. Deformations, on the other hand, are permissible.

#figure(
  table(
    columns: (1fr, 0.5fr, 0.5fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,
    
    /* --- header --- */
    table.header[*System Element*][*Test Factor*][*Burst Factor*],
    /* -------------- */

    [Pressure Vessels], [1.5], [2.0],
    [Flexible Hoses], [2.0], [4.0],
    [Pipes and Fittings], [1.5], [3.0],
    [Other Components], [1.5], [2.0],
  ),

  kind: table,
  caption: [Proof and burst factors for pressurized components. Table copied from CS 25.1453 - Protection of oxygen equipment from rupture @EASA_CS_25.],
)<tab_1>

One might think that perheabs it would be possible, under certain circumstances, to convince the approval authorities of a test factor of 1.5 and a burst factor of 2.0 through argumentative skills. 
EASA might possibly accept voluminous high-pressure tanks as other components from @tab_1. However, first the hydrogen tank is a pressure vessel whose internal pressure is a factor higher than that of the oxygen bottles. 
Secondly, the tank is many times larger in its dimensions than an oxygen bottle. This simple argumentation is valid and could be used by the approval authorities to reject these proposed factors of 1.5 and 2.0. Based on this, aerospace-related areas should be examined more closely.

One option that presents itself is space technology. In this field, the ANSI/AIAA S-081B-2018 Space Systems—Composite Overwrapped Pressure Vessels @ansi_standard_2018 could be found. 
ANSI stands for American National Standards Institute. Consequently, these standards are primarily intended for the USA. It often happens that other states or the EU orient themselves on existing standards to adopt their own standards @Mensen2013. 
Complete acceptance of foreign guidelines would be a conceivable possibility, but there is no guarantee of later acceptance. 
Standards are generally distinguished by adoption geographical locality. Internationally recognized standards are recognized globally. This is followed by continents and individual states. The legislator in a state can, in addition to the international and continental standards, demand additional points for approval in its own state. Without fulfilling all requirements, the progress of an innovative project could be strongly influenced by the legislator.

Secondly, the desire for hydrogen-powered aircraft has existed for some time, and the first announcements for designing corresponding standards were made by SAE International on 20.11.2019. @tab_2 lists the two most promising standards for general aviation. 
It should be explicitly highlighted that these standards have only been announced and are not commercially available at the current time. 
This report is being written in October 2024. With the legitimate assumption that an institution like SAE International is informed about the standard published in 2018, the following assumption should be discussed. SAE had about 5 years to draft the standard for general aviation for liquid hydrogen. The fact that these 5 years are not sufficient allows the conclusion that the ANSI/AIAA S-081B-2018 Space Systems cannot be applied to general aviation without further ado.


#figure(
  table(
    columns: (0.5fr, 1fr, 0.5fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,
    
    /* --- header --- */
    table.header[*Hydrogen's Aggregate State*][*Standard*][*In Work Since*],
    /* -------------- */

    [Liquid], [SAE AS 6679 Liquid Hydrogen Storage for Aviation @SAE_Liquid], [20.11.2019],
    [Gaseous], [SAE AS 7373 Gaseous Hydrogen Storage for General Aviation @SAE_Gas], [06.07.2021],
  ),

  kind: table,
  caption: [Promising announced and not yet available standards for general aviation with hydrogen as energy carrier. The information was taken from the official website of SAE International.],
)<tab_2>

Thirdly, even if SAE AS 7373 @SAE_Gas were available, it would not be guaranteed that it would have taken an external load on the hydrogen tanks into account. In other words, it is unclear whether the standards, once completed, will also be applicable to structural integral high-pressure hydrogen tanks.
It can be noted that standards from aerospace can indeed be found that could be of interest for the final goal of getting #gl_("swith", pl:true) certified or as an inital reference. However, with simple arguments, it can be clearly shown why the described standards offer too little security for official recognition. On the one hand, it is partly unclear whether the standards are also applicable in the European area. On the other hand, at this point, it is not clear whether the standards are also valid for structural integral and externally loaded high-pressure hydrogen tanks. 
With the special requirements of #gl_("swith", pl:true) which according to the current state cannot be comprehensively covered by a single standard, #gl_("swith", pl:true) represent a very special niche research.



/* -------------------------------------------------------------------------- */

Pressure tank standards were mentioned as the second major sub-area. These guidelines cover tanks that contain high-pressure compressed gas. Depending on the pressure range, the chosen gas, the type of storage, the material of the container, and the area of application, specific standards can be found. A more detailed explanation of this will be given in the following section.


In summary, it can be said that within this work, it is not possible to rely exclusively on a single standard. Therefore, existing standards that show visible relevance for #gl_("swith", pl:true) must be found. This is to provide a basis for follow-up work.