/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */
#pagebreak(weak:true)

// TODO Title
== Loadcase <chap_3_0>

In @chap_1_0 the objective was to obtain infromation that could help for desinging #gls("swith", long:true) and finding specific infromaiton regarding the demands for experimental structral certification tests. Here it was concluded that as of wirtign this thesis there is no single available standard dedicted to the certifcation of #glspl("swith"). Therefore state of the art standards were found and filtered such that some essential standards remain.
While some of tests mentioned there would allow to replace hydrogen inside the tanks through other filling agents, other did not.
When desiring to make use of hydrogen in practical applicaiton, its properties shouldbe known.
These were covered in @chap_2_0. In @chap_2_0_2 it was acknowledged that in general it is possible to work with hydorgen in experiments, however, this is not advised directly for hydrogen in long tubes and under high pressure as it generally the case for #glspl("swith").
The proposed pathway to one day utilize high-pressure hydrogen for tubes suitable for aircraft wing lengths, was to conduct many simulations and experiments with tube lengths and pressure values that would build upon each other till desired tube length and pressure are feasible. 
Based on the current technical limitation that could not provide human, leveraged instruments and the #gls("swith") itself safety, other possibilties shall be invesitgated.
The goal is to identify, wheter hydrogen can be replaced with another filling agent, that would not change the structral propeties too much such that the reasults could not be used.
For that initally the most cirtical load cases shall be investigated in @chap_3_0_0.
With these findings the following questions needs to be answered in @chap_3_0_1.
Can the hydrogen that is filled inside the tanks be replaced through another filling agent, with the altenrative medium chaning any important structral properties during an expeirmental strucal investigation.

=== Most prominent laodcases<chap_3_0_0>
In this subsection, it will first be explained why the identification of critical load cases is significant and how the load cases for #glspl("swith") differ from conventional load cases. Subsequently, the methodological approach for #glspl("swith") will be substantiated and outlined.

The definition of critical load cases for structure-integrated hydrogen tanks, designed as integral parts of light aircraft wings, presents a challenging task. 
The tanks are, on one hand, integrated into the wing structure and thus bear structural loads. On the other hand, the tanks are under high pressure. 
The internal pressure particularly leads to increased complexity, as it may now be necessary to test each conventional load case both without pressure and across an entire pressure range.
Even for conventional light aircraft, the identification of critical load cases poses a significant challenge. There exists a vast array of possible load cases @EASA_CS_23 @EASA_CS_25. 
Examining each individual load case experimentally is neither economically viable nor environmentally feasible in practice. 
Simulative investigations present the alternative. However, depending on the required accuracy, a single calculation of aerodynamic loads may take months. 
Even if it were possible to write very fast and accurate simulation software, numerous experienced programmers, fluid mechanics engineers, structural mechanics engineers, optimization specialists, and others would be required.
Given the assumption of having such solvers, substantial hardware resources and qualified personnel capable of operating the software would be necessary. Once results are obtained, all of these must be interpreted and categorized. 
It is crucial to filter out from these numerous results those that represent critical load cases. Therefore, according to the current state of technology, it is not possible to calculate all specified load cases with high accuracy in real-time, compare them with each other, and obtain the critical ones as a final result.
Within the framework of thesis, it is neither temporally nor financially viable to model, calculate, evaluate all individual load cases, and then finally arrive at a few selected candidates. However, it should be unequivocally stated that the considered load cases are essential for the design of an aircraft's airworthiness and safety.


In order to identify potentially realistic critical load cases for #glspl("swith"), it was initially relied upon the critical load cases provided by the former company MMM. 
The author derives the critical load cases presented in @tab_29 not directly from MMM, but from the lecture course #emp_[Design of Commercial Aircraft II], delivered by Dr. Heinze at TU Braunschweig in Germany. 
The company MMM had reportedly simulated various load cases and then statistically evaluated the probability of the tested load cases being dimensioning. At this point, gratitude is extended to Dr. Heinze for providing this information, especially considering that comparable information typically represents protected proprietary knowledge of very large companies. 
In other words, external scientists do not have access to these documents.



// --------------------------- table missing here --------------------------- //
#figure(
  table(
    columns: (0.3fr, auto),
    align: (col, row) => if row == 0 { left + horizon } else { left + horizon },
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    // ------------------------------- header ------------------------------- //
    [*Probability*], [*Critical Load Case*],
    // ---------------------------------------------------------------------- //
    [100%], [Elevator maneuver and vertical gust (Vn diagram)],
    [90%], [Landing impact],
    [80%], [Aileron maneuver and ground rolling],
    [70%], [Lateral gust and rudder maneuver],
    [50%], [Steady pull-up],
    [40%], [Frontal gust],
    [20%], [Crash landing and cabin pressure],
    [10%], [Single engine failure and maximum engine thrust],
  ),
  kind: table,
  caption: [Critical load cases from the lecture #emp_[Design of Commercial Aircraft II] @heinze2023aircraft.],
) <tab_29>


For this thesis, it is not possible to experimentally replicate all identified load cases. Rather, due to cost and time constraints, it is necessary to select one or at maximum two load cases. 
Simulative modeling of the critical load cases from @tab_29 is also not readily feasible. Depending on accuracy requirements, high-quality and time-intensive CFD calculations, fluid-structure coupling, multi-body simulation, crash analysis, or a combination thereof must be computed.
Given that vertical gust loading is considered one of the most significant loads, it warrants closer examination.
The loads can be derived from a V-n diagram and can be practically implemented into existing methods. The V-n diagram itself prescribes an entire range of possible load cases. However, the critical cases among these have already been identified in the literature. Furthermore, the V-n diagram is valid for all common types of light aircraft. Thus, there exists the possibility that the knowledge gained through K2H2 may also be applicable to other hydrogen-powered light aircraft.
Motivated by this, possibilities for creating Vn diagrams independently were investigated. A free tool was identified (ADRpy, https://github.com/sobester/ADRpy, last accessed on 26.04.2023), which was initially verified against each individual point specified in CS-23 for creating a Vn diagram. Subsequently, the tool was extended with several desired features.


Concurrent discussions were held with the light aircraft manufacturer APUS. This company had also investigated critical load cases and made them available to the project consortium. As this information was provided confidentially, it currently cannot be shared with the public. However, it should be noted that in this case as well, numerous load cases from the V-n diagram were classified as critical. Therefore, the developed Vn modeler can be considered a valuable component.
In summary, it can be stated that from the many possible load case ranges, a significant load case range could be identified and justified. This range prescribes its load cases through a Vn diagram. Motivated by this, K2H2 now has its own small tool available for the creation of Vn diagrams.

// VN-Diag


