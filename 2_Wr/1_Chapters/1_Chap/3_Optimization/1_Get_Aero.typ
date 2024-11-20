/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// INFO
// all refs
// all figs - the image data was not copied
// all eqs
// compared with true german text

=== Obtaining Aerodynamic Loads<chap_4_0_1>
In @chap_3_0_4, we examined the physical #gls("lie") available for introducing loads in an experiment, evaluated them according to specific criteria, and explained why #gls("ld") is necessary. 
In the subsequent @chap_4_0_0 we explored various possibilities for implementing #gls("ld") and determined that the presented methods alone are insufficient and should be combined with optimization.
However, before #gls("ld") can be performed and subsequent steps can be taken, the aerodynamic load must be obtained.
This section will therefore demonstrate what steps were taken to obtain the aerodynamic loads.

From previous projects conducted at TU Dresden, valuable work is available.
Among others, there exists a simulation code that can model structural behavior with additional aerodynamic loads using #gls("fem").
This simulation code internally uses APAME @Filkovic to calculate aerodynamic loads.
APAME is a three-dimensional frictionless panel method. 
While the calculation is not designed for high-precision requirements, it reproduces the lift distribution with sufficient accuracy and in minimal computation time.
APAME receives inputs including flight velocity, density, Mach number, and geometric properties, and produces the lift distribution along the wing span as output.
This load distribution can then be mapped from the aerodynamic mesh to the structural mesh through fluid-structure coupling.
Thus, the #gls("fem") model also integrates the aerodynamic loads. 
An exemplary result provided by APAME is shown in @fig_66. 
The figure shows the distribution of lift coefficients multiplied by the local chord length across the wing span.

// TODO the legend of the map potentially is white, thus the image cannot be used on white background paper
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/5.png", 
  width: 100%),
  caption: [Exemplary distribution of lift coefficients multiplied by local chord length, obtained from APAME @Filkovic],
)<fig_66>

To convert from a coefficient distribution to a force, let's examine @eq_77[Equations] and @eq_78[].
In @eq_77, the variables represent $F_a$ for a point load, $rho$ for density, $u²$ for velocity squared, $C_l$ for lift coefficient, $c$ for chord length, and $l$ for length.
Furthermore, $q_a$ from @eq_78 represents a force distributed over a length, or a line load.

// dot is used because it makes the distinction between the variables much easier -> easier than just adding some space.med
$ F_a = rho/2 dot u² dot C_l  dot c dot l space.quad  [#unit("N")] $ <eq_77>
$ q_a = rho/2 dot u² dot C_l  dot c  space.quad [#unit("N/mm")] $ <eq_78>

It should be explicitly emphasized that a point load $F_a$ and a line load $q_a$ do not represent the same thing.
This is indicated both by the two different equations and by the explicit mention of units.
In common parlance, it is often said that a force acts at a local point.
However, this is physically quite rare; in most cases, forces act along a length (line load) or over an area (tension/pressure).
Point loads can be used in numerical mathematics as a resultant single load.
A resultant force typically serves to reduce a force vector that extends over a length or area to a single resultant force.
The resultant force can thus be considered as a representative load that helps represent an entire distribution as a scalar value.

// ------------------------------- simple case ------------------------------ //
In simple cases, converting a resultant load distribution to a single load is possible without introducing concerning inaccuracies.
Simple cases can be imagined as geometries that contain very little or no local gradient.
To illustrate this, imagine we want to describe a geometry using x,y,z coordinates.
Changing one coordinate should leave the other two remaining coordinates unchanged.
Specifically, we can imagine a cube. If we are, for example, on the upper surface of the wing, then we should be able to move across the entire surface without having to climb up or down.
In this case, we would have a horizontal flat surface, which should be termed a simple geometry.

For the transformation of the distributed load to a point load to continue without major restrictions, a force should be applied on the flat surface at equal distances with equal magnitude and in the same direction.
In such a state, the distributed load can be converted to a single point load for a certain length or area.

// TODO here were have some deviations from the original german text
Generally, the larger the length or area for which the distributed load is to be converted to a single load, the greater the risks for local phenomena.
// TODO the example is not mentioned in the original german version
Here's a concrete example: if we have a large length over which a uniformly distributed load acts and this is to be represented by a single point load, the following could occur.
// TODO the transtion does not add up
Mathematically, everything might be correct, but a high local point load could cause material failure at that location or other unexpected events could be observed.

Therefore, it is desirable to represent distributed loads through point loads over small lengths and areas, in addition to having uniform geometry and force distribution.
When working with complex geometries, the effective length and area over which the distributed load can be covered by a resultant point load decreases. 
Consequently, the number of individual forces increases accordingly.
The same effect occurs with a complex and highly non-linear load distribution that is to be approximated locally by individual point loads.

// Images of Fi qa and discretization Slide 12
A visual representation of the difference between the distributed load and point load is given in @fig_67 on the right side. 
If the uniform line load is to be formed into a point load, it would act at the center as shown in @fig_67.
Furthermore, @fig_67 shows that the example wing has a mesh consisting of individual elements. 
The result that APAME provides is a line load that follows @eq_78.
However, to work with kmeans++ @Arthur2006, discrete point data is needed.
Therefore, as shown in @fig_67, it is necessary to move from the representation of @eq_78 to the representation of @eq_77.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/6.svg", 
  width: 100%),
  caption: [Representation of the basic initial concept: Reading out the aerodynamic line load and conversion to individual point loads],
)<fig_67>

The following will show in detail using @fig_68 how a line load can be converted to a point load suitable for kmeans++.
First, it is known that according to @fig_67, the mesh consists of many individual elements and each element has its own line load.
It is possible that the line loads are equal at some elements, but this would be more coincidence than a requirement.
Generally, $q_(a,i) != op("const")$ applies, and thus the pairwise inequality
$ forall i, j in {0, .... , n} , i != j => q_(a,i) != q_(a,j)$.
Consequently, this also applies to the derived resultant point loads $ forall i, j in {0, .... , n} , i != j => F_(a,i) != F_(a,j)$.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/7.svg", 
  width: 100%),
  caption: [Representation of the process of deriving point loads from line loads with the goal of using the point loads for kmeans++],
)<fig_68>

To convert from a uniform line load $q_a$ to a point load $F_a$, @eq_79 can be used.
Here, $l$ is a side length. 
Since we obtained $q_a$ according to @eq_78, the length in chord direction has already been used. 
Therefore, the sought length $l$ remains as the length of the element in span direction.

$ F_a = q_a dot l $ <eq_79>

The information about the aerodynamic mesh is available to us in readable (non-binary) form and could therefore be processed without problems.
However, for handling .vtk files @Gueunet2023 @Shen2023 @Bethel2012, quite capable open-source libraries already exist. 
One of these is the Python library meshio 
@Islam2024 @Baker2023 @Jha2024 @CortesOrtuno2024 @DelaporteMathurin2024 @schlomer2022meshio.
Through this, the .vtk files can be easily read and desired information can be programmatically filtered and obtained.
Whether this should be done through meshio or through our own tool, the goal remains unchanged.
The element length in span direction must be obtained for each individual element.
This is done through simple subtraction; the coordinates of the right node must be subtracted from the coordinates of the left node of the same element.
Since the coordinates are given in 3D, the magnitude or length of the vector can be obtained through the Pythagorean theorem.
Mathematically, this can also be expressed as the L2-norm as shown in @eq_80.
Here, the indices $[x,y,z]_(i,r)$, $[x,y,z]_(i,l)$ stand for the coordinate in direction $x,y,z$, of element $i$ and the right $r$ and left $l$ node respectively.

$ l = sqrt((x_(i,r) - x_(i,l))² + (y_(i,r) - y_(i,l))² + (z_(i,r) - z_(i,l))²) $ <eq_80>

// ------------------------------- point load ------------------------------- //
Thus, with @eq_79 and @eq_80, a line load can be converted to a point load.
This can be done for all elements in the mesh, and for each individual element exactly one resultant partial force can exist.
However, @fig_68 shows, with the sub-figure in the lower left corner, that this is not desired.
To understand why this approach is not entirely correct, another point about the nature of kmeans++ @Arthur2006 must be added.
In normal use with kmeans++, each point initially has the same weighting as a standard option.
This means that if particularly many data points or force points are found in one location, a new cluster is more likely to form there.
Thus, not only the position of the points but also their number is of great importance.

If we have particularly many but small forces in one location, we simulate higher importance. Consequently, the position of the centroid would shift towards this point-rich area.
The varying number of force points is a direct consequence of the variable element length.
The latter statement can be verified by careful examination of @fig_66.
Where the centroids or #gls("lie") should be placed is not known to us at this time. It is the task of kmeans++ to answer exactly this.
If a preferred direction were unknowingly provided through an incorrect data format, the kmeans++ output would be partially or completely unusable.

// --------------------------------- adjust --------------------------------- //
To adjust the kmeans++ input data format, it must be defined how many individual forces are to be found over a reference length. 
Thus, for each element, depending on its element length, it is defined into how many uniformly distributed partial point forces the distributed load is approximated.
According to @eq_81, at a length of $100 #unit("mm")$, a distributed load [N/mm] is approximated by 20 partial point loads [N].
Therefore, @eq_81 gives the number of partial forces into which a resultant point load should be subdivided.
The individual partial point loads can be calculated with @eq_82. 
Here, within an element $i$, $i = op("const")$ remains constant and the variable $j$ in this context stands for the partial point load within an element.

$ n_F = l_i 20/100  $ <eq_81>

$ F_(a,i,j) = (q_(a,i) dot l_i )/n_F  $ <eq_82>

Since the partial point loads are obtained by dividing a scalar value from the resultant single point load, within an element $i$:
that $i = op("const")$ and with $j in {0,1, ... n_F}$ then follows $F_(i= op("const"), j = op("variabel")) => F_(i,j=0) = F_(i,j=1) = ... = F_(i,j=n_F)$.
Expressed in words, this means that the partial point loads within an element are equal to each other.
While the partial point loads within an element are equal in magnitude, this does not mean that this equality can be extended to other elements.
The X-Matrix, as it is called in Scikit-learn @Pedregosa2011, is our data matrix and looks as follows: $X = [op("Position [mm]"); op("Partial point loads") = F_(a,i,j)] $.
For each partial point load, a corresponding three-dimensional position vector is specified.
The clustering method kmeans++ can work with even higher dimensions without hitting hardware limitations or needing to change the implementation.

At this point, something must be anticipated and something must be said about the upcoming beam model and optimization.
This is necessary to understand why the three-dimensional coordinate vector should be converted to a one-dimensional position vector.
Further information about both the beam model and optimization will be discussed in the following @chap_4_0_2 to @chap_4_0_4.
Here, only a brief description from a highly superordinate view should be given.
Instead of performing the optimization with a more computationally intensive #gls("fem") model, a one-dimensional beam model can be used as a substitute model.
The beam model has a significant disadvantage compared to the #gls("fem") calculation: accuracy. 
However, it has various advantages, including that it can be used on a conventional computer within an optimization procedure.
Because the beam model represents a one-dimensional model and only sees a force distribution along the span direction, the three-dimensional coordinate vector from the X-Matrix should be converted to a one-dimensional position vector.
APAME provides, among other outputs, lift coefficients that are valid for strips. 
These strips are drawn along the span direction. 
Within a strip, the actual lift coefficient is integrated over the chord.
This behavior is shown in @eq_83, the lift coefficient which is valid for a strip $i$ is denoted as $C_(op("lc"),i$ and is obtained through the integration of the lift coefficient $C_l$ over the boundaries le and te.
Here, le stands for leading edge, which appears at the beginning of the chord, and te for trailing edge, which is found at the end of the chord.

$ C_(op("lc"),i) = integral_(op("le")) ^(op("te"))  C_l $ <eq_83>

If $C_(op("lc"),i)$ is multiplied by the remaining length of the strip in the span direction, a resultant lift coefficient is obtained, which is valid for the entire strip.
To obtain the force from this said resultant lift coefficient, @eq_77 can be used.
A resultant force acts at the geometric center of gravity, thus the resultant force can be assigned a unique position vector.
The resulting partial forces are only distributed along the span. 
A coordinate change in the two other remaining directions does not occur.
Thus, the two other spatial directions can already be neglected without problems with the obtained order.
In other words, further processing of the three-dimensional coordinate vector is not necessary, and removing the vertical and depth coordinates can be applied without concerns.

// --------------------------------- summary -------------------------------- //
In this section, we explained how we first obtain a three-dimensional aerodynamic load and how it interacts with the structural model.
Then, we explained what data format is required for the kmeans++ method and what is obtained as output from APAME. 
Furthermore, the steps required to perform the needed data transformations were named. 
These were supported with visual illustrations and equations in addition to textual descriptions.
Finally, an introduction to the following @chap_4_0_2 was made. 
The latter through the mention of the beam model and optimization.