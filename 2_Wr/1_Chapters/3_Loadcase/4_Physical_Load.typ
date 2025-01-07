/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Title was tested and is inshallah fine
// word repetition task inshallah completed

== Physical Load Introduction Elements for Experimental Structural Validation<chap_3_4>
In @chap_3_0, critical load cases for #gls("swith", long:true) were established. Hydrogen's properties were examined in @chap_2_0, with particular attention to safety considerations in @chap_2_1 and @chap_2_2. 
Due to several technical limitations in safely handling hydrogen within high-pressure, long-dimensional tube experiments, among others, a filling agent study was conducted in @chap_3_1 to @chap_3_3. 
This analysis determined that alternative filling agents could potentially replace hydrogen for structural validation testing without significantly altering the structural behavior.
While numerical simulations offer considerable advantages in analyzing structural behavior, as demonstrated in @chap_3_3 and @chap_3_4, experimental validation remains essential. 
Among various advantages, numerical methods allow straightforward modification of parameters such as internal pressure and benefit from well-established theoretical frameworks for load application. 
However, experimental investigations present distinct challenges. The application of physical forces for aircraft testing is inherently demanding, and these requirements increase notably when dealing with pressurized tubes in #gls("swith") configurations.

This section addresses some of these experimental barriers by examining physical #glspl("lie", long:true) for aircraft wings. 
An analysis of each #gls("lie")'s characteristics is presented, followed by systematic evaluation using relevant assessment criteria to determine suitable approaches for structural testing.
These findings provide the motivation for the upcoming aerodynamical load discretization and optimization detailed in @chap_4. 
Understanding the practical implications of different load introduction methods provides crucial insights for developing effective structural testing procedures that balance theoretical requirements with experimental feasibility.

// -------------------------------------------------------------------------- //
Besides the internal pressure elaborated previously within this thesis, aerodynamic forces constitute the other important loads experienced by this aircraft configuration during flight operations. 
To achieve representative test conditions that accurately reflect the in-flight structural behavior, it is essential to simultaneously apply both internal pressure and aerodynamic loads during experimental investigations.
Three fundamental approaches can be considered for applying aerodynamic forces to the wing and fuselage skin structure. 
The first approach involves conducting experimental tests during actual flight conditions. However, this option presents substantial hurdles for the current aircraft concept, including numerous technical uncertainties and potentially catastrophic safety risks. 
Additionally, the financial requirements for flight testing would notably exceed the project's current budgetary constraints, rendering this approach infeasible.
The second approach involves wind tunnel testing @Goizueta2022 @Zhao2022 @He2022, which offers relatively accurate representation of external aerodynamic forces. This method benefits from extensive implementation in both research institutions and industry, providing access to established expertise and validated procedures. Although wind tunnel operational costs are considerable, they remain within potentially manageable ranges for a pioneering project's scope. 
However, significant challenges arise regarding environmental control and safety considerations. The generation of high-velocity flows within enclosed spaces necessitates exhaustive safety protocols and specialized containment measures.

A critical consideration in wind tunnel testing relates to the management of environmental conditions within the test facility. The generation of flight-representative velocities within an enclosed space necessitates comprehensive safety protocols and specialized containment measures.
Primary safety considerations include the secure anchoring of all test equipment and auxiliary components to prevent displacement under high-velocity conditions. Furthermore, strict operational protocols must be established to ensure personnel safety, particularly regarding maximum permissible wind speed exposure levels during test operations.
Even with the implementation of robust safety measures and successful pressurization protocols for the tanks, substantial technical obstacles persist regarding instrumentation. The high-velocity environment poses two critical concerns: potential degradation of measurement accuracy and the risk of instrument detachment under aerodynamic loading.
Given that the #gls("swith") represents a pioneering aircraft project, it can be assumed that exhaustive experimental data acquisition is essential for monitoring as many aspects as possible. This necessitates sophisticated instrumentation to measure multiple physical parameters simultaneously without interference. The potential adverse effects of high-velocity airflow, exerted not only on the aircraft but also on the attached measurement devices, could represent a considerable technical constraint.
These instrumentation restrictions, combined with the aforementioned safety considerations, render wind tunnel testing unsuitable for the structural validation of the current aircraft configuration.

// ------------------------------ third option ----------------------------- //
The third approach involves conducting structural tests in a controlled facility environment, rather than in flight or wind tunnel conditions. This method requires the application of aerodynamic loads through physical devices within a secure testing hall. The approach utilizes #glspl("lie") that can be actuated through either tension or compression to approximate aerodynamic forces.
This methodology raises several fundamental questions regarding implementation:

1. Which possible #gls("lie", long:true) configurations are viable
2. How should the selection criteria be established
3. How many #glspl("lie") should be utilized
4. Where should the #glspl("lie") be optimally positioned
5. How should the #glspl("lie") be dimensioned
6. How should spacing between adjacent #glspl("lie") be determined
7. Which force magnitudes and directions should be applied

The first two questions are addressed within this section, while the remaining aspects are examined throughout @chap_4.
Before proceeding with the detailed analysis, it is pertinent to elaborate on the rationale behind selecting this approach over the previously mentioned alternatives.
As mentioned in @chap_0_6, this research was conducted within the framework of the K#sub[2]H#sub[2] project. 
Through collaboration with the industrial partner IMA Materialforschung und Anwendungstechnik GmbH Dresden, valuable practical insights were obtained for this thesis.
IMA's expertise encompasses extensive experience in experimental structural testing of aircraft across various size categories, including the Airbus A380 @link_Lufthansa_Airbus_380.
Their established methodology primarily employs #glspl("lie") in ground-based testing configurations. This existing expertise offers notable advantages regarding implementation efficiency. The sustained application of this testing methodology by IMA demonstrates both its economic viability and technical reliability. Moreover, cost projections for this approach are considerably lower than the alternative methods, primarily due to existing infrastructure, established procedures, and personnel expertise.

A significant advantage of this approach relates to instrumentation implementation. The absence of high-velocity airflow around the wing structure enables optimal placement and utilization of measurement systems with minimal environmental interference. However, it is important to acknowledge that this method presents certain limitations regarding aerodynamic load approximation accuracy.
While flight testing would theoretically provide the most representative aerodynamic loading conditions, it is noteworthy that even this approach cannot guarantee purely undisturbed aerodynamic loading. The installation of measurement devices on the wing surface inevitably alters its geometry. 
Even such minimal geometric modifications can notably alter the flow behavior due to the fundamental characteristics of fluid dynamics
Turbulent fluid flows are recognized as chaotic systems @Roessler1976 @Lu2002 @Rickles2007 @SPROTT2020 @Boeing2016 @Chen1999 @dryer2007spontaneous @Argyris2017 @Strogatz2019 @Datseris2022, characterized by their extreme sensitivity to initial conditions. This phenomenon, formally known as #emp_[Sensitive Dependence on Initial Conditions] @Datseris2022 @Strogatz2019, results in exponential divergence of system behavior over time, even from imperceptible variations. Current physical understanding employs the Navier-Stokes equations @Blazek2015 as the most comprehensive model for fluid behavior, these being non-linear coupled differential equations that inherently exhibit chaotic characteristics.


These considerations suggest that experimental flight testing would not necessarily provide purely undisturbed aerodynamic forces. The same limitations regarding flow disturbance apply to wind tunnel testing. The viability of the ground-based testing approach depends primarily on the fidelity with which continuous aerodynamic loading experienced during flight can be approximated through discrete load application.
For scenarios where the approximation quality proves suboptimal, further investigation would be required to quantify the influence of external aerodynamic loads on the overall structural response. It is conceivable that beyond certain internal pressure thresholds, the relatively smaller aerodynamic loads might become negligible in terms of their structural impact.

// ---------------------------- burst example ---------------------------- //
The controlled environment of ground-based testing offers an additional meaningful advantage through its capability to conduct burst testing procedures. This testing methodology enables precise control over both internal pressure magnitudes and external bending loads - a capability that proves particularly valuable for structural validation. The controlled manipulation of these parameters would present substantial technical challenges in both flight and wind tunnel configurations.
Implementation of burst testing during flight operations would require remote adjustment of both internal pressure and aerodynamic loading parameters. This necessitates supplementary pressurization equipment that would not be present during normal flight operations, potentially compromising the representativeness of the test conditions. While aerodynamic loads could be modified through adjustments in flight velocity or angle of attack, such modifications might deviate from representative flight conditions. Additionally, burst testing during flight operations would require identification of suitable testing zones that accommodate potential structural failure scenarios, introducing significant logistical and safety complexities.
Wind tunnel implementation presents distinct technical obstacles. 
The requirement for explosion-proof containment systems introduces notable complexity to facility design. Furthermore, structural failure events could result in serious facility damage under high-pressure conditions. The spatial requirements for comprehensive instrumentation systems, pressure regulation equipment, and containment structures exceed typical wind tunnel facility capabilities. These dimensional constraints suggest that existing facilities might prove inadequate, potentially necessitating development of purpose-built testing infrastructure.
Through systematic evaluation of these considerations, ground-based testing in a secure facility emerges as the most viable approach for structural validation. 
This methodology enables implementation of exhaustive safety protocols while maintaining precise control over experimental parameters. Having established this foundational testing approach, @tab_30 lists conventional physical #glspl("lie").

#figure(
  table(
    columns: (1fr),
    align: left + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    /* --- header --- */
    table.header([*Load Introduction Method*]),
    /* -------------- */

    [Discrete mass elements (sandbags)],
    [Profile-conforming collets],
    [Air cushions or other gases],
    [Hydraulic cylinder with pads],
    [Various combinations of the methods mentioned above],
  ),

  kind: table,
  caption: [Established methods for physically introducing forces into the wing structure.],
  )<tab_30>

Load introduction methodology requires thorough investigation since not every method can be used for arbitrary structures.
Essential points that need to be considered are the geometry of the object to be loaded (test specimen), the type of loading (static, dynamic), the magnitude of the force to be applied, and the direction of the force vector.
Depending on requirements, load application accuracy may also be a significant factor.
The load might need to be achieved precisely down to individual Newtons or Newton-meters (for bending loads) at specific coordinates.
It could also be that the structure being loaded has to undergo the same test multiple times after an experimental structural test or be subjected to other tests afterward.

Testing requirements for prototype structures present additional complexities, particularly given the typically limited availability of test specimens due to high manufacturing costs. 
These constraints often necessitate non-destructive testing protocols to preserve specimen integrity for subsequent analyses or practical implementation. Such preservation requirements preclude certain invasive methods, such as drilling mounting holes or applying permanent adhesives. Furthermore, surface integrity considerations may extend to protective coatings, where paint degradation needs to be prevented.
Beyond these foundational requirements, the load introduction elements must demonstrate a higher strength characteristics than the test specimens to prevent unintended failure modes that could compromise experimental validity @Rossow_2014. 
A notable distinction exists between testing standardized versus complex structures. 
While standardized geometries often benefit from existing test facilities and established protocols, complex geometries typically require custom-manufactured #glspl("lie"). The subsequent sections examine in detail the individual load introduction methods presented in @tab_30.

// --------------------------------- sandbag -------------------------------- //
Sandbags represent one of the most traditional and economically viable approaches to wing load application. Their implementation on small aircraft structures is particularly common, as illustrated in @fig_56.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/4_Phyiscal_Load/0_Sandbags.png", 
  width: 100%),
  caption: [Illustrative demonstration of sandbags being applied for loading the wing of a small aircraft @ho2022development.],
)<fig_56>


// --------------------------------- collets -------------------------------- //
Profile-conforming collets encase the wing's cross-sectional contour and serve as load transfer interfaces, as depicted in @fig_57. These devices typically operate in conjunction with load harnesses and crane systems. Wooden construction is prevalent for collets, comprising upper and lower sections secured through metal fasteners. Interface protection between the collet and wing surface can be achieved through intermediate cushioning materials.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/4_Phyiscal_Load/1_Collet.png", 
  width: 100%),
  caption: [Illustrative demonstration of profile-conforming collets applied for wing loading @yeniceli2014design.],
)<fig_57>

//
// -------------------------------- air bags -------------------------------- //
The next #gls("lie") mentioned in @tab_30 are air cushions.
This is a method where a balloon-like cushion is filled with gas.
These elements can be positioned at specific load introduction points and actuated through cylinder compression.

//
// -------------------------------- cylinder -------------------------------- //
Hydraulic cylinders offer another load introduction methodology. These actuators can either connect directly with the test specimen through adhesive pads or integrate with auxiliary #glspl("lie"). The pads, constructed from polymeric materials, serve dual functions: distributing loads across specified surface areas and providing protective contact surfaces. @fig_58 demonstrates an implementation where movable cylinders connect to collets for structural testing of a fighter aircraft @leski2016full.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/4_Phyiscal_Load/2_Cylinder.png", 
  width: 100%),
  caption: [Illustrative demonstration of hydraulic cylinders connected to collets for structural testing of a fighter aircraft @leski2016full.],
)<fig_58>

// ---------------------------------- here ---------------------------------- //
Following the introduction of individual #gls("lie") configurations, a systematic evaluation framework is required to identify the optimal solution. The assessment criteria, presented in @tab_31, form the basis for this systematic evaluation. The subsequent passages examine these criteria by analyzing each load introduction method, beginning with the sandbag approach.

#figure(
  table(
    columns: (0.3fr, 1fr, 1em, 0.3fr, 1fr),
    align: left + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    /* --- header --- */
    table.header([*Number*],[*Criterion*],[], [*Number*], [*Criterion*]),
    /* -------------- */
  [1],  [Cost], [],
  [2],  [Load introduction accuracy], 
  [3],  [Number of required #glspl("lie")], [],
  [4],  [Availability of #glspl("lie")], 
  [5],  [Reusability of #glspl("lie")], [],
  [6],  [Safety],
  [7],  [Control system effort], [],
  [8],  [Specially trained personnel], 
  [9],  [Reproducibility], [],
  [10], [Innovation factor], 
  [11], [Constraint forces], [],
  [12], [Possibility for introducing tension loads],
  [13], [Modeling effort], [],
),

  kind: table,
  caption: [Evaluation criteria for systematic selection of appropriate #gls("lie") configurations.],
) <tab_31>

// ========================================================================== //
// =========================== Assessment sandbag =========================== //
// ========================================================================== //
#hor_Line("Assessment: Sandbag")
From a cost perspective, sandbags represent the most economical #gls("lie") option, with minimal procurement costs per unit. Even implementations requiring numerous units maintain considerable cost advantages over alternative methods. The absence of operational energy requirements further enhances their economic efficiency compared to powered alternatives such as stage lifts or crane-cylinder systems.
However, sandbags demonstrate major limitations in load introduction precision relative to other #glspl("lie"). Their loading capability is fundamentally constrained by gravitational forces acting vertically downward. 
While angled force components could theoretically be achieved through strategic sandbag placement on inclined surfaces, such arrangements would introduce additional complexities and reduce load application precision. Implementation requires a comparatively high quantity of individual #gls("lie") units, contrasting with the efficiency of electromechanical systems where a single cylinder could replace multiple sandbag units. Despite these limitations, sandbags offer advantages in procurement accessibility and versatile reusability across various applications.
Safety considerations vary significantly between standard wing tests and pressurized tank configurations. 
While conventional unpressurized testing presents minimal risks, the integration of pressurized water tanks constructed from #gls("cfrp") introduces substantial safety concerns. Structural failure scenarios could result in the release of fine, sharp #gls("cfrp") particles, presenting risks of cutaneous injuries. Additional investigation is required regarding potential damage to measurement instrumentation and associated systems from particle dispersion. The respiratory hazard from airborne #gls("cfrp") particles presents a decisive occupational safety consideration requiring thorough risk assessment.
// -------------------------------------------------------------------------- //

In the event of tank failure, sandbags provide limited safety mitigation, restricting #gls("cfrp") particle dispersion only in the vertical direction. While sandbag placement typically allows flexible load distribution adjustment during structural verification of small aircraft, this flexibility becomes a critical safety concern with pressurized tanks. Post-pressurization modification of sandbag positioning presents potentially life-threatening risks, effectively precluding load distribution adjustments under pressurized conditions using current methodologies.
Testing multiple load cases necessitates complete system depressurization and likely requires draining and refilling of the test medium between investigations. Additionally, automotive industry regulations for high-pressure vessels mandate dynamic testing protocols alongside static evaluations. The inherent limitations of sandbag-based loading render dynamic structural verification, particularly cyclic loading scenarios, infeasible.
Control system requirements demonstrate considerable variation based on load distribution precision demands. While achieving high-quality load distribution requires substantial effort and monitoring, basic load application demands minimal control infrastructure. The potential for unintended loading during sandbag placement necessitates careful sequence analysis. 

Given the novelty of combined internal pressure and external loading in #gls("swith"), precise load distribution becomes particularly critical for validating simulation models and understanding the structural behavior under these multi-load conditions.
Personnel requirements remain minimal, with basic material handling competencies sufficing for implementation. Standard equipment operation (hand trucks, forklifts) combined with supervised placement verification adequately supports testing procedures. However, test reproducibility suffers from inherent limitations in load distribution precision, resulting in poor repeatability characteristics.
While sandbags represent established methodology without significant innovation potential, they offer advantages regarding constraint forces. The axial loading nature and absence of profile enclosure requirements minimize unwanted force introduction into the test structure.
Tension load introduction remains infeasible through sandbag application due to their inherent gravitational operation. However, the modeling aspects demonstrate favorable characteristics, as sandbag loading can be approximated as constant surface pressure. This simplification facilitates straightforward integration into simulation frameworks with minimal computational overhead.

Summarizing the sandbag assessment: While offering economic advantages and accessibility with minimal personnel training requirements, sandbags present impactful limitations in load distribution precision. Safety considerations with pressurized #gls("swith") preclude manual load adjustments post-pressurization, though automated systems could potentially address this constraint. However, this would introduce additional complexity and cost, negating the primary advantages of sandbag application. 
The method's suboptimal characteristics for combined loading scenarios emphasize the necessity for thorough requirement analysis in #gls("lie") selection, particularly for novel structural configurations involving internal pressure and external loads.