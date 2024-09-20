/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */




=== Aviation Standards <chap_1_0_2>
In the last @chap_1_0_1 it was explained why standards are important in general and why they are also especially important for #gl_("swith", long:true).
It was mentioned that currently there is no single standard available that could be used to either support the design of #gl_("swith", long:true) or guide the desgining and conducting the strucutral validation test.
Since theren are no rules for a strucutral validation available, there is also no authority that could grant any certication for flying with a #gl_("swith").
Yet, the the goal of this thesis is to provide some inital work that can be used by industry, scieticits, aerospace certifcation authorities or standard institutions to build upon this work and helping in closing this gap.
Additional motivation for the need for standards for #gl_("swith", pl:true) as well as a possible next step to it was provided in @chap_1_0_1.
Based on it, in this subsection important stanadrds that are used in aerosapce shall be mentioned.
First the overall available standards shall be provided. 
Afterwards it shall be elaborated in which manner the found stanadrds might be applicable.
Finally, announced upcoming work shall be meneitoned and examined wheter in future after their availibitly they could used for #gl_("swith") certication. 
/* -------------------------------------------------------------------------- */

//TODO
/* --------------------------- continue from here --------------------------- */

Given that there are standards for both structural testing in aircraft construction and for pure pressure vessels, comparable standards should also be found for the K2H2 project. 

Standards can be translated as guidelines. For instance, in the field of construction, there would be design guidelines defined by standards. Similarly, for structural testing, there would be safety, procedural, setup, and other guidelines. On one hand, guidelines can be seen as unwanted restrictions. However, they allow systems to function safely and reliably. It can be argued that the use of standards in a field with many unknowns provides a certain level of security and reduces the likelihood of errors. Since both the construction and experimental structural investigation of #gl_("swith", pl:true) are innovations, there are particularly many unknowns in the K2H2 project. This also comes with many potential risks.

It is precisely for this reason that it is necessary, as far as possible, to rely on foundations that allow for safe, clearly traceable, and systematic procedures. Standards offer a kind of guideline that engineers and experts can follow. By adhering to standards, it can largely be ensured that all important aspects are considered. It's also worth noting that standards are usually written and revised by expert groups with a deep understanding of the relevant field. This ensures that factors are considered that an individual might not have thought of.

In addition to ensuring the safety and reliability of products and systems, standards also contribute to compliance with legal regulations. They enable products and systems to meet applicable safety standards and minimize negative consequences for the environment and society. By adhering to standards, new or slightly modified systems can be more easily approved for science and industry.

The introduction should have motivated the search for existing standards for #gl_("swith", pl:true). In summary, it can be said that by using appropriate standards, safety and planned feasibility can be optimized. In addition, the industrial project leader (IMA) can thus offer the developed test concept to third parties as a service more quickly and with comparatively lower cost and time expenditure. However, no #gl_("swith") is known in research or publicly accessible industry. Due to the fact that no #gl_("swith") has been publicly approved to date, at the time of writing this report, there is no standard that fully covers the design and physical structural testing of #gl_("swith", pl:true).

The alternative to a missing comprehensive standard is to break #gl_("swith", pl:true) into sub-areas. The two major sub-areas would be aviation and pressure tank standards. In aviation, distinctions are made according to the approval space, maximum takeoff mass, and the general type of flying object. The approval space refers to the region in which the aircraft is to be approved and operated. There are different approval authorities and regulations depending on which country or region the aircraft is to be approved in. In Europe, for example, the European Union Aviation Safety Agency (EASA) @EASA_Homepage is responsible for the approval of aircraft, while in the USA, the Federal Aviation Administration (FAA) @FAA_Homepage performs this task. The maximum takeoff weight (MTOW) refers to the maximum weight an aircraft may have to safely take off and fly. Depending on the size and performance of the aircraft, there are different MTOW classes defined in the standards. The general type of flying object refers to the category of the aircraft, such as commercial aircraft, helicopter, small aircraft, and military aircraft.

The present project is being developed for the German market. Therefore, the focus is mainly on European standards. The European Union has established uniform standards for the aviation industry that are binding for all member states. This ensures a uniform basis for the operation of aircraft and safety in air traffic. However, it is known that, for example, American standards do not differ in many areas from European standards. The paragraph numbers are often identical, but details may vary. European aviation standards are referred to as CS (Certification Specifications) @EASA_CS_Genereral. 
The most important CS are CS-23 @EASA_CS_23, CS-25 @EASA_CS_25, CS-27 @EASA_CS_27, and CS-29 @EASA_CS_29. If an aircraft meets the following conditions:

// TODO check if a concrete Amendment must be mentioned here - also general check the value for phd
Category: Normal, Utility, Aerobatic
Maximum takeoff weight: 5670 kg
Maximum number of passengers: 9

CS-23 can be used for certification. With a maximum of 2 propeller drives, CS-23 can be used under the following conditions:

Maximum takeoff weight: 8618 kg
Maximum number of passengers: 19

If one of these criteria is exceeded, either an explicit authorization for use must be obtained from EASA to continue using CS-23 @EASA_CS_23, or a switch to CS-25 @EASA_CS_25 must be made. CS-23 differs from CS-25 essentially in that CS-23 places less demanding requirements on aircraft performance and equipment than CS-25. Another difference is that CS-25 requires a more detailed examination of the aircraft structure, fuel supply, electrical systems, flight control, and other systems. This is because larger aircraft generally have more complex systems and are therefore exposed to higher risks.
Pressure tank standards were mentioned as the second major sub-area. These guidelines cover tanks that contain high-pressure compressed gas. Depending on the pressure range, the chosen gas, the type of storage, the material of the container, and the area of application, specific standards can be found. A more detailed explanation of this will be given in the following section.


In summary, it can be said that within this work, it is not possible to rely exclusively on a single standard. Therefore, existing standards that show visible relevance for #gl_("swith", pl:true) must be found. This is to provide a basis for follow-up work.



=== II.4 Potentially Applicable Aerospace Standards

This section provides an overview of possible standards that could be used to cover the lack of a comprehensive standard. In particular, it will refer to standards from general aerospace. Furthermore, it will discuss to what extent the found standards can be considered for K2H2.

At this point, it should be explicitly mentioned again that at the time of writing this report, no single document exists that guarantees Germany-wide recognized standards for the approval of #gl_("swith", pl:true). Nevertheless, in order to build on existing knowledge through standards, similar or sub-areas of #gl_("swith", pl:true) should be considered. For small aircraft certification, there is the CS-23 recognized in Europe. Compared to CS-25, which is intended for regular commercial aircraft, it comes with significantly fewer restrictions. Fewer restrictions also means fewer topics that are addressed and discussed. High standard detailing could offer valuable advantages, especially in terms of safety aspects. Furthermore, concrete ideas for conducting a structural test could also be given, for example, to answer the following questions:

- Which measurement technology is allowed, which is preferred and why?
- What possibilities exist for introducing loads?
- Which points can be neglected in detail if main aspects are reliably proven?

In CS-23, the author of this report was unable to extrapolate information that would be valid for a high-pressure hydrogen container. It is quite possible that this will be adjusted in the coming years, as CS-23 could be adapted for hydrogen-powered aircraft. Therefore, the statement made above should be considered only in the context of CS-23 Version 2018. Search terms such as high-pressure containers, hydrogen in all its states of aggregation, and other gases, such as helium, were also consulted to build on possible knowledge from CS-23. The core result is that no helpful knowledge could be gained from CS-23 for #gl_("swith", pl:true).

In CS-25 Amendment 27, under point CS 25.1453, there is information on the topic: Protection of oxygen equipment from rupture. It requires that the chosen working pressure of the oxygen bottles can also be withstood by the bottle. In addition, the maximum operating pressure must be able to withstand the maximum normal operating pressure, the transient pressures and pressure surges, the tolerances of the pressure limiting devices, and possible pressure fluctuations in normal operating conditions. Transient pressures or pressure surges would not need to be considered unless they would exceed the maximum normal operating pressure multiplied by 1-10. Furthermore, the temperature influence and a proof of strength are addressed. Specifically, the following 3 requirements are made for the proof of strength:

1) Compliance with the test and burst factors from @tab_1: Test and burst factors from CS-25, CS25.1453 @tab_1, when working with maximum operating pressure.
2) Duration of compliance with the test pressure is at least 2 minutes. There should be no leaks or permanent deformations.
3) The burst pressure must be maintained for at least 1 minute and must not cause bursting within said time. Deformations, on the other hand, are permissible.

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
  caption: [Test and burst factors from CS-25, CS25.1453 @EASA_CS_25],
)<tab_1>

Perhaps it would be possible, under certain circumstances, to convince the approval authorities of a test factor of 1.5 and a burst factor of 2.0 through argumentative skill. EASA might possibly accept voluminous high-pressure tanks as other components from @tab_1. The hydrogen tank is a pressure vessel whose internal pressure is on the one hand a factor higher than that of oxygen bottles. On the other hand, the tank is many times larger in its dimensions than an oxygen bottle. This simple argumentation is valid and could be used by the approval authorities to reject these proposed factors (1.5 and 2.0). Based on this, aerospace-related areas should be examined more closely.

One option that presents itself is space technology. In this field, the ANSI/AIAA S-081B-2018 Space Systems—Composite Overwrapped Pressure Vessels could be found. ANSI stands for American National Standards Institute. Consequently, these standards are primarily intended for the USA. It often happens that other states or the EU orient themselves on existing standards to adopt their own standards. Complete acceptance of foreign guidelines would be a conceivable possibility, but there is no guarantee of later acceptance. Standards are generally distinguished by adoption locality. Internationally recognized standards are recognized globally. This is followed by continents and individual states. The legislator in a state can, in addition to the international and continental standards, demand additional points for approval in its own state. Without fulfilling all requirements, an innovative project could be strongly influenced by the legislator.

Secondly, the desire for hydrogen-powered aircraft has existed for some time, and the first announcements for designing corresponding standards were made by SAE International on 20.11.2019. @tab_2 lists the two most promising standards for general aviation. It should be explicitly considered that these standards have only been announced and are not yet commercially available at the current time. This report is being written in April 2023. With the legitimate assumption that an institution like SAE International is informed about the standard published in 2018, the following assumption should be discussed. SAE had about 2 years to draft the standard for general aviation for liquid hydrogen. The fact that these 2 years are not sufficient allows the conclusion that the ANSI/AIAA S-081B-2018 Space Systems cannot be applied to general aviation without further ado.



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
    table.header[*Hydrogen - Aggregate State*][*Standard*][*In Work Since*],
    /* -------------- */

    [Liquid], [SAE AS 6679 Liquid Hydrogen Storage for Aviation], [20.11.2019],
    [Gaseous], [SAE AS 7373 Gaseous Hydrogen Storage for General Aviation], [06.07.2021],
  ),

  kind: table,
  caption: [Promising announced and not yet available standards for general aviation with hydrogen as energy carrier. The information was taken from the official website of SAE International.],
)<tab_2>

Thirdly, even if SAE AS 7373 were available, it would not be guaranteed that an external load on the hydrogen tanks was taken into account. In other words, it is unclear whether the standards, once completed, will also be applicable to structural integral hydrogen tanks.

It can be noted that standards from aerospace can indeed be found that could be of interest for K2H2. However, with simple arguments, it can be clearly shown why the described standards offer too little security for official recognition. On the one hand, it is partly unclear whether the standards are also applicable in the European area. On the other hand, at this point, it is not clear whether the standards are also valid for structural integral and externally loaded hydrogen pressure tanks. With its requirements, which according to the current state cannot be comprehensively covered by a single standard, K2H2 represents a very special niche research.