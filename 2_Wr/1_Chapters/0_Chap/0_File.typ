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
Conversely, acceptable defecltions caused by the high pressure within the tanks will put stress on the wing skin. 
Because of the strucutral connections of the wing and the tanks, the connection areas allow load paths to be created.

An illustraitve example of the wing of a #gl_("swith") is given in @fig_0. 
While for #gl_("swith", pl:true) the wing skin usally surrounds the pressure tanks fully, in @fig_0 the view is made free on purpose.
With the latter, the location of the 4 hydrogen tubes can be made visible easier. 


#figure(
  image("../../../1_Data/2_Figs/0_Content/0_Chap/0_Wing_Tube.png", 
  width: 100%),
  caption: [ Illustrative example of a #gl_("swith")],
) <fig_0>




/* ---------------------- Motivation and Importance of ---------------------- */
== Motivation and Importance of #gl_("swith") <chap_0_2>
Within this section the need for this research contribution shall be given.
Modern world heavily reilies on aircraft, whether it be for personal flighty for regular customers or for the budiness sector.
Regular consumers needs aircraft for a comfortable, secure and fast option to get from one location to another.
In the buisness sector it can be seen as reliable and fast transportion of goods.
These goods could comprise a high amount of small good, that would also fit inside a car, or could itself be bigger than a regular car.
While there are many more reasons the reader himself can think about, why aviation has become indispensable, the negative impact on the environment is hihgly disliked by governments and many consumers.
In order to keep the benefits of aircraft more environmentally friendly alternatives are demanded.
One approach as mentioned in @chap_0_1 is the replacement of current fuel kersoin with hydrogen.
Hydrogen has very specific properties, of which some could be reagrded as hihgly benefical.
Yet, being not aware of some of them, could cause serious damage to humans and surroing environment. 
Besides that there are still many open tasks questions regarding dealing with hydrogen.
More about hydrogen can be found in 
//
// TODO
// @chap_2_0 .
The point is, finding an alternative fuel for aerospace is of high importantce.
However, in the case of hydrogen, gaining knowledge how to work with hydorgen can be reqraded equally import as finding an alternative fuel.
The latter is because of the wide application fields of hydrogen. 
Considering only the mobility sector, hydrogen could power, among others, ships, motor cycles, cars, vans, helicopters, trains and quadcopters.
Be it the mobility industry or the energy sector, subtle mistakes could cause big damage and thus a deeper exploation on hydrogen is required for more than just aviation.

Furthermore, based on used literature for this thesis, the author can state the following. 
Important information for a domain x can be found within a sseimgly unrelated y.
Consequently, domains that might not have a direct link, can help each other to make progress.

Next, #gl_("swith", pl:true) are a quite new field of research. 
While its main idea is to be an answer to the current environmental situation, it does this in a noteable way.
Because the tanks and the wing are connected, #gl_("swith", pl:true) try to fully exploit given space and not waste any.
On the contrary, utilizing hydrogen tanks soley for the purpose of fuel provider, would not alleviate the load that the wing experinces.
So the #gl_("swith") aims to fulfill two purpopses, that is, providing fuel and alleviating wing loads.

The focus of this work is primarily scientific, aiming to advance our understanding of #gl_("swith") technology and its potential applications in aerospace. 
However, it's crucial to recognize that scientific research in general requires financial backing to be carried out effectively. Nations that demonstrate the capability and commitment to fund research into such novel, promising, and complex endeavors may position themselves to gain numerous benefits beyond the immediate scientific outcomes.
Some of these benefits are presented in @chap_0_5

/* --------------------------------- summary -------------------------------- */

#summary_([
Aviation has become an indispensable part of the global economy, serving both personal and business sectors with fast, reliable transportation. However, its negative environmental impact necessitates research into alternative, more environmentally friendly fuels. Hydrogen emerges as a promising candidate, not only for aviation but across various sectors, making research in this area broadly valuable. In this context, #gl_("swith", pl:true) represent a novel approach. 
The hydrogen tanks not only store the fuel, but also are an active part of the wing such that loads across wing and hydrogen tanks are shared.
This innovative design aims to optimize space usage and potentially increase wing stiffness, showcasing how scientific ingenuity could address multiple challenges simultaneously.
]
)

// add some vertical spacing inshallah
#v(default_Font_Size)


