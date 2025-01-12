/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Word rep ins. done

#hor_Line("Assessment: Collet")

The deployment of collets as #glspl("lie") for aircraft experimental structural testing necessitates careful analysis of multiple factors that influence operational efficiency and economic viability.
These custom-manufactured components, specifically designed for load introduction at particular profile geometries, present cost implications that correlate directly with wing profile variability along the span. Greater geometric variation demands additional specialized collets, potentially resulting in substantial cost escalation.

To establish practical relevance, it is pertinent to consider the current state-of-the-art #gls("swith") outlined in @chap_0_7. 
The APUS i-2 @APUS_0, characterized as a small aircraft with a 13.2-meter wingspan, is assumed to incorporate tubes of approximately $gt.tilde 7 upright("m")$ length positioned within the inner wings. Based on initial assessments, it can be hypothesized that the aircraft's design utilizes constant airfoil profiles in the inner wing sections, transitioning to non-uniform cross-sections in the outer wings
This geometric variation requires corresponding collet adaptations, introducing additional manufacturing costs. Furthermore, the deployment calls for evaluation of crane procurement, operational expenses including electricity consumption, and personnel costs.
// -------------------------------------------------------------------------- //

The accuracy of load transfer through collets demonstrates a strong dependence on both their quantity and spatial distribution. While precise load introduction can be achieved under optimal conditions, the efficacy varies significantly based on the complexity of the desired load distribution profile.
The fundamental mechanical principle underlying collet operation mandates that the collet structure possess greater stiffness than the wing-tube assembly.
This design restriction impacts the wing's deformation behavior in multiple directions. 
When the collet fully encloses the wing profile, it inherently constrains expansion in both vertical and profile-normal directions. Additionally, the collet's enclosure affects spanwise deformation through frictional forces at the contact interface, with the magnitude of this effect correlating with the contact force.

Further information regarding the general underlying friction mechanics can be found in @chap_1_3.
The geometric restrictions imposed by the collet-wing interface generate constraint forces within the wing structure. These forces primarily arise from two sources: bending loads transmitted through the collet interface and the prevention of pressure-induced expansion in the internal tubes.
The latter effect merits particular attention in pressurized systems, as the tubes' radial expansion tendencies transmit forces to the wing skin. 
While the wing skin may possess sufficient stiffness to resist this expansion under certain conditions, high internal pressures could induce outward deformation in an unconstrained state. 
The presence of a collet in such scenarios effectively introduces artificial stiffening of the wing structure, generating additional constraint forces throughout both the skin and internal tubes. These constraint forces potentially alter the structure's mechanical properties.
Conversely, inward displacements present a distinct mechanical scenario where the collet no longer maintains complete surface contact with the wing profile. 
This partial contact condition results in localized load transfer at discrete points where contact persists, potentially creating stress concentrations and deviating from the intended load distribution.

The capability of collets to apply complex load distributions, while advantageous in principle, requires careful consideration to avoid undesired structural responses. 
This becomes particularly critical near the wing tip, where displacement magnitudes are inherently larger due to increased distance from the mounting point. 
Significant force differentials between adjacent collets in this region can generate pronounced local deformation gradients. Such load distributions, being unrealistic for typical aerodynamic loading conditions, can create unintended local stress concentrations and potentially lead to premature structural failure

// -------------------------------------------------------------------------- //
The determination of required #gls("lie") quantity necessitates clear establishment of load introduction accuracy requirements, associated costs, and desired discrete load distribution characteristics. While collets offers lower accessibility compared to sandbags, they offer distinct advantages for specific testing scenarios. Their reusability, however, remains constrained by geometric restrictions. Any modification in profile geometry demands new collet manufacture, rendering them a cost-intensive option when high adaptability across varying wing profiles is required.

Safety considerations for collet-based #gls("lie") implementations parallel those of sandbag configurations, necessitating appropriate shielding and distance maintenance during structural testing. Collets present a significant operational advantage through their capacity for remote load adjustment, either from the crane cockpit or through remote control systems, thus minimizing personnel exposure to potential risks. In the event of structural failure, collets may provide localized containment of #gls("cfrp") particles at attachment points, though penetration of particles through collet material remains possible. 
The optimization objective of achieving satisfactory load distribution with minimal collet quantity must be balanced against these safety concerns.

Given an anticipated wing span of approximately $gt.tilde 7 upright("m")$, the substantial unconstrained surface area between collet positions introduces uncertainty regarding potential failure locations. This geometric configuration faces elevated risk for omnidirectional #gls("cfrp") particle dispersion, necessitating comprehensive protective measures and appropriate safety distances. 
The control system implementation, while relatively straightforward post-installation of collets and load harness, requires specialized personnel for multiple operational aspects. This includes oversight of collet positioning and attachment integrity, as well as qualified crane operation. These staffing requirements ensure precise load distribution while maintaining both operational safety and structural testing integrity.

// -------------------------------------------------------------------------- //
Test reproducibility utilizing collets as #gls("lie") demonstrates favorable characteristics attributable to their precise attachment capabilities, with positional deviations maintained within millimeter tolerances. The electrical crane operation further enhances repeatability through controlled load application. These factors collectively contribute to high reliability and consistency in experimental outcomes. Despite serving as an established method without significant innovation potential, the implementation of collets introduces complex considerations regarding constraint forces that warrant thorough investigation.
A potential mitigation strategy involves the utilization of single-sided collets that partially enclose either the upper or lower wing surface exclusively. This approach allows unrestricted vertical expansion of the structure during loading. Correspondence with IMA Dresden has confirmed the practical feasibility of such an approach. 
The application of tension loads through collets present various implementation possibilities, especially when combining crane and cylinder systems. While the crane-only approach exhibits certain operational limitations, the integration of hydraulic cylinders enables enhanced load application flexibility. However, the numerical representation of collet-wing interactions in #gls("fem") models introduces additional complexity due to the requisite precision in contact condition modeling. This complexity manifests particularly in scenarios where the collet encases the profile, introducing asymmetric loading conditions between the constrained lower surface and the unconstrained upper surface during lift operations.

To conclude, cost assessment for collet implementation remains contingent upon detailed specification of load discretization requirements and accuracy parameters. 
The integration of crane systems and associated load harnesses introduces significant cost implications relative to simpler methods such as the sandbag implementation. 
The determination of collet suitability for specific testing scenarios necessitates in-depth evaluation of two critical factors: achievable load introduction accuracy and the influence of constraint forces on structural behavior. 
These aspects must be thoroughly analyzed within the context of specific test requirements to ensure appropriate selection of the load introduction methods.

// ------------------------------ air Cushions ------------------------------ //
#hor_Line("Assessment: Air Cushion")
Air cushions represent an emerging method in #gls("lie") deployment, distinguished by their innovative approach to load distribution.
Initial assumptions suggested high procurement costs due to specialized manufacturing requirements. However, the fundamental technology, which utilizes pressurized cushions with plastic surface attachments, indicates potential cost-effectiveness in production.
Collaboration with IMA Dresden has revealed high market availability of these systems, indicating favorable procurement conditions. 
Air cushions provide efficient load distribution, potentially reducing the required number of units compared to alternative methods.
Nevertheless, operational costs, particularly for cylinder pressurization systems, appear comparable to the collet and cylinder configurations in isolated subsystem analysis. Yet, the total operational expenditure, including control system complexity and integration requirements, could lead to higher costs as will be explained later.
A critical advantage of air cushion implementation lies in its capacity for precise and uniform load distribution across surfaces. This approach significantly reduces the occurrence of constraint forces and load irregularities common to traditional methods, offering superior accuracy in load introduction. 

The determination of optimal air cushion quantity depends fundamentally on load distribution approximation requirements. This quantification requires comprehensive calculations and analyses. While this specialized #gls("lie") demonstrates high market availability, its implementation offers pronounced advantages through simple attachment and removal processes utilizing replaceable plastic end surfaces. This design feature enables efficient reuse across different wing configurations, promoting both resource sustainability and long-term cost efficiency.
Safety protocols necessitate thorough assessment during operation
Personnel protection entails maintaining appropriate distances from the test structure during load application. 
The system's remote pressure control capabilities facilitate safe test execution while enabling flexible load adjustment without direct operator proximity to the test article.

// -------------------------------------------------------------------------- //
The operational requirements of air cushions encompass both their application and pressurization. The integration with cylinders results in increased control system requirements compared to cylinder-based systems, as both cylinder operation and pressure regulation must be managed. The critical technical challenge resides in achieving precise pressure control within the air cushions to ensure uniform load distribution.
The implementation warrants specialized personnel for load operations. These operators must monitor both the initial system configuration, including proper air cushion application and cylinder connections, and maintain operational oversight throughout test execution.
The system demonstrates high test result reproducibility due to the precise positioning capabilities and electrical cylinder control. These characteristics facilitate consistent load application throughout repeated test cycles.

The air cushion system exhibits significant innovation potential, given its current limited application in structural testing. This novel load introduction approach presents opportunities for enhancement or replacement of conventional methods. 
The application of pressure forces from below eliminates constraint forces, facilitating uniform load distribution and precise force application.
Tension load introduction, however, requires adequate adhesive bonding between the air cushions and wing structure. Both the air cushion material and adhesive interfaces must possess sufficient stiffness characteristics to ensure proper load transfer. 
The implementation of air cushions simplifies the #gls("fem") modeling process. The uniform surface load distribution generated by the air cushions permits straightforward numerical representation within the #gls("fem") framework, enhancing both computational efficiency and simulation accuracy.

In summary, while current cost estimates for the air cushion system remain incomplete, preliminary analysis indicates higher expenditure compared to the collet and cylinder-pad configurations. This increased cost is primarily attributed to complex control system requirements. The implementation costs comprise both the air cushion procurement and the essential cylinder systems for pressure force application. Despite these cost implications, the system offers significant advantages in reusability, safety, reproducibility, and innovation, positioning it as a viable solution for future load distribution applications.

// ---------------------------- cylinder and pad ---------------------------- //
#hor_Line("Assessment: Cylinder with Pad")

The hydraulic cylinder and pad configuration serves as an established gls("lie") that demonstrates operational characteristics comparable to air cushion systems in terms of load application and resultant structural response. 
Implementation of this approach necessitates careful consideration of load distribution requirements, as achieving high-fidelity load representation typically demands deployment of multiple #gls("lie") units, directly impacting system costs. 
Despite this consideration, the method's primary advantage lies in its precise load introduction capabilities, characterized by minimal constraint forces and uniform distribution across discrete contact surfaces.
Component availability presents a crucial operational advantage, particularly for large-scale aircraft structural testing applications. Both hydraulic cylinders and load distribution pads maintain robust market presence, facilitating system implementation and maintenance. 
This #gls("lie") has favorable reusability characteristics, enhanced by efficient pad attachment and removal mechanisms that minimize operational complexity. This attribute contributes to long-term economic viability through reduced replacement requirements and streamlined testing procedures.
Safety protocols parallel those established for air cushion implementations, necessitating prescribed clearance zones around the test article and remote load adjustment capabilities through automated control systems. 
The complexity of control system requirements exhibits correlation with desired load distribution precision. 

As elaborated in the air cushion assessment, air cushion systems require more sophisticated control architectures than the cylinder-pad configurations. However, in scenarios demanding high-fidelity load distribution, necessitating numerous discrete pad-cylinder units, the overall control system complexity may become comparable. 
This potential convergence in control requirements primarily stems from the increased coordination efforts of managing multiple small-area contact interfaces, each requiring precise force regulation to maintain desired load distribution profiles.


// -------------------------------------------------------------------------- //

Implementation of the cylinder-pad configurations requires specialized personnel to oversee installation procedures, including proper pad attachment and cylinder connectivity, ensuring precise and reliable load introduction. The system demonstrates favorable reproducibility properties through consistent pad positioning and electronically controlled cylinder actuation, facilitating high test result repeatability. 
While this method functions as established practice, its adaptation beyond large-scale aircraft testing constitutes an extension of conventional applications.

The magnitude of constraint forces exhibits strong dependence on pad-wing interface conditions. Implementation of elastomeric intermediate layers can effectively minimize constraint forces, whereas direct bonding may introduce localized force concentrations. The capacity for tension load introduction is governed by both the cohesive and adhesive properties of the bonding agent, coupled with sufficient pad stiffness attributes. These considerations necessitate meticulous material selection to achieve specified test parameters while maintaining structural integrity.
Numerical modeling of cylinder-pad systems demands in-depth investigations of multiple mechanical factors. 
The modeling framework must incorporate both pad stiffness characteristics and interface behavior between pad and wing structure. 
This requirement extends beyond simple force application, necessitating detailed representation of load transfer mechanisms through the pad-wing interface. 
Accurate simulation of these interactions proves essential for establishing correlation between numerical predictions and experimental observations, ultimately determining the validity of structural analysis results.

In summary, the economic implications of cylinder-pad implementation demonstrate strong correlation with the quantity of required #glspl("lie"). Achievement of high-fidelity load distribution necessitates deployment of numerous pad-cylinder units, substantially impacting overall system costs. The comprehensive cost assessment must encompass both initial procurement expenses and operational expenditures, including energy consumption for control systems and extended testing operations. These operational costs can account for a notable proportion of total expenditure, especially for complex, long-duration test campaigns.
Despite these economic considerations, the cylinder-pad method shows superior load distribution properties, particularly in configurations employing multiple #glspl("lie"). The system enables precise load application control, yielding high-quality experimental data suitable for rigorous structural analysis. 
The capacity for uniform load distribution while maintaining minimal constraint forces represents a significant technical advantage, enhancing the method's applicability across diverse structural testing scenarios. 
Selection of this approach ultimately requires systematic evaluation of three primary factors: required accuracy specifications, economic constraints, and other specific test program requirements.

// ----------------------------- tables overview ---------------------------- //
#hor_Line("Assessment: Overview")
The preceding analysis presented numerous evaluative aspects for each load introduction method. To facilitate a systematic comparison of these methods, @tab_32 provides a concise evaluation matrix comparing the four essential #glspl("lie") across all defined criteria. 
This tabular overview aims to distill the detailed qualitative analysis into a structured comparative framework.
It is important to acknowledge the inherent limitations of this evaluation approach. The transformation of complex, multidimensional information into a three-level assessment scale necessarily involves some degree of simplification. This reduction in dimensionality introduces potential subjectivity and may not capture nuanced distinctions between the methods. 
Such shortcomings are inherent to any categorical assessment of complex engineering endeavors. 

#figure(
  table(
    columns: (auto,auto,auto,auto,auto,auto),
    // align: left + horizon,
    align: center,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    /* --- header --- */
    table.header(
        [*No*],
        [*Criterion*],
        [*Sandbag*],
        [*Collet*],
        [*Cylinder*],
        [*Air Cushion*],
      
      ),
    /* -------------- */

  [1], [Costs], [#col_Gre()], [#col_X()], [#col_X()], [#col_X()],
  [2], [Load introduction accuracy], [#col_X()], [#col_Mid()], [#col_Gre()], [#col_Gre()],
  [3], [Number of #glspl("lie")], [#col_X()], [#col_Mid()], [#col_X()], [#col_Mid()],
  [4], [Availability of #glspl("lie")], [#col_Gre()], [#col_Gre()], [#col_Gre()], [#col_Gre()],
  [5], [Reusability of #glspl("lie")], [#col_Gre()], [#col_X()], [#col_Gre()], [#col_Gre()],
  [6], [Safety], [#col_X()], [#col_Mid()], [#col_Mid()], [#col_Mid()],
  [7], [Control system effort], [#col_X()], [#col_Mid()], [#col_X()], [#col_X()],
  [8], [Specially trained personnel], [#col_Gre()], [#col_Mid()], [#col_Mid()], [#col_Mid()],
  [9], [Reproducibility], [#col_X()], [#col_Gre()], [#col_Gre()], [#col_Gre()],
  [10], [Innovation], [#col_X()], [#col_X()], [#col_Mid()], [#col_X()],
  [11], [Constraint forces], [#col_Gre()], [#col_Mid()], [#col_Gre()], [#col_Gre()],
  [12], [Possibility for introducing tension loads], [#col_X()], [#col_Gre()], [#col_X()], [#col_X()],
  [13], [Modeling effort], [#col_Gre()], [#col_X()], [#col_X()], [#col_Gre()]
),

  kind: table,
  caption: [Comparative evaluation of #glspl("lie") using established assessment criteria. #col_X(): unfavorable, #col_Mid(): moderate, #col_Gre(): favorable.],
) <tab_32>


// ------------------------------- innovation ------------------------------- //
Meetings held with IMA Dresden highlighted an important consideration regarding the innovation criterion. 
While innovation generally represents a positive attribute in scientific and technological advancement, the context of structural testing for a pioneering aircraft configuration introduces specific constraints. 
For initial validation of novel structural concepts, established methods with documented reliability may offer significant advantages over innovative but less-proven approaches. 
This insight led to a reevaluation of the innovation criterion, effectively inverting its interpretation in the assessment matrix.
The revised evaluation framework, presented in @tab_33, reflects this adjusted perspective on innovation while maintaining consistent assessment of all other criteria. This modification aligns the evaluation matrix more closely with the primary objective of ensuring reliable structural validation for the novel aircraft configuration.

#figure(
  table(
    columns: (auto,auto,auto,auto,auto,auto),
    // align: left + horizon,
    align: (left, center, center, center, center, center),
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    /* --- header --- */
    table.header(
        [*No*],
        [*Criterion*],
        [*Sandbag*],
        [*Collet*],
        [*Cylinder*],
        [*Air Cushion*],
      
      ),
    /* -------------- */

  [1], [Costs], [#col_Gre()], [#col_X()], [#col_X()], [#col_X()],
  [2], [Load introduction accuracy], [#col_X()], [#col_Mid()], [#col_Gre()], [#col_Gre()],
  [3], [Number of #glspl("lie")], [#col_X()], [#col_Mid()], [#col_X()], [#col_Mid()],
  [4], [Availability of #glspl("lie")], [#col_Gre()], [#col_Gre()], [#col_Gre()], [#col_Gre()],
  [5], [Reusability of #glspl("lie")], [#col_Gre()], [#col_X()], [#col_Gre()], [#col_Gre()],
  [6], [Safety], [#col_X()], [#col_Mid()], [#col_Mid()], [#col_Mid()],
  [7], [Control system effort], [#col_X()], [#col_Mid()], [#col_X()], [#col_X()],
  [8], [Specially trained personnel], [#col_Gre()], [#col_Mid()], [#col_Mid()], [#col_Mid()],
  [9], [Reproducibility], [#col_X()], [#col_Gre()], [#col_Gre()], [#col_Gre()],
  [10], [Innovation], [#col_Gre()], [#col_Gre()], [#col_Mid()], [#col_X()],
  [11], [Constraint forces], [#col_Gre()], [#col_Mid()], [#col_Gre()], [#col_Gre()],
  [12], [Possibility for introducing tension loads], [#col_X()], [#col_Gre()], [#col_X()], [#col_X()],
  [13], [Modeling effort], [#col_Gre()], [#col_X()], [#col_X()], [#col_Gre()]
),

  kind: table,
  caption: [Revised evaluation matrix of #glspl("lie") with innovation criterion considered as reliability indicator. #col_X(): unfavorable, #col_Mid(): moderate, #col_Gre(): favorable. Lower innovation scores reflect higher reliability for pioneering applications.],
) <tab_33>


// -------------------------------- favorite -------------------------------- //
#hor_Line("Assessment: Current Favorite")
The systematic evaluation of #glspl("lie") revealed varying degrees of certainty in assessment outcomes across different criteria. While some characteristics could be definitively evaluated, others demonstrated strong dependence on specific project parameters and implementation details. This variance in assessment confidence highlights the context-dependent nature of #gls("lie") selection, suggesting that optimal solutions must be determined within the framework of specific project requirements rather than through universal generalizations.
The presented evaluation framework, while not exhaustive, establishes a valuable foundation for structured decision-making in #gls("lie") selection. This contribution is particularly significant given that load introduction methodology often represents specialized industrial knowledge, typically confined within commercial enterprises and specialized testing facilities. The systematic reasoning approach outlined here can be adapted and extended to accommodate project-specific requirements, providing a methodological template for future evaluations.

Load discretization analysis yields critical methods for finding other key variables that guide the final #gls("lie") selection. These include:

+ Required quantity of #glspl("lie")
+ Dimensional specifications
+ Optimal positioning coordinates
+ Minimum and maximum spacing requirements
+ Force magnitude and directional parameters

@chap_4 describes a systematic approach to obtain these parameters through detailed load approximation analysis, surrogate modeling, and optimization. Knowledge of these variables, combined with the evaluation frameworks established in @tab_32 and @tab_33, enables enhanced precision in assessing each #gls("lie") configuration's suitability. 
The required quantity of #glspl("lie") directly impacts required costs. Additionally, spacing requirements influence both the feasibility of an attachment strategy and the availability of unobstructed areas. These clear areas are potentially beneficial for visual strain measurements and structural monitoring.
This quantitative foundation, coupled with the qualitative evaluation criteria, forms a solid basis for informed #gls("lie") selection tailored to specific project requirements.


#summary_([
This section provided the fundamentals of physical load introduction methods for aircraft structural testing, with particular focus on #glspl("swith"). Following an examination of critical load cases and safety aspects from previous sections, the analysis found three potential approaches for experimental load application: flight testing, wind tunnel testing, and ground-based structural testing. 
After establishing ground-based testing as the most viable approach, four distinct #gls("lie") methods were evaluated: sandbags, profile-conforming collets, air cushions, and hydraulic cylinders with pads.
A comprehensive evaluation framework comprising thirteen criteria was developed and applied to each method, considering factors ranging from economic viability to technical implementation challenges. 
The assessment results were obtained through analytical reasoning and outlined as concise evaluation matrices, enabling clear comparison across methods. 

The evaluation of the innovation criterion demonstrated how different perspectives can lead to opposing yet equally valid conclusions. 
This highlights both the systematic nature and inherent complexity of the assessment process.
The analysis revealed that optimal #gls("lie") selection depends strongly on context-specific variables and some identified critical parameters. 
These critical parameters require rigorous determination through load approximation analysis.
This investigation provides a methodological foundation for #gls("lie") selection and establishes the motivation for the detailed load discretization analysis presented in @chap_4.

])