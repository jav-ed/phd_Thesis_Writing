/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

/* ------------------------------ Introduction ------------------------------ */
= Introduction <chap_0>
In the starting chapter of this work, first some inital background regarding the niche field shall be given 
in @chap_0_1. 
This aims to give the reader a broad overview of the field of research.
The deeper look into this subject can inshallah be found in 
//
// TODO
// @chap_2_0 .
Once a rough understanding of #gl_("swith"), pronounced #emph("sweets"),  is obtained, the motivation behind this work shall be explained in @chap_0_2.
The next @chap_0_3 shall outline the overall goals of this work. The reader can refer to it for gaining a quick overview about the topics that are covered.
In @chap_0_4 the systematic strucutre of writing this thesis is given.
The following @chap_0_5 highlights the novelty and significance of this work.
Finally in @chap_0_6 the financial funding is made transparent such that the reader can decide for himself whether any manipulation from outside occured.


/* ---------------------------- Inital Background --------------------------- */
== Inital Background <chap_0_1>
In this subsection a quick and rough defintion of the term #gl_("swith") shall be given. 
Concrete detailed information about #gl_("swith", pl:true) can be found at
//
// TODO
// @chap_2_0 .
The reason for initally starting with a brief defintion of #gl_("swith") is to work systematically.
First a overall idea is presented, which in most #emp_[]cases can be assumed to be easier to undertand, especially for non-specialists.
Once basics are understood properly, depth knowledge becomes easier to grasp.

There are many aspects in the field of aviation, which scienntists and industries areound the world try to improve. 
One of them is the impact that aircrafts have on the environment.
The main goal in the latter field is to investigate, how the harm already caused to the planet earth, can be reduced.
Among the many options that are actively researched on, the potential soluition this work deals with is the applicaiton of hydrogen.
In this case hydrogen would replace the conventional fuel, that is, cerosine, as the power supplier. 
If working with hydrogen, the engineers currenlty have two viable options. 
Hydrogen in to decide between working with gaseous and liquid hydrogen.
For this work, gaseous hydrogen will be chosen. 
Because of the latter and the desire of a feasible flight range, the hydrogen must be stored under very high pressure.
For now the following simpliefied explanation shall suffice. 
Gas can be compressed and with high pressure we can compress hydrogen such that we can store comprably more hydorgen within a given and constant volumne.
Due to the high pressure, pressure resitant hydrogen storages are required.
The direct approach would to devote a secure space to storing the hydrogen tanks within the aircraft.
The concrete location for placing the hydrogen tanks is not easy and depeneds on a high number of factors.
However, another apporach is to have the hydrogen high pressure tanks inside the wing and furthermore conntected to the wingskin.
As a consequence of the tank and wing skin being strucutrally connected, the loads are shared.
In more concrete terms, if the wings feels any lift distirbution, part of it will be passed to the hydrogen tanks.
On the other hand, acceptable defecltions caused by the high pressure within the tanks will put stress on the wing skin. 
Because of the strucutral connections of the wing and the tanks, the connection areas allow load paths to be created.

An illustraitve example of the wing of a #gl_("swith") is given in @fig_0. 
While for #gl_("swith", pl:true) the wing skin usally surrounds the pressure tanks fully, in @fig_0 the view is made free on purpose.
With the latter, the location of the 4 hydrogen tubes can be made visible easier. 


#figure(
  image("../../../1_Data/2_Figs/0_Content/0_Chap/0_Wing_Tube.png", 
  width: 100%),
  caption: [ Illustrative example of a #gl_("swith")],
) <fig_0>




/* ------------------------------- Motivation ------------------------------- */
== Motivation <chap_0_2>
This section outlines the fundamental reasons inspiring this research contribution.
The contemporary world heavily relies on aviation, serving crucial functions in both personal and business spheres that extend far beyond mere transportation.
For individual consumers, aircraft provide a comfortable, secure, and expeditious option to traverse vast distances. 
This capability has changed personal travel, enabling people to explore distant lands, reunite with loved ones, and broaden their cultural horizons in ways previously might be very hard to impossible. The speed and efficiency of air travel have impact on international understanding and cultural exchange.

In the business sector, aviation stands as a indispensable part of global commerce. It offers reliable and swift transportation of goods, ranging from small, high-value items to oversized cargo that exceeds the capacity of standard ground or some sea transport. 
This logistical advancements has enabled the development of complex, international supply chains that are an essential part of modern industry. 
Furthermore, business travel facilitated by aviation has become integral to maintaining personal relationships in an increasingly globalized economy, where face-to-face meetings can make or break crucial deals and partnerships.
The importance of aircraft extends well beyond these primary functions. In the realm of emergency services, aircraft play a vital role in search and rescue operations, medical evacuations, and disaster relief efforts. 
Their ability to quickly reach remote or inaccessible areas has saved many lives and provided critical aid in times of crisis. Additionally, aircraft serve essential functions in scientific research, enabling atmospheric studies, wildlife tracking, and earth observation that contribute to our understanding of climate change and other global phenomena.

The agricultural sector also benefits significantly from aviation. Crop dusting and aerial surveying can benefit farming practices, increasing efficiency and yield in food production. 
Moreover, the aviation industry itself is a major economic driver, creating thousands of jobs worldwide in manufacturing, maintenance, airport operations, and associated services. It supports a vast ecosystem of businesses, from small local suppliers to multinational corporations, contributing significantly to global economic growth and technological innovation.
While there are many more reasons why aviation has become indispensable, it is crucial to acknowledge that this progress comes at an environmental cost. 
The negative impact of aircraft emissions on the environment is a growing concern for governments, industry stakeholders, and consumers. 
This dichotomy between the essential nature of aviation and its environmental footprint underscores the urgent need for sustainable solutions in the sector, providing a compelling motivation for the research presented in this thesis.

To maintain the benefits of aircraft while addressing environmental concerns, more environmentally friendly alternatives are in demand. One approach, as mentioned in @chap_0_1, is the replacement of current kerosene fuel with hydrogen. Hydrogen possesses specific properties, some of which could be regarded as highly beneficial for aviation. However, lack of awareness or mishandling of these properties could potentially cause serious damage to humans and the surrounding environment. Furthermore, there remain numerous open questions and challenges regarding the practical implementation of hydrogen in aviation. A more detailed discussion of hydrogen's properties and challenges can be found in 
//
// TODO
// @chap_2_0 .

Finding an alternative fuel for aerospace is of high importance. However, in the case of hydrogen, gaining knowledge on how to work with hydrogen can be regarded as equally important as finding an alternative fuel. This is due to the wide application fields of hydrogen. Considering only the mobility sector, hydrogen could power, among others, ships, motorcycles, cars, vans, helicopters, trains, and quadcopters. Whether in the mobility industry or the energy sector, subtle mistakes could cause significant damage, necessitating a deeper exploration of hydrogen for applications beyond aviation.

Furthermore, based on the literature reviewed for this thesis, the author observes that valuable information for a specific domain can often be found within seemingly unrelated fields. This interdisciplinary nature of knowledge implies that domains without apparent direct links can potentially contribute to each other's progress, highlighting the importance of cross-disciplinary research and collaboration.

#gl_("swith", pl:true) represent a relatively new field of research. While their primary objective is to address current environmental challenges in aviation, they do so in a distinctive manner. By integrating fuel tanks within the wing structure, #gl_("swith", pl:true) aim to maximize space utilization, avoiding wastage. This approach contrasts with the use of conventional hydrogen tanks solely for fuel storage, which would not contribute to alleviating the loads experienced by the wing. Consequently, #gl_("swith") are designed to serve dual purposes: providing fuel storage and potentially reducing wing loads.


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


