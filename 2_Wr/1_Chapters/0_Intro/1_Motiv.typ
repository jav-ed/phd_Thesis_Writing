/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */



// Some review already happened
/* ------------------------------- Motivation ------------------------------- */
== Motivation <chap_0_2>
This section outlines the fundamental reasons inspiring this research contribution.
The contemporary world heavily relies on aviation, serving crucial functions in both personal and business spheres that extend far beyond mere transportation
@Rupcic2023 @Afonso2023 @Ansell2023 @Abrantes2024 @Ficca2023.
For individual consumers, aircraft provide a comfortable, secure, and expeditious option to traverse vast distances. 
This capability has changed personal travel, enabling people to explore distant lands, reunite with loved ones, and broaden their cultural horizons in ways that were previously difficult or impossible. The speed and efficiency of air travel have an impact on international understanding and cultural exchange.

In the business sector, aviation stands as an indispensable part of global commerce
@FloridoBenitez2023 @Li2024
. It offers reliable and swift transportation of goods, ranging from small, high-value items to oversized cargo that exceeds the capacity of standard ground or some sea transport. 
These logistical advancements have enabled the development of complex, international supply chains that are an essential part of modern industry. 
Furthermore, business travel @Lai2022 facilitated by aviation has become integral to maintaining personal relationships in an increasingly globalized economy, where face-to-face meetings can make or break crucial deals and partnerships.
The importance of aircraft extends well beyond these primary functions @Zachariah2023. 
In the realm of emergency services, aircraft play a vital role in search and rescue operations @Lawson2023, medical evacuations @Herstein2023, and disaster relief efforts @Pak2021. 
Their ability to quickly reach remote or inaccessible areas has saved many lives and provided critical aid in times of crisis. Additionally, aircraft serve essential functions in scientific research, enabling atmospheric studies @Hamilton2022, wildlife tracking @Marzioli2024, and earth observation @Tsokas2022 that contribute to our understanding of climate change and other global phenomena.

The agricultural sector @Bikov2022 also benefits significantly from aviation. Crop spraying and aerial surveying can benefit farming practices, increasing efficiency and yield in food production. 
Moreover, the aviation industry itself is a major economic driver, creating millions of jobs worldwide in manufacturing, maintenance, airport operations, and associated services @Zhang2020. It supports a vast ecosystem of businesses, from small local suppliers to multinational corporations, contributing significantly to global economic growth and technological innovation.
While there are many more reasons why aviation has become indispensable @Meijer2020 @Lenaerts2021, it is crucial to acknowledge that this progress comes at an environmental cost. 
The negative impact of aircraft emissions on the environment is a growing concern for governments, industry stakeholders, and consumers. 
This dichotomy between the essential nature of aviation and its environmental footprint underscores the urgent need for sustainable solutions in the sector, providing a compelling motivation for the research presented in this thesis.

To maintain the benefits of aircraft while addressing environmental concerns, more environmentally friendly alternatives are in high demand. The environmental impact of aviation is significant and cannot be neglected, primarily due to the emissions produced when aircraft burn fuel. 
These emissions include carbon dioxide (CO2), nitrogen oxides (NOx), and sulphur dioxide (SO2), all of which contribute to climate change and air pollution @Rupcic2023.
The magnitude of this issue is reflected in policy initiatives such as the European Commission's Flightpath 2050 @Zaporozhets2021. 
This document sets ambitious goals for the aviation industry, including a 75% reduction in CO2 emissions and a 90% reduction in NOx emissions per passenger kilometer @Zaporozhets2021. These targets underscore the urgent need for innovative solutions in aviation technology and fuel systems.

One promising approach to meeting these environmental challenges, as mentioned in @chap_0_1, is the replacement of current kerosene fuel with hydrogen. In addition to potentially eliminating certain environmental impacts, hydrogen possesses specific properties that could be highly beneficial for aviation. However, lack of awareness or mishandling of these properties could potentially cause serious damage to humans and the surrounding environment @Hu2023. Furthermore, there remain numerous open questions and challenges regarding the practical implementation of hydrogen in aviation.
These are especially of importance in the face of conducting experimental structural validation tests that are mandatory for certifying any aircraft. A more detailed examination of hydrogen's properties and challenges can be found in 
//
// TODO
// @chap_2 .

Finding an alternative fuel for aerospace is of high importance. However, in the case of hydrogen, gaining knowledge on how to work with hydrogen can be regarded as equally important as finding an alternative fuel. This is due to the wide application fields of hydrogen @Rasul2022 @Capurso2022. 
Considering only the mobility sector 
@Rasul2022 @Capurso2022 @Qureshi2022, hydrogen could power, among others, ships, motorcycles, cars, vans, helicopters, trains, and quadcopters. Whether in the mobility industry or the energy sector, subtle mistakes could cause significant damage, necessitating a deeper exploration of hydrogen for applications beyond aviation.

Furthermore, based on the literature reviewed for this thesis, the author observes that valuable information for a specific domain can often be found within seemingly unrelated fields. This interdisciplinary nature of knowledge implies that domains without apparent direct links can potentially contribute to each other's progress, highlighting the importance of cross-disciplinary research and collaboration.

#glspl("swith") represent a novel approach in aviation fuel storage, integrating hydrogen tanks within the wing structure. This design aims to maximize space utilization while potentially contributing to load-bearing, distinguishing it from conventional fuel storage methods. Besides the scarcity of literature about #glspl("swith"), their unique characteristics present significant challenges. Unlike most structure-integrated approaches reviewed in literature, which predominantly focus on fuselage integration, #glspl("swith") involve wing integration. This distinction is crucial, as wing-integrated tanks experience substantially greater aerodynamic loads compared to fuselage-integrated tanks in conventional tube-and-wing configurations.

The dual functionality of #glspl("swith") - serving as both fuel storage and load-bearing structures - introduces complexity that extends beyond the scope of current certification procedures for commercial aircraft. This novel approach necessitates a reevaluation of existing safety standards and certification processes.
Certification authorities need to ensure that #glspl("swith") can be safely operated by pilots and utilized by passengers. The integration of high-pressure hydrogen tanks within the wing structure raises numerous questions that are not adequately addressed by current norms, as further elaborated in 
//
// TODO
// @chap_2 .

First, there is limited knowledge regarding which experimental structural tests should be conducted to provide comprehensive certification. This lack of established protocols highlights the need for developing new testing methodologies specifically tailored to the unique characteristics of #glspl("swith").
Second, even when assuming ti know of what to test, there remains a significant challenge in determining how to conduct these tests safely. Addressing these certification challenges is crucial for the successful implementation of #glspl("swith") in commercial aviation.

The focus of this work is primarily scientific, aiming to advance our understanding of #glspl("swith"). 

However, it is important to note that the potential impact of this research extends beyond purely scientific outcomes. The development of #glspl("swith") could have significant implications in economic, technological, and strategic domains.
While a detailed exploration of these broader impacts is beyond the scope of this motivation section, it is worth acknowledging that nations and organizations investing in this research may position themselves to gain numerous benefits. These potential advantages, which could encompass economic growth, technological leadership, and strategic positioning in the aviation sector, underscore the wider significance of this work. A more comprehensive exploration of these aspects is presented in @chap_0_5.


/* --------------------------------- summary -------------------------------- */

// #summary_([
// Aviation has become an indispensable part of the global economy, serving both personal and business sectors with fast, reliable transportation. However, its negative environmental impact necessitates research into alternative, more environmentally friendly fuels. Hydrogen emerges as a promising candidate, not only for aviation but across various sectors, making research in this area broadly valuable. In this context, #glspl("swith") represent a novel approach. 
// The hydrogen tanks not only store the fuel, but also are an active part of the wing such that loads across wing and hydrogen tanks are shared.
// This innovative design aims to optimize space usage and potentially increase wing stiffness, showcasing how scientific ingenuity could address multiple challenges simultaneously.
// ]
// )

// // add some vertical spacing inshallah
// #v(default_Font_Size)


