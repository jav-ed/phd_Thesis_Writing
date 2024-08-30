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
//
// TODO
// @chap_2_0 .
Once a rough understanding of #gl_("swith"), pronounced sweets, is obtained, the motivation behind this work shall be explained in @chap_0_2.
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
The obvious approach would to devote a secure space to storing the hydrogen tanks within the aircraft.
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
  caption: [ Illustrative example of a wing of a #gl_("swith")],
) <fig_0>


When working with #gl_("swith", pl:true) it is very improtant to understand which implications are obtained through the key difference between regular aircraft or non wing structure-integrated hydrogen tank aircraft.
For the both latter versions, the forces that the aircraft has to bear can be assumed to be very simmilar.
Placing hydrogen tanks securely in the aircraft, requires mofiying space arrangement and chances the mass distribution. 
However, both versions would not add high pressures to the wing like it is the case for #gl_("swith", pl:true).
Due to the very hihg pressures of the hydrogen tanks the wings of the #gl_("swith", pl:true), besides the usal aerodynamical load, the newly added pressure load must be considered.
If the pressure is very high, it might be the case, that the pressure load have bigger structral impact on the wing than the aerodynamical load.
Among others, the latter insight must be incorporated in numericla simualtions, in certiifcations standards and in conducting experimental strucutral validation tests.


