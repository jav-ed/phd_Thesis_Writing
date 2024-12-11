/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// INFO
// all refs
// all figs - the image data was not copied
// all eqs
// compared with true german text

// Title was tested and is inshallah fine
=== Aerodynamic Load Computation and Post-Processing <chap_4_0_1>
In @chap_3_0_4, an examination of available #glspl("lie", long:true) for introducing physical loads in the wing of a #gls("swith", long:true) was conducted. These elements were evaluated against specific criteria, leading to the establishment of #gls("ld", long:true) necessity. 
The investigation continued in @chap_4_0_0, exploring various implementation possibilities for #gls("ld") and determining that these methods require integration with optimization approaches to solve remaining issues. Prior to executing #gls("ld") and its subsequent steps, it is essential to obtain the aerodynamic loads acting on the aircraft wing. This section presents a methodology for acquiring these loads through numerical simulations and details their transformation from distributed loads to discrete point loads. The transformation process holds particular significance for k-means++ implementation and demonstrates advantageous implications for the subsequent optimization framework.

// -------------------------------------------------------------------------- //

Prior research at TU Dresden has established foundational work in this domain, particularly through the development of a computational framework that integrates structural and aerodynamic analyses using #gls("fem"). This framework employs APAME @Filkovic as its aerodynamic solver, implementing a three-dimensional frictionless panel method for load calculations.
While APAME does not target high-fidelity aerodynamic analysis, it provides an effective balance between computational efficiency and accuracy in predicting lift distribution. The solver processes several key input parameters, including flight velocity, density, Mach number, and geometric characteristics, to generate spanwise lift distributions. Through fluid-structure coupling methodology, these aerodynamic loads are mapped from the aerodynamic mesh to the structural mesh, enabling their integration into the #gls("fem") analysis framework.
@fig_67 presents a representative output from APAME, illustrating the distribution of lift coefficients, scaled by local chord length, along the wing span.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/1_Get_Aero_Forces/0.png", 
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
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/1_Get_Aero_Forces/1.svg", 
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


// ------------------------------- point load ------------------------------- //
The combination of @eq_81 and @eq_82 enables the transformation of distributed loads into point loads across all mesh elements, with each element yielding exactly one resultant partial force. However, as illustrated in the lower left corner of @fig_69, this initial transformation does not provide the complete solution required for the analysis.


#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/1_Get_Aero_Forces/2.svg", 
  width: 68%),
  caption: [Schematic illustration of the advanced conversion process from distributed aerodynamic loads to adjusted point loads for k-means++ @Arthur2006.],
)<fig_69>

The limitations of this transformation approach become apparent when examining the fundamental properties of k-means++ @Arthur2006. 
In its standard implementation, k-means++ assigns equal weighting to each point during initialization. 
Consequently, areas containing a higher density of data points - in this case, force points - have a greater likelihood of forming new clusters. 
This characteristic makes both the position and quantity of points critical factors in the clustering process.
When multiple small-magnitude forces concentrate in a particular location, their collective presence artificially elevates the importance of that region. This bias shifts the centroid position toward areas with higher point density, regardless of the individual force magnitudes. 
The variation in force point density stems directly from the non-uniform element lengths within the mesh structure, as evident through careful examination of @fig_67. 
Regions with smaller element lengths accumulate more force points, leading to an artificially increased likelihood of centroid generation in these areas.

The optimal placement of centroids, which determine the locations of the #glspl("lie"), remains unknown prior to analysis. 
k-means++ determines these positions through centroid calculation, providing the essential information about #gls("lie") centers. 
However, if the input data format inadvertently introduces directional bias, the resulting k-means++ output may become partially or completely invalid for the intended analysis.

// ------------------------- input format adjustment ------------------------ //
The adjustment of k-means++ input data format requires establishing a relationship between force distribution and reference length. This relationship determines how many uniformly distributed partial point forces approximate the distributed load for each element, based on its specific length. According to @eq_83, a distributed load of [N $"mm"^(-1)$] spanning a reference length of $100 "mm"$ is discretized into 20 partial point loads [N]. 
These units, since chosen for clarity of exposition, remain adaptable to alternative requirements. 
@eq_83 thus provides the mathematical basis for determining the number of partial forces necessary to subdivide each resultant point load.

$ n_F = l_i space.thin 20/100  $ <eq_83>

The calculation of individual partial point loads follows the formulation presented in @eq_84. Within each #gls("fem") element $i$, the variable $j$ denotes the index of the specific partial point load, as illustrated in the lower right corner of @fig_69.

$ F_(a,i,j) = (q_(a,i) dot l_i )/n_F  $ <eq_84>


The distribution of partial point loads within a single #gls("fem") element can be derived from the division of the resultant single point load by a scalar value. 
For a given element $i$, this relationship leads to an important property regarding the distribution of forces.
Consider an element $i$ where $i = "const"$ and $j in {0,1, ..., n_F-1}$.
It follows that for $F_(i= "const", j)$, all partial forces are equal
$F_(i,j=0) = F_(i,j=1) = ... = F_(i,j=n_F)$.
This equality demonstrates that all partial point loads within the same element maintain identical magnitudes. However, this equality relationship is strictly limited to forces within a single element and does not extend to forces across different elements.
The resulting data structure can be represented as a matrix $bold(X)$, following the convention used in Scikit-learn @Pedregosa2011, as shown in @eq_85.

$ bold(X) = bold(X)[ ("Position"), space ("Partial point loads" = F_(a,i,j))] $ <eq_85>

Each partial point load is associated with a corresponding three-dimensional position vector. 
As established in @chap_4_0_0, such three-dimensional data structures pose no challenge for k-means++, which readily handles even higher-dimensional spaces. 
APAME provides lift coefficients that are valid for span strips, which serve as discrete computational entities. 
Within each strip, the lift coefficient undergoes integration over the chord length. 
As shown in @eq_86, the representative lift coefficient for a span strip $i$, denoted as $C_("lc",i)$, is derived through the integration of the local lift coefficient $C_L$ from the leading edge (le) to the trailing edge (te). 


$ C_("lc",i) = integral_("le") ^("te")  C_(L,i) $ <eq_86>

In order to obtain distributed forces from $C_("lc",i)$, @eq_80 can be modified to @eq_87.

$ q_a = rho/2 dot u^2 dot underbrace(C_L  dot c, C_("lc")) =  rho/2 dot u^2 dot C_("lc")  $ <eq_87>


// -------------------------------------------------------------------------- //

With the distributed forces according to @eq_87, the individual partial point loads can be determined by applying the previously described procedure. 
Given the properties of $C_("lc",i)$, the resulting partial forces $F_(a,i,j)$ exhibit distribution exclusively along the span direction, with no coordinate variations occurring in the remaining two directions.
This transformation effectively reduces the three-dimensional aerodynamic load distribution to a one-dimensional load distribution comprising the resulting partial forces $F_(a,i,j)$. 
This reduction provides two significant advantages. First, the resulting force points are compatible with k-means++ implementation. 
Second, the reduced dimensionality allows the use of a one-dimensional beam model instead of the more computationally intensive #gls("fem") model within optimization frameworks.
A dedicated examination of both the beam model and optimization methodology is presented in @chap_4_0_2 to @chap_4_0_4, followed by concrete optimization problem definitions and their solutions in @chap_5_0 to @chap_5_3.

// --------------------------------- summary -------------------------------- //
#summary_([
Building upon @chap_4_0_0, this section presented a methodology for obtaining and transforming three-dimensional aerodynamic loads into one-dimensional resulting point loads. 
The investigation began with explaining the derivation of aerodynamic loads and their structural relevance, followed by an examination of the data format requirements for k-means++ clustering in relation to APAME's output characteristics.
To bridge the identified gaps between APAME's outputs and k-means++ requirements, a systematic transformation procedure was developed. The procedure addressed some key challenges. First, it enabled the conversion of distributed loads to point loads while maintaining their physical significance. Second, it resolved mesh density variations that could potentially bias k-means++ clustering results.
The implementation of a reference-length-based force discretization method proved instrumental in resolving these challenges. The development process was supported by numerous visual illustrations and mathematical equations to ensure clear understanding.

The reduction of the three-dimensional load distributions to one-dimensional representations enables the use of computationally efficient beam models as alternatives to #gls("fem") analysis. 
This simplified modeling approach proves particularly advantageous within optimization frameworks, where computational efficiency becomes crucial due to iterative model evaluations.
The findings outlined in this section provide the essential foundation for understanding the concepts elaborated in @chap_4_0_2 to @chap_4_0_4 and their practical implementations highlighted in @chap_5_0 to @chap_5_3.
])