/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// INFO
// all refs
// all figs - the image data was not copied
// all eqs
// compared with true german text

=== Obtaining Aerodynamic Loads<chap_4_0_1>
// use it form
In @chap_3_0_4, we examined some of the available #glspl("lie", long:true) for introducing physical loads in the wing of a #gls("swith", long:true) for an experiment, 
// potentially to long sentce
evaluated them according to specific criteria, and explained why #gls("ld", long:true) is necessary. 
In the subsequent @chap_4_0_0 we explored various possibilities for implementing #gls("ld") and determined that the presented methods alone are insufficient and should be combined with optimization.
However, before #gls("ld") can be performed and subsequent steps can be taken, the aerodynamic load that acts on the wing of an aircraft must be obtained.
This subsection will therefore demonstrate one method how aerodynamic loads can be obtained thorugh numerical simulations and transformed in a way that k-means++ can be used for the #gls("ld").
// -------------------------------------------------------------------------- //

Prior research at TU Dresden has established foundational work in this domain, particularly through the development of a computational framework that integrates structural and aerodynamic analyses using #gls("fem"). This framework employs APAME @Filkovic as its aerodynamic solver, implementing a three-dimensional frictionless panel method for load calculations.
While APAME does not target high-fidelity aerodynamic analysis, it provides an effective balance between computational efficiency and accuracy in predicting lift distribution. The solver processes several key input parameters, including flight velocity, density, Mach number, and geometric characteristics, to generate spanwise lift distributions. Through fluid-structure coupling methodology, these aerodynamic loads are mapped from the aerodynamic mesh to the structural mesh, enabling their integration into the #gls("fem") analysis framework.
@fig_67 presents a representative output from APAME, illustrating the distribution of lift coefficients, scaled by local chord length, along the wing span.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/1_Get_Aero_Forces/0.png", 
  width: 87%),
  caption: [Illustrative spanwise distribution of the lift coefficients multiplied by local chord length, as obtained from APAME @Filkovic.],
)<fig_67>

The conversion from coefficient distribution to force requires examination of @eq_79 and @eq_80. 
In @eq_79, $F_a$ represents a point load, $rho$ denotes density, $u^2$ represents velocity squared, $C_L$ is the lift coefficient, $c$ denotes chord length, and $l$ represents length. The variable $q_a$ in @eq_80 characterizes a force distributed over length, commonly referred to as a distributed load.

// dot is used because it makes the distinction between the variables much easier -> easier than just adding some space.med
$ F_a = rho/2 dot u^2 dot C_L  dot c dot l space.quad  [#unit("N")] $ <eq_79>
$ q_a = rho/2 dot u^2 dot C_L  dot c  space.quad [#unit("N/mm")] $ <eq_80>

To distinguish between point load $F_a$ and distributed load $q_a$, appropriate units are provided for corresponding equations. While in common language forces are often described as acting at specific points, this idealization rarely occurs in physical systems. In reality, forces typically manifest as distributed loads along lengths or as stresses (tension/pressure) over areas. 
Nevertheless, point loads serve valuable purposes in numerical analysis, particularly for specialized modeling applications or as resultant forces.
A resultant force provides a mathematical means of condensing a force distribution, represented by matrix $bold(F)^(n times m)$, into a single equivalent force. 
The matrix dimensions are defined by $n$, representing the number of force entries, and $m$, denoting the dimensionality of each force vector. 
The resultant can be expressed either as an $m$-dimensional vector preserving directional information or as a scalar magnitude.

// ------------------------------- simple case ------------------------------ //
In simple cases, converting a resultant load distribution to a single load is possible without introducing concerning inaccuracies or local structural effects. Simple cases can be characterized by geometries that exhibit minimal or no local gradients.
This concept can be illustrated through a geometric description using x,y,z coordinates. Gradients characterize the rate of change of one variable with respect to another. Various geometric changes can occur, such as thickness variations, curvature changes, or cross-sectional area transitions.
For example, if the local x and z coordinates exhibit minimal change while moving along the y direction of a beam, the corresponding geometric gradients are considered low.
Beyond geometric considerations, structural analysis must account for material properties, including stiffness gradients and density distributions. These material properties must be negligibly small or zero, ensuring constant material characteristics within the considered domain. For successful transformation of distributed loads to point loads without inducing local structural responses, both the shape and magnitude of the distributed load are of critical importance.

A distributed load can be transformed into a single point load over a specific length, with this transformation being most straightforward when the load maintains constant magnitude and angle. However, such transformations require careful consideration of potential local structural responses. The risk of inducing these responses increases with both the non-uniformity of the load distribution and the length over which the transformation occurs.
For distributed loads acting over large lengths or areas, transformation to a single point load presents particular challenges. While mathematically feasible, the resulting concentrated force can induce significant local stresses, potentially leading to material failure at the point of application. This risk becomes especially pronounced when dealing with non-uniform load distributions.
To mitigate these risks, it is advantageous to discretize distributed loads into multiple point loads over smaller lengths and areas. 
This approach is essential when dealing with complex geometries or non-linear load distributions.
As geometric complexity increases, the effective length over which a single resultant point load can adequately represent the distributed load decreases, necessitating a higher number of discrete point loads to maintain structural accuracy.

// -------------------------------------------------------------------------- //
The meshed surface of a wing, representing a complex geometry, is illustrated on the left side of @fig_68. The figure demonstrates how the mesh consists of interconnected elements. This detailed representation is crucial for understanding the transformation of distributed loads to point loads.
The transformation process is motivated by two factors: APAME provides distributed loads according to @eq_80, while k-means++ @Arthur2006, as 
outlined in @chap_4_0_0, requires discrete data points for the initial step of #gls("ld") of the aerodynamic load distribution. 
Consequently, the distributed loads from @eq_80 must be converted to discrete point loads following the form of @eq_79.
The force transformation mechanism is visualized on the right side of @fig_68, where a single element demonstrates the relationship between the distributed force $q_(a,i)$ and its resulting point load $F_(a,i)$. 
The point load $F_(a,i)$ is depicted with a larger magnitude vector compared to the distributed force vectors $q_(a,i)$, illustrating the aggregation of the distributed load into a single point load. 
For uniform distributed loads, this resultant force's point of application coincides with the element's center.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/1_Get_Aero_Forces/1.svg", 
  width: 100%),
  caption: [Schematic illustration of the conversion process from distributed aerodynamic loads to discretized individual point loads on a meshed wing surface.],
)<fig_68>



As demonstrated in @fig_68, the mesh structure comprises multiple individual elements, each characterized by its unique distributed load. 
While it is theoretically possible for distributed loads to be equal across some elements, such equality would be coincidental rather than a systematic requirement. The general case is expressed as $q_(a,i) != "const"$, leading to the pairwise inequality:

#math.equation(block: true, numbering: none)[
$forall i, j in {0, .... , n-1} , i != j => q_(a,i) != q_(a,j) $
]
This inequality relationship extends to the derived resultant point loads:

#math.equation(block: true, numbering: none)[
$ forall i, j in {0, .... , n-1} , i != j => F_(a,i) != F_(a,j) $
]

The conversion of a uniform distributed load $q_a$ to a point load $F_a$ is accomplished through @eq_81, where $l$ represents the element's side length. Given that $q_a$ was derived according to @eq_80, which incorporates the chord-directional length, $l$ specifically denotes the element length in the span direction.

$ F_a = q_a dot l $ <eq_81>

// -------------------------------------------------------------------------- //
The aerodynamic mesh information is available in readable (non-binary) .vtk format, enabling straightforward processing. For handling .vtk and several other common file formats, such as XDMF, VTU, and GMSH, several robust open-source libraries exist @Gueunet2023 @Shen2023 @Bethel2012. 
The Python library meshio @Islam2024 @Baker2023 @Jha2024 @CortesOrtuno2024 @DelaporteMathurin2024 @schlomer2022meshio emerges as a particularly capable solution. It offers comprehensive support for both binary and non-binary file formats, facilitating efficient programmatic reading and filtering of mesh data.
While the choice between meshio and a custom tool implementation remains flexible, the fundamental requirement persists: obtaining the element length in the span direction for each individual element. 
This calculation is accomplished through coordinate subtraction, where the coordinates of the right node are subtracted from those of the left node within the same element. Given the three-dimensional nature of the coordinates, the magnitude or length of the resulting vector is obtained through the Pythagorean theorem, which can be mathematically expressed as the L2-norm shown in @eq_82. 
The notation $[x,y,z]_(i,r)$ and $[x,y,z]_(i,l)$ represents the coordinates in the $x$, $y$, and $z$ directions for element $i$, with subscripts $r$ and $l$ denoting the right and left nodes, respectively.
// -------------------------------------------------------------------------- //

$ l = sqrt((x_(i,r) - x_(i,l))² + (y_(i,r) - y_(i,l))² + (z_(i,r) - z_(i,l))²) $ <eq_82>


// ---------------------------------- here ---------------------------------- //
// ------------------------------- point load ------------------------------- //
Thus, with @eq_81 and @eq_82, a distributed load can be converted to a point load.
This can be done for all elements in the mesh, and for each individual element exactly one resultant partial force can exist.
However, @fig_69 shows, with the sub-figure in the lower left corner, that this is the complete desired solution.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/1_Get_Aero_Forces/2.svg", 
  width: 68%),
  caption: [Schematic illustration of the advanced conversion process from distributed aerodynamic loads to adjusted point loads for k-means++ @Arthur2006.],
)<fig_69>


To understand why this approach is not entirely correct, another point about the nature of k-means++ @Arthur2006 must be added.
In normal application of k-means++, each point initially has the same weighting as a standard option.
This means that if particularly many data points or in this case force points are found in one location, a new cluster is more likely to be formed there.
Thus, not only the position of the points but also their number is of great importance.
// it form should be used
If we have particularly many but small forces in one location, we artifcally increase the importance. Consequently, the position of the centroid would shift towards this point-rich area.
The varying number of force points is a direct consequence of the variable element lengths that make up the mesh.
The latter statement can be verified by careful examination of @fig_67.
In regions were the element lengths is small more force points are accounted there.
As a consequence, the mentioned likelyhood to generate centroids there is falsely increased. 
Where the centroids or #gls("lie") should be placed is not known beforehand. Through the centroid posistion, k-means++ gives exactly these informaiton, that is the centers of the #glspl("lie").
If a preferred direction were unknowingly provided through an incorrect data format, the k-means++ output would be partially or completely unusable.

// --------------------------------- adjust --------------------------------- //
To adjust the k-means++ input data format, it must be defined how many individual forces are to be found over a reference length. 
Thus, for each element, depending on its element length, it is defined into how many uniformly distributed partial point forces the distributed load is approximated.
According to @eq_83, at a length of $100 "mm"$, a distributed load [N $"mm"^(-1)$] is approximated by 20 partial point loads [N].
Note, the units are given to make things easier to understand and can be adapted to required units.
Consequently, @eq_83 gives the number of partial forces into which a resultant point load should be subdivided.

$ n_F = l_i space.thin 20/100  $ <eq_83>

The individual partial point loads can be calculated with @eq_84. 
Here, within an #gls("fem") element $i$ and the variable $j$ in this context stands for the partial point load within that element. This can be visually seen in the right lower corner in @fig_69.

$ F_(a,i,j) = (q_(a,i) dot l_i )/n_F  $ <eq_84>

Since the partial point loads are obtained by dividing a scalar value from the resultant single point load, within an  #gls("fem") element $i$ the following can be observed.
// better transtion for the math reference
With $i = op("const")$ and with $j in {0,1, ... n_F}$ then follows $F_(i= op("const"), j = op("variabel")) => F_(i,j=0) = F_(i,j=1) = ... = F_(i,j=n_F)$.
Expressed in words, this means that the partial point loads within an element are equal to each other.
While the partial point loads within an unqiw element are equal in magnitude, this does not mean that this equality can be extended to other elements.
The structre of the data matrix $bold(X)$, as it is noted in Scikit-learn @Pedregosa2011, is given in @eq_85.

$ bold(X) = bold(X)[ ("Position"); space ("Partial point loads" = F_(a,i,j))] $ <eq_85>

For each partial point load, a corresponding three-dimensional position vector is specified.
To reiterate, the clustering method k-means++ can work with even higher dimensions without hitting hardware limitations or needing to change the implementation.
APAME is able to provide lift coefficients that are valid for span strips and can be seen resulting entities. 
Within a strip, the lift coefficient is integrated over the chord.
This behavior is shown in @eq_86, the lift coefficient which is represenatrive for a span strip $i$ is denoted as $C_("lc",i)$ and is obtained through the integration of the lift coefficient $C_L$ over the boundaries leading edge le and  trailing edge te.
Here, le stands for leading edge, which appears at the beginning of the chord, and te for trailing edge, which is found at the end of the chord.

$ C_("lc",i) = integral_("le") ^("te")  C_(L,i) $ <eq_86>

In order to obtain distributed forces from $C_("lc",i)$, @eq_80 can be modified to @eq_87.

$ q_a = rho/2 dot u^2 dot underbrace(C_L  dot c, C_("lc")) =  rho/2 dot u^2 dot C_("lc")  $ <eq_87>

In order to obtain the required individual partial point loads the descibed proedure can be followed. Because of the explained properties $C_("lc",i)$ the resulting partial forces $F_(a,i,j)$ are only distributed along the span. 
A coordinate change in the two other remaining directions does not occur.
Consequently, the 3d aerodynamic load distribution was tranfered to a 1d load distirbution consisting of resulting partial forces $F_(a,i,j)$.
This has two implication. First because they are force points, they can be used with k-means++.
Moreover, because of the 1d dimension, instead of performing the optimization with a more computationally intensive #gls("fem") model, a one-dimensional beam model can be used as a substitute model.
Further information about both the beam model and optimization will be elaborated in the following @chap_4_0_2 to @chap_4_0_4.


// --------------------------------- summary -------------------------------- //
#summary_([

// These are just some starting fractions. based on the provided text above, the summary could be expanded and refined
In this section, we explained how we first obtain a three-dimensional aerodynamic load and how it interacts with the structural model.
Then, we explained what data format is required for the k-means++ method and what is obtained as output from APAME. 
Furthermore, the steps required to perform the needed data transformations were named. 
These were supported with visual illustrations and equations in addition to textual descriptions.
Finally, through the mention of the beam model and optimization, an introduction to the following @chap_4_0_2  where fundamentals of beam models are explained was made. 
])