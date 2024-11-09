/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */
#hor_Line("Assessment: Collet")
Regarding the use of collets as #gls("lie") in aircraft construction, several factors must be considered that significantly affect overall efficiency and costs.
Collets are custom-made components specifically developed for load introduction and for a particular profile geometry.
The costs for these custom-made items heavily depend on the variability of the profile geometry along the wing's span.
The higher the variation, the more specific collets are required, which can significantly increase costs.

// TODO recheck actual 7m?
In the specific case of a wing with a span of approximately $gt.tilde 7 unit("meter")$, where uniform load distribution is required over the entire length, an additional challenge arises.
The inner wing, which makes up the majority of the span ($gt.tilde 7 unit("meter")$) and contains the tanks, has a uniform cross-section in the absence of manufacturing inaccuracies.
If an outer wing area were assumed as with APUS #cite(<APUS_1>), then the length would increase. 
The remaining $tilde [2 - 4] #unit("meter")$ of the outer wing exhibits varying profile depth over its entire length.
These differences in profile geometry require adaptation of the collets, causing additional costs.
Additionally, there are costs for crane procurement and operating costs, such as electricity and personnel.

The accuracy of load introduction strongly depends on the number of collets used.
This accuracy can vary from very high to insufficient, depending on how high the load should be. 
A high load would cause significant wing bending.
At the point where a collet encloses the profile, local differences in displacements could result.
This phenomenon could be noticeable at the wing tip.
The longer the wing and the further away the collet is from the mounting point, the higher the expected deflection.
At the wing tip, the local displacement differences in the span direction are thus greater than near the mounting point.
The collet should be stiffer than the wing, making it understandable that outward displacements would only be possible if the collet opened or was penetrated.
In case outward displacements of the wing were prevented by the collet, constraint forces would be induced into the wing.
On one hand, these constraint forces could arise from external bending loads. 
However, it is also conceivable that the tubes would want to expand when the pressure is raised.

Since the tubes are connected to the skin, the radial outward expansion would be transmitted to the wing skin.
Now it could be that the wing skin is stiff enough to prevent this expansion.
However, at appropriately high pressure, it could also occur that the wing skin would expand outward in the undisturbed state (no collet).
However, if a collet were present around the wing skin, this outward expansion would be expected to be prevented.
This prevention can be physically imagined as artificial stiffening of the wing structure.
The latter would again cause constraint forces in the outer skin and in the tubes, thus influencing the structural properties of the wing.
The other case would be inward displacements. These would ensure that the collet no longer encloses the profile.
Enclosing means the collet should ideally touch the wing's outer skin at every point. 
The local contact between the collet's inner surface and wing skin would no longer exist in the case of inward-directed displacements of the wing.
Thus, the collet would only transfer the seen loads at individual points where contact between collet and wing skin still exists.

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

Since the wing would likely be mostly free of collets over its initially assumed total length of $gt.tilde 7 unit("meter")$, it is unclear where bursting could occur, leading to a high risk that #gls("cfrp") particles could spread unhindered in all directions.
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