/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// TODO title
===  Pressurized Bodies with External Dynamic Loading<chap_2_0_3>

In @chap_2_0_2, a roadmap was proposed for conducting experimental structural validation tests on #gl_("swith", long:true) at scales comparable to large aircraft. A key aspect of this roadmap involves experiments and simulations on small high-pressure hydrogen cylinders subjected to external loads.
Currently, no commercially certified #gl_("swith",pl:true) are available, precluding studies related to hydrogen ignition in these systems. For the purpose of initial analysis, #gl_("swith",pl:true) can be conceptualized as vessels subject to external loading, irrespective of their filling medium. This conceptual simplification enables the utilization of externally loaded cylinders as representative models for the prospective #gl_("swith",pl:true), which are still in the developmental stage.
By employing this simplified model, it becomes possible to conduct a literature review on the structural behavior of pressure vessels under external loads. This approach lays the foundation for more sophisticated investigations in the future.


A literature review on the structural behavior of pressurized bodies under external loading identified several relevant studies. One such investigation, conducted by @mitsuishi2000dynamic, involved a dynamic experiment where a mass of $2.5 "ton"$ was dropped from a height of $2 "m "$ onto a high-pressure cylinder. This experimental setup, visually represented in @fig_25, simulated an impact energy of $49 "kJ"$, equivalent to the impact of a $1 "ton"$ vehicle traveling at $36 "km/h"$. 
The study incorporated several variable parameters to assess their influence on the structural response. The experimental design considered two filling media, hydrogen and helium, across a pressure range spanning from $7 "MPa"$ to $35 "MPa"$ (equivalent to $70 "bar"$ to $350 "bar"$). Furthermore, the investigation encompassed both Type III and Type IV tanks, evaluating their performance under varying conditions. The cylinder orientation was also taken into account, with tests conducted in both vertical and horizontal positions to elucidate any potential differences in structural behavior based on the direction of impact.

// TODO
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/3_External_Forces/0_Crash.png", 
  width: 77%),
  caption: [Setup of the drop test from @mitsuishi2000dynamic.],
) <fig_25>

The authors of @mitsuishi2000dynamic synthesize their results into three primary conclusions. Firstly, they observed that the effect of pressure force in high-pressure cylinders is contingent upon the direction of the external force applied. Specifically, lateral pressure forces in high-pressure cylinders generate higher loads compared to external axial pressure forces. Secondly, their investigation revealed that when a pressure cylinder is subjected to an axial pressure force, tensile stresses manifest in the boundary region between the cylinder dome and its middle section. Lastly, and perhaps most significantly, the study found that cylinders tested under high pressure conditions exhibited pressure loads of such magnitude that they surpassed the range typically assumed in vehicle crash test procedures.

Numerical modeling approaches have been employed to study the impact behavior of various tank types. Abaqus simulations were employed to model both axial and lateral impacts on a Type III tank, consisting of an aluminum liner (6061-T6) and a #gl_("cfrp",long:true) winding (T800/Epoxy with 65% fiber volume fraction), as reported by @perfetto2022numerical.
Upon comparison with experimental data, the study revealed that lateral impact simulations yielded more accurate results than axial impact models, with lateral impact simulations achieving acceptable quality. In a related study, @farhood2021low employed Abaqus to model a Type IV tank under low-speed impact loading. Their simulation results, when compared to experimental force-time curves, demonstrated a deviation of 8.7%. Expanding the scope beyond individual tank impacts, @goto1980studies investigated the behavior of tanks in proximity to one another and under light soil conditions. This research aimed to replicate, both experimentally and numerically, the loads experienced by tanks during seismic events.

// ---------------------------------- here ---------------------------------- //
The paper @schwer1988response investigates the structural behavior of an aluminum cylinder under high-speed loading. The cylinder was experimentally tested with various internal pressures and different impact energies. 
Some results were recalculated using the Finite Element Method (DYNA3D) and compared with the experimental results. 
The author points out that an existing internal pressure has a significant influence on the failure behavior of the aluminum cylinder. 
The ranges $0 "MPa to" 0.76 "MPa"$ and $250 "J " and 440"J "$ were experimentally demonstrated. For pressurized cylinders, a rapid and large inward displacement would initially occur, as with non-pressurized cylinders. 
However, for pressurized cylinders, the latter would be smaller. The second difference is that for pressurized cylinders, after the rapid indentation, a slow outward displacement appears. These findings were obtained using high-speed cameras. 
To further support them, strain gauges were additionally used. These showed both the large rapid axial inward movement and the following smaller axial compressive strain (rebound motion). The strain response of a pressurized and point-loaded tank would be dominated by the axial strain during the initial inward deformation and by the circumferential strain during the subsequent outward deformation.

The work @jones1996influence conducts experimental investigations on a cold-drawn structural steel pipe with an outer diameter of $60 "mm"$ and a wall thickness of $1.7 "mm"$. In the tests, internal pressure, impact velocity, energy, and pipe stress position are defined as test parameters. The evaluation of the results mainly refers to the influence of the impact energy. At low impact energy, deformations already occur. However, there was no pressure reduction here or the internal pressure remained intact. If this is increased, local failure can be observed. In local failure, the pressure escapes gradually. A further increase in impact energy leads to global failure, where the pressure escapes explosively at the clamping points. The clamping points are located at each end of the pipes. For the case where the impact energy is kept constant and only the internal pressure is changed, photos of the experimental outcomes were shown. These can be seen in @fig_26. It is clearly recognizable that through pure pressure increase, material failure occurs not only at the impact position on the pipe.


// TODO
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/3_External_Forces/1_Druckanstieg.png", 
  width: 77%),
  caption: [Constant impact energy applied centrally to pipe at different internal pressures @perfetto2022numerical],
) <fig_26>



The works discussed so far deal with dynamic point or small-area loads. However, for the structural test in K2H2, a quasi-static test is planned. In these, ideally the entire wing surface with a wing length of ~ 13 m should be continuously and areally loaded. Consequently, the collected knowledge cannot be directly applied to the project for K2H2. The dynamic loading of cylinders is extensively documented and researched in the literature. Accordingly, many more works on this topic can be found. However, pressure cylinders that experience an external static areal load and are thus more important for K2H2 are hardly researched. In the next section, an important work on this topic, which thus has great relevance for K2H2, will be discussed in detail.



// TODO 
// GAIN for swiths
In summary, it can be said that the literature provides much information on dynamically loaded cylinders. From it follows, among other things, that the internal pressure, depending on its value, can have a considerable influence on the displacement, stress, and failure behavior.