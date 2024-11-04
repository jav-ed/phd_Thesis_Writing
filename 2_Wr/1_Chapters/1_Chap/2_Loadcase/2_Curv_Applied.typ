/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


// TODO
// Title Check
=== Application for Impact Filling Agent<chap_3_0_2>
while fem can provide strains, in the event where only displacements and corresponding locations are known, more general method shall be given.
explain which methods availabel to derive the gradeitns numerically. which chosen and why.
give some inution behind the applicaiton of the FDM methods


In this section, it will be explained how it was decided for #gls("swith", long:true) whether the fill medium had a noteworthy influence on structural behavior. 
For this purpose, it will be explained why an approach using critical curvature can be pursued. Subsequently, it will be discussed how the curvature can be calculated, which methods are available for this, and why the final method was chosen. Finally, the results of the conducted curvature study will be shown.

Previously, it was already explained that this thesis' plan does not provide for cost-intensive experimental investigations. Therefore, these cannot be conducted. However, an alternative method to still make qualitative statements for the desire of offering inital findings for conducating experimtnal statical strucutral validation tests.
These can be found upon careful examination of the results from @Liu2019. @fig_33 shows that the bending moment curves, regardless of fill medium and pressure, have similar curvature values for a certain range. 
Through this, a critical curvature could be defined, up to which the bending moment is independent of fill medium and pressure. @fig_34 shows two possible critical values for curvature. 

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/0_Critical_Curv.png", 
  width: 67%),
  caption: [Comparison of moment M and curvature $kappa$ for air and water as fill medium for different pressure levels @Liu2019 with possible critical curvature values],
) <fig_34>


Both $0.4 upright("m")^(-1)$ and $0.5 upright("m")^(-1)$ could be considered as permissible values. However, the author of this report chooses the safer variant and defines the critical curvature as $0.4 upright("m")^(-1)$. Through this, the deviation of the bending moment curves is just small enough to be considered negligible. For better overview, this definition should be given as formula @eq_27:

$ kappa_"crit" ≤ 0.4 $<eq_27>

// --------------------------- curvature of swith --------------------------- //
To check whether the curvature of a #gls("swith") model exceeds the critical curvature, its curvature values must be calculated.

// ---------------------------- model explanation --------------------------- //
For this work some design variations for #glspl("swith") are available as #gls("fem") model.
While acknowldign that the desning of the #gls("swith") and its modeling in #gls("fem") is of pivotal importance, yet the thesis assumes the given availabily of the #gls("swith") as #gls("fem") model.
This approach can be jhustified through the following. As of writing this thesis, there is no single commericaly cerrified #gls("swith") available.
This signalties many things. Among them are, that #glspl("swith") are in their developement stage. Adding the consideration that no single standard is available which could grant the commerical applicaiton of #glspl("swith"), it can be said, that #glspl("swith") are not only in a developement phase, but in a quite early developement and reseach state.
Moreover, because of the special properties of hydrogen as outlined in @chap_2_0_1 and @chap_2_0_2 it is understood that much works need to devoted to the pioneering project, to finally make #glspl("swith") under safe conditions for customers commericaly avaialble.
The major takeaway is that #glspl("swith") are in a early developement and research phase.
Consequently, there is much space for change. If the focus would be set on a specific #gls("swith") design with some pregiven constraints on which the specific #gls("fem") model would be built, the cahnces are high that the #glspl("swith") potenially available in future may differe significantly from what presented here.
Thus, it is considered to be more reasonable to have the focus on general methods than on numerical models that have limited practical applicaiton scope.
These general methods shall serve as a more universal contribution, that ideally could be applied to all kind of #gls("swith") simulation models.
Therefore, importance will be devoted in explaining the process of how the solution are obtianed.
With the provided explanations, potential given design changes for a #gls("swith") model should be adaptable by the interested reader to use the same method for his case.


First, #glspl("swith") bear both, aerodynamic forces and inner pressure laods. 
The aerodynamic loads can be obtained by many methods. Depedning on the accuracy demands, computational power and mdoeling should be linked. 
For this theis the aerodynamic loads calculated separately from the structral model through APAME @Filkovic, a frictionless open-source 3d panel method implementation. 
The aerodynamic loads are applied to the structural mesh through coupling. 
For the number of tanks, four tanks were chosen inspired by @APUS_1. 
The internal pressure of the four tanks for the sake of in depth study is defined as a variable and can be adjusted accordingly. 
The solution of the #gls("fem") model provides, among other things, the displacements. 


// --------------------------- explanation starts --------------------------- //
@fig_35 shows an extract of the displacement values in the three spatial directions of all nodes of an element.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/1_FEM_Displacements.png", 
  width: 77%),
  caption: [Example representation of displacement values in the 3 spatial directions at all nodes of an element],
) <fig_35>


Besides the displacements, the element ID precisely indicates which element is located where and which nodes are assigned to this element. Through this, it is also known which elements are adjacent to each other, or their neighborhood relationships can be derived. This concept of neighborhood is depicted in @fig_36.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/2_Neigbourhood.png", 
  width: 57%),
  caption: [Neighborhood relationships of individual elements is known through the numbered and color-highlighted element IDs],
) <fig_36>


// ---------------------------- curvature formula --------------------------- //
For determining the curvature with known displacement values, formula @eq_28 @Gross2021 @Gross2023 can be used. Here, u stands for displacement and u', u'' for the first and second derivatives of displacement with respect to the directional coordinate. 

$ kappa = u''/ ( (1 + u'^2) ^(3/2)) $<eq_28>

In paper @Liu2019, a geometric relationship was found through which the curvature could be calculated directly analytically. However, according to the author's knowledge, no geometric relationship can be found for the general case, which is why formula @eq_28 should be used.

// ------------------------ numerical differentiation ----------------------- //
Since the displacements are known, the derivatives can be obtained through numerical differentiation. Methods for obtaining the gradients numerically are the well known #gls("fd") methods 
@Baerwolff2020 @Meister2019 @Munz2019 @Richter2017 @Langtangen2017
and the less well-known Complex-Step @mdobook. Among the #gls("fd") methods there are three common procedures. 
All procedures are derived through Taylor series expansion and are subject to truncation error @mdobook. Since calculations are performed numerically, rounding error a added to the truncation error @Baerwolff2020. 
Common computers use double precision ($2^(-52) approx num("2.2 e-16")$ @Baerwolff2020), which means that numerical values cannot be captured after a certain decimal place. Consequently, rounding errors are inevitable. Rounding errors are to be considered according to accuracy requirements and are of great importance when calculating with very small numbers. The three common #gls("fd") methods are the Forward, Backward, and Central Difference methods. The Central Difference method is more accurate in calculating the derivative as it is a second-order method/accuracy. However, two support points are also needed to calculate the derivative of a point.

// ------------------------- regular numerical diff ------------------------- //
The Forward and Backward methods are first-order methods and are in most cases less accurate than the Central Difference method, but only need one support point for calculating the derivative. This makes them faster in execution and simpler in implementation. Forward and Backward methods differ in the quality of their derivative depending on the case. Usually, a step size study must be conducted to find a suitable value. The latter is defined via a convergence criterion, where the optimum represents a minimum of rounding error and truncation error. According to @mdobook a stepsize of $h approx 10^(-6)$ often procudes high quality ouptut. However, in the case of a structre mesh, the step size $h$ is the distance between the nodes of interest. Such a small distance between the nodes is unusual in stuctrual mechanics. For #gls("fem") the step size will be provided by the mesh size that can accurately solve the given mechanical description.

// ------------------------------ complex step ------------------------------ //
The Complex-Step is a second-order method and can be mathematically be proven to be one as for instance done in @mdobook. 
The amazing thing, however, is that only one support point is needed for this. For it to be applied, a mathematical function is needed. 
Point values and their distance, as with the known #gls("fd") methods, are not sufficient. Because function values at a very small distance from each other do not need to be subtracted, no rounding errors result and calculations can be performed with maximum machine precision (step size: $h approx 10^(-30)$) @mdobook. 
However, the truncation error remains (second-order method). The mathematical definitions of the #gls("fd") methods are given in formulas @eq_29 - @eq_31.
The variables are denotes as derivative function $f'$, discretization points $x_i$ and step size $h$ or distance between two discretization points $x_i$ and $x_j$, where $i != j $. 
// ---------------------------- differential eqs ---------------------------- //
$ f'_("forward")(x_1) = (f(x_2) - f(x_1))/h $<eq_29>
$ f'_("backward")(x_1) = (f(x_1) - f(x_0))/h $<eq_30>
$ f'_("central")(x_1) = (f(x_2) - f(x_0))/(2h) $<eq_31>

The order of placement of the discretization points $x_i$ is depicted in @fig_37. Besides providing neccesary background to levergage the #gls("fd") methods, a visual depiction of the discretization points $x_i$ often helps to understand the concept of #gls("fd") methods. 

// ------------------------------- single fdm ------------------------------- //
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/3_Simple_FDM.svg", 
  width: 47%),
  caption: [Nessary knowledge about the positions of the discretization points $x_i$ the #gls("fd") method],
) <fig_37>


The mathematical description for the Complex-Step is found in @eq_32. 

$ f'(x) = "Imag"[f(x + i space.thin h)]/h $<eq_32>

For the Complex-Step, the approximation function for the displacements could be determined. However, this would involve greater time expenditure. Moreover, very high precision is not required since the results are compared with the diagram from @Liu2019, depicted in @fig_34. 

// --------------------------- selected fd methods -------------------------- //
Thus, one of the #gls("fd") methods needs to be selected.
Generally, the central differce method acheived higher accuracies than the first order emthods, forward and backward difference methods
In order to comprehend the additional computaitonal and human effort resulting from the central #gls("fd") method, an concrete example shall be given.
Considering @fig_38, it can be observed that the structral mesh is approximated with an element type that has eight nodes.
The variables $x_i$, where $i in [0, 7]$ aim to represent the local placing of the nodes. 

// ------------------------------- 8 nodes fdm ------------------------------ //
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/4_FEM_Ele.svg", 
  width: 47%),
  caption: [Discretization points $x_i$ or nodes from #gls("fem") model for #gls("fd") methods],
) <fig_38>

In order to caluclate the derivative, besides the local node coordinate a function value is needed. Since the goal is to obtain the curvature according to @eq_28, the following shall be assumed.
For each $x_i$ discretization point, its local coordinates and the corresponding displacement value $u$ are known.
Thus applying one the #gls("fd") methods would compute the derivative of the displacement with respect to the location, that is, the strain. 
With the information about the nodes of a single element as depcicted in @fig_38 only for the two nodes $x_4$ and $x_6$ of the total 8 nodes the strain values could be calculated according to @eq_35 and @eq_36, respectively. 

$ f'_("central")(x_4) = (f(x_2) - f(x_3))/(h) $<eq_35>
$ f'_("central")(x_6) = (f(x_1) - f(x_0))/(h) $<eq_36>

Comparing @eq_35 and @eq_36 with @eq_31 two important observatiosn can be made. First, the indices in  @eq_35 and @eq_36 do not match the pattern  of indices shown in @eq_31. This is the reason why the #gls("fd") equations should be refered to the correspinding problems visual descirption @fig_37 and @fig_38. Second, instead of dividing with two times the step size $h$, according to @fig_38 the $h$ for @eq_35 and @eq_36 already provides the correct distance between the two nodees of interest for the central differential sceme.

Having provided some intutition for the central #gls("fd") method, important drawbacks shall be mentioned. According to @fig_38, the information of one #gls("fem") element would only provide derivatives of two nodes instead of 8.
For the remaining six derivatives, correct assignment of neighboring elements and nodes is required. This introduces complexity, increased  programming effort and consequently risk of mistake incorporation. In the simplest case, the elements have a chronologically ascending element ID in all three dimensions. For the 1D case, this is shown in @fig_39. 

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/5_Chron_Order.svg", 
  width: 47%),
  caption: [Simplest case: Elements or nodes of interest are ordered strucutred and ids are given chronologically],
) <fig_39>


In practice, however, it is usually the case that the element IDs do not increase chronologically. A pictorial representation of this is given in @fig_40. In such cases, as could occur with complex 3d #gls("swith") simulation models, complexity is increaed to capture and properly leverage the element and node neighborhood relationships.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/6_Complex_Ids.svg", 
  width: 47%),
  caption: [Real case Element Id ordering, are not chronologically arranged depicted simplied in 2D ],
) <fig_40>

// ----------------------------- forward method ----------------------------- //
While having acknowldiged the higher accuracy of the central #gls("fd") method, its drawbacks were mentioned as well. The Forward and Backward Difference methods offer sufficient accuracy with comparatively simple implementation. For a #gls("fem") application, the step size is inherently defined by the mesh discretization. 
Considering both accuracy requirements and implementation complexity, the Forward #gls("fd") method was preferepreferred over the central #gls("fd") method for calculating the required derivatives for the curvature. 

// ------------------------------ not only fem ------------------------------ //
For this thesis #gls("fem") is used to simulate the structural behavior of the #gls("swith") model. Conducting #gls("fem") simulaitons, besides displaxments, the strains (first derivatives of displacement with respect to local coordinates) are obrained part of its solution.
Yet, it is epxlained how to obtain the strains when displacment values are available.
The rationale behind that is to strnegened the universal applicability of this work. The presented method for calculating curvature could be equally applied to displacement data from various sources. These include alternative simulation approaches such as beam models @Gross2021b @Gross2019 @Gross2021 @Gross2017 @Gross2021a @Gross2019a @Spura2019, as well as experimental measurements where only displacement values and their corresponding coordinates are required. Indeed, the method could be applied with any analytical or numerical approach that provides displacement field data.

By focusing on a method that requires only displacement data and coordinates, rather than leveraging #gls("fem")-specific outputs like strains, the approach remains broadly applicable. This generality increases the practical value of the presented methodology, as it can serve as a reference procedure for future work, regardless of how displacement data is obtained.

// ----------------------------- steps with fem ----------------------------- //
Having laid out the general nature of the presented approch, concrete steps with the #gls("fd") method for the curavture derivation shall be given.
For the concrete example it is assumed that the stutrucre model is discretized through elements as depcited in @fig_38. 
// TODO proper linking to the text above
Again, while the concrete example is based on a #gls("fem") meshing approach, the apporach presented is general applicable to other methods as well.
With having the local displacment values and the corresponding coordinates, five of the eight required derivates per element can be obtained without having to consider any neighborhood relationships.
These are given in @eq_37 to @eq_41, where the function $f(x_i)$ is to return the displacment value of the discretization point $x_i$.

$ f'_("forward")(x_0) = 2 space (f(x_4) - f(x_0))/(h) $<eq_37>
$ f'_("forward")(x_4) = 2 space (f(x_1) - f(x_4))/(h) $<eq_38>
$ f'_("forward")(x_7) = (f(x_5) - f(x_7))/(h) $<eq_39>
$ f'_("forward")(x_3) = 2 space (f(x_6) - f(x_3))/(h) $<eq_40>
$ f'_("forward")(x_6) = 2 space (f(x_2) - f(x_6))/(h) $<eq_41>

In order to  obtain the obtain the derivates of the three remaining discretization points $x_1, x_5 "and" x_2$ a neighboring element is required. According to @fig_39 the ending nodes of the one element are the starting nodes of the next element.
With this, @eq_37 to @eq_41 can be used again.
In order to derive the second order gradient of the displacment the output of @eq_37 to @eq_41 can be used and inserted as input for @eq_42 to @eq_46.

$ f''_("forward")(x_0) = 2 space (f'(x_4) - f'(x_0))/(h) $<eq_42>
$ f''_("forward")(x_4) = 2 space (f'(x_1) - f'(x_4))/(h) $<eq_43>
$ f''_("forward")(x_7) = (f'(x_5) - f'(x_7))/(h) $<eq_44>
$ f''_("forward")(x_3) = 2 space (f'(x_6) - f'(x_3))/(h) $<eq_45>
$ f''_("forward")(x_6) = 2 space (f'(x_2) - f'(x_6))/(h) $<eq_46>


In the presented procedure, a constant element size of $h$ was assumed.
Furthermore, it was assumed that the centering nodes would be ideally in the middle.
Thus, for the step size either $h$ or $h/2$ could be used, depending on the discretization points of interest.
However, in practical applicaiton it is possible that the meshes are distored, different sized oder type of elements are used. 
In these cases the element size cannot be taken as constant, thus, the geomtrical duistance between the diuscretization points of consideration $h$ needs to evaltued for potentially every calculation.  
While @eq_37 to @eq_46 for the forward #gls("fd") method with neighboring relationships can be used to derive the first and second order derivates of the displacments, the derivates for the global right ending nodes need special consideration.
The issue is visualized in @fig_41, where the global right ending discretization points are shown in red. 

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/7_Ending.svg", 
  width: 47%),
  caption: [Limitation of purley using the forward #gls("fd") method for global red right ending discretization points.],
) <fig_41>

// ----------------------------- backward story ----------------------------- //
In order to obtain the the gradients of the red points, as depcited in @fig_41, using the forward #gls("fd") method, additional discretization points to the right of them  would be needed.
However, since the red points are the last points, only discretization points from the left can be used used.
Therefore, for these points the backward #gls("fd") method could be leveraged.
Nevertheless, it might not be required to implemment such a feature.
This depends on the relevance of the most outer part. If the curvature values of the most right nodes are not of relevance, dummy values could be inserted.
In the event of requing the most outer red nodes, the three missing discretization points $X_1, x_5 "and" x_2$ according to @fig_38, can be obtained with @eq_47 to @eq_49 using the backward #gls("fd") method.

$ f'_("backward")(x_1) = 2 space (f(x_1) - f(x_4))/h $<eq_47>
$ f'_("backward")(x_5) = (f(x_5) - f(x_7))/h $<eq_48>
$ f'_("backward")(x_2) = 2 space (f(x_2) - f(x_6))/h $<eq_49>


// ---------------------------- first 3d results ---------------------------- //
At this point, displacements, first and second derivatives are known, such that the curvature can be calculated according to @eq_28.
IN order to cover a braod specturm, them #gls("swith") model was computed with the variations of internal pressure between $15 "MPa"$ to $110 "MPa"$ or  $150 "bar"$ to $1100 "bar"$  with linearly spaced 30 values.
While $150 "bar"$ can be assumed to be too small for it providing econolical use in avaition, it is a high value, that can be used within experiemtnal testing environments.
Next, $1100 "bar"$ is above the maximal pressure that can be currently stored within a tank type IV as mentioned in @chap_1_0_3.
However, in @chap_1_0_3 it was mentioned that the tank type V is supposed to provide a maximal pressure of $1000 "bar"$. 
First, because it is assumed that technical advantages are likely in future, they value of $1100 "bar"$ is justified. 
Second, in @chap_1_0_3 it was explained that the tank type IV was selected as the current best compromiss between safety and econolical demand. However, it was also mentioned that once the tank type V technology advances enough, it could be the preferred option.
The lift coefficient $C_L$ variation $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5]$ was selected.
It is supposed to cover lift coefficients for small aircraft and big aircraft with potenital high-lift devices in appliaction @Wild2022.
This corresponds to 180 totial variations. 

// a = np.linspace(15,110,30)
// a[11] = 51.034
An illustrative exmaple of the displacment on the top left, the strains (first order derivate) on the top right, the second order derivate on bottom left and resulting curvature on bttom right for a pressure of $ p approx 510 "bar"$ and a lift coefficient of $C_L ~ 0.6$ is depicted in @fig_42.

// -------------------------------- 3d plots -------------------------------- //
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/8_Skin_Ca_06_P_510.png", 
  width: 100%),
  caption: [Illustrative depcition of the displacments ([mm], top left), first order derivative ([-], top right), second order derivative ([$"mm"^(-1)$], bottom left) and the curvature ([$"mm"^(-1)$], bottom right) for a #gls("swith") model with $C_L approx 0.6$ and internal pressure $p approx 510 "bar"$. ],
) <fig_42>


The magntiude value are calculated according to the usual Euclidean norm.
For the curvature they are given per formula @eq_33, where the indices $kappa_x, kappa_y$, and $kappa_z$ stand for the curvature component in the respective spatial direction.

$ kappa_("mag") = sqrt(kappa_x^(2) + kappa_y^2 + kappa_z^2) $<eq_33>

Since for #glspl("swith") the strucutral behaviour of the tanks is of utmost importance, the same information  is analogguglsy  depicted soley for the tanks in @fig_43.


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/9_Tubes_Ca_06_P_510.png", 
  width: 100%),
  caption: [Illustrative depcition of the displacments ([mm], top left), first order derivative ([-], top right), second order derivative ([$"mm"^(-1)$], bottom left) and the curvature ([$"mm"^(-1)$], bottom right) soley for the tubes of #gls("swith") model with $C_L approx 0.6$ and internal pressure $p approx 510 "bar"$.],
) <fig_43>


// ---------------------------- model specialitis --------------------------- //
In order to interpret the curvatrure results for real-world applicaiton, additional aspects needs to be incorporated through a deeper analysis. For that @fig_44 shall be viewed. 
The visualization shows the first-order derivatives of displacement (strain), using a visual scaling factor to enhance the visibility of critical regions. This scaling is used to highlight areas of the wing that require special attention during real-world simulation result interpreation.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/10_Tubes_Ca_06_P_510.png", 
  width: 100%),
  caption: [Focused and scaled depiction of the first order derivates (strain) with $C_L approx 0.6$ and internal pressure $p approx 510 "bar"$.
  Top left: startof inner wing, top right: fuselage, bottom left: ending of inner wing and tubes, bottom right, outer wing ending.],
) <fig_44>


With the top left side of @fig_44 it can be observed that particularly high strains occur on the skin of starting of the inner wing. This is because a dummy value for stiffness is used here. It is an area that extends into the fuselage. Therefore, skin stiffness is virtually reduced to a very small value. The fuselage area was not removed as this simplifies aerodynamic modeling and calculations.
At the landing gear and engine connection points, as well as tank ends, circumferential rings with high stiffnesses are used. Due to the stiff circumferential rings, abrupt stiffness differences are to be expected in their vicinity, as can also be seen in the top right for the landing gear and bottom left for the tube ending side of @fig_44.
One another 

If the first derivative shows jumps, this will also be reflected in the second derivative. Since the curvature is based on the first and second derivatives of displacement, peculiarities are also to be expected at these points. 
If it is assumed that the first derivative is much smaller than 1 ($u' << 1$), then the curvature @eq_28 can be written as @eq_34 @Gross2021.
Thus, the curvature $kappa$ shows the direct proportionality to the second order derivative $u$. 


$ kappa approx u'' $<eq_34>

It already know that the first derivative exhibits abrupt behavior. However, this does not necessarily contradict $u' << 1$. 
It is possible that two values differ by several orders of magnitude, yet both considered sidplacement values are still significantly smaller than 1.
Through the deeper analysis of the curvature results, it can be noted that the numiercal output of @eq_28 does not suffice to verrify wheter the critical curvature was exceeded.
The output needs to be interperted with background knowedlge about the derivation of curvature and enginerring background to asses how to asses local curvature jumps.
In order to aswer the answering the question about the influence of the fill medium, only the structral representative areas should be used to determine wheter the critical curvature $kappa_"krit"$ was exceeded or not. Otherwise it would otherwise lead to misinterpretations. 

In order to highlight the importance of proper engeering assesment one more aspect that needs to be considered for real world assement shall be given. 
Since the impact of the filling agent only involves the tubes, the outer wing cannot be part of the evaluation. The ratioanle behind this is that that the tanks are only placed within the inner wing.
With the the interpreation based on the realworld related simulation model of a #gls("swith") and the in depth interpreations, some fundamental approach for properlyx asseing the cricitcal curvature should have been provided.   

// ---------------------------- transition to 2d ---------------------------- //
The results up to here were shown in three dimensions. However, evaluating the results in 2D is significantly less prone to errors and simpler to interpret. Additionally, perfroaing additonaly investigations on 2d data is generally less complex and less ocmputaitonal demanding than wokring on 3d data. 
For these reasons, the influence of the filling medium on the maximum sustainable bending moment should be investigated using averaged curvatures.

There are two possibilities for averaging the curvatures. In the first method, the displacements, derivatives, and curvatures are calculated for the entire structure. 
Once these are available, the curvatures can be averaged along the wing span. 
To make the concept easier to understand, see Figure 40. 
The vertical and depth curvature components are added up and averaged for each individual span value. The second method calculates the displacements and averages them directly along the span. The averaged displacements are used to calculate the corresponding averaged derivatives and curvatures. In the first method, averaging occurs only after obtaining the curvatures, whereas the second method begins directly with averaged displacements.

// To answer the question of whether there is a difference between the two presented approaches, equations (20) and (21) should first be considered. 

// Abbildung 40: Konzept der Mittelung der Krümmungen entlang der Flügelspannweite


// Equation (20) shows the case where all curvatures are first calculated and then averaged over these. In this case, only two curvature values are used for averaging for illustration. In equation (21), the derivatives are first averaged and then the mean curvature is calculated.

// $ kappa_("mean",1) = (u_1 ^'' / ( (1 + u_1 ^') ^(3/2)) + u_2 ^'' / ( (1 + u_2 ^') ^(3/2)))  1/2 $ <20>

// $ kappa_("mean",2) = ((u_1 ^'' + u_2 ^'')/2) / ([1 +
//  (u_1 ^' + u_2 ^')/2] ^(3/2)) $ <21>

// Since it is not directly apparent from this form of the equations whether there is a difference between the two variants, equations (22) and (23) should be inserted as examples. This leads to equations (24) and (25).

// $ u_1 = cos(x) \
//    u_2 = sin(x) $ <22>

// $ u_1' = -sin(x) \
//    u_2' = cos(x) \
//    u_1'' = -cos(x) \
//    u_2'' = -sin(x) $ <23>

// $ kappa_("mean",1) = (-cos(x)/(1 - sin(x))^(3/2) + (-sin(x))/(1 + cos(x))^(3/2))(2) $ <24>

// $ kappa_("mean",2) = (-cos(x) - sin(x))(2(1 + (-sin(x) + cos(x))/2)^(3/2)) $ <25>

// For equation (25), the relationship in equation (26) was assumed, which can generally be assumed for differentiation:

// $ (u_1'' + u_2'')/2 = (u_1 + u_2')/2 \
//    (-cos(x) + (-sin(x)))/2 = (-sin(x) + cos(x))/2 \
//    (f_1 + f_2)' = f_1' + f_2' \
//    (f_1 dot f_2)' != f_1' dot f_2' $ <26>

// Finally, an angle of $x = pi/2$ should be assumed for sine and cosine. This results in equations (27) and (28). Formula (29) shows as the final result that it makes a difference how the curvatures are averaged.

// $ kappa_("mean",1)(x = pi/2) = 0 + (-1)(1 + 0)^(3/2) = -1 $ <27>

// $ kappa_("mean",2)(x = pi/2) = (-1)(2(1 + (-1)/2)^(3/2)) approx (-1)(2 dot 0.353) $ <28>

// $ (kappa_("mean",1) = -1) != (kappa_("mean",2) approx (-1)(2 dot 0.353)) $ <29>

// Another important aspect that must be considered when calculating curvature averaging is the neighboring elements and nodes. Node overlaps in the FE mesh create new nodes on the wing and tank mesh. The distance from existing nodes to the new nodes can be very small along the span. Detailed investigation shows that this is the case. When looking at Figure 41 left, it can be seen that entries 001-008 differ minimally in their span position.
// The distances to the respective subsequent entries are shown on the right in the figure. The slightly varying nodes, which are all located in one element each, would not be counted as a single span point in a conventional averaging. This would distort the averaging at these points, as erroneous abrupt curvature deviations are to be expected at these positions. The following can be imagined: if there were 10 nodes, 5 of which had a positive curvature and the other 5 a negative curvature. The first 5 values would be "coincidentally" assigned to point $y_1$ and the other 5 values to point $y_2$. If this were plotted, a jump or discontinuity would become visible in a very small distance $(Delta y approx 10^(-9))$. Therefore, nodes that have a distance according to equation (30) were combined into one node for averaging.

// [Figure 41: Left: Chronologically ordered span coordinates of individual nodes. Right: Distance to neighboring entries or span coordinates of individual nodes among each other]


// $ "dist"(y_1, y_2) <= 0.9 $ <30>

// For averaging, all line elements (girders, engine and landing gear connections, and stiffening elements) were deliberately neglected. The curvatures are calculated exclusively for the skin and tubes (eight-node shell elements). If the line elements were included in the calculation of curvature averaging of wing and tank, the result would be incorrect. For example, the curvatures of the engine nodes do not influence the curvature behavior of the wing and tanks.

// For presenting the following results, first all curvatures of the individual nodes were calculated and then averaged as described. For safe and easy evaluation of the results, all averaged curvatures for all selected pressure values were saved as an interactive animation in an HTML file. This allows the curvature curves of individual pressure values to be displayed first with a click. Areas that are classified as particularly important can be zoomed into. To avoid having to approximately read the results from the scale labels, the actual values are displayed via popup when placing the mouse cursor over the desired location. The integrated screenshot function can be used for quick sending of results.

// [Figure 42: Excerpt from the results of averaged curvatures along the span for $C_L = 1.5$ and a pressure value of $p = 70.69$ MPa]

// This shows the averaged curvature profile over the entire wing span. It becomes clear that local effects occur in the undisturbed regions. These were already discussed previously and will therefore not be explained again. The undisturbed region is shown in Figure 43.

// [Figure 43: Detailed view of the undisturbed region of averaged curvatures for $C_L = 1.5$ and $p = 70.69$ MPa]

// The scale shows a maximum curvature value of $0.02$ 1/m, which is significantly below the critical curvature of $0.4$ 1/m.

// It can be noted that the maximum curvature in the undisturbed region does not exceed the critical curvature, but remains significantly below it. Additionally, the influence of the $C_L$ value and pressure was investigated. If the $C_L$ value is increased, an increase in the maximum occurring curvature can be observed, which applies to both the undisturbed and disturbed regions. This is to be expected, as a larger $C_L$ value causes greater deflection and can be verified by comparing Figure 42 with Figure 44. The increase in pressure has hardly any visible influence, which can be verified by comparing Figure 44 with Figure 45.

// [Figure 44: Excerpt from the results of averaged curvatures along the span for $C_L = 1.0$ and a pressure value of $p = 70.69$ MPa]

// [Figure 45: Excerpt from the results of averaged curvatures along the span for $C_L = 1.0$ and a pressure value of $p = 15$ MPa]

// In summary, the investigation with averaged curvature has also shown that the influence of the filling medium should be negligibly small at expected $C_L$ values and pressures.

