/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


// TODO
// Title Check
=== Assessment of Impact Filling Agent in 3D<chap_3_0_2>
The fundamental concept of critical loads was established in @chap_3_0_0, followed by an analysis of the relationship between curvature and filling agent impact on structural properties in @chap_3_0_1. Building upon these foundations, this subsection presents a methodology for assessing the curvature of a #gls("swith", long:true) and its implications for experimental validation tests.
While the theoretical basis for curvature calculation provides essential insights, determining whether hydrogen can be substituted with an alternative filling agent for experimental structural validation testing requires additional considerations. This subsection introduces the concept of critical curvature and develops a systematic approach for its practical application. Through an analysis of a #gls("fem") model, it is demonstrated that direct comparison between calculated and critical curvature values presents significant challenges in real-world applications, particularly for complex three-dimensional structures.
The presented methodology distinguishes itself through its broad applicability, as it requires only displacement field data as input. This approach enables curvature assessment from various sources, including experimental measurements, beam models, or numerical simulations, thereby extending its utility beyond specific analysis methods. However, the complexity of three-dimensional structures necessitates careful interpretation of results, particularly in regions with abrupt stiffness changes or geometric discontinuities. These practical challenges and their implications for experimental testing are examined, providing essential guidance for future structural validation efforts.


Due to resource constraints, cost-intensive experimental investigations cannot be conducted within this work. However, an alternative method has been developed to make qualitative assessments for initial findings regarding experimental static structural validation tests.
The foundation for this approach is derived from a careful examination of results presented in @Liu2019. @fig_33 demonstrates that bending moment curves exhibit similar curvature values within a specific range, independent of fill medium and pressure. This observation enables the definition of a critical curvature value, below which the bending moment remains independent of both fill medium and pressure, as illustrated in @fig_34.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/0_Critical_Curv.png", 
  width: 67%),
  caption: [Comparison of moment M and curvature $kappa$ for air and water as fill medium for different pressure levels @Liu2019 with possible critical curvature values],
) <fig_34>


Analysis of the data suggests two potential permissible values: $0.4 upright("m")^(-1)$ and $0.5 upright("m")^(-1)$. Taking a conservative approach, this study defines the critical curvature as $0.4 upright("m")^(-1)$, where the deviation between bending moment curves becomes negligible. This definition can be formally expressed as @eq_27.

$ kappa_"crit" >= 0.4 $<eq_27>

// ---------------------------- model explanation --------------------------- //
To evaluate whether a #gls("swith") model's curvature exceeds this critical value, its curvature values must be calculated.
This work assumes the existence of displacement data with corresponding coordinates, which could be obtained from a #gls("fem") model. While acknowledging that the design of #gls("swith") and its modeling is of pivotal importance, the focus here is on the methodology rather than specific model creation.
This approach can be justified by examining the current state of #gls("swith") technology. Two key observations highlight their early development stage: First, as of writing this thesis, no commercially certified #gls("swith") exists. Second, there are no established standards available for the commercial application of #glspl("swith"). Additionally, the special properties of hydrogen, as outlined in @chap_2_0_1 and @chap_2_0_2, necessitate substantial development work to ensure safe operation. Given this early stage, focusing on a specific #gls("swith") design with predefined constraints would risk developing methods that may not apply to future configurations, which could differ substantially from current concepts.
Therefore, it is more beneficial to focus on developing general methods rather than specific numerical models with limited practical application. These general methods aim to provide universal contributions applicable to various simulation approaches. Consequently, emphasis is placed on explaining the solution process methodology, enabling interested readers to adapt the methods to their specific cases.
For demonstration purposes, a #gls("fem") model incorporating both aerodynamic forces and internal pressure loads is utilized. The aerodynamic loads are calculated using APAME @Filkovic, a frictionless open-source 3D panel method implementation, and applied to the structural mesh through coupling. Following the design concept from @APUS_1, four tanks were implemented. The internal pressure of these tanks is defined as a variable parameter for in-depth analysis.

// --------------------------- explanation starts --------------------------- //
The solution of the #gls("fem") model provides, among other things, the displacements
@fig_35 presents an extract of these displacement values in the three spatial directions for all nodes of an element.


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/1_FEM_Displacements.png", 
  width: 77%),
  caption: [Example representation of displacement values in the 3 spatial directions at all nodes of an element],
) <fig_35>


The element ID provides crucial information about element location and node assignments. This information enables the determination of element adjacency and their neighborhood relationships, as illustrated in @fig_36.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/2_Neigbourhood.png", 
  width: 57%),
  caption: [Neighborhood relationships of individual elements is known through the numbered and color-highlighted element IDs],
) <fig_36>


// ---------------------------- curvature formula --------------------------- //
For calculating curvature from known displacement values, @eq_28 @Gross2021 @Gross2023 is employed, where $u$ represents displacement, and $u', u''$ denote the first and second derivatives of displacement with respect to the directional coordinate.

$ kappa = u''/ ( (1 + u'^2) ^(3/2)) $<eq_28>

While @Liu2019 established a geometric relationship for direct analytical curvature calculation in their specific case, no such relationship exists for the general case. Therefore, formula @eq_28 is adopted for this analysis.

With known displacements, derivatives can be obtained through numerical differentiation. Two main approaches are available: the well-established #gls("fd") methods @Baerwolff2020 @Meister2019 @Munz2019 @Richter2017 @Langtangen2017 and the less conventional Complex-Step method @mdobook. Within the #gls("fd") methods, three common procedures exist.
These procedures, derived from Taylor series expansion, are subject to truncation error @mdobook. Additional rounding errors arise from numerical calculations @Baerwolff2020. Modern computers typically use double precision ($2^(-52) approx num("2.2 e-16")$ @Baerwolff2020), limiting the precision of numerical values beyond a certain decimal place. These rounding errors, while inevitable, require particular attention when working with very small numbers and must be considered in relation to accuracy requirements.
The three common #gls("fd") methods are Forward, Backward, and Central Difference. The Central Difference method achieves higher accuracy as a second-order method but requires two support points for derivative calculation at each point. In contrast, Forward and Backward methods are first-order methods that typically provide lower accuracy but require only one support point for derivative calculation. This characteristic makes them computationally more efficient and simpler to implement.
The choice between Forward and Backward methods depends on the specific case, as their derivative quality varies by application. Determining an appropriate step size typically requires a convergence study, seeking an optimum that minimizes both rounding and truncation errors. 
While @mdobook suggests that a step size of $h approx 10^(-6)$ often yields high-quality results, this is impractical for structural mesh applications. In #gls("fem"), the step size $h$ is the distance between nodes of interest. Such a small distance between nodes is unusual in structural mechanics. For #gls("fem") the step size will be provided by the mesh size that can accurately solve the given mechanical description.


// ------------------------------ complex step ------------------------------ //
The Complex-Step method is mathematically proven to be a second-order method, as demonstrated in @mdobook. A notable characteristic of this method is that it requires only one support point. However, unlike the #gls("fd") methods which operate on discrete point values and their distances, the Complex-Step method requires a mathematical function. Since the method eliminates the need to subtract function values at very small distances from each other, it avoids rounding errors and can operate at maximum machine precision (step size: $h approx 10^(-30)$) @mdobook. Nevertheless, the truncation error inherent to second-order methods remains.

The mathematical definitions of the #gls("fd") methods are expressed in formulas @eq_29 - @eq_31, where $f'$ denotes the derivative function, $x_i$ represents discretization points, and $h$ indicates the step size or distance between two discretization points $x_i$ and $x_j$ ($i != j$).
// ---------------------------- differential eqs ---------------------------- //
$ f'_("forward")(x_1) = (f(x_2) - f(x_1))/h $<eq_29>
$ f'_("backward")(x_1) = (f(x_1) - f(x_0))/h $<eq_30>
$ f'_("central")(x_1) = (f(x_2) - f(x_0))/(2h) $<eq_31>

@fig_37 illustrates the spatial arrangement of the discretization points $x_i$. This visualization provides essential context for understanding the #gls("fd") methods and their implementation.

// ------------------------------- single fdm ------------------------------- //
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/3_Simple_FDM.svg", 
  width: 47%),
  caption: [Nessary knowledge about the positions of the discretization points $x_i$ the #gls("fd") method],
) <fig_37>


// ---------------------------------- here ---------------------------------- //
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
In the event of requing the most outer red nodes, the missing derivatives of the three remaining discretization points $X_1, x_5 "and" x_2$ according to @fig_38, can be obtained with @eq_47 to @eq_52 using the backward #gls("fd") method.

$ f'_("backward")(x_1) = 2 space (f(x_1) - f(x_4))/h $<eq_47>
$ f'_("backward")(x_5) = (f(x_5) - f(x_7))/h $<eq_48>
$ f'_("backward")(x_2) = 2 space (f(x_2) - f(x_6))/h $<eq_49>

$ f''_("backward")(x_1) = 2 space (f'(x_1) - f'(x_4))/h $<eq_50>
$ f''_("backward")(x_5) = (f'(x_5) - f('x_7))/h $<eq_51>
$ f''_("backward")(x_2) = 2 space (f'(x_2) - f'(x_6))/h $<eq_52>


// ---------------------------- first 3d results ---------------------------- //
At this point, displacements, first and second derivatives are known, such that the curvature can be calculated according to @eq_28.
IN order to cover a braod specturm, them #gls("swith") model was computed with the variations of internal pressure between $15 "MPa"$ to $110 "MPa"$ or  $150 "bar"$ to $1100 "bar"$  with linearly spaced 30 values.
While $150 "bar"$ can be assumed to be too small for it providing econolical use in avaition, it is a high value, that can be used within experiemtnal testing environments.
Next, $1100 "bar"$ is above the maximal pressure that can be currently stored within a tank type IV as mentioned in @chap_1_0_3.
However, in @chap_1_0_3 it was mentioned that the tank type V is supposed to provide a maximal pressure of $1000 "bar"$. 

While in @chap_1_0_3 it was explained that the tank type IV was selected as the current best compromiss between safety and econolical demand. However, it was also mentioned that once the tank type V technology advances enough, it could be the preferred option.
Furthermore, because it is assumed that technical advantages are likely in future, it is possible that tank type V can store more hydrogen under higher pressures than $1000 "bar"$ or even above $1100 "bar"$. 
Moreover, having selected thus a high pressure values also hihglights the fact that increasing the pressure in a simualtion is muich easier than in a practical experimental test. 
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


If all menetioned modeling measures and their consequences are considered, the following conclusion can be reached: In the undisturbed regions, it can be recognizable that the critical curvature is not exceeded. Therefore, based on utlized #gls("fem") simulation model of a potential real world #gls("swith") design, it can be assumed that the fill medium has no significant influence on the maximum sustainable bending moment. 
Yet, it can be oberved that the intepreation of curvature calculations for a complex 3d model is tedious task to do.
Thus, is is prone to errors when not careful investigations are made.
Therefore in the upcoming @chap_3_0_3 the natrual progression was made to introduce to a method that shall help to obtain results easier to interpret and thus reduce the likelhood of making mistakes of the critical curvature assement.
Finally, it is important to have clearly defined that the obtained results are only valid within the framework of the made assumptions. The calculations were solved linear-statically; gas compression effects and possible nonlinearities were not considered

// --------------------------------- summary -------------------------------- //
#summary_([

In summary, the calucaliton of the curvature and its interpreations was provided.
For this a #gls("fem") simulaiton model for a #gls("swith") model was chosen.
It was explained how the required derivatives could be required.
Since the explanations started from the displacements basis, the preented method can be leveraged for different methods.
These could be numeircla simualtion methods, but the displacment data could also be obtained from experimental investigations.
With having provided some examples of how to perform the assesment of the critical curvature investigation, it should have become clear why for complex structres like aircraft it is not easy to directly comapre obtained curvatrure results with the critical curvatrure value.
The final answer of interpreation was, that for an experimtnal investigation hydrogen could be replaced with another filling agent without it having an impact on the maximal bearbale bending moment.
Finally the diffcultiy of assesing the critical curvature in 3d was acknlwoedged and the transtion to next @chap_3_0_3 was introduced.

])