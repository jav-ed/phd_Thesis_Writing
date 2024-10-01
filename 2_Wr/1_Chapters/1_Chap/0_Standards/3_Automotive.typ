/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// TODO proper title
=== Structural Integral Tanks In Automotive <chap_1_0_4>

In previous @chap_1_0_3 it could be observed that espeically the automtive industry offers advancement in hydrogen-driven vehicels.
Furthermore the automtive industry contributes with a considerable amount of literature and expertise to this field.
In  previous @chap_1_0_3 it could also be seen that there is a substrional similatiry between the hydrogen driven auotmotive industry and aerospace.
Both fields desire light #gl_("cfrp") tanks to store among other #gl_("cgh2", pl:true).
Because of the provided value of the automtive industry to the realization of a #gl_("swith", long:true), a in depth study shall be cariied out.
The objective for this subsection and this study it to find public available work from the auotmotive industry that deals with external loaded #gl_("cgh2") tanks.
The found work needs to be investigated in depth to find potential helpful insights for the experimenteal strucutral validation tests of #gl_("swith", pl:true).
More concretely, this subsection should contain the following.
First, if simmilar work could be found the work needs to be explained in depth.
Next, it shall be elaborated on wheter the found work can be leveraged for experimenteal strucutral validation tests of #gl_("swith", pl:true) or not.
// -------------------------------------------------------------------------- //

The insights obtained from @chap_1_0_3 can be regarded as one part of the motivation for doing a indepth investigation in the auotmotive industry for finding helpful insight for an experimenteal strucutral validation tests of #gl_("swith", pl:true).
Nonetheless, some additional motivations shall be given.
First, according to the current state of knowledge, no flying cars are known. Thus, a significant difference between the automotive industry and aviation remains. Namely, that the aircraft must be able to operate both on the ground and in the air at different flight altitudes. 
In contrast, the automotive industry produces road-bound vehicles. 
Yet, the vehicle industry is ahead of aviation in terms of incorporating new technologies @LopezVega2023 @Rizvi2023, such as autonomous driving 
@Zhao2024 @Chib2024 @Teng2023, object recognition
@Caro2023 @Liu2024a @Wang2023, and 
drive mode assistance @Suganthi2023 @Monk2023 @Hong2024.
The same applies to hydrogen-powered vehicles as indicated with @fig_9 through the 
#text(weight: "bold")[T]echnical 
#text(weight: "bold")[R]eadiness 
#text(weight: "bold")[L]evel (TRL).

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/2_Mobility/0_Readinesslevel.png", 
  width: 77%),
  caption: [Technical development status of hydrogen applications in the mobility sector. The image was copied from @Schmidt2020[p.~436] and translated to english.],
) <fig_9>


There are already hydrogen cars approved for traffic @link_hyundai_nexo_img @link_hyundai_ix35_img @link_toyota_mirai_ii_img @link_honda_clarity_img @link_mercedes_glc_img as demosntrated in @chap_1_0_3. This raises the justified question of whether there are already initial concepts for externally loaded structural integral #gl_("cgh2") tanks in the automtive industry. 
One of the main reasons for aviation lagging behind is that aviation has very many and demanding approval requirements and quality requirements. 
Furthermore, aircraft are significantly larger in dimensions than cars. This results in high costs for planning and manufacturing. Consequently, there are comparatively few manufacturers and less competition. 
Even if there were a lot of competition, building aircraft is a highly complex and interdisciplinary intertwined achievement. Acknowledgig the fact that road vehicles are interdisciplinary, still from concept to finished product, aircraft design, manufacturing and approval requires significantly more time expenditure than is necessary for road vehicles.

In the literature, one contribution could be found that describes the use of structural integral tanks in automobiles @Bleser2012. In this, the torsional stiffness of the body was to be increased with the help of #gl_("cfrp") tanks. 
The latter is mainly due to the closed form of the hydrogen high-pressure cylinder. It is mentioned that a first preliminary test was carried out by Opel. 
In this, tension bands were wrapped around the tanks, as shown in @fig_5. In this configuration, the introduction of moments and longitudinal forces is only possible to a limited extent. 


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_KFZ_Tanks.png", 
  width: 77%),
  caption: [Tank configuration from the HydroGen project by Opel from @Bleser2012.],
) <fig_5>

The tension bands press the cylinders against the carrier system. If a longitudinal force were to be exerted on a cylinder, the only resistance to displacement would be the frictional force. 
The same applies for a moment around the longitudinal axis. 
The moment would cause a rotation around the longitudinal axis of the cylinders. Analogously, it would only be a frictional force that would generate resistance.


To now introduce a torsion that a body experiences onto a tank, two #gl_("lie", long:true) are utlized. The concept proposed in @Bleser2012 is shown in @fig_6. 
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/2_KFZ_Tanks.png", 
  width: 100%),
  caption: [Concept from the automobile for introducing a torsional moment from the body to the integral hydrogen tank @Bleser2012.],
) <fig_6>

The shells are connecting the pressure vessel and a load-bearing part of the var's body.
The shells, which acts as #gl_("lie", pl:true), can transfer any torsional moment experinced by the car's body to the pressure vessel and vice versa. 
The connection between the shells or #gl_("lie", pl:true) and the hydrogen tanks is a friction-locked connection and is created using clamping ring bands. 
The concept certainly represents a possibility to introduce torsional moments into #gl_("cgh2") tanks. 
However, it requires that the clamping rings can generate sufficiently strong pressures such that a grip or adhesion between the tanks and the shells is maintined.
Only if a proper contact between the tanks and the shells is given, force transmission via friction is possible. 
A source of danger here could be the magnitude of the occurring torsional moments.
In case of very high torsional magnitudes the pressure that acts on the clamping rings and ensures the load transfer is possible, needs to be increased accordingly.
By doing so, the clamping pressure could become too high for the #gl_("cgh2") tanks.
To help in understnading this concept better additional infromaiton shall be given via staic friction illustration. 
The static friction is given in @eq_0, where $H, mu$, and $N$ are denoted as static friction force, static friction coefficient, and normal force, respectively.

$  H <=  mu N $<eq_0>


The torsion causes a circumferential force that would cause a sliding between hydrogen tanks and #gl_("lie"). However, for the circumferential force not to cause sliding between the shell and the tank, the ring clamping force that acts perpendicular to the circumferential force needs to be accordingly high.
The ring clamping force is the normal force $N$ from @eq_0 and needs to widthstand the  circumferential force, which is the static friction force $H$ from @eq_0 . This explanaiton can be expressed mathematically as @eq_1, where $F_t$ denotes the circumferential force.

$  F_t = H and  H <=  mu N $<eq_1>

The static friction force $H$ itself is composed of the normal force $N$ and a friction coefficient $mu$, which is usually significantly smaller than 1. For simplified consideration, let's assume: $F_t = H = mu N$. If the equation is rearranged, the following can be concluded.

$ N = F_t / mu  = H/ mu $<eq_2>

From @eq_2 and with $mu << 1$, it becomes clear that the necessary normal force or ring clamping force, depending on the friction coefficient, can turn out to be many times higher than the circumferential force $F_t$. Transferred to the concept shown in @fig_6, it must be ensured that the normal forces (in radial direction) do not turn out to be too high for the tank, which among others could cause buckling of the tank @Rossow_2014 @Parello2024 @Chen2024. 
In the case of the normal force being too small, the consequence would be a weakened to negligibly small transfer of the torsional moment to or from the #gl_("cgh2") tanks.
Furthermore upon closer look at @fig_6 it can be observed that each of the two clamping ring bands is exerting pressure at only a low percentage of tank's available area.
Consequently, the area that connects the tank with the shells is small.
Increasing the dimensions of the clamping ring bands and ensuring that they can extert pressure on more area of the shells could offer two beenfits.
First, when high torision moments needs to be transfered, effects occuring due to local overloading can be prevented.
Second, a more reliable connection between the shells and the tanks can be expected.
Anyhow, @Bleser2012 deomstrates different possible positions where the #gl_("cgh2") tanks could be placed and conencted with the body of the car. 
Next, they also demonstrate which impact shell geometries ha on mass and stiffness.  Finally, the experimental investigation is mentioned in a short section.
It can be seen that the autotmive industry also had a simmilar idea of not only using hydrogen tanks as the fuel provider, but leverage them as a integral part of the load bearing car strcutre.
Yet, the insights obtained from @Bleser2012 cannot be directly used for a experimental strucutral validaiton test of #gl_("swith",pl:true).

Besides academic literature, there is also the field of patens, which could potentially give additional helpful informaiton for experimental strucutral validaiton test of #gl_("swith",pl:true).
Since #gl_("swith", pl:true) are a pioneering desire and proper scientific work ethics requires to make use of all public avialable resources, research results from patens shall be presented as well.

// --------------------------------- patents -------------------------------- //
In principle, patents could provide information about existing concepts similar to #gl_("swith"). Two German patents from the automotive industry state that they want to pursue the idea of a load-bearing pressure cylinder. The first, @Stahl2017 was already published by BMW in 2015. The idea was to construct the longitudinal member as a pressure cylinder so that it could absorb both fuel and external forces. 
According to the description on Google Patents @Stahl2017, the patent was withdrawn.
The other, @ChristophBechtold2019 was published by Audi in 2017 for motor vehicles with pressure cylinders. The patent description explicitly mentions that the pressure cylinder should be able to absorb both forces and moments within the motor vehicle. 
The idea is that the loads are introduced into the rigid pressure cylinder via pole caps attached at the ends. The sketch from the patent is depcited in @fig_7. According to Google Patents @ChristophBechtold2019, the patent expires on 14.12.2037 and is currently still active.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/25_Patent.png", 
  width: 77%),
  caption: [Sketch of the load-bearing pressure cylinder @ChristophBechtold2019.],
) <fig_7>

Simmilar to the academic paper @Bleser2012, the mentioned patents clearly indicate that the automotive industry is interested in load-bearing structurally integral tanks. However, neither academic papers not patent descriptions from the auotmive industry propvide additional valueable insights for experimenteal strucutral validation tests of #gl_("swith", pl:true).
Finally, for completeness, patents from the field of aviation were already mention in @chap_0_7. The only relevant patent here to mention again is @Scheffel2015.
While @Friedmann2023 mentions 7 patents, only 2 of them could be found, which might be due to the fact, that the other five are before 1939.


// -------------------------------------------------------------------------- //
In summary, it academic work in the auotmive shows that aersoapce have comon aims.
It could be observed that structral integral hydrogen tanks are not only interesting for avaition, but also for automotive. Yet, the available literature on this field is very scare similar to the field of aerospace.
The only found academic paper in autotmive @Bleser2012 had its focus focus on utlizing hydrogen tanks as torsion absorber and the information mention did not adress much deatails. The latter particularly noticeable in the experimental part, so that according to the current state, no lucrative added value could be drawn from automtive academic literature for certifacvtion oriented experimenteal strucutral validation tests of #gl_("swith", pl:true).
While more patents with the aim of using tanks as load-beaing structral integral parts, could be found, the patent descrptions as well did not provide additional informaiton for  experimenteal strucutral validation tests of #gl_("swith", pl:true).