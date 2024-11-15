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
Determining the required number of #gls("lie") presupposes that clear requirements for load introduction accuracy and costs are established, as well as an understanding of how the discrete load distribution should look.
Regarding the availability of collets, while they are not as easily accessible as sandbags, they offer decisive advantages for specific requirements.
However, their reusability is limited.
With any change in profile geometry, new collets must be manufactured, unless it's the same wing type without changes.
These limitations make collets a costly option, especially when high adaptability to different wing profiles is required.

Regarding safety aspects when using collets as #gls("lie"), similar precautions as with sandbags are required, including shielding or maintaining a large distance from the wing during structural testing.
A significant advantage of collets over sandbags is that varying the load does not require immediate proximity to the wing.
Adjustments can be made either directly in the crane cockpit or remotely, minimizing risk to operating personnel.
In the event of wing bursting, the collets could dampen the spread of #gls("cfrp") particles at the points where they are attached.
However, there is a possibility that #gls("cfrp") particles could penetrate the collet material.
Nevertheless, the goal is to achieve a satisfactory approximation of load distribution with as few collets as possible.

Since the wing would likely be mostly free of collets over its initially assumed total length of $gt.tilde 7 upright("m")$, it is unclear where bursting could occur, leading to a high risk that #gls("cfrp") particles could spread unhindered in all directions.
Appropriate distancing or the use of protective measures is therefore essential.
Regarding the control system effort, it should be noted that after attaching the collets and mounting the load harness on the crane, operating the crane is considered relatively simple.
Specially trained personnel is still required, particularly someone who monitors the correct positioning and proper attachment of the collets, as well as personnel familiar with crane operation.
These requirements ensure that load distribution is carried out accurately and safely while minimizing risks to operating personnel and the test structure.

// -------------------------------------------------------------------------- //
The reproducibility of tests using collets as #gls("lie")  on identical wings is rated positively due to the precision with which collets can be attached (small deviations in the millimeter range), as well as the electrical operation of the crane, which enables very good repeatability. 
These characteristics contribute to high reliability and consistency of test results. 
Although the use of collets is a known method and thus does not represent an innovation factor, it still poses challenges regarding the resulting constraint forces. 
These constraint forces and their potential effects on the structural behavior of the wing, such as displacements, stresses, and failure modes compared to a freely flying wing, must be carefully investigated to avoid distortions.

// -------------------------------------------------------------------------- //

egarding the possibility of introducing tension loads, collets in combination with a crane or cylinder offer different options. While using a crane alone may have certain limitations, the combination with a cylinder enables more flexible load application. The modeling effort for representing the interaction between collet and wing profile in #gls("fem") models is increased due to the necessity to precisely model the contact conditions between the two meshes (collet and profile). This is particularly the case when the collet encloses the profile and pushes the underside of the profile upward during lifting, while the upper side is not fixed and thus remains free.

In summary, the costs for using collets cannot be conclusively evaluated until the requirements for load discretization and accuracy are defined in detail. Nevertheless, it is clear that using a crane and additional load harness significantly increases costs compared to using sandbags. The possible load introduction accuracy and the effects of constraint forces on structural behavior are decisive factors that require detailed evaluation to determine the suitability of collets for specific test requirements.

// ------------------------------ air Cushions ------------------------------ //
#hor_Line("Assessment: Air Cushions")
Air cushions represent a relatively new method in load introduction technology, particularly notable for its innovative approach to load distribution.
Given that it is a specialized procedure, procurement costs could initially be assumed to be relatively high, as only niche manufacturers offer this technology.
On the other hand, the basic technology, which uses a pressurized cushion attached to the wing via a plastic surface, suggests a relatively simple and potentially cost-effective production method.
Through contact with our industry partner IMA, we were informed that there is high availability of these air cushions.
Due to the high availability, it can be assumed that the costs for merely procuring the cushions would be low.
The efficiency of load distribution through air cushions could be reflected in a lower number of required units compared to other methods, which would further put the costs into perspective.
Operating costs, particularly electricity costs for the cylinders that pressurize the air cushion, depend directly on the number of cylinders used and should be considered in the total cost calculation.
The latter puts the costs on par with collets and cylinders.
A decisive advantage of the air cushion method is the precise and uniform load distribution over the surface that it enables.
Unlike traditional methods where constraint forces or uneven loads can occur, the surface distribution of load through air cushions offers outstanding accuracy and quality in load introduction accuracy.
This characteristic makes them particularly attractive for applications where uniform load application is crucial.

Determining the optimal number of air cushions needed for a specific project depends on the exact approximation of the load to be distributed.
This number can only be determined after detailed calculations and analyses have been carried out.
Regarding the availability of these specialized #gls("lie"), it was already mentioned in the cost consideration that they can be easily obtained.
Through the possibility of simply gluing them on and removing them using replaceable plastic end surfaces, the air cushions can be reused for different wings without major problems.
This aspect not only supports sustainable use of resources but also helps minimize the long-term costs of the system.
In terms of safety, basic measures must be considered.
An appropriate distance from the wing during operation is essential to minimize risks to operating personnel.
Furthermore, adjusting the internal pressure of the air cushions should be remotely controllable, enabling flexible and safe handling during tests.

The air cushions must be both applied and pressurized. 
Additionally, they must be connected to cylinders. Because of this, the control system effort for the air cushion system is considered similar to the cylinder system.
The challenge lies in ensuring precise control of pressure within the air cushions to guarantee uniform load distribution.
Specially trained personnel is required for effective use of the air cushion system.
This personnel must not only monitor the correct application and proper connection of the air cushions and cylinders but also ensure their functionality during test execution.
The reproducibility of test results using air cushions is considered high due to precise placement possibilities and electrical control of the cylinders.
These characteristics enable consistent application of loads across repeated test cycles.

The innovation factor of the air cushion system is remarkable, particularly as this method currently has limited widespread use.
The novel approach to load introduction offers the potential to improve or even replace existing procedures.
Since the load is applied from below through pressure force, no constraint forces are expected, enabling uniformly distributed and precise load application.
However, to effectively introduce tension loads, a sufficiently strong adhesive connection between the air cushions and the wing is required.
Additionally, both the air cushion and the adhesive ends must have sufficient stiffness properties to correctly transfer the loads.
The modeling effort within the framework of #gls("fem") is simplified by using air cushions.
The uniformly distributed surface load generated by the air cushions can be represented in the #gls("fem") model without great difficulties, increasing the efficiency and accuracy of simulation-supported analyses.

In summary, while the costs for implementing the air cushion system are not yet fully known at this time, they are estimated to be comparable to the costs for collets and pads with cylinders. 
The reason for this is that even if the air cushions can be obtained inexpensively, cylinders are still needed to apply pressure force.
This, together with the described advantages regarding reusability, safety, reproducibility, and the innovative approach to load introduction, makes air cushions a promising option for future applications in load distribution.

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