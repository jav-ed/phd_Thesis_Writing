/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */



// Title was checked and is fine - inshallah
== Aviation Certification Standards <chap_1_0_2>
The preceding @chap_1_0_1 elaborated on the general importance of standards and their particular significance in the context of #gls("swith", long:true).
It highlighted the current absence of a single standard that could support the design of #gls("swith", long:true) or guide the design and conduct of structural validation tests. 
Due to the lack of established rules for structural validation, no authority can currently grant certification for flying with a #gls("swith"). 
The goal of this thesis is to provide initial work that can be utilized by industry, scientists, aerospace certification authorities, or standards institutions to build upon and help close this gap. 
Additional motivation for the need for #glspl("swith") standards, along with suggested possible next steps, was also presented in @chap_1_0_1.
It could be deduced that #glspl("swith") encompass multiple subfields, including aircraft design, hydrogen systems, and pressure vessel technology, each governed by its own set of standards. 
This subsection focuses on the significant standards employed in aerospace. Initially, it presents the commonly used and available aviation standards. 
Subsequently, it examines the potential applicability of these standards to #glspl("swith"). 
Lastly, it examines emerging standards currently under development and evaluates their potential utility for #gls("swith") certification upon their release.

/* -------------------------------------------------------------------------- */
At the outset of this subsection, it is important to reiterate that, at the time of writing this thesis, there is no single standard available that pertains to the certification of #glspl("swith"). Certification extends beyond mere bureaucratic processes; it signifies that local or global aviation authorities permit the use of a #gls("swith"). Only with such certification is a commercial application of a #gls("swith") possible. 

Considering one of the sub-domains in which #gls("swith") can be classified, namely aviation, it is crucial to understand how aircraft are categorized. In aviation, aircraft classification is based on various factors, including the region of certification, maximum takeoff mass, and type of aircraft. The region of certification refers to the geographical location where the aircraft is to be approved and operated. Different approval authorities and regulations exist depending on the country or region in which the aircraft is to be certified. For instance, in Europe, the #gls("easa", long:true) @EASA_Homepage @Mensen2013 is responsible for aircraft approval, while in the USA, this task falls under the purview of the Federal Aviation Administration (FAA) @FAA_Homepage @Mensen2013.

The Maximum Takeoff Weight (MTOW) denotes the maximum weight an aircraft can safely carry for takeoff and flight. Distinct MTOW classes are defined within the standards based on the aircraft's size and performance. The general type of flying object refers to the category of the aircraft, such as commercial aircraft, helicopters, small aircraft, and military aircraft @Purton2014 @olivotto2012certification.


/* -------------------------------------------------------------------------- */
This thesis is written in Germany; thus, the focus is primarily on European standards. While there are differences between European and US standards, it is common knowledge that they do not differ significantly in many areas @Mensen2013. This similarity extends to the extent that even the numbering of the documents and their respective paragraphs align. Detailed analyses of their similarities and differences can be found, among others, in @Kun2011 and @Ramadhanti2024.
The European Union has established uniform standards for the aviation industry that are binding for all member states. This ensures a consistent basis for aircraft operation and safety in air traffic. 
European aviation standards are referred to as #gls("cs", long:true) @Mensen2013 @EASA_CS_Genereral. Among these, the standards that might be classified as relevant to #glspl("swith") are #gls("cs")-23 @EASA_CS_23, #gls("cs")-25 @EASA_CS_25, #gls("cs")-27 @EASA_CS_27, and #gls("cs")-29 @EASA_CS_29.

#gls("cs")-23, for instance, can be applied for the certification of small aircraft that fall within specific criteria regarding their category, maximum take-off mass, and passenger capacity. However, exceeding these criteria may require the application of #gls("cs")-25. #gls("cs")-23 differs from #gls("cs")-25 essentially in that it places less demanding requirements on aircraft performance and equipment. Another difference is that #gls("cs")-25 requires a more detailed examination of the aircraft structure, fuel supply, electrical systems, flight control, and other systems. This is because larger aircraft generally have more complex systems and are therefore exposed to higher risks.

Nevertheless, the intent of this thesis is not to delve into a comprehensive explanation of the #gls("cs") standards, as such an exhaustive explanation would exceed the scope of this document. Instead, @tab_15, which enumerates #gls("swith")-potentially relevant #gls("cs") standards alongside their respective application fields, should suffice as a suitable reference.

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
    table.header[*#gls("cs")*][*Field of application*],
    /* -------------- */
    [#gls("cs")-22 @EASA_CS_22], [Sailplanes and Powered Sailplanes],
    [#gls("cs")-23 @EASA_CS_23], [Normal, Utility, Aerobatic and Commuter Aeroplanes],
    [#gls("cs")-25 @EASA_CS_25], [Large Aeroplanes],
    [#gls("cs")-26 @EASA_CS_26], [Additional airworthiness specifications for operations],
    [#gls("cs")-27 @EASA_CS_27], [Small Rotorcraft],
    [#gls("cs")-29 @EASA_CS_29], [Large Rotorcraft],
    [#gls("cs")-31GB  @EASA_CS_31GB], [Gas Balloons],
    [#gls("cs")-31HB  @EASA_CS_31HB], [Hot Air Balloons],
    [#gls("cs")-31TGB @EASA_CS_31TGB], [Tethered Gas Balloons],

    [#gls("cs")-LSA  @EASA_CS_LSA], [Light Sport Aeroplanes],
    [#gls("cs")-P @EASA_CS_P], [Propellers],
    [#gls("cs")-VLA @EASA_CS_VLA], [Very Light Aeroplanes, see also #gls("cs")-23],
    [#gls("cs")-VLR @EASA_CS_VLR], [Very Light Rotorcraft],
  ),

  kind: table,
  caption: [Selected EU civil aviation #gls("cs", long:true) standards and their primary application fields.],
)<tab_15>

Next, closer attention shall be paid to the two most suitable #glspl("cs"), namely #gls("cs")-23 and #gls("cs")-25. #gls("cs")-23 can be used for small aircraft certification. Since #glspl("swith") are not restricted to either small or large aircraft, #gls("cs")-23 is a suitable candidate to infer potential information for desired #gls("swith")-certification.

Compared to #gls("cs")-25, which is intended for regular commercial and civil large aircraft, #gls("cs")-23 comes with significantly fewer restrictions. Fewer restrictions also mean fewer topics that are addressed and elaborated upon. However, high standard detailing could offer valuable advantages, especially in terms of safety aspects. Furthermore, concrete ideas for conducting structural tests could also be provided, for example, to answer the following questions:

- Which measurement technologies are allowed, which are preferred, and why?
- What possibilities exist for physically introducing loads?
- Which points can be neglected in detail if important and core aspects are reliably proven?

In #gls("cs")-23, the author of this work was unable to extrapolate information that would be valid for a high-pressure hydrogen container. It is quite possible that this will be adjusted in the coming years, as #gls("cs")-23 could be adapted for hydrogen-powered aircraft. Therefore, the statement made above should be considered only in the context of #gls("cs")-23 Version 2018. Search terms such as high-pressure containers, hydrogen in all its states of aggregation, and other gases, such as helium, were also consulted to build on possible knowledge from #gls("cs")-23. The core result is that no helpful knowledge could be gained from #gls("cs")-23 for #glspl("swith").
In #gls("cs")-25 @EASA_CS_25 Amendment 27, under point CS 25.1453, there is information on the topic #emp_([Protection of oxygen equipment from rupture]). It requires that the oxygen bottles can withstand the maximum working pressure. The standard goes even further, demanding that loads induced by temperature and externally applied forces must also be taken into account and withstood.
Additionally, 

#quote(attribution: [#gls("easa") #gls("cs")-25 @EASA_CS_25])[the maximum working pressure must include the maximum normal operating pressure, the transient and surge pressures, tolerances of any pressure limiting means and possible pressure variations in the normal operating modes. Transient or surge pressures need not be considered except where these exceed the maximum normal operating pressure multiplied by 1.10.]

Furthermore, temperature influence and proof of strength are addressed. Specifically, the following three requirements are made for the proof of strength:

+ Compliance with the test and burst factors from @tab_1. These factors, obtained from CS 25.1453, are to be used in conjunction with the maximum working pressure.

+ The test pressure must be maintained for at least 2 minutes without causing leaks or permanent deformations.

+ The burst pressure must be maintained for at least 1 minute without causing rupture. Deformations, however, are permissible during this test.

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
  caption: [Proof and burst factors for pressurized components. Table obtained from CS 25.1453 - Protection of oxygen equipment from rupture @EASA_CS_25.],
)<tab_1>

One might consider the possibility of convincing approval authorities to accept a test factor of 1.5 and a burst factor of 2.0 for #glspl("swith") through persuasive argumentation. #gls("easa") might potentially categorize voluminous high-pressure tanks as "other components" from @tab_1. However, two key counterarguments exist. First, the hydrogen tank is a pressure vessel with an internal pressure significantly higher than that of oxygen bottles. Second, the tank's dimensions are considerably larger than those of an oxygen bottle. This straightforward reasoning could be employed by approval authorities to reject the proposed factors of 1.5 and 2.0. Consequently, it is prudent to examine aerospace-related areas more closely.
One relevant option is space technology. In this field, the ANSI/AIAA S-081B-2018 Space Systems—Composite Overwrapped Pressure Vessels standard @ansi_standard_2018 is noteworthy. 
ANSI, the American National Standards Institute, primarily develops standards for use in the USA. However, it is common for other countries or the EU to use existing standards as a basis for developing their own @Mensen2013. 
While complete adoption of foreign guidelines is conceivable, there is no guarantee of universal acceptance.
Standards are generally distinguished by their geographical scope of adoption. Internationally recognized standards have global acceptance, followed by continental and national standards. Individual states may require additional approval criteria beyond international and continental standards. Failure to meet all requirements could significantly impact the progress of an innovative project under a given jurisdiction.


/* -------------------------------------------------------------------------- */

The desire for hydrogen-powered aircraft has existed for some time, with the first announcements for designing corresponding standards made by SAE International on November 20, 2019 @SAE_Liquid. The two most promising standards for general aviation are listed in @tab_2. It should be explicitly noted that these standards have only been announced and are not commercially available at the time of writing (October 2024). 
Assuming that an institution like SAE International is aware of the ANSI/AIAA S-081B-2018 Space Systems standard @ansi_standard_2018 published in 2018, it raises an interesting observation. Why, after approximately five years, has the standard for liquid hydrogen in general aviation not been completed?
This suggests that the ANSI/AIAA S-081B-2018 Space Systems standard cannot be directly applied to general aviation without significant modifications.


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
  caption: [Prospective standards for hydrogen-powered general aviation aircraft, announced but not yet available.]
)<tab_2>

Furthermore, even if SAE AS 7373 @SAE_Gas were available, it would not necessarily account for external loads on high-pressure hydrogen tanks. In other words, it remains unclear whether these standards, once completed, will be applicable to structurally integrated high-pressure hydrogen tanks.
While aerospace standards that could be of interest for #glspl("swith") certification or as initial references could indeed be found, simple arguments demonstrate why these standards offer insufficient security for official recognition. Firstly, it is uncertain whether these standards are applicable in the European context. Secondly, it is unclear whether they are valid for structurally integrated and externally loaded high-pressure hydrogen tanks.
Given the special requirements of #glspl("swith"), which according to the current state cannot be comprehensively covered by a single standard, #glspl("swith") represent a very specialized area of research.


/* --------------------------------- summary -------------------------------- */
#summary_([
In conclusion, there are currently available standards that, in theory, could be applied to #gls("swith")-certification. However, with simple argumentation concerning the high-pressure and much larger scale of the tanks, authorities can deny the application of current available standards for the certification of #glspl("swith").
Driven by this reasoning, two standards for hydrogen-powered general aviation have been announced: @SAE_Liquid and @SAE_Gas. At present, they are not commercially available. However, even upon their release, there is no guarantee that they can be applied to #glspl("swith"). 
Firstly, it is unknown whether these SAE standards will be limited to non-integral, non-external, and thus non-load-carrying hydrogen tanks, or if they will extend to external-load carrying integrated hydrogen tanks. Additionally, they might include provisions for fuselage-integral hydrogen tanks, but possibly not wing-integral tanks. In essence, at the moment, the applicability of the announced SAE standards to the certification of #glspl("swith") remains unclear.
Secondly, these standards, in their current form, might not be accepted in Europe without modifications.

Finally, a connection was made between two events in aerospace standardization. In 2018, ANSI/AIAA S-081B-2018 @ansi_standard_2018 became available for space systems. The following year, in 2019, SAE announced plans to develop SAE AS7373 @SAE_Liquid, a standard for liquid hydrogen in aviation. 
However, as of late 2024, five years after its initiation, this development is still ongoing. This extended timeline suggests that transferring existing space standards to general aviation is not straightforward and requires substantial time and effort.

])

