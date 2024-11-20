/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Title was tested and is inshallah fine
=== Filtering Essential Standards<chap_1_0_6>
In previous @chap_1_0_5, an overview of standards from various areas using #gls("cgh2", long:true) as fuel was presented. Building upon this list of options, this subsection aims to summarize the overarching categories of hydrogen applications and clearly identify the category in which #gls("swith", long:true) is classified.
Subsequently, a systematic approach for narrowing down the extensive list to a few essential standards is introduced. 
These essential standards are selected based on their high potential applicability for #gls("swith") certification. A comprehensive review of all standards is beyond the scope of this thesis. However, fundamental insights from non-aviation standards are presented to provide a basic understanding of potential tests that authorities might require for commercial certification of #glspl("swith").
These insights are presented in a structured and concise manner, extracted from the essential standards to reinforce their relevance. Special attention is given to the burst test, considered a crucial component of certification. 
The analysis focuses on two key aspects: the safety factors required for the burst test and the maximum allowable nominal pressures. These parameters, derived from the findings, are critically evaluated to assess their implications for #gls("swith") design and certification.


The three overarching categories that can be assumed to facilitate a rapid initial assessment of standards' applicability by experienced personnel are presented in @tab_9. These categories - Storage, Tank Type, and Locality - can be combined in various ways to create specific requirement profiles. For instance, a profile might include #emp_[mobile] (Storage), #emp_[Type I] (Tank Type), and either #emp_[air] or #emp_[ground] (Locality). The multitude of possible combinations necessitates careful standard selection to ensure precise alignment with the specific requirement profile. This approach allows for tailored standard application, crucial for addressing the unique demands of different hydrogen storage systems, including #gls("swith").


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


The classification of #glspl("swith") based on @tab_9 is mobile, Type IV, and air.  
The term #emp_[air] in this context is self-evident, referring to the operational environment of aircraft. However, the distinction between #emp_[mobile] and #emp_[static] pressure vessels requires further elucidation. Mobile pressure vessels are characterized by their exposure to forces resulting from acceleration, encompassing both linear and angular acceleration. These vessels experience dynamic loading conditions due to the motion of the vehicle in which they are installed, such as an aircraft in flight or an automobile in motion. 
Conversely, static pressure vessels are subject solely to the force exerted by their own mass under the influence of gravity. In static applications, the pressure vessel does not undergo additional accelerations beyond those imposed by Earth's gravitational field. 

// ---------------------------------- fine ---------------------------------- //
The rationale for selecting Type IV is detailed in @chap_1_0_3. While Type V tanks offer potential advantages, their current limited market share affects their viability. As Type V tanks gain prominence, it can be anticipated that their maturity and safety in application will increase. 
Consequently, more manufacturers may emerge, potentially reducing costs. Once these conditions are met, Type V could become the preferred option.
Comparing Type IV tanks against Types I to III, Type IV offers a significant weight advantage, particularly when contrasted with stationary Types I and II. A comprehensive analysis of the different types, including their use cases, advantages, disadvantages, and direct comparisons, is provided in @chap_1_0_3. It is important to emphasize that, at the time of writing this thesis, Type IV remains the optimal choice for #glspl("swith").
Furthermore, the selection of Type IV is applicable to both smaller and larger aircraft. 
Given that aircraft are primarily designed for air transportation, with ground operations being secondary, the #emp_[mobile] and #emp_[air] categories can be considered constants, irrespective of the #gls("swith") size.
The criteria for determining essential standards are presented in @tab_10, with no specific weighting implied by their order.

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
    [2) Actively development],
    [3) Accessibility and availability],
    [4) Adoption in research and industry],
    [5) International recognition],
    [6) Europe-wide recognition],
    [7) Costs for acquisition],
    [8) Coverage of #gls("swith") requirements],
    table.cell(colspan:2, [9) Clearly understandable and detailed specifications]),
  ),

  kind: table,
  caption: [Criteria for selection of essential standards.],
)<tab_10>

Of particular importance for pioneering projects like #glspl("swith") are the first two criteria: #emp_[Timeliness] and #emp_[Actively development]. These interlinked criteria are crucial in ensuring that standards remain relevant and effective.
Timeliness ensures that standards incorporate the most recent knowledge from expert teams. Active development, on the other hand, serves as a mechanism to adapt standards within a reasonable time frame after new information becomes available. Together, these criteria reflect the iterative process of standard creation and revision, where new insights are integrated to address challenges and refine existing guidelines.

In innovative projects like #glspl("swith"), learning often occurs through trial and error. Standards play a crucial role in this process by helping to prevent the repetition of both serious and minor mistakes. This prevention is enabled through building upon accumulated knowledge. As understanding of these projects deepens, standard-issuing bodies should be prepared to adjust their guidelines. They may modify or even remove existing requirements to reflect lessons learned and best practices identified through practical implementation.

These adjustments, primarily aimed at ensuring safety and functionality for both people and the environment, facilitate the path from manufacturing to commercially viable certification. By capturing and codifying the knowledge gained through iterations of the project, standards serve as a repository of collective experience and guidance in the field. 
Prioritizing standards that meet both timeliness and active development criteria allows researchers and industry practitioners to work with guidelines that reflect the current state of knowledge. This approach enhances safety, efficiency, and regulatory compliance for pioneering projects, helping to avoid repeated mistakes and paving the way for new advancements built on a solid foundation of understanding.

The accessibility and availability criterion, as outlined in @tab_10, is of paramount importance. Even the most comprehensive standards hold little value for research and industry if they are not readily obtainable.
Criteria 4-6 in @tab_10 (Adoption in research and industry, International recognition, and Europe-wide recognition) serve as indicators of a standard's experience and successful implementation. The trustworthiness of a standard correlates with the frequency of its adoption and the number of functional vehicles successfully constructed and approved based on its guidelines.
A standard's international recognition often follows from its established trustworthiness. 
Nevertheless, in the absence of internationally recognized standards, the focus shifts to regional standards, with European standards serving as the intermediate step between national and global recognition. This approach aligns with the geographical and regulatory context of this research, which is primarily centered in Germany and the broader European Union. The emphasis on European standards is further supported by the research context, as this work was conducted with funding from the Federal Ministry for Economic Affairs and Climate Action in Germany, as noted in @chap_0_6. 
It is important to acknowledge that in other geographical or political settings, different regional frameworks might take precedence. The choice of regional focus should be determined by the specific context of the research, the regulatory environment in which #glspl("swith") are being developed and implemented, and the broader goals of the project. While this thesis gives precedence to European standards, the principles of standard selection discussed here can be applied to other regional or international frameworks as appropriate.

The cost of acquisition is a critical consideration, particularly for start-ups and small to medium-sized research and industrial institutions. These entities often operate under constrained budgets, making affordability a key factor in standard selection.
The coverage of #glspl("swith") requirements is a crucial criterion. It is generally understood that any standard failing to consider this aspect would be automatically disqualified from consideration. This criterion acts as a fundamental filter, ensuring that only relevant standards are included in the selection process.
The final criterion, clearly understandable and detailed specifications, is essential for effective implementation. Standards should provide precise and comprehensive guidelines to ensure consistent application across different projects and organizations. This clarity facilitates accurate interpretation and implementation, reducing the risk of errors or misunderstandings that could compromise safety or performance in #glspl("swith") applications.

For #glspl("swith"), four standards meeting all criteria and complementing each other have been identified in @tab_11.

#figure(
  table(
    columns: (1fr, 1fr),
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,

    
    /* --- header --- */
    table.header(table.cell(colspan:2,[*Essential Standards*])),
    /* -------------- */
    [1) EC 406/2010 @EU_406_2010],
    [2) ISO 11119-3:2020 @11119_3_ISO],
    [3) #gls("cs")-23 @EASA_CS_23],
    [4) #gls("cs")-25 @EASA_CS_25],
  ),

  kind: table,
  caption: [Selection of four essential standards that, while not fully covering all aspects of #gls("swith"), collectively represent the current state of the art.],
)<tab_11>


For #glspl("swith"), four standards meeting all criteria and complementing each other have been identified in @tab_11. 
It is essential to address important points of the selected standards. EC 406/2010 @EU_406_2010 and ISO 11119-3:2020 @11119_3_ISO are established regulations for the automotive industry. 
EC 406/2010 is available in multiple languages and is valid across 50 geopolitical regions, including various islands and countries. However, there are several objections to its direct application to aviation. The full title in English states: #emp_[COMMISSION REGULATION (EU) No 406/2010 of 26 April 2010 implementing Regulation (EC) No 79/2009 of the European Parliament and of the Council on type-approval of hydrogen-powered motor vehicles]. While by definition an airplane is also a vehicle, the German translation of EC 406/2010 uses the term  #emp_[Kraftfahrzeug] (motor vehicle), which limits the applications to road vehicles. Consequently, from the title definition in the English version itself, it is not clear whether aviation use would be legally permissible. 
The limitation to road-bound vehicles is further emphasized by ISO 19881:2018 @iso_19881. This standard, which serves similar purposes as EC 406/2010 @EU_406_2010, explicitly restricts its scope through its title #emp_[Gaseous hydrogen - Land vehicle fuel containers]. The phrase #emp_[Land vehicle] unequivocally precludes application to aircraft. Moreover, ISO 19881:2018 specifically mandates permanently attached tanks, adding another layer of incompatibility with aviation applications. However, for #glspl("swith"), replaceable tanks could offer significant advantages over permanently attached ones. This potential benefit arises from two main aspects. Firstly, in the event of hydrogen tank issues, replaceable tanks allow for faster substitution, minimizing aircraft inactivity periods. Such efficiency is crucial in airline economics, where prolonged inactivity is highly undesirable. Secondly, replaceable tanks facilitate easier upgrades, such as transitioning from Type IV to Type V tanks when new technological advancements become available.

An additional advantage of replaceable tanks lies in the potential for increased specialization across subdomains. The entire process—encompassing design, manufacturing, attachment, refilling, maintenance (including special inspections), and upgrades—could be more easily outsourced to specialized third parties. #gls("swith") construction, like regular aircraft construction, is highly multidisciplinary. Outsourcing certain aspects to dedicated experts could benefit both existing aircraft manufacturers, enabling them to produce more reliable aircraft, and newcomers to the aircraft manufacturing industry, facilitating their entry into this complex field.
The implementation of replaceable tanks in #glspl("swith") offers multiple benefits to various stakeholders in the aviation industry. Aircraft manufacturers would benefit from reduced management responsibilities, potentially freeing up resources for additional advancements in other areas of aircraft design and production. This shift towards replaceable tanks could also stimulate the creation of specialized service providers, generating new employment opportunities and potentially contributing to enhanced security and affordability in hydrogen tank technology.
Furthermore, airlines might realize significant cost and time savings in their refueling operations. With replaceable tanks, hydrogen refilling stations would not necessarily need to be in the immediate vicinity of aircraft landing locations. Instead, pre-filled tanks could be swapped out efficiently, potentially reducing turnaround times compared to on-site refilling. This approach could also mitigate some of the time-consuming security considerations associated with local refilling operations.

Returning to EC 406/2010, beyond the aforementioned language considerations, studying the EC 406/2010 reveals that it lacks any direct references to aircraft applications. Furthermore, EC 406/2010 presents additional potential limitations, particularly in its testing requirements. These requirements may exceed available economic resources, as they stipulate that multiple #glspl("swith") specimens must undergo a single experimental test.
This demand for multiple specimens is not unique to EC 406/2010 but is also present in ISO 11119-3:2020 @11119_3_ISO. A notable example is found in ISO-11119-3, paragraph 8.2.1, which explicitly states: #emp_[A minimum of 30 cylinders of the new design shall be made available for prototype testing]. 
The requirement for multiple #glspl("swith") samples is highly undesirable due to the cost-intensive and time-consuming nature of their manufacturing process. To illustrate this point, consider the dimensions of the #gls("cfrp", long:true) tubes involved: for small aircraft, these range between 8 and 15 meters in span length @APUS_0, while for large aircraft, they can extend up to approximately 80 meters @link_Lufthansa_Airbus_380. 
It is important to recall that a #gls("swith") consists of a wing with multiple structure-integrated tubes. The integration of multiple tubes, rather than a single one, is driven by the need to optimally utilize all available space within the wing. 
If a single tube-shaped tank were employed, it would only fit at the location of maximum wing thickness, leaving much of the surrounding space unoccupied.
While future advancements may potentially yield airfoil-shaped high-pressure hydrogen tanks, the scope of this work is limited to regular-shaped tanks, specifically cylinders. 

Given the reiterated conceptualization of #glspl("swith") and the illustrated dimensions of integrated composite tubes, the prohibitive expense of producing multiple #glspl("swith") for experimental tests becomes evident. This economic constraint presents a significant challenge in meeting the testing requirements outlined in current standards.
Another obstacle to the direct applicability of EC 406/2010 to #glspl("swith") stems from certain prescribed demands that may be considered excessively stringent. These requirements, found identically in both EC 406/2010 and ISO 19881:2018, relate to the gaseous hydrogen burst ratio criteria. Specifically, these criteria are delineated in section 3.6 of EC 406/2010 and section 7.3.2 of ISO 19881:2018.
Both standards mandate the fulfillment of @eq_3, where $p_"burst"$, $"factor"$, and $p_"wnp"$ represent the minimal burst pressure, a factor dependent on the over-wrap material, and the nominal working pressure, respectively.

$ p_"burst" ≥ "factor"  p_"wnp" $<eq_3>

The safety factors specified for different fiber materials are as follows: 3.5 for glass, 3.0 for aramid, and 2.25 for carbon. Consequently, when using glass as the fiber material, the hydrogen tank must withstand three times the nominal pressure. For instance, if the nominal pressure for a #gls("swith") tank were set at $300 "bar"$, the tank would need to withstand a minimum of $900 "bar"$.
These high safety factors, as defined in EC 406/2010 and ISO 19881:2018, pose significant technical challenges. Higher safety factors necessitate more material to meet the requirements, resulting in increased mass and weight. This outcome is highly undesirable in aviation, as emphasized on multiple occasions in @chap_1_0.
The limitations of current testing facilities further complicate this issue. The high-pressure gas tank testing facility of the European Commission (GasTeF) @Cebolla2019 reports a maximum internal pressure testing capability of $1050 "bar"$. Depending on the fiber material, maximum working nominal pressures ($p_"wnp"$) between 300 and $465 "bar"$ can be achieved under EC 406/2010 and ISO 19881:2018 standards. However, when considering the factors specified in ISO 11119-3:2020, the expected maximum working nominal pressures ($p_"wnp"$) range between 437.5 and $525 "bar"$.

A comprehensive overview of these relationships is provided in @tab_14. The table presents the complete list of fiber material-dependent safety factors for three standards, represented in the denominators of the fractions. Additionally, it illustrates the maximum allowable operating pressures for each combination of fiber material and standard, calculated based on the maximum test pressure of $1050 "bar"$ @Cebolla2019.


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
    table.header[*Fiber material*][*EC 406/2010 &\ ISO 19881:2018\ $p_"wnp"$*][*ISO 11119-3:2020 $p_"wnp"$*],
    /* -------------- */
    [Glass], [1050/3.5 = 300 bar], [1050/2.4 = 437.5 bar],
    [Aramid], [1050/3.0 = 350 bar], [1050/2.1 = 500 bar],
    [Carbon], [1050/2.25 = 465 bar], [1050/2.0 = 525 bar],
  ),

  kind: table,
  caption: [Fiber material-dependent safety factors (denominator of fractions) and associated maximum allowable operating nominal pressure $p_"wnp"$, given a maximum allowable test pressure of $1050 "bar"$ @Cebolla2019.],
)<tab_14>

// TODO rephrase
Despite its limitations, EC 406/2010 remains a viable choice in the selection of applicable standards for #glspl("swith"). In contrast, ISO 19881:2018 has been disqualified from consideration due to ambiguities in its testing instructions. While copyright restrictions prevent direct quotation of the original document, a description of the problematic aspects can be provided.
The issue centers on Table 1 - Material tests of ISO 19881:2018. This table presents headers for material test, clause, material type, and four fields corresponding to the four possible tank or container types. For the material type category, multiple metal materials are listed, with each associated field for Type IV tanks marked as applicable. This presentation suggests that these tests are mandatory not only for metal tanks but also for #gls("cfrp") tanks. However, the test descriptions lack any explicit reference to #gls("cfrp") materials.
Given the significant differences between metal and plastic liners, one would expect variations in testing protocols. The absence of a clear distinction or an explicit statement indicating uniform testing across all materials introduces ambiguity. This raises a critical question: should composite tanks undergo identical testing procedures as metallic tanks, or are these tests specifically designed for metallic tanks?
The inability to resolve this ambiguity within a reasonable timeframe and effort has led to the decision to remove ISO 19881:2018 from the list of applicable standards for #glspl("swith"). This decision underscores the importance of clarity and specificity in standards applicable to novel technologies such as #glspl("swith").

To provide a structured overview of potential tests that #glspl("swith") might undergo, selected information from the chosen essential standards is presented. A list of the mandatory and optional tests, as outlined in ISO 11119-3:2020, is provided in @tab_12 and @tab_13, respectively. These tables offer a concise summary of the testing requirements, distinguishing between tests that are universally required and those that may be necessary under specific circumstances.

#figure(
  table(
    columns: (auto, auto),
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,

    /* --- header --- */
    table.header(table.cell(colspan:2, [*Mandatory Tests*])),
    /* -------------- */
    [Hydraulic proof pressure test (8.5.1) or hydraulic elastic expansion test (8.5.2)],
    [Cylinder burst test (8.5.3)],
    [Ambient temperature cycle test (8.5.4)],
    [Environmental cycle test (8.5.6)],
    [Flaw test (8.5.8)],
    [Drop/impact test (8.5.9)],
    [High-velocity impact (gunfire) test (8.5.10)],
    [Torque test on cylinder neck boss (8.5.13)],
    [Leak test (8.5.15)],
    [Pneumatic cycle test (8.5.16)],
    [Resin shear strength test (8.5.18)],
    [Glass transition temperature test (8.5.14)],
  ),

  kind: table,
  caption: [Mandatory tests specified in ISO 11119-3:2020 @11119_3_ISO.],
)<tab_12>


#figure(
  table(
    columns: (auto, auto),
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,

    /* --- header --- */
    table.header(table.cell(colspan:2, [*Optional Tests*])),
    /* -------------- */
    [Vacuum test (8.5.5)\ Mandatory if a cylinder is to be exposed to a vacuum in service],
    [Environmentally assisted stress rupture test (8.5.7)\ Mandatory for cylinders with load-sharing glass or aramid fiber],
    [Permeability test (8.5.12)\ For cylinders manufactured with non-metallic liners or without liners],
    [Fire resistance test (8.5.11)],
    table.cell(colspan:2, [Salt water immersion test (8.5.14)\ Mandatory for cylinders used in underwater applications]),
  ),

  kind: table,
  caption: [Optional tests specified in ISO 11119-3:2020 @11119_3_ISO, with conditions for mandatory application.],
)<tab_13>

The presentation of these tables, which primarily list test names, does not raise copyright concerns due to their limited content. It is important to note, however, that test names alone provide insufficient information about the specific testing procedures. A comparative analysis of various standards revealed that tests with similar nomenclature often entail significantly different methodologies and requirements.
Despite this limitation, these tables serve a valuable purpose by offering an overview of the types of tests potentially required for #glspl("swith") certification. They provide a general indication of the range and nature of tests that developers and manufacturers should anticipate. It is crucial to recognize that the classification of tests as mandatory or optional may vary depending on the specific circumstances of each project. Some tests listed as optional may become mandatory based on particular design features, intended use, or regulatory requirements of the #gls("swith") in question.

While the aforementioned standards primarily address hydrogen containment systems, it is crucial to consider that #glspl("swith") must also comply with broader aircraft regulations. This necessity led to the inclusion of #gls("cs")-23 @EASA_CS_23 and #gls("cs")-25 @EASA_CS_25 in the list of essential standards in @tab_11.
While #gls("cs")-23 is limited to small aircraft, #gls("cs")-25 can be considered the more comprehensive version that also covers larger aircraft.

#summary_[
From the numerous available standards, the introduced assessment criteria were used to obtain a few essential standards in a structured manner. This analysis has identified four essential standards pertinent to the development and certification of #glspl("swith"). While these standards collectively do not address all the unique aspects of #glspl("swith"), they represent the current state of the art in relevant regulatory frameworks. They provide valuable insights into potential certification requirements and testing protocols for #glspl("swith").
Two of the selected standards offer critical information regarding working nominal pressure. Depending on the applicable standard, the maximum allowable nominal pressure ranges from 437.5 to $525 "bar"$. This upper limit is constrained by the capabilities of existing test facilities, which cannot generate arbitrarily high pressures for experimental structural verification tests.
These findings underscore the importance of considering both hydrogen containment and aircraft-specific regulations in the development of #glspl("swith"), while also highlighting the current technological limitations in testing high-pressure systems.
]

