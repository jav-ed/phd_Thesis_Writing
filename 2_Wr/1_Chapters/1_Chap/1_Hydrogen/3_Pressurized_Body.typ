/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


===  II.12 Pressurized Bodies with External Dynamic Loading<chap_2_0_3>

Although nothing could be found in the literature about #gl_("swith", pl:true), structurally integral tanks, regardless of the filling medium, can initially be assumed to be tanks with external loading. Through this assumption, a literature search can be conducted to obtain information on the structural behavior of pressurized cylinders with external loading. In this section, some important results in this regard will be presented.

An intensive literature search was conducted on the topic of structural behavior of pressurized bodies with external loading. In @mitsuishi2000dynamic, a dynamic experimental investigation was carried out. For this purpose, a mass of 2.5 tons was dropped from a height of 2 m onto a high-pressure cylinder. This corresponds to an impact energy of 49 kJ, which is comparable to the impact of a vehicle with a mass of 1 ton and a driving speed of 36 km/h. A graphical representation of the experimental setup is given in Figure 19. The investigation was conducted with the following variable parameters:

1. Filling medium: hydrogen and helium
2. Pressure range [7; 35] MPa ≜ [70; 350] bar
3. Tank types III and IV
4. Cylinder position: vertical and horizontal

[Figure 19: Setup of the drop test from @mitsuishi2000dynamic]

The authors of @mitsuishi2000dynamic summarize their results in three main findings:

1. The effect of the pressure force of cylinders with high pressure depends on the direction of the external force. The lateral pressure force of cylinders with high pressure produces higher loads than the external axial pressure force.
2. When the pressure cylinder was subjected to an axial pressure force, tensile stresses occurred in the boundary area between the cylinder dome and the middle part.
3. However, the cylinders tested at high pressure would exhibit such high pressure loads that these would exceed the range assumed for vehicle crash test procedures.

In @perfetto2022numerical, Abaqus was used to model an axial and a lateral impact of a Type III tank. The tank has an aluminum liner made of 6061-T6 and a CFRP winding made of T800/Epoxy with 65% fiber volume fraction. The numerical results were compared with experimental results. It was found that the lateral impact could be simulated much better than the axial impact. The results for the lateral impact would provide acceptable quality. A similar investigation was conducted in @farhood2021low. The aim of this work was to simulate a Type IV tank under low-speed impact loading using Abaqus. The modeling was compared with the force-time curve of an experimental test. A deviation of 8.7% was observed here. In @goto1980studies, it was investigated what to expect for tanks that are located near many other tanks and under light soil. In particular, an attempt was made to experimentally and simulatively replicate the loads occurring due to earthquakes.

The paper @schwer1988response investigates the structural behavior of an aluminum cylinder under high-speed loading. The cylinder was experimentally tested with various internal pressures and different impact energies. Some results were recalculated using the Finite Element Method (DYNA3D) and compared with the experimental results. The author points out that an existing internal pressure has a significant influence on the failure behavior of the aluminum cylinder. The ranges [0; 0.76] MPa and [250; 440] J were experimentally demonstrated. For pressurized cylinders, a rapid and large inward displacement would initially occur, as with non-pressurized cylinders. However, for pressurized cylinders, the latter would be smaller. The second difference is that for pressurized cylinders, after the rapid indentation, a slow outward displacement appears. These findings were obtained using high-speed cameras. To further support them, strain gauges were additionally used. These showed both the large rapid axial inward movement and the following smaller axial compressive strain (rebound movement). The strain response of a pressurized and point-loaded tank would be dominated by the axial strain during the initial inward deformation and by the circumferential strain during the subsequent outward deformation.

The work @jones1996influence conducts experimental investigations on a cold-drawn structural steel pipe with an outer diameter of 60 mm and a wall thickness of 1.7 mm. In the tests, internal pressure, impact velocity, energy, and pipe stress position are defined as test parameters. The evaluation of the results mainly refers to the influence of the impact energy. At low impact energy, deformations already occur. However, there was no pressure reduction here or the internal pressure remained intact. If this is increased, local failure can be observed. In local failure, the pressure escapes gradually. A further increase in impact energy leads to global failure, where the pressure escapes explosively at the clamping points. The clamping points are located at each end of the pipes. For the case where the impact energy is kept constant and only the internal pressure is changed, photos of the experimental outcomes were shown. These can be seen in Figure 20. It is clearly recognizable that through pure pressure increase, material failure occurs not only at the impact position on the pipe.

[Figure 20: Constant impact energy applied centrally to pipe at different internal pressures @perfetto2022numerical]

The works discussed so far deal with dynamic point or small-area loads. However, for the structural test in K2H2, a quasi-static test is planned. In these, ideally the entire wing surface with a wing length of ~ 13 m should be continuously and areally loaded. Consequently, the collected knowledge cannot be directly applied to the project for K2H2. The dynamic loading of cylinders is extensively documented and researched in the literature. Accordingly, many more works on this topic can be found. However, pressure cylinders that experience an external static areal load and are thus more important for K2H2 are hardly researched. In the next section, an important work on this topic, which thus has great relevance for K2H2, will be discussed in detail.

In summary, it can be said that the literature provides much information on dynamically loaded cylinders. From it follows, among other things, that the internal pressure, depending on its value, can have a considerable influence on the displacement, stress, and failure behavior.