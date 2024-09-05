/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

== State of The Art <chap_0_7>

This section presents an overview of #gl_("swith", pl:true). Initially, a detailed definition of #gl_("swith", long:true) shall be provided. The section then shall examine whether #gl_("swith", pl:true) are purely a scientific concept or if they are being attempted to be manufactured in the real world for commercial purposes. Other existing approaches for utilizing hydrogen as fuel in aircraft shall be addressed, highlighting the differences between these approaches and #gl_("swith", pl:true).
Subsequently, the key benefits of #gl_("swith", pl:true) shall be outlined, followed by a short analysis of potential drawbacks associated with this pioneering approach. By this point, the differences between #gl_("swith", pl:true) and currently available commercial aircraft should be evident. After reading this section, the reader should clearly understand what #gl_("swith", pl:true) are, their main purposes, and how they differ from other existing approaches.
/* -------------------------------------------------------------------------- */

This work focuses on #gl_("swith", pl:true), which represent a novel configuration for aircraft design. The innovation lies in the manufacturing and design of the wing and the hydrogen tanks. 
Concretely, the wing is structurally integrated with hydrogen tanks that are placed within the wing, forming a single structural component of the aircraft. An illustrative example of a #gl_("swith") is provided in @fig_1. Note that while it would be possible to have #gl_("swith", pl:true) that utilize liquid hydrogen, this thesis focuses solely on the gaseous version.
The concept of #gl_("swith", pl:true) has progressed beyond a mere scientific idea. APUS @APUS_0, an aircraft manufacturing company, is attempting to make the first #gl_("swith") commercially available with their i2 model @APUS_1.
A visual depiction of the i2 is given in @fig_2.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/1_Apus_Img.png", 
  width: 50%),
  caption: [Visualization of the APUS i2, demonstrating the practical application of #gl_("swith", pl:true) in commercial aircraft design @APUS_Image.],
) <fig_2>


Due to the goal of bringing this aircraft to market, real-world demands must be considered. A primary concern is the range of flight 
@butt2021development @Viswanathan2022, which necessitates storing as much hydrogen as possible within the tanks @Muthukumar2023.
Given the focus on gaseous hydrogen @Manigandan2023 @Yusaf2024 @Meissner2023, two main options exist for increasing storage capacity: enlarging the tank dimensions or compressing the gas. However, increasing the dimensions presents significant challenges due to constraints from various disciplines. Larger tubes would add mass, a crucial factor in structural design. 
Moreover, any change in the shape or dimensions of the tubes would necessitate corresponding changes to the wing shape and dimensions, as they are structurally connected. The wing, being the primary generator of aerodynamic force, is highly sensitive to such changes. Any modification ofn the wing would directly impact the lift distribution
@McLean2014 @McBain2012 @Schuetz_2023 @Hucho2012 @Sigloch2022. 
While there are numerous additional reasons why altering the tube dimensions is problematic, these examples suffice to highlight the complexities involved in increasing storage capacity through dimensional changes.

/* -------------------------------------------------------------------------- */

The second method to increase the hydrogen capacity of the tubes is through compression
@Muthukumar2023 @Klell2023 
. With a fixed volume, increasing the pressure within the tanks allows for comparatively greater hydrogen storage. To maximize the flight range of an economically viable #gl_("swith"), a very high tank pressure is desirable. However, the pressurized structure must ensure secure storage and operational safety. Consequently, the magnitude of pressure is constrained, among other factors, by material properties @Cheng2024 @Bagarello2024.
Given the reasoning above, it can be concluded that for commercial and economically attractive #gl_("swith", pl:true), the structure-integrated hydrogen tanks are subject to high pressure
@Klell2023 @Cheng2024 @Bagarello2024
. Due to this high pressure and the structural connectivity between the wing and the tanks, the pressure loads from the tanks are shared with the wing. Conversely, the aerodynamic loads acting on the wing are shared with the tanks. Thus, the concept of a #gl_("swith") serves a dual purpose: fuel storage and load sharing between wing and tanks @Adler2023.

A significant advantage of this configuration is the efficient utilization of available space within the aircraft. In contrast, non-structure-integrated hydrogen tanks are typically placed within the aircraft, often in the fuselage 
@Eissele2023 @Prewitz2023 @Huete2022 @Cipolla2022 
, although they could potentially be located within the wing @Huete2021. 
The key distinction is that these non-structure-integrated tanks do not serve a dual purpose. They solely store fuel without structurally alleviating any other part of the aircraf. In other words, they do not share loads with other aircraft components.

An alternative approach involves integrating the tanks within the fuselage rather than the wings, as is the case with #gl_("swith", pl:true). Illustrative variations of this approach are given in @fig_3. 

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Fuselage_Integration.jpg", 
  width: 100%),
  caption: [Demonstrative example of how fuselage structure-integrated hydrogen tanks could look like @Adler2023.],
) <fig_3>


In the scenario of fuselage-integrated hydrogen tanks
@Onorato2022 @Huete2021  @Baroutaji2019   @Verstraete2013 @onorato2021fuel   @verstraete2009potential   
, the tanks contribute to load-bearing. However, due to the conventional tube-and-wing configuration, the loads experienced within the fuselage are significantly lower than in a #gl_("swith") design. 

In addition to aerodynamic loads, conventional aircraft wings bear substantial localized forces from mounted components such as engines and landing gear. #gl_("swith", pl:true)  present a unique advantage in this context. By integrating high-pressure hydrogen tanks within the wing structure, #gl_("swith", pl:true) facilitate a more distributed load-bearing system. This integration enables the hydrogen tanks to partly alleviate the wing structure from the concentrated loads imposed by these attached components.

/* -------------------------------------------------------------------------- */
That being said, the primary advantage of hydrogen-powered aircraft is the mitigation of negative environmental impacts associated with kerosene-driven aircraft. This advantage is consistent across all integration methods: non-structure integrated, fuselage-structure integrated, and #gl_("swith").

Both structure-integrated variations constitute niche fields within aerospace engineering, as evidenced by a review of the literature. However, when comparing the two approaches, it is observed that there is substantially more publicly available research on fuselage-integrated high-pressure tanks than on #gl_("swith", pl:true). 
At the time of this thesis's composition, only one publicly available scientific paper addressing wing-integrated high-pressure gaseous hydrogen tanks was identified @Friedmann2023. This paper cites multiple patents related to #gl_("swith", pl:true), including @Scheffel2015 from APUS @APUS_0. Beyond these patents, the paper does not reference any additional scientific work concretely addressing #gl_("swith", pl:true).


The scarcity of openly available scientific work on #gl_("swith", pl:true), coupled with the limited number of aircraft manufacturers capable of demonstrating a functional #gl_("swith"), suggests that the manufacturing industry could face significant challenges in the production process. A primary obstacle could be the complexity of producing a single component that integrates both the wing and the tubes.
According to publicly available information from APUS @APUS_1, the full wingspan is 13.2 meters. From the visual depiction provided in @APUS_1, it can be assumed that the structurally integrated portion of the wing comprises approximately half of this length, suggesting a tube length of around 7 meters. Generally, with a given pressure, longer tubes allow for increased hydrogen storage capacity. 
Consequently, for extended flight ranges and assuming the highest allowable pressure has already been selected, even longer tubes may be required.
Based on the 7-meter assumption, it is plausible that manufacturers could need to either develop novel methods or significantly improve existing techniques to craft such large-scale and complex structures. This process must adhere to the required material specifications and manufacturing accuracy demands, potentially presenting a considerable engineering challenge.
  
  
/* --------------------------------- summary -------------------------------- */
#summary_([
In summary, all hydrogen-powered aircraft concepts share the same primary objective: the reduction of negative environmental impact. The structural integration of hydrogen tanks offers a dual advantage. These tanks not only store hydrogen but also share the load with the attached structural components. At the time of writing, two distinct approaches to structural integration have been identified: fuselage-integrated and wing-integrated.

The field of #gl_("swith", pl:true) is characterized by a scarcity of scientific literature. This paucity of research presents both advantages and challenges. On one hand, it enhances the value and supports the novelty aspect of the #gl_("swith") research. Hence, this situation underscores the need for further investigation into #gl_("swith", pl:true), potentially encouraging more researchers to explore this topic.
Conversely, the limited availability of prior work means that scientists have a reduced foundation of existing research upon which to build. As a result, it could pose initial challenges that need to be overcome in the pursuit of sustainable aviation.

])