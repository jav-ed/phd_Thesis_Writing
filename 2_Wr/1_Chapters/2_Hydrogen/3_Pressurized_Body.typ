/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Title was tested and is inshallah fine
==  Pressurized Vessels Under External Dynamic Loading <chap_2_3>

In @chap_2_2, a roadmap was proposed for conducting experimental structural validation tests on #gls("swith", long:true) at scales comparable to large aircraft. A key aspect of this roadmap involves experiments and simulations on small high-pressure hydrogen cylinders subjected to external loads.
Currently, no commercially certified #glspl("swith") are available, precluding studies related to hydrogen ignition in these systems. For the purpose of initial analysis, #glspl("swith") can be conceptualized as vessels subject to external loading, irrespective of their filling medium. This conceptual simplification enables the utilization of externally loaded cylinders as representative models for the prospective #glspl("swith"), which are still in the developmental stage.
By employing this simplified model, it becomes possible to conduct a literature review on the structural behavior of pressure vessels under external loads. This approach lays the foundation for more sophisticated investigations in the future.
A literature review on the structural behavior of pressurized bodies under external loading identified several relevant studies. One such investigation, conducted by @mitsuishi2000dynamic, involved a dynamic experiment where a mass of $2.5 "ton"$ was dropped from a height of $2 "m "$ onto a high-pressure cylinder. This experimental setup, visually represented in @fig_25, simulated an impact energy of $49 "kJ"$, equivalent to the impact of a $1 "ton"$ vehicle traveling at $36 "km/h"$. 
The study incorporated several variable parameters to assess their influence on the structural response. The experimental design considered two filling media, hydrogen and helium, across a pressure range spanning from $7 "MPa"$ to $35 "MPa"$ (equivalent to $70 "bar"$ to $350 "bar"$). Furthermore, the investigation encompassed both Type III and Type IV tanks, evaluating their performance under varying conditions. The cylinder orientation was also taken into account, with tests conducted in both vertical and horizontal positions to elucidate any potential differences in structural behavior based on the direction of impact.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/3_External_Forces/0_Crash.png", 
  width: 77%),
  caption: [Drop test apparatus for dynamic impact testing of pressurized cylinders from @mitsuishi2000dynamic.],
) <fig_25>

The authors of @mitsuishi2000dynamic synthesize their results into three primary conclusions. Firstly, they observed that the effect of pressure force in high-pressure cylinders is contingent upon the direction of the external force applied. Specifically, lateral pressure forces in high-pressure cylinders generate higher loads compared to external axial pressure forces. Secondly, their investigation revealed that when a pressure cylinder is subjected to an axial pressure force, tensile stresses manifest in the boundary region between the cylinder dome and its middle section. Lastly, and perhaps most significantly, the study found that cylinders tested under high pressure conditions exhibited pressure loads of such magnitude that they surpassed the range typically assumed in vehicle crash test procedures.

Numerical modeling approaches have been employed to study the impact behavior of various tank types. Abaqus simulations were employed to model both axial and lateral impacts on a Type III tank, consisting of an aluminum liner (6061-T6) and a #gls("cfrp", long:true) winding (T800/Epoxy with 65% fiber volume fraction), as reported by @perfetto2022numerical.
Upon comparison with experimental data, the study revealed that lateral impact simulations yielded more accurate results than axial impact models, with lateral impact simulations achieving acceptable quality. The correlation between experimental and numerical results for the lateral impact scenario is presented in @fig_27.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/3_External_Forces/3_Lateral_Impact.jpg", 
  width: 100%),
  caption: [Comparison of experimental and numerical force-time responses for lateral impact loading on a Type III tank from @perfetto2022numerical.],
) <fig_27>


In a related study, @farhood2021low employed Abaqus to model a Type IV tank under low-speed impact loading. Their simulation results, when compared to experimental force-time curves, demonstrated a deviation of 8.7%. Expanding the scope beyond individual tank impacts, @goto1980studies investigated the behavior of tanks in proximity to one another and under light soil conditions. This research aimed to replicate, both experimentally and numerically, the loads experienced by tanks during seismic events.
An investigation into the structural behavior of aluminum cylinders under high-speed loading was conducted by @schwer1988response. This study employed experimental testing with varying internal pressures and impact energies, complemented by Finite Element Method (DYNA3D) simulations for result validation. The research demonstrated that internal pressure significantly influences the failure behavior of aluminum cylinders. Experimental tests were conducted across pressure ranges of $0 "MPa to" 0.76 "MPa"$ and impact energy ranges of $250 "J to" 440 "J "$.
The study revealed distinct deformation patterns between pressurized and non-pressurized cylinders. While both types initially experience rapid and large inward displacement, this displacement is less pronounced in pressurized cylinders. Moreover, pressurized cylinders exhibit a unique slow outward displacement following the initial rapid indentation. These observations were captured using high-speed cameras and corroborated by strain gauge measurements.
Strain gauge data indicated both a large rapid axial inward movement and a subsequent smaller axial compressive strain, representing a rebound motion. Further analysis showed that the strain response of a pressurized, point-loaded tank is characterized by axial strain dominance during the initial inward deformation, followed by circumferential strain dominance during the subsequent outward deformation.

Experimental investigations conducted by @jones1996influence examined the behavior of cold-drawn structural steel pipes with an outer diameter of $60 "mm"$ and a wall thickness of $1.7 "mm"$. The study incorporated multiple test parameters, including internal pressure, impact velocity, energy, and pipe stress position, with particular emphasis on the influence of impact energy on structural response.
The investigation revealed a progressive failure mechanism dependent on impact energy levels. Initial deformation occurs at low impact energies while maintaining internal pressure integrity. As impact energy increases, the pipe exhibits local failure characterized by gradual pressure release. Further elevation of impact energy induces global failure, resulting in explosive pressure release at the clamping points positioned at the pipe ends.
Additional experiments maintaining constant impact energy while varying internal pressure produced notable results, documented photographically in @fig_26. These images demonstrate that material failure extends beyond the impact location when subjected to increased internal pressure alone, indicating a complex relationship between pressure distribution and structural integrity.


#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/3_External_Forces/1_Druckanstieg.png", 
  width: 100%),
  caption: [Failure patterns in structural steel pipes under constant impact energy with increasing internal pressures, showing progressive damage extension beyond the impact location from @jones1996influence.],
) <fig_26>



#summary_([
The literature review reveals substantial research on pressurized vessels under external dynamic loading. Studies demonstrate that internal pressure significantly influences structural behavior, with lateral loads generating higher stresses than axial loads. The documented failure mechanisms progress from initial deformation through local failure to global failure, depending on impact energy levels. While these studies provide valuable insights into pressure vessel behavior for dynamic loading conditions, which are essential for aircraft certification, they do not address quasi-static loading scenarios. Quasi-static testing, such as ultimate load testing, represents another critical requirement for aircraft certification and, consequently, for potential #gls("swith") certification. This identified gap in current research emphasizes the necessity for additional investigations into pressure vessel behavior under external static loads.
])