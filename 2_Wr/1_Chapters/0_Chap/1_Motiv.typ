/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */



// Some review already happened
/* ------------------------------- Motivation ------------------------------- */
== Motivation <chap_0_2>
This section outlines the fundamental reasons inspiring this research contribution.
The contemporary world heavily relies on aviation, serving crucial functions in both personal and business spheres that extend far beyond mere transportation.
For individual consumers, aircraft provide a comfortable, secure, and expeditious option to traverse vast distances. 
This capability has changed personal travel, enabling people to explore distant lands, reunite with loved ones, and broaden their cultural horizons in ways that were previously difficult or impossible. The speed and efficiency of air travel have an impact on international understanding and cultural exchange.

In the business sector, aviation stands as an indispensable part of global commerce. It offers reliable and swift transportation of goods, ranging from small, high-value items to oversized cargo that exceeds the capacity of standard ground or some sea transport. 
These logistical advancements have enabled the development of complex, international supply chains that are an essential part of modern industry. 
Furthermore, business travel facilitated by aviation has become integral to maintaining personal relationships in an increasingly globalized economy, where face-to-face meetings can make or break crucial deals and partnerships.
The importance of aircraft extends well beyond these primary functions. In the realm of emergency services, aircraft play a vital role in search and rescue operations, medical evacuations, and disaster relief efforts. 
Their ability to quickly reach remote or inaccessible areas has saved many lives and provided critical aid in times of crisis. Additionally, aircraft serve essential functions in scientific research, enabling atmospheric studies, wildlife tracking, and earth observation that contribute to our understanding of climate change and other global phenomena.

The agricultural sector also benefits significantly from aviation. Crop dusting and aerial surveying can benefit farming practices, increasing efficiency and yield in food production. 
Moreover, the aviation industry itself is a major economic driver, creating thousands of jobs worldwide in manufacturing, maintenance, airport operations, and associated services. It supports a vast ecosystem of businesses, from small local suppliers to multinational corporations, contributing significantly to global economic growth and technological innovation.
While there are many more reasons why aviation has become indispensable, it is crucial to acknowledge that this progress comes at an environmental cost. 
The negative impact of aircraft emissions on the environment is a growing concern for governments, industry stakeholders, and consumers. 
This dichotomy between the essential nature of aviation and its environmental footprint underscores the urgent need for sustainable solutions in the sector, providing a compelling motivation for the research presented in this thesis.

To maintain the benefits of aircraft while addressing environmental concerns, more environmentally friendly alternatives are in high demand. The environmental impact of aviation is significant and cannot be neglected, primarily due to the emissions produced when aircraft burn fuel. 
These emissions include carbon dioxide (CO2), nitrogen oxides (NOx), and sulphur dioxide (SO2), all of which contribute to climate change and air pollution.
The magnitude of this issue is reflected in policy initiatives such as the European Commission's Flightpath 2050. 
This document sets ambitious goals for the aviation industry, including a 75% reduction in CO2 emissions and a 90% reduction in NOx emissions per passenger kilometer. These targets underscore the urgent need for innovative solutions in aviation technology and fuel systems.

One promising approach to meeting these environmental challenges, as mentioned in @chap_0_1, is the replacement of current kerosene fuel with hydrogen. In addition to potentially eliminating certain environmental impacts, hydrogen possesses specific properties that could be highly beneficial for aviation. However, lack of awareness or mishandling of these properties could potentially cause serious damage to humans and the surrounding environment. Furthermore, there remain numerous open questions and challenges regarding the practical implementation of hydrogen in aviation.
These are especially of importance in the face of conducting experimental structural validation tests that are mandatory for certifying any aircraft. A more detailed examination of hydrogen's properties and challenges can be found in 
//
// TODO
// @chap_2_0 .

Finding an alternative fuel for aerospace is of high importance. However, in the case of hydrogen, gaining knowledge on how to work with hydrogen can be regarded as equally important as finding an alternative fuel. This is due to the wide application fields of hydrogen. Considering only the mobility sector, hydrogen could power, among others, ships, motorcycles, cars, vans, helicopters, trains, and quadcopters. Whether in the mobility industry or the energy sector, subtle mistakes could cause significant damage, necessitating a deeper exploration of hydrogen for applications beyond aviation.

Furthermore, based on the literature reviewed for this thesis, the author observes that valuable information for a specific domain can often be found within seemingly unrelated fields. This interdisciplinary nature of knowledge implies that domains without apparent direct links can potentially contribute to each other's progress, highlighting the importance of cross-disciplinary research and collaboration.
#gl_("swith", pl:true) represent a relatively new field of research. While their primary objective is to address current environmental challenges in aviation, they do so in a distinctive manner. By integrating fuel tanks within the wing structure, #gl_("swith", pl:true) aim to maximize space utilization, avoiding wastage. This approach contrasts with the use of conventional hydrogen tanks solely for fuel storage, which would not contribute to alleviating the loads experienced by the wing. Consequently, #gl_("swith") are designed to serve dual purposes: providing fuel storage and potentially reducing wing loads.

However, the dual functionality of #gl_("swith", pl:true) - serving as both fuel storage and load-bearing structures - introduces complexity that extends beyond the scope of current certification procedures for commercial aircraft. This novel approach necessitates a reevaluation of existing safety standards and certification processes.
Certification authorities need to ensure that #gl_("swith", pl:true) can be safely operated by pilots and utilized by passengers. The integration of high-pressure hydrogen tanks within the wing structure raises numerous questions that are not adequately addressed by current norms, as further elaborated in 
//
// TODO
// @chap_2_0 .

First, there is limited knowledge regarding which experimental structural tests should be conducted to provide comprehensive certification. This lack of established protocols highlights the need for developing new testing methodologies specifically tailored to the unique characteristics of #gl_("swith", pl:true).
Second, as mentioned before, even when assuming knowledge of what to test, there remains a significant challenge in determining how to conduct these tests safely. Addressing these certification challenges is crucial for the successful implementation of #gl_("swith", pl:true) in commercial aviation.

The focus of this work is primarily scientific, aiming to advance our understanding of #gl_("swith", pl:true). 
However, it is essential to acknowledge that scientific research, particularly in such novel and complex fields, requires substantial financial support to be conducted effectively. Nations and organizations that demonstrate the capability and commitment to fund research into such promising and challenging endeavors may position themselves to gain numerous benefits beyond the immediate scientific outcomes. These potential benefits, which extend to economic, technological, and strategic domains, are further elaborated in @chap_0_5.



/* --------------------------------- summary -------------------------------- */

// #summary_([
// Aviation has become an indispensable part of the global economy, serving both personal and business sectors with fast, reliable transportation. However, its negative environmental impact necessitates research into alternative, more environmentally friendly fuels. Hydrogen emerges as a promising candidate, not only for aviation but across various sectors, making research in this area broadly valuable. In this context, #gl_("swith", pl:true) represent a novel approach. 
// The hydrogen tanks not only store the fuel, but also are an active part of the wing such that loads across wing and hydrogen tanks are shared.
// This innovative design aims to optimize space usage and potentially increase wing stiffness, showcasing how scientific ingenuity could address multiple challenges simultaneously.
// ]
// )

// // add some vertical spacing inshallah
// #v(default_Font_Size)


