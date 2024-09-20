/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */





=== Aviation Standards <chap_1_0_2>


/* -------------------------------------------------------------------------- */

Standards should be considered as an initial point of reference for the goal of safely desining and conducting a experimental structrual validation tests of #gl_("swith", pl:true) that is meant to be a first step tpwards the certification of #gl_("swith", pl:true).
Standards can be translated as guidelines. For instance, in the field of construction, there would be design guidelines defined by standards. Similarly, for structural testing, there would be safety, procedural, setup, and other guidelines. On one hand, guidelines can be seen as unwanted restrictions. However, they allow systems to function safely and reliably. It can be argued that the use of standards in a field with many unknowns provides a certain level of security and reduces the likelihood of errors. Since both the construction and experimental structural investigation of #gl_("swith", pl:true) are innovations, there are particularly many unknowns in the K2H2 project. This also comes with many potential risks.

It is precisely for this reason that it is necessary, as far as possible, to rely on foundations that allow for safe, clearly traceable, and systematic procedures. Standards offer a kind of guideline that engineers and experts can follow. By adhering to standards, it can largely be ensured that all important aspects are considered. It's also worth noting that standards are usually written and revised by expert groups with a deep understanding of the relevant field. This ensures that factors are considered that an individual might not have thought of.

In addition to ensuring the safety and reliability of products and systems, standards also contribute to compliance with legal regulations. They enable products and systems to meet applicable safety standards and minimize negative consequences for the environment and society. By adhering to standards, new or slightly modified systems can be more easily approved for science and industry.

The introduction should have motivated the search for existing standards for #gl_("swith", pl:true). In summary, it can be said that by using appropriate standards, safety and planned feasibility can be optimized. In addition, the industrial project leader (IMA) can thus offer the developed test concept to third parties as a service more quickly and with comparatively lower cost and time expenditure. However, no #gl_("swith") is known in research or publicly accessible industry. Due to the fact that no #gl_("swith") has been publicly approved to date, at the time of writing this report, there is no standard that fully covers the design and physical structural testing of #gl_("swith", pl:true).


Standards for Wing- Structure- Integrated high-pressure Hydrogen Tanks (SWITHs)
play a vital role in establishing a basis for both design and experimental structural investi-
gation. Particularly when dealing with innovative concepts, fraught with potential risks.
and uncertainties. Recognizing standards as guidelines allows engineers and specialists
to follow a safe, clear, and systematic process. The contribution of experts to the composi-
tion and revision of these standards ensures consideration of aspects that an individual
might not think of, thereby enhancing the safety and reliability of products and systems.


/* -------------------------------------------------------------------------- */

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



=== Fundamentals of Pressure Vessels <chap_1_0_3>



=== II.3 Fundamentals of Pressure Vessels

This section will first provide general basics about pressure tanks. Then, distinctions will be made so that only information relevant to #gl_("swith", pl:true) (Structural Integral Hydrogen Fuel Tanks) can be used for further work.

Pressure tanks are special containers used in various applications for the storage and transport of pressurized gases and liquids. Pressure tanks are used, among other things, in transportation, aerospace, energy and environmental technology, as well as various other research and industrial sectors. For the K2H2 project, however, it can be clearly stated that the propulsion of the small aircraft should be carried out by hydrogen (H2). Accordingly, this work will focus exclusively on pressure tanks for the storage of hydrogen (H2).

The paper @barral2006hydrogen briefly reports on the development history of pressure cylinders. This will be briefly described below. Since the beginning of the 20th century, H2 has been stored in seamless steel bottles. Around the end of the 1960s, steel tubes could also be used. At this time, the so-called hydrogen embrittlement was increasingly encountered. The latter states that, through sufficiently long contact between metal and H2, the metal begins to embrittle or the structural mechanical properties, such as strength and E-modulus, are weakened.

Aluminum tanks were the alternative at the time, which, however, cost significantly more. With the aim of reducing the weight of the steel bottles, a partial to complete composite wrapping of the steel bottles was carried out. Due to the weight savings, the wrapped pressure vessels could now also be used mobile. The next step in development was to replace the metallic so-called liner with plastic. The composite winding is wrapped around the plastic liner.

The extent to which a metallic liner differs from a plastic liner and what differences exist between the individual plastics is presented in a detailed study in @Su2021. However, the most important points are: Metal has a higher density, making it more difficult for H2 to diffuse out. The disadvantage of metal, on the other hand, is its higher weight and embrittlement. Depending on the choice of plastic and utilization of special effects, such as the tortuous effect (addition of fillers), significant influence can be taken on the diffusion behavior. The goal is to let as little H2 diffuse out as possible or to obtain the lowest possible diffusion rate.

The superordinate development stages of the pressure tank can be divided into tank types. @fig_4 shows all four common tank types that are available in the free market economy. Contrary to the labeling in @fig_4, tank types are usually labeled with Roman numerals in the literature. Tank type V had already been developed at the time of writing this report. However, it is the most expensive of all variants. It consists exclusively of fiber-reinforced plastic, has no liner @Su2021, and is currently mainly used for military purposes.


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/0_Tank_Types.png", 
  width: 100%),
  caption: [Common types of pressure vessels @Su2021.],
) <fig_4>


From tank type I to IV, the weight decreases on the one hand, and on the other hand, the maximum bearable pressure as well as the costs increase. Type V weighs about 20% less than Type IV @Su2021, but can only withstand a lower maximum pressure. The choice of tank depends on the pressure range, weight, and cost. Different values for the maximum bearable pressure can be found in the literature. However, @tab_0 can be considered as guideline values. For K2H2, tank type IV has already been chosen and is defined as a non-changeable constant for the project.

/* -------------------------------------------------------------------------- */

#figure(
  table(
    columns: (0.3fr, 0.7fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,
    
    /* --- header --- */
    table.header[*Tank Type*][*Maximum bearable pressure [bar]*],
    /* -------------- */
    [I], [200],
    [II], [263],
    [III and IV], [300 – 700],

  ),

  kind: table,
  caption: [Maximum bearable pressure values according to @khzouz2020hydrogen.],
)<tab_0>
/* -------------------------------------------------------------------------- */


In summary, it can be said that there are different tank types that come into question for different requirements. For the K2H2 project, the choice has already been made; it should be a Type IV tank.