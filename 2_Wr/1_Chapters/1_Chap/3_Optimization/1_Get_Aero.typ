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
This subsection will therefore demonstrate one method how aerodynamic loads can be obtained thorugh numerical simulations and transformed in a way that kmeans++ can be used for the #gls("ld").

// this needs to be adapted properly for a phd - its okay to acknowledge that work is based on somehting, but should be adapted
From previous projects conducted at TU Dresden, valuable work is available.
Among others, there exists a simulation code that can model structural behavior with additional aerodynamic loads using #gls("fem").
This simulation code internally uses APAME @Filkovic to calculate aerodynamic loads.
APAME is a three-dimensional frictionless panel method. 
While the calculation is not designed for high-precision requirements, it reproduces the lift distribution with sufficient accuracy and in minimal computation time.
APAME receives inputs including flight velocity, density, Mach number, and geometric properties, and produces the lift distribution along the wing span as output.
This load distribution can then be mapped from the aerodynamic mesh to the structural mesh through fluid-structure coupling.
Thus, the strucutral #gls("fem") model also integrates the aerodynamic loads. 
An exemplary result provided by APAME is shown in @fig_67. 
It shows the distribution of lift coefficients multiplied by the local chord length across the wing span.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/1_Get_Aero_Forces/0.png", 
  width: 87%),
  caption: [Exemplary distribution of lift coefficients multiplied by local chord length, obtained from APAME @Filkovic],
)<fig_67>

To convert from a coefficient distribution to a force, let's examine @eq_79 and @eq_80.
In @eq_79, the variables represent $F_a$ for a point load, $rho$ for density, $u^2$ for velocity squared, $C_L$ for lift coefficient, $c$ for chord length, and $l$ for length.
Furthermore, $q_a$ from @eq_80 represents a force distributed over a length, or a distributed load.

// dot is used because it makes the distinction between the variables much easier -> easier than just adding some space.med
$ F_a = rho/2 dot u^2 dot C_L  dot c dot l space.quad  [#unit("N")] $ <eq_79>
$ q_a = rho/2 dot u^2 dot C_L  dot c  space.quad [#unit("N/mm")] $ <eq_80>

// it should be understood that the given units are mandated to always be in that form, you could also use N/m or KN  and so on
In order to explicitly emphasize the difference between the point load $F_a$ and a distributed load $q_a$ deomstrative units for both equations are provided.
In common parlance, it is often said that a force acts at a local point.
However, this is physically quite rare; in most cases, forces act along a length (distributed load) or over an area (tension/pressure).
However, in numerical mathematics Point loads can be used for special modeling pruposees or as single  resultant load.
// provide better explanation for what a resultant force is
A resultant force typically serves to reduce a force matrix  $bold(F)^(n times m)$ that extends over a length or area to a single resultant force.
Here n denotes the number of force entries and m the dimension of a single force vector.
The single resultant force can either be a single vector of the dimension m or be a single scalar value with its magnitude being calcualted.
Thus, the resultant force can thus be considered as a representative load that helps representing an entire distribution as a single vector or scalar value.

// ------------------------------- simple case ------------------------------ //
In simple cases, converting a resultant load distribution to a single load is possible without introducing concerning inaccuracies and local structral effects.
Simple cases can be imagined as geometries that contain very little or no local gradient.
To illustrate this, imagine we want to describe a geometry using x,y,z coordinates.
Since gradient describe the cahnge of one varaible with resepect to another, the following can be said.
If the local x and z coordinates do not change much when moving along the y direction, the gradients are accordingly low.
Besides the geometrical aspects for structral investigations, material properties such as stiffness gradients needs to be neglianbale small as well or zero that is constant stiffness within the considered domain.
For the transformation of the distributed load to a point load  without inducing local structral responses,  the shape and magnitude of the distributed load is of importnace.
In the case of a distirbuted load that acts on a given length with the constant load and constant angle, the  distributed load can be converted to a single point load for a certain length.

Generally, the larger the length or area for which the distributed load is to be converted to a single load, the greater the risks for structral local phenomena.
// formulation needs to be improved
Here's a concrete example: if we have a large length over which a uniformly distributed load acts and this is to be represented by a single point load, the following could occur.
// formulation needs to be improved
While, mathematically, everything remains possible, but a high local point load could cause material failure at that location.
Therefore, it is desirable to represent distributed loads through point loads over small lengths and areas, in addition to having uniform geometry, material properties and force distribution.
When working with complex geometries, the effective length and area over which the distributed load can be covered by a resultant point load decreases. 
Consequently, the number of individual forces increases accordingly.
The same effect occurs with a complex and highly non-linear load distribution that is to be approximated locally by individual point loads.

The meshed surface of a wing as an exmaple of a complex geomtry is given on the left side of @fig_68.
Furthermore it depcits how the meshed can be viewed as connected elements.
This detaield inspection is important to transfer distributed loads to a point loads.
The motivation behind this transformation is that APAME can be used to obtain distributed load according to @eq_80.
However, according to the reasoning provided in @chap_4_0_0, kmeans++ @Arthur2006 shall be used for the inital step of #gls("ld") of the aerodynamic load distribution.
Since kmeans++ required discrete data points as input, distributed loads from @eq_80 need to be adapted to discrete point loads in the form of @eq_79.
Vieweing the mesh as single connected elements as depichted on the left side of @fig_68, the distributed force $q_(a,i)$ and the resulting point load $F_(a,i)$ for one single element can be viwed on the right side of the same figure.
The latter depcits the difference between a distributed force  $q_(a,i)$ and a point load $F_(a,i)$ visually.
Speical attention should be given to the length of the arrow in $F_(a,i)$, which is higher than the arrows of  $q_(a,i)$ in order to signify that magnitude of the distributed load is approaximted through a single point load.
Also, it can be observed that if the uniform distributed load is to be formed into a point load, it would act at the center.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/1_Get_Aero_Forces/1.svg", 
  width: 100%),
  caption: [Representation of the basic initial concept: Reading out the aerodynamic distributed load and conversion to individual point loads],
)<fig_68>

Next, @fig_68 shows that the mesh consists of many individual elements and each element has its own distributed load.
It is possible that the distributed loads are equal at some elements, but this would be more coincidence than a requirement.
Generally, $q_(a,i) != op("const")$ applies, and thus the pairwise inequality
$ forall i, j in {0, .... , n} , i != j => q_(a,i) != q_(a,j)$.
Consequently, this also applies to the derived resultant point loads $ forall i, j in {0, .... , n} , i != j => F_(a,i) != F_(a,j)$.
To convert a uniform distributed load $q_a$ to a point load $F_a$, @eq_81 can be used.
Here, $l$ is a side length. 
Since $q_a$ was obtained according to @eq_80, the length in chord direction has already been used. 
Therefore, the sought length $l$ remains as the length of the element in span direction.

$ F_a = q_a dot l $ <eq_81>

// use it form, not we form
The information about the aerodynamic mesh is available to us in readable (non-binary) form and could therefore be processed without problems.
However, for handling .vtk files @Gueunet2023 @Shen2023 @Bethel2012, quite capable open-source libraries already exist. 
One of these is the Python library meshio 
@Islam2024 @Baker2023 @Jha2024 @CortesOrtuno2024 @DelaporteMathurin2024 @schlomer2022meshio.
Through this, the .vtk files can be easily read and desired information can be programmatically filtered and obtained.
Whether this should be done through meshio or through our own tool, the goal remains unchanged.
The element length in span direction must be obtained for each individual element.
This is done through simple subtraction; For the shown case, the coordinates of the right node must be subtracted from the coordinates of the left node of the same element.
Since the coordinates are given in 3D, the magnitude or length of the vector can be obtained through the Pythagorean theorem.
Mathematically, this can also be expressed as the L2-norm as shown in @eq_82.
Here, the indices $[x,y,z]_(i,r)$, $[x,y,z]_(i,l)$ stand for the coordinate in direction $x,y,z$, of element $i$ and the right $r$ and left $l$ node respectively.

$ l = sqrt((x_(i,r) - x_(i,l))² + (y_(i,r) - y_(i,l))² + (z_(i,r) - z_(i,l))²) $ <eq_82>



// ------------------------------- point load ------------------------------- //
Thus, with @eq_81 and @eq_82, a distributed load can be converted to a point load.
This can be done for all elements in the mesh, and for each individual element exactly one resultant partial force can exist.
However, @fig_69 shows, with the sub-figure in the lower left corner, that this is the complete desired solution.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/1_Get_Aero_Forces/2.svg", 
  width: 68%),
  caption: [Representation of the process of deriving point loads from distributed loads with the goal of using the point loads for kmeans++],
)<fig_69>


To understand why this approach is not entirely correct, another point about the nature of kmeans++ @Arthur2006 must be added.
In normal application of kmeans++, each point initially has the same weighting as a standard option.
This means that if particularly many data points or in this case force points are found in one location, a new cluster is more likely to be formed there.
Thus, not only the position of the points but also their number is of great importance.
// it form should be used
If we have particularly many but small forces in one location, we artifcally increase the importance. Consequently, the position of the centroid would shift towards this point-rich area.
The varying number of force points is a direct consequence of the variable element lengths that make up the mesh.
The latter statement can be verified by careful examination of @fig_67.
In regions were the element lengths is small more force points are accounted there.
As a consequence, the mentioned likelyhood to generate centroids there is falsely increased. 
Where the centroids or #gls("lie") should be placed is not known beforehand. Through the centroid posistion, kmeans++ gives exactly these informaiton, that is the centers of the #glspl("lie").
If a preferred direction were unknowingly provided through an incorrect data format, the kmeans++ output would be partially or completely unusable.

// --------------------------------- adjust --------------------------------- //
To adjust the kmeans++ input data format, it must be defined how many individual forces are to be found over a reference length. 
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
To reiterate, the clustering method kmeans++ can work with even higher dimensions without hitting hardware limitations or needing to change the implementation.
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
This has two implication. First because they are force points, they can be used with kmeans++.
Moreover, because of the 1d dimension, instead of performing the optimization with a more computationally intensive #gls("fem") model, a one-dimensional beam model can be used as a substitute model.
Further information about both the beam model and optimization will be elaborated in the following @chap_4_0_2 to @chap_4_0_4.


// --------------------------------- summary -------------------------------- //
#summary_([

// These are just some starting fractions. based on the provided text above, the summary could be expanded and refined
In this section, we explained how we first obtain a three-dimensional aerodynamic load and how it interacts with the structural model.
Then, we explained what data format is required for the kmeans++ method and what is obtained as output from APAME. 
Furthermore, the steps required to perform the needed data transformations were named. 
These were supported with visual illustrations and equations in addition to textual descriptions.
Finally, through the mention of the beam model and optimization, an introduction to the following @chap_4_0_2  where fundamentals of beam models are explained was made. 
])