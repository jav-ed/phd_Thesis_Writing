/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

== State of The Art <chap_0_7>
// TODO -
// adapot the section's intrudcion based on the content found
In this section, inially a complete defintion for the term #gl_("swith", long:true) shall be given.
After that it is shall be explained in detail where the differences are to already commerical available aircraft.
Next, the key benefits shall given.
After reading this seciton the reader should be clearly informaed about, wheter #gl_("swith", pl:true) are currently available or not.
Next, it shall be explained where the difficulties for the theoretical certification process.
Afterwards, some concrete difficulties occur when attempting to conduct a expemrintally strcutral validtion test that shall be used for an actual certification.

/* -------------------------------------------------------------------------- */
This work deals with #gl_("swith", pl:true), which can be described as a new configuraiton for an aircraft. 
The novely lies how the wing is manufactured and designed. 
Namely, the wing is one structuraly conected part with the hydrogen tanks that are palced within the wing.
An illustraitve how such a #gl_("swith") could look like was provided in @fig_1.
Because of the structural connection the wing and the tubes can be thought of one single strucutral component of the aircraft.
While it would be possible to have #gl_("swith") that are driven through fliud hydrogen, this thesis focus soley on the gaseous version.
The #gl_("swith") is more than just an scientific idea such that APUS @APUS_0 a company that build aircrafts attempts to make the first #gl_("swith") commericaly available with the i2 @APUS_1.
Because of the demand to actually get this aircraft sold to the public, we need to also look at real world deamnds.
When it comes to the range of flight, the demand is too have as much hydrogen stored inside the tanks as possible.
Because we are focusing on gasous hydrogen, we have two options. 
Either increasing the dimensions of the tanks or comipressing the gas.
Increasing the dimensions is rather, diffculkt, because of very possible constraints of other disciplines.
Making the tubes big in dimension would add mass, which is a very cruical factor for the strucutral discipline. 
Any change in the shape or dimension of the tubes would necessitate in changing the wing shape and dimension as well, due to the fact that they need to be strutrally connected.
The wing is by far the most important part for creating the aerodynmical force.
Any change of the wing, would directly impact the lift distirbution.
While there are many more reasons why the dimension of the tubes cannot be changes that easily, are supposed to suffice for highlighing the difficulty in increasing the tubes dimensions.

The second method to increase the capacity of hydrogen that the tubes can carry is through compression. Having a fixed given volume for the tubes, adding high pressure into the tanks allows to store more hydrogen compertively. In order to maximize the flight range for an economically valueable #gl_("swith") a very high tank pressure is desired. However, the the strucutre that is under pressure should ensure a secure storing and operting service. Thus, the choice of the magnitude of the pressure is constrianed among others by the material properties.

With the reasoning provided above, it can be said that for commerical and ecnomically attractive #gl_("swith",pl:true), the stucture-integrated hydrogen tanks are under high pressure. Because of this high pressure and the structral connectivity of the wing and the tanks, the pressure loads from the tanks are shared with the wing.
On the other hand, the aerodynamic loads that act on the wing are shared with the tanks. So the concept of a #gl_("swith") fulfills a dual prupoise, that is, store the fuel and load sharing between wing and tanks. 
One big advantage of this configutation is the leverage of the available space within the aircraft.
In contrast to that none strucutre integrated hydrogen tanks are placed within the aircraft. 
While they could be placed within the wing, mostly they are placed within the fueselage. Their mean difference to #gl_("swith", pl:true) is do not serve a dual purpose. Non strcutre intregral hydrogen tanks only store fuel without structrally alleviating any other part of the aircraft, that is, they do not share loads with any other part of the aircraft.
Another approach is to integrate the tanks not within the wings as with #gl_("swith", pl:true), but inside the fusellage. 
Some variations for that are given in @fig_2.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Fuselage_Integration.jpg", 
  width: 100%),
  caption: [Demonstrative example of how fuselage strucutre integrated hydrogen tanks could look like @Adler2023.],
) <fig_2>


In the scneario of fueselage integrated hydrogen tanks, the tanks would also carry loads, but because of the shape of regular tube-and-wing configuration, the loads experinced within the fuesellage would be much lower than in the case of a #gl_("swith").
The main advantage of hydrogen powered aircrafts is to reduce the negative environmental impact that kersoine driven aircrafts have. This is what all hydrogen variations, wheter it be, non strucutre integrated, fuselage sutructre integrated or wing strucutre integrated (#gl_("swith")), have in common.
Another point that at least the two strucutre integrated vairations have it that they are niche field.
However, by doing literature research it stands out that there is compertively much more work on fuselage integrated hydrogen tanks than on #gl_("swith", pl:true).
In the time of writing this thesis, the author of this thesis could find only one public available scnieitfic paper that deals with wing integrated high-pressue gaesous hydrogen tanks @Friedmann2023.
Besides patents like @Scheffel2015 from APUS @APUS_0, the paper itself does not mention any other scientifc work that would deal with #gl_("swith", pl:true).

Due to the scarictiy of openly available scientific work on #gl_("swith", pl:true) and the fact that there are not many aircraft manufacturers that can display a working #gl_("swith"), it can be assumed that the manufacuring industry will also face diffculties in the manufacuring process.
The main obstacle that could be observed is that it is hihgly changeling to procude a single part that contains the wing and the tubes.
Considering the openly available information provided by APUS @APUS_1, it can be observed that the full length of the wings are 13.2 meters.
However, the structral integrated part of the wing can be assumed to be close to the half. 
So, from first impression we might demand the tube length to be around 7 meters.
Generally, we can say, with a given pressure, the higher the length of the tubes are the more hydrogen can be stored. 
Thus,  for higher flight ranges, assuming already haven chosen the highest alloweable pressure, even longer tubes could be requierd.
Staying with the 7 meter assumption, we can alrady assume that the manufactures will need to find new methods or improve existing methods to craft such high dimensional and complex structres, while using required materials and obeying manufacturing accuracy demands.
  
  
/* --------------------------------- summary -------------------------------- */
#summary_([
In summary it can be said all hydrogen powered aircraft concepts have the same main goal, that is, reude the negative environmental impact.
Integrating hydrogen tanks structrally allows to leverage the tanks in a dual sense. The hydrogen tanks not only store the hydrogen, but they also share the load with the attached strucutre component.
While writing this work, there are two different types of strucutre integrtated approached, fuselage and wing.
For wing integrated high-pressure hydrogen tanks there is a lack of availability of scientifc papers, which offeres both, advantages and disadvantges. The lack of current available scientifc work first gives more value to the research field of #gl_("swith", pl:true). Second, should encourge more researcher to work on this topic.
The drawback however is the scientists have less prework that they can rely on.

])