/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// TODO remove the fast access === below
=== Collet

#hor_Line("Assessment: Collet")

The deployment of collets as #gls("lie") for aircraft experimental structural testing necessitates careful consideration of multiple factors that influence operational efficiency and economic viability.
These custom-manufactured components, specifically designed for load introduction at particular profile geometries, present cost implications that correlate directly with wing profile variability along the span. Greater geometric variation necessitates additional specialized collets, potentially resulting in substantial cost escalation.

To establish practical relevance, it is pertinent to consider the current state-of-the-art #gls("swith") outlined in @chap_0_7. 
The APUS i2 @APUS_0, characterized as a small aircraft with a 13.2-meter wingspan, is assumed to incorporate tubes of approximately $gt.tilde 7 upright("m")$ length positioned within the inner wings. Based on initial assessments, it can be hypothesized that the aircraft's design utilizes constant airfoil profiles in the inner wing sections, transitioning to non-uniform cross-sections in the outer wings
This geometric variation necessitates corresponding collet adaptations, introducing additional manufacturing costs. Furthermore, the deployment requires consideration of crane procurement, operational expenses including electricity consumption, and personnel costs.
// -------------------------------------------------------------------------- //

The accuracy of load transfer through collets demonstrates a strong dependence on both their quantity and spatial distribution. While precise load introduction can be achieved under optimal conditions, the efficacy varies significantly based on the complexity of the desired load distribution profile.
The fundamental mechanical principle underlying collet operation requires the collet structure to possess greater stiffness than the wing-tube assembly. 
This design constraint impacts the wing's deformation behavior in multiple directions. 
When the collet fully encloses the wing profile, it inherently constrains expansion in both vertical and profile-normal directions. Additionally, the collet's enclosure affects spanwise deformation through frictional forces at the contact interface, with the magnitude of this effect correlating with the contact force.

Further information regarding the general underlying friction mechanics can be found in @chap_1_0_4
The geometric constraints imposed by the collet-wing interface generate constraint forces within the wing structure. These forces primarily arise from two sources: bending loads transmitted through the collet interface and the prevention of pressure-induced expansion in the internal tubes.
The latter effect merits particular attention in pressurized systems, as the tubes' radial expansion tendencies transmit forces to the wing skin. 
While the wing skin may possess sufficient stiffness to resist this expansion under certain conditions, high internal pressures could induce outward deformation in an unconstrained state. 
The presence of a collet in such scenarios effectively introduces artificial stiffening of the wing structure, generating additional constraint forces throughout both the skin and internal tubes. These constraint forces potentially alter the structure's mechanical properties.
Conversely, inward displacements present a distinct mechanical scenario where the collet no longer maintains complete surface contact with the wing profile. 
This partial contact condition results in localized load transfer at discrete points where contact persists, potentially creating stress concentrations and deviating from the intended load distribution.

The capability of collets to apply complex load distributions, while advantageous in principle, requires careful consideration to avoid undesired structural responses. 
This becomes particularly critical near the wing tip, where displacement magnitudes are inherently larger due to increased distance from the mounting point. 
Significant force differentials between adjacent collets in this region can generate pronounced local deformation gradients. Such load distributions, being unrealistic for typical aerodynamic loading conditions, can create unintended local stress concentrations and potentially lead to premature structural failure

// -------------------------------------------------------------------------- //
The determination of required #gls("lie") quantity necessitates clear establishment of load introduction accuracy requirements, associated costs, and desired discrete load distribution characteristics. While collets present lower accessibility compared to sandbags, they offer distinct advantages for specific testing scenarios. Their reusability, however, remains constrained by geometric considerations. Any modification in profile geometry necessitates new collet manufacture, rendering them a cost-intensive option when high adaptability across varying wing profiles is required.

Safety considerations for collet-based #gls("lie") implementations parallel those of sandbag configurations, necessitating appropriate shielding and distance maintenance during structural testing. Collets present a significant operational advantage through their capacity for remote load adjustment, either from the crane cockpit or through remote control systems, thus minimizing personnel exposure to potential risks. In the event of structural failure, collets may provide localized containment of #gls("cfrp") particles at attachment points, though penetration of particles through collet material remains a consideration. The optimization objective of achieving satisfactory load distribution with minimal collet quantity must be balanced against these safety considerations.

Given an anticipated wing span of approximately $gt.tilde 7 upright("m")$, the substantial unconstrained surface area between collet positions introduces uncertainty regarding potential failure locations. This geometric configuration presents elevated risk for omnidirectional #gls("cfrp") particle dispersion, necessitating comprehensive protective measures and appropriate safety distances. 
The control system implementation, while relatively straightforward post-installation of collets and load harness, requires specialized personnel for multiple operational aspects. This includes oversight of collet positioning and attachment integrity, as well as qualified crane operation. These staffing requirements ensure precise load distribution while maintaining both operational safety and structural testing integrity.

// -------------------------------------------------------------------------- //
Test reproducibility utilizing collets as #gls("lie") demonstrates favorable characteristics attributable to their precise attachment capabilities, with positional deviations maintained within millimeter tolerances. The electrical crane operation further enhances repeatability through controlled load application. These factors collectively contribute to high reliability and consistency in experimental outcomes. Despite representing an established methodology without significant innovation potential, the implementation of collets introduces complex considerations regarding constraint forces that warrant thorough investigation.
A potential mitigation strategy involves the utilization of single-sided collets that partially enclose either the upper or lower wing surface exclusively. This configuration allows unrestricted vertical expansion of the structure during loading. Correspondence with IMA Dresden has confirmed the practical feasibility of such an approach. 
The application of tension loads through collet configurations presents varied implementation possibilities, particularly when combining crane and cylinder systems. While crane-only configurations exhibit certain operational limitations, the integration of hydraulic cylinders enables enhanced load application flexibility. However, the numerical representation of collet-wing interactions in #gls("fem") models introduces additional complexity due to the requisite precision in contact condition modeling. This complexity manifests particularly in scenarios where the collet encases the profile, introducing asymmetric loading conditions between the constrained lower surface and the unconstrained upper surface during lift operations.

To conclude, cost assessment for collet implementation remains contingent upon detailed specification of load discretization requirements and accuracy parameters. 
The integration of crane systems and associated load harnesses introduces significant cost implications relative to simpler methodologies such as sandbag implementation. 
The determination of collet suitability for specific testing scenarios necessitates detailed evaluation of two critical factors: achievable load introduction accuracy and the influence of constraint forces on structural behavior. These considerations must be thoroughly analyzed within the context of specific test requirements to ensure appropriate selection of load introduction methodology.

// ------------------------------ air Cushions ------------------------------ //
#hor_Line("Assessment: Air Cushions")
Air cushions represent an emerging methodology in #gls("lie") deployment, distinguished by their innovative approach to load distribution.
Initial assumptions suggested high procurement costs due to specialized manufacturing requirements. However, the fundamental technology, which utilizes pressurized cushions with plastic surface attachments, indicates potential cost-effectiveness in production.
Collaboration with IMA Dresden has revealed high market availability of these systems, indicating favorable procurement conditions. 
The efficient load distribution characteristics of air cushions potentially reduce the required number of units compared to alternative methods, though operational costs, particularly related to cylinder pressurization systems, remain comparable to collet and cylinder configurations.
A critical advantage of air cushion implementation lies in its capacity for precise and uniform load distribution across surfaces. This approach significantly reduces the occurrence of constraint forces and load irregularities common to traditional methods, offering superior accuracy in load introduction. 

The determination of optimal air cushion quantity depends fundamentally on load distribution approximation requirements. This quantification requires comprehensive calculations and analyses. While these specialized #gls("lie") demonstrate high market availability, their implementation offers significant advantages through simple attachment and removal processes utilizing replaceable plastic end surfaces. This design feature enables efficient reuse across different wing configurations, promoting both resource sustainability and long-term cost efficiency.
Safety protocols necessitate careful consideration during operation. Personnel protection requires maintaining appropriate distances from the test structure during load application. The system's remote pressure control capabilities facilitate safe test execution while enabling flexible load adjustment without direct operator proximity to the test article.

// -------------------------------------------------------------------------- //
The operational requirements of air cushions encompass both their application and pressurization. 
The operational requirements of air cushions encompass both their application and pressurization. The integration with cylinders results in increased control system requirements compared to cylinder-based systems, as both cylinder operation and pressure regulation must be managed. The critical technical challenge resides in achieving precise pressure control within the air cushions to ensure uniform load distribution.
The implementation requires specialized personnel for load operations. These operators must monitor both the initial system configuration, including proper air cushion application and cylinder connections, and maintain operational oversight throughout test execution.
The system demonstrates high test result reproducibility due to the precise positioning capabilities and electrical cylinder control. These characteristics facilitate consistent load application throughout repeated test cycles.

The air cushion system exhibits significant innovation potential, given its current limited application in structural testing. This novel load introduction approach presents opportunities for enhancement or replacement of conventional methodologies. 
The application of pressure forces from below eliminates constraint forces, facilitating uniform load distribution and precise force application.
Tension load introduction, however, requires adequate adhesive bonding between the air cushions and wing structure. Both the air cushion material and adhesive interfaces must possess sufficient stiffness characteristics to ensure proper load transfer. 
The implementation of air cushions simplifies the #gls("fem") modeling process. The uniform surface load distribution generated by the air cushions permits straightforward numerical representation within the #gls("fem") framework, enhancing both computational efficiency and simulation accuracy.

In summary, while current cost estimates for the air cushion system remain incomplete, preliminary analysis indicates higher expenditure compared to collet and cylinder-pad configurations. This increased cost is primarily attributed to complex control system requirements. The implementation costs comprise both the air cushion procurement and the essential cylinder systems for pressure force application. Despite these cost considerations, the system demonstrates significant advantages in reusability, safety, reproducibility, and innovative load introduction methodology, positioning it as a viable solution for future load distribution applications.

// ---------------------------- cylinder and pad ---------------------------- //
#hor_Line("Assessment: Cylinder with Pad")
The procedure with pads and cylinders represents an established method for load introduction that differs little from the use of air cushions with cylinders in terms of handling and achieved results.
Achieving high load distribution quality also requires a correspondingly large number of #gls("lie") here, which can increase costs.
However, the accuracy of load introduction is a strong advantage of this system, as constraint forces can be minimized and the load is evenly distributed over small areas.

The availability of components, both hydraulic cylinders and pads, is good for large aircraft structural tests, which facilitates the implementation of the procedure.
The reusability of pads and cylinders is another plus point, particularly when attaching and removing the pads is possible without great effort.
Regarding safety, similar precautions must be taken as with air cushions, including maintaining distance from the wing and the ability to adjust the load through control technology from a distance.
The control system effort depends on the required load distribution quality and may be higher than with air cushions due to the use of small-area pads.

Specially trained personnel is required to monitor the proper attachment and connection of pads and cylinders, contributing to ensuring precise and reliable load introduction.
Test reproducibility is facilitated by reattaching the pads at the same locations and electrically controlling the cylinders, enabling high repeatability of test results.
Although the procedure is known and thus does not possess a high innovation factor, its application outside large aircraft construction represents an expansion of the field of application.
The possibility of constraint forces strongly depends on how the pads are connected to the wing.
An elastic intermediate layer between pad and wing can minimize constraint forces, while direct bonding can lead to local constraint forces.
The ability to introduce tension loads depends on the cohesive and adhesive strength of the adhesive used and sufficient stiffness of the pads.
This requires careful selection of materials and adhesives to achieve the desired test conditions and ensure the integrity of structural tests.

The modeling effort for the procedure with pads and cylinders should not be underestimated, as both the stiffness of the pads and the nature of their connection to the wing must be included in the calculations.
This step is crucial to correctly simulate the system's behavior under load conditions and understand how loads are actually transferred to the structure.
Careful consideration of these factors in the modeling process is essential for the accuracy of simulated results and their transferability to real conditions.

In summary, the costs for applying the pad and cylinder procedure significantly depend on the number of required #gls("lie").
The necessity to use a high number of pads and cylinders to achieve a finely tuned and precise load distribution can significantly influence costs.
In addition to direct procurement costs for pads and cylinders, operating costs, including electricity costs for control technology, must also be considered.
These operation costs can be substantial, depending on the complexity and duration of tests.

Despite potentially high costs, the procedure with pads and cylinders offers excellent load distribution quality, especially with a high number of #gls("lie").
This method enables precise control over load application, resulting in high-quality and meaningful results in structural tests.
The ability to distribute loads evenly and accurately while minimizing constraint forces represents a significant advantage and makes the procedure attractive for a variety of applications in structural testing.
The decision for or against this method ultimately depends on balancing required accuracy, costs, and specific requirements of the respective test project.

#hor_Line("Assessment: Overview")
Many individual points were presented about the various methods. 
To present these in a clear manner and to see each individual evaluation criterion compared across the four essential #gls("lie"), reference should be made to @tab_32.
At this point, it should be noted that the goal for @tab_32 was to transfer the collected observations into a clear form.
However, when high-dimensional information (high amount of information) is transferred into a low dimension (three possibilities for evaluation), a certain subjectivity or susceptibility to errors cannot be excluded.

// TODO recheck that - copy pasted table 33
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
  [3], [Number of #gls("lie")], [#col_X()], [#col_Mid()], [#col_X()], [#col_Mid()],
  [4], [Availability of #gls("lie")], [#col_Gre()], [#col_Gre()], [#col_Gre()], [#col_Gre()],
  [5], [Reusability of #gls("lie")], [#col_Gre()], [#col_X()], [#col_Gre()], [#col_Gre()],
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
  caption: [Evaluation criteria for various #gls("lie") broken down into a three-dimensional space according to the made explanations. 
  Here #col_X() stands for negative, #col_Mid() for medium, #col_Gre() for positive.
  Furthermore, innovation was viewed as negative here for a pioneering project.],
) <tab_32>


// ------------------------------- innovation ------------------------------- //
Through exchanges within the team and with the industrial partner (IMA), it was discovered that innovation is of great importance for science and the general public, making innovation viewed as something positive.
However, in a project where a pioneering aircraft is to be structurally tested for the first time, it would certainly be advantageous to rely on known and proven methods.
Therefore, all innovation entries from @tab_32 would be understood as inverted, resulting in the final evaluation matrix given in @tab_33.

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
  [3], [Number of #gls("lie")], [#col_X()], [#col_Mid()], [#col_X()], [#col_Mid()],
  [4], [Availability of #gls("lie")], [#col_Gre()], [#col_Gre()], [#col_Gre()], [#col_Gre()],
  [5], [Reusability of #gls("lie")], [#col_Gre()], [#col_X()], [#col_Gre()], [#col_Gre()],
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
  caption: [Evaluation criteria for various #gls("lie") broken down into a three-dimensional space according to the made explanations. 
  Here #col_X() stands for negative, #col_Mid() for medium, #col_Gre() for positive.
  Furthermore, innovation was viewed as negative here for a pioneering project.],
) <tab_33>

#hor_Line("Current Favorite")
To identify a final favorite, several open questions still need to be answered.
Many of these can be determined through load approximation.
How many #gls("lie") are needed, what dimensions should they have, where should they be attached, what minimum distance between them is required, and what magnitude should be pulled or pushed.

Therefore, @tab_32 and @tab_33 can be considered as an important first step, providing indications for concrete further action.

// TODO proper transition into next chapter - also make sure to hihglight that the provided inofrmaiton from the enxt chapter are helpful, but the optmizaiton is still just one of the next steps that needs to be taken. With it informaiton especially related to the desired test condiations can be obtianed. While the optimiaztion results can be reagrded as hihgly helpful, potentially additional considerations need to be make depending on the scale of the considered project
To identify a favorite, load approximation should be carried out next.

// TODO proper summary
#summary_([
In this section, it was explained what is meant by physical load introduction.
Then, several options were enumerated and explained, which should have highlighted the difference between simulative and physical or experimental load application.
An evaluation table was presented and applied to each #gls("lie").
The derivation of results was discussed in detail in written form on one hand, and on the other hand, a tabular presentation was given for clarity.
This section brings to our attention that the next sub-point should address the load discretization of continuous aerodynamics.

])