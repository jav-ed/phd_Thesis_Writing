/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */
#pagebreak(weak:true)

// TODO Title
== Loadcase <chap_3_0>
In @chap_1_0, the primary objective was to identify specific requirements for experimental structural certification tests of #gls("swith", long:true). The analysis revealed that no single standard currently exists dedicated to the certification of #glspl("swith"). Consequently, existing state-of-the-art standards were evaluated and filtered to establish essential certification requirements.These identified standards not only serve certification purposes but could also be leveraged to inform design decisions.

The evaluation of these standards indicated varying flexibility regarding tank filling agents. While some testing protocols permitted the substitution of hydrogen with alternative filling agents, others mandated the use of hydrogen. For practical applications involving hydrogen, a thorough understanding of its properties is essential. These properties were extensively elaborated in @chap_2_0. In @chap_2_0_2, it was established that while hydrogen can be utilized in experimental settings, its direct application in long tubes under high pressure, as typically required for #glspl("swith"), presents significant challenges.
To safely conduct experimental investigations, a long-term strategy was proposed for working with high-pressure hydrogen in tubes of aircraft wing dimensions. This approach advocates for a gradual progression of simulations and experiments, starting with smaller tube lengths and lower pressure values, systematically increasing both parameters as safety protocols are validated. 
The current technical capabilities for safely handling high-pressure hydrogen in long tubes cannot adequately protect human operators, testing equipment, and the #gls("swith") itself from potential hydrogen-related incidents during experiments. Due to these safety limitations, alternative methods for conducting the certification tests must be explored.

The primary objective of this section is to determine whether hydrogen can be substituted with an alternative filling agent without significantly altering the structural properties that would invalidate test results. 
To address this question, the most critical load cases will be examined in @chap_3_0_0. These findings will inform the central question addressed in @chap_3_0_1: Can hydrogen be replaced with an alternative medium in the tanks without significantly affecting the structural properties during experimental structural investigation?


// TODO Title

// TODO is this intro actually fulfilled?
=== Most prominent laodcases<chap_3_0_0>
This subsection addresses the significance of identifying critical load cases and examines how load cases for #glspl("swith") deviate from conventional scenarios. Following this analysis, a methodological approach specific to #glspl("swith") is presented and justified.


Defining critical load cases for structure-integrated hydrogen tanks, designed as integral parts of light aircraft wings, presents a complex engineering challenge. This complexity stems from the dual-nature of #glspl("swith"): the tanks are both integrated into the wing structure, bearing structural loads, and subjected to high internal pressure. Consequently, each conventional load case must be evaluated both without pressure and across various pressure ranges, significantly expanding the testing matrix.

The identification of critical load cases poses significant challenges even for conventional light aircraft, given the vast array of possible scenarios defined in certification standards @EASA_CS_23 @EASA_CS_25. A comprehensive experimental investigation of each load case is neither economically viable nor environmentally sustainable. While simulative approaches offer an alternative, they present their own set of challenges. Depending on accuracy requirements, a single aerodynamic load calculation may require months of computational time. Faster aerodynamical simulations can be achieved by neglecting friction and introducing simplifications; however, these compromises may result in accuracy levels insufficient for certification requirements.

The development and implementation of fast, accurate simulation capabilities would demand extensive resources. This includes not only experienced programmers, fluid mechanics engineers, structural mechanics engineers, and optimization specialists but also substantial computational hardware and qualified personnel to operate the software. Furthermore, the resulting data would require careful interpretation and categorization to identify truly critical load cases. Given the current state of technology, real-time calculation and comparison of all specified load cases with high accuracy remains unfeasible.

// TODO references
The implementation of comprehensive simulation capabilities for this analysis presents significant methodological challenges that extend beyond mere computational resources. While individual multiphysics problems are numerically solvable with current methods, the challenge lies in the unprecedented combination of multiple physical phenomena with an extensive array of load cases. The analysis requires expertise across multiple disciplines: computational fluid dynamics for accurate aerodynamic load prediction, structural mechanics for understanding load distribution and material behavior, and optimization theory for handling the vast solution space. Furthermore, depending on the specific load case, additional physical phenomena must be considered, including crash dynamics, multi-body interactions, dynamic structural responses, and thermomechanical effects. Each of these domains introduces its own set of numerical complexities and computational demands.

The coupling of these physical phenomena further compounds the computational complexity, leading to potential stability issues and increased computational overhead. Even with state-of-the-art high-performance computing infrastructure, the simultaneous consideration of aerodynamic effects, structural responses, and internal pressure loads across multiple load cases remains computationally intractable for real-time analysis. The challenge is not in solving any single multiphysics problem, but rather in the systematic evaluation of numerous load cases, each potentially requiring different combinations of physical models and solver configurations. Moreover, the interpretation of such multidimensional results requires sophisticated post-processing methodologies to identify truly critical load cases, as the interaction between different physical phenomena may lead to non-obvious failure modes. These fundamental challenges in both computation and analysis underscore the current limitations in achieving comprehensive, high-fidelity simulations for all specified load cases.

Given these computational challenges, the identification of potentially critical load cases for #glspl("swith") was approached by leveraging established industry knowledge. The analysis draws upon critical load case data originally developed by the former company MMM, as presented in @tab_29. 
The data was presented in the lecture course #emp_[Design of Commercial Aircraft II] at TU Braunschweig in Germany @heinze2023aircraft, delivered by Dr. Heinze.
MMM's approach involved comprehensive load case simulations followed by statistical evaluation to determine the probability of each load case being dimensioning. Such probabilistic classification of load cases represents valuable proprietary knowledge typically protected within large aerospace companies and rarely accessible to the broader scientific community. The availability of this data through academic channels provides unique insights into industry-validated load case hierarchies.



// TODO
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
    [100%], [Elevator maneuver and vertical gust (V-n diagram)],
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


Within the scope of this thesis, experimental replication of all identified load cases is not feasible due to resource constraints, necessitating a focused approach on one or two critical cases. Similarly, comprehensive simulative modeling of all critical load cases from @tab_29 presents significant challenges, requiring extensive computational resources for high-fidelity #gls("cfd", long:true) calculations, fluid-structure coupling, multi-body simulation, crash analysis, or combinations thereof.

According to @tab_29, vertical gust loading represents one of the most probable critical load cases, with a 100% probability of being dimensioning, thus warranting detailed investigation. 
As demonstrated in @tab_29, these loads can be systematically analyzed through V-n diagrams. This approach provides a standardized framework that readily integrates with existing methodologies.
While V-n diagrams encompass a broad spectrum of load cases, critical conditions within this spectrum have been well-documented in literature @heinze2023aircraft.

// ---------------------------------- here ---------------------------------- //
// TODO light aircraft, bigb aircraft - focus on light aircraft, because it is believed swith it would be more reasonable to ahve smaller swiths than bigger acs
Significantly, V-n diagrams maintain validity across various light aircraft configurations, suggesting that findings from this research could potentially extend to other hydrogen-powered light aircraft designs.

This potential for broader applicability motivated the development of independent V-n diagram generation capabilities. An open-source aerodynamics tool, ADRpy 
// @github_sobester_2023
, was identified and thoroughly validated against CS-23 specifications for V-n diagram generation. The tool's functionality was subsequently enhanced with additional features to meet specific research requirements.

// -------------------------------------------------------------------------- //
For this thesis, it is not possible to experimentally replicate all identified load cases. Rather, due to cost and time constraints, it is necessary to select one or at maximum two load cases. 
Simulative modeling of the critical load cases from @tab_29 is also not readily feasible. Depending on accuracy requirements, high-quality and time-intensive #gls("cfd") calculations, fluid-structure coupling, multi-body simulation, crash analysis, or a combination thereof must be computed.
Given that vertical gust loading is considered one of the most significant loads, it warrants closer examination.
The loads can be derived from a V-n diagram and can be practically implemented into existing methods. The V-n diagram itself prescribes an entire range of possible load cases. However, the critical cases among these have already been identified in the literature. Furthermore, the V-n diagram is valid for all common types of light aircraft. Thus, there exists the possibility that the knowledge gained through K2H2 may also be applicable to other hydrogen-powered light aircraft.
Motivated by this, possibilities for creating V-n diagrams independently were investigated. A free tool was identified (ADRpy, https://github.com/sobester/ADRpy, last accessed on 26.04.2023), which was initially verified against each individual point specified in CS-23 for creating a V-n diagram. Subsequently, the tool was extended with several desired features.


Concurrent discussions were held with the light aircraft manufacturer APUS. This company had also investigated critical load cases and made them available to the project consortium. As this information was provided confidentially, it currently cannot be shared with the public. However, it should be noted that in this case as well, numerous load cases from the V-n diagram were classified as critical. Therefore, the developed V-n modeler can be considered a valuable component.
In summary, it can be stated that from the many possible load case ranges, a significant load case range could be identified and justified. This range prescribes its load cases through a V-n diagram. Motivated by this, K2H2 now has its own small tool available for the creation of V-n diagrams.

// VN-Diag


