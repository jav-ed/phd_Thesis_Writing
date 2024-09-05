/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

=== II.5 Preliminary Development of a Structural Integral Tank from Automotive Engineering

This section will explain why findings from automotive engineering could make an important contribution to K2H2. This will be done using a published work that dealt with integral body hydrogen tanks. First, the work will be briefly reported on, in order to be able to evaluate afterwards whether and to what extent this work allows the extraction of additional knowledge for K2H2.

Besides space technology, the automotive industry represents a possible alternative for adhering to known standards. According to the current state of knowledge, no flying cars are known. Thus, a significant difference between the automotive industry and aviation is that aircraft must be able to operate both on the ground and in the air at different flight altitudes. In contrast, the automotive industry produces road-bound vehicles. The vehicle industry is ahead of aviation in terms of incorporating new technologies, such as autonomous driving, object recognition, and voice control. The same applies to hydrogen-powered vehicles. There are already hydrogen cars approved for traffic. This raises the justified question of whether there are already initial concepts for structural integral hydrogen storage in automobiles. One of the main reasons for aviation lagging behind is that aviation has very many and demanding approval requirements and quality requirements. Furthermore, aircraft are significantly larger in dimensions than cars. This results in high costs for planning and manufacturing. Consequently, there are comparatively few manufacturers and less competition. Even if there were a lot of competition, building aircraft is a highly complex and interdisciplinary intertwined achievement. From concept to finished product, it requires significantly more time expenditure than is necessary for road vehicles.

In the literature, a work could be found that describes the use of structural integral tanks in automobiles @Bleser2012. In this, the torsional stiffness of the body was to be increased with the help of CFRP tanks. The latter is mainly due to the closed form of the hydrogen high-pressure cylinder. It is mentioned that a first preliminary test was carried out by Opel. In this, tension bands were wrapped around the tanks, as shown in @fig_5. In this configuration, the introduction of moments and longitudinal forces is only possible to a limited extent. The tension bands press the cylinders against the carrier system. If a longitudinal force were to be exerted on a cylinder, the only resistance to displacement would be the frictional force. The same applies to torsion. The torsion would cause a rotation around the longitudinal axis of the cylinders. Analogously, it would only be a frictional force that would generate resistance.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/1_KFZ_Tanks.png", 
  width: 100%),
  caption: [Tank configuration from the HydroGen project by Opel from @Bleser2012],
) <fig_5>



To now introduce a torsion that a body experiences onto a tank, load introduction elements are needed. The concept proposed in @Bleser2012 is shown in @fig_6. The sheets are said to be connected to the body, which experiences a torsional moment. Through the sheets, which function as load introduction elements, the torsional moment can be appropriately passed on with a suitably designed sheet and hydrogen tank connection. The sheet-hydrogen tank connection is a friction-locked connection and is created using clamping rings. The concept certainly represents a possibility to introduce torsional moments into tanks. However, it is assumed that the clamping rings can generate sufficiently strong pressures for force transmission via friction. A source of danger here could be that occurring torsional moments are so high that a correspondingly high required ring pressure becomes too high for the tanks. To make this as easy to understand as possible, the present topic should be illustrated via static friction. The static friction is given in equation (1), where Ft, H, μ, and N stand for torsional force, static friction force, static friction coefficient, and normal force.

Ft = H ≤ μN (1)


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/0_Standards/2_KFZ_Tanks.png", 
  width: 100%),
  caption: [Concept from the automobile for introducing a torsional moment from the body to the integral hydrogen tank @Bleser2012.],
) <fig_6>


The torsion causes a circumferential force. For the circumferential force not to cause sliding between the sheet and the tank, the torsional force must not be greater than the static friction force. The static friction force itself is composed of the normal force and a friction coefficient, which is usually significantly smaller than 1. For simplified consideration, let's assume: Ft = H = μN. If the equation is rearranged, the following can be concluded.

N = FT / μ (2)

From equation (2) and with μ « 1, it becomes clear that the necessary normal force, depending on the friction coefficient, can turn out to be many times higher than the circumferential force. Transferred to the concept shown in @fig_6, it must be ensured that the normal forces (in radial direction) do not turn out to be too high for the tank (buckling of the tank). In the case of normal forces that are too small, the consequence would be a weakened to negligibly small transfer of the torsional forces. In @Bleser2012, different possible positions for the installation of the tanks with the shells are depicted and evaluated. It also shows for some cases what influence the shape of the shell has on the stiffness. Finally, the experimental investigation is discussed in a short section.

In summary, it can be said that the investigation in @Bleser2012 also aims to use the tank not only as a fuel storage. However, on the one hand, the main focus of the work is on a torsional load introduction. On the other hand, the information provided was quite sparse. This was particularly noticeable in the experimental part, so that according to the current state, no lucrative added value could be drawn from said work.