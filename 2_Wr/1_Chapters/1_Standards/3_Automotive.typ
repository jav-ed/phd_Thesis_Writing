/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Word rep ins. done

// Title was checked and is fine - inshallah
== Structural Integration of Hydrogen Tanks in the Automotive Industry <chap_1_3>

In the previous @chap_1_2, it was observed that the automotive industry offers significant advancements in hydrogen-driven vehicles. Furthermore, this industry contributes a considerable amount of literature and expertise to the field. The previous @chap_1_2 also highlighted substantial similarities between the hydrogen-driven automotive industry and aerospace. Both fields desire lightweight #gls("cfrp", long:true) tanks to store, among other things, #gls("cgh2", long:true). Due to the value the automotive industry provides to the realization of a #gls("swith", long:true), an in-depth study shall be carried out.
The objective of this section and study is to find publicly available research from the automotive industry that deals with externally loaded #gls("cgh2") tanks. The identified literature needs to be investigated thoroughly to find potentially helpful insights for the experimental structural validation tests of #glspl("swith"). More specifically, this section will address the following: First, if similar studies are found, they will be explained in depth. Subsequently, it will be elaborated whether these findings can be leveraged for experimental structural validation tests of #glspl("swith").


// -------------------------------------------------------------------------- //

The insights obtained from @chap_1_2 can be regarded as one part of the motivation for conducting an in-depth investigation into the automotive industry to find helpful insights for experimental structural validation tests of #glspl("swith"). Nonetheless, additional motivations shall be presented.
First, according to the current state of knowledge, no flying cars are known to exist. Thus, a crucial difference between the automotive industry and aviation remains: aircraft must be able to operate both on the ground and in the air at various flight altitudes, whereas the automotive industry produces road-bound vehicles. Yet, the vehicle industry is ahead of aviation in terms of incorporating new technologies @LopezVega2023 @Rizvi2023. This includes advancements in autonomous driving @Zhao2024 @Chib2024 @Teng2023, object recognition @Caro2023 @Liu2024a @Wang2023, and drive mode assistance @Suganthi2023 @Monk2023 @Hong2024. The same applies to hydrogen-powered vehicles, as indicated in @fig_9.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/2_Mobility/0_Readinesslevel.png", 
  width: 77%),
  caption: [#text(weight: "bold")[T]echnical 
#text(weight: "bold")[R]eadiness 
#text(weight: "bold")[L]evel (TRL) of hydrogen applications in the mobility sector. Image adapted and translated to English from @Schmidt2020[p.~436].],
) <fig_9>

There are already hydrogen cars approved for traffic @link_hyundai_nexo_img @link_hyundai_ix35_img @link_toyota_mirai_ii_img @link_honda_clarity_img @link_mercedes_glc_img, as demonstrated in @chap_1_2. This raises the justified question of whether there are already initial concepts for externally loaded structural integral #gls("cgh2") tanks in the automotive industry. 
One of the main reasons for aviation lagging behind is that it has numerous and demanding approval and quality requirements. Furthermore, aircraft are significantly larger in dimensions than cars, resulting in high costs for planning and manufacturing. Consequently, there are comparatively few manufacturers and less competition. Even if there were meaningful competition, building aircraft remains a highly complex and interdisciplinary achievement. While acknowledging that road vehicles are also interdisciplinary, aircraft design, manufacturing, and approval require substantially more time from concept to finished product than is necessary for road vehicles.
In the literature, one contribution could be found that describes the use of structural integral tanks in automobiles @Bleser2012. In this work, the torque stiffness of the body was to be increased with the help of #gls("cfrp") tanks. This is mainly due to the closed form of the hydrogen high-pressure cylinder. It is mentioned that Opel carried out a first preliminary test. In this test, tension bands were wrapped around the tanks, as shown in @fig_5. In this configuration, the introduction of moments and longitudinal forces is only possible to a limited extent.


#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/2_Mobility/1_KFZ_Tanks.png", 
  width: 77%),
  caption: [Tank configuration of Opel's HydroGen4 project @Bleser2012.],
) <fig_5>

The tension bands press the cylinders against the carrier system. If a longitudinal force were to be exerted on a cylinder, the only resistance to displacement would be the frictional force. The same applies for a moment around the longitudinal axis. Such a moment would cause rotation around the longitudinal axis of the cylinders. Analogously, only frictional force would generate resistance in this case as well.
To introduce torque that a body experiences onto a tank, two #gls("lie", long:true) are utilized. The concept proposed in @Bleser2012 is shown in @fig_6.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/2_Mobility/2_KFZ_Tanks.png", 
  width: 100%),
  caption: [Automotive concept for torque transfer from vehicle body to integral hydrogen tank @Bleser2012.],
) <fig_6>

The shells connect the pressure vessel and a load-bearing part of the car's body. These shells, which act as #glspl("lie"), can transfer any torque experienced by the car's body to the pressure vessel and vice versa. The connection between the shells (or #glspl("lie")) and the hydrogen tanks is a friction-locked connection created using clamping ring bands. 
This concept certainly represents a possibility to introduce torque into #gls("cgh2") tanks. Critically, it requires that the clamping rings can generate sufficiently strong pressures to maintain grip or adhesion between the tanks and the shells. Force transmission via friction is only possible if proper contact between the tanks and the shells is established.
A potential source of danger could be the magnitude of the occurring torque. In the case of very high torque, the pressure acting on the clamping ring bands, which ensures load transfer, needs to be increased accordingly. In turn, by doing so, the clamping pressure could become too high for the #gls("cgh2") tanks to sustain.
To aid in understanding this concept, additional information shall be provided via static friction illustration. The static friction is given in @eq_0, where $H$, $mu$, and $N$ are denoted as static friction force, static friction coefficient, and normal force, respectively.

$  H <=  mu N $<eq_0>


The torque causes a circumferential force that would induce sliding between the hydrogen tanks and the #glspl("lie"). However, to prevent this sliding between the shell and the tank, the ring clamping force acting perpendicular to the circumferential force must be sufficiently high.
Due to friction, the circumferential force invokes the static friction force $H$. Assuming a static relationship, where no movement is allowed, this explanation can be expressed mathematically as @eq_1, where $F_t$ stands for the circumferential force.

$  F_t = H and  H <=  mu N $<eq_1>

The static friction force $H$, as described in @eq_0, allows for the creation of a relationship between two perpendicular forces: the static force $H$ itself and the normal force $N$. While the friction force $H$ acts in the opposite direction of the circumferential force $F_t$, they must be equal in magnitude.
Moreover, based on the current understanding of physics, if one force acts in a particular direction, another force of equal magnitude but opposite direction (rotated 180 degrees) must exist to maintain a stationary condition; otherwise, movement will occur. Thus, the normal force $N$ and the ring clamping force $F_c$ must point in opposite directions while having the same magnitude.
This explanation is made visually apparent through @fig_14.


#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/2_Mobility/1_Forces.svg", 
  width: 37%),
  caption: [Visualization of the relationships between circumferential force $F_t$, static friction force $H$, ring clamping force $F_c$, and normal force $N$.],

) <fig_14>


The static friction force $H$ itself is composed of the normal force $N$ and a friction coefficient $mu $, which is usually significantly smaller than 1 @Gross2019. For stationary evaluation, the condition is: $F_t = H = mu N$. If the equation is rearranged, the following can be concluded:

$ N = F_t / mu  = H/ mu $<eq_2>


From @eq_2 and considering that $μ << 1$, it is evident that the required normal force $N$ can reach markedly high magnitudes. Consequently, the ring clamping force $F_c$ attains the same substantially high magnitudes.
Applied to the concept shown in @fig_6, it must be ensured that the normal forces (in radial direction) do not become too high for the tank, which could, among other effects, cause buckling of the tank @Rossow_2014 @Parello2024 @Chen2024. Conversely, if the normal force is too small, the consequence would be a weakened, possibly negligible, transfer of torque to or from the #gls("cgh2") tanks.
Furthermore, upon closer examination of @fig_6, it can be observed that each of the two clamping ring bands exerts pressure on only a small percentage of the tank's available area. 
As a result, the area connecting the tank with the shells is limited. Increasing the dimensions of the clamping ring bands and ensuring they can exert pressure over a larger area of the shells could offer two benefits. First, when high torque needs to be transferred, effects occurring due to local overloading can be prevented. Second, a more reliable connection between the shells and the tanks can be expected.
Moreover, @Bleser2012 illustrates different possible positions where the #gls("cgh2") tanks could be placed and connected with the body of the car. 
They also demonstrate the impact of shell geometries on mass and stiffness. 
Finally, the experimental investigation is briefly mentioned.

It can be seen that the automotive industry also had a similar idea of not only using hydrogen tanks as fuel providers but leveraging them as an integral part of the load-bearing car structure. The reviewed work from the automotive industry introduces the idea of potentially using #gls("cgh2") tanks as torque-bearing vessels in aerospace as well. However, the insights obtained from @Bleser2012 cannot be directly applied to an experimental structural validation test of #glspl("swith").

In addition to academic literature, the field of patents could offer potential insights for experimental structural validation tests of #glspl("swith"). Given that #glspl("swith") exhibit a pioneering concept, and adherence to proper scientific work ethics necessitates the utilization of all publicly available resources, it is prudent to examine and present research findings from patents as well.
// --------------------------------- patents -------------------------------- //
The patent research offered some information about existing concepts similar to #gls("swith"). Two German patents from the automotive industry are particularly noteworthy in their pursuit of load-bearing pressure cylinder concepts. The first, published by BMW in 2015 @Stahl2017, suggests constructing the first longitudinal structure as a pressure cylinder capable of absorbing both fuel and external forces. However, according to the description on Google Patents @Stahl2017, this patent was withdrawn, possibly due to the novelty and complexity of such an endeavor.
The second patent, published by Audi in 2017 @ChristophBechtold2019, addresses motor vehicles with pressure cylinders. The patent description explicitly states that the pressure cylinder should be able to absorb both forces and moments within the motor vehicle. The concept involves introducing loads into the rigid pressure cylinder via pole caps attached at the ends. The sketch from this patent is depicted in @fig_7. According to Google Patents @ChristophBechtold2019, the patent remains active until its expiration on December 14, 2037.


#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/2_Mobility/25_Patent.png", 
  width: 77%),
  caption: [Schematic sketch of the load-bearing pressure cylinder design @ChristophBechtold2019.],
) <fig_7>


Similar to the academic paper @Bleser2012, the cited patents clearly indicate that the automotive industry is interested in load-bearing structurally integral tanks. 
Upon further consideration, these automotive concepts could potentially inspire additional load cases for integrated tanks in aerospace applications. 
However, neither academic papers nor patent descriptions from the automotive industry provide direct additional valuable insights for experimental structural validation tests of #glspl("swith").
For completeness, it shall be stated that patents from the field of aviation were already covered in @chap_0_7. The only relevant patent to highlight again is @Scheffel2015. While @Friedmann2023 names 7 patents, only 2 of them could be found, which might be due to the fact that the other five predate 1939.


// -------------------------------------------------------------------------- //
#summary_([
In summary, academic work in the automotive industry reveals common aims with aerospace regarding structural integral hydrogen tanks. It is evident that these tanks are of interest not only for aviation but also for automotive applications. Nevertheless, the available literature in this field is scarce, mirroring the limited research in aerospace.
The sole academic paper found in the automotive sector @Bleser2012 focused on utilizing hydrogen tanks as torque absorbers.
Regrettably, details were sparse, especially regarding the experimental section.
Consequently, based on the current state of research, no significant added value could be derived from automotive academic literature for certification-oriented experimental structural validation tests of #glspl("swith").
While additional patents aimed at using tanks as load-bearing structural integral parts were identified, their descriptions did not contain substantial additional information for experimental structural validation tests of #glspl("swith"). This further underscores the need for more comprehensive research in this area across both industries.
])