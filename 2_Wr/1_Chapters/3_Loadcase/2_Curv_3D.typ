/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Word rep ins. done
// proofread ins. done


// Title was tested and is inshallah fine
== Assessment of Filling Agent Impact in 3D<chap_3_2>
The fundamental concept of critical loads was established in @chap_3_0, followed by an analysis of the relationship between curvature and filling agent impact on structural properties in @chap_3_1. Building upon these foundations, this section presents a methodology for assessing the curvature of #gls("swith", long:true) and their implications for experimental validation tests.
While the theoretical basis for curvature calculation provides essential insights, determining whether hydrogen can be substituted with an alternative filling agent for experimental structural validation tests warrants additional considerations. 
This section introduces the concept of a critical curvature and develops a systematic approach for its practical application. 
Through a study of a #gls("fem", long:true) model, it is demonstrated that direct comparison between calculated and critical curvature values yields significant challenges. 
These challenges are especially evident in real-world applications, which often involve complex three-dimensional structural simulation models.
The proposed methodology distinguishes itself through its broad applicability, as it requires only displacement field data as input. This strategy enables curvature assessment from various sources, including experimental measurements, beam models, or numerical simulations, thereby extending its utility beyond specific analysis methods. Nevertheless, the complexity of three-dimensional structures necessitates careful interpretation of the results, particularly in regions with abrupt stiffness changes or geometric discontinuities. 
These practical obstacles and their implications for experimental testing are addressed, providing essential guidance for future structural validation efforts.


Due to resource constraints, cost-intensive experimental investigations cannot be conducted within this dissertation. 
Therefore, an alternative method was developed to make qualitative assessments relevant to experimental static structural validation tests of #glspl("swith").
The foundation for this approach is derived from an examination of the results presented in @Liu2019. 
@fig_33 demonstrates that bending moment curves exhibit similar curvature and moment values within a specific range, independent of the filling medium and pressure.
This observation enables the definition of a critical curvature value, below which the bending moment remains independent of both filling agent and pressure, as illustrated in @fig_34.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/0_Critical_Curv.png", 
  width: 67%),
  caption: [Comparison of moment M and curvature $kappa$ for air and water as filling agent for different pressure levels @Liu2019 with possible critical curvature values.],
) <fig_34>


Analysis of the data suggests two potential permissible values: $0.4 space upright("m")^(-1)$ and $0.5 space upright("m")^(-1)$. Taking a conservative approach, this study defines the critical curvature as $0.4 space upright("m")^(-1)$, where the deviation between bending moment curves becomes negligible. This definition can be formally expressed as @eq_27.

$ kappa_"crit" >= 0.4 $<eq_27>

// ---------------------------- model explanation --------------------------- //
To evaluate whether a #gls("swith") model's curvature exceeds this critical value, its curvature values must be calculated.
This dissertation assumes the existence of displacement data with corresponding coordinates, which, for instance, could be obtained from a #gls("fem") model. 
While acknowledging that the design of a #gls("swith") and its modeling is of pivotal importance, the focus here is on the methodology rather than specific model creation.
This reasoning is supported by an examination of the current state of #glspl("swith") as detailed in @chap_0_7.
Two key observations highlight their early development stage: First, as of writing this thesis, no commercially certified #gls("swith") exists. Second, there are no established standards available for their commercial application. 
Additionally, the special properties of hydrogen, as outlined in @chap_2_1 and @chap_2_2, necessitate substantial development work to ensure operational safety. 
Given this early stage, focusing on a specific #gls("swith") design with predefined constraints would risk developing methods that may not apply to future configurations, which could differ significantly from current concepts.
Therefore, it is more beneficial to focus on developing general approaches rather than specific numerical models with limited practical application. 
These general approaches are designed to work across different simulation techniques, enhancing their practical relevance.
Consequently, emphasis is placed on explaining the solution process, enabling interested readers to adapt these methods to their specific cases.
For demonstration purposes, a #gls("fem") model incorporating both aerodynamic forces and internal pressure loads is utilized. The aerodynamic loads are calculated using APAME @Filkovic, a frictionless open-source 3D panel tool, and applied to the structural mesh through fluid-structure coupling. Following the design concept from @APUS_1, four tanks were implemented. The internal pressure of these tanks is defined as a variable parameter for in-depth analysis.

// --------------------------- explanation starts --------------------------- //
The outcome of the #gls("fem") model provides, among other things, the displacements.
@fig_35 presents an extract of these displacement values in the three spatial directions for all nodes of an element.


#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/1_FEM_Displacements.png", 
  width: 77%),
  caption: [Nodal displacement values in three spatial directions for a single element.],
) <fig_35>


The element ID furnishes crucial information about element location and node assignments. This information enables the determination of element adjacency and their neighborhood relationships, as illustrated in @fig_36.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/2_Neigbourhood.png", 
  width: 57%),
  caption: [Element connectivity demonstrated through numbered and color-highlighted element IDs.],
) <fig_36>


// ---------------------------- curvature formula --------------------------- //
For calculating curvature from known displacement values, @eq_28 @Gross2021 @Gross2023 is employed, where $u$ represents displacement, and $u', u''$ denote the first and second derivatives of displacement with respect to a directional coordinate.

$ kappa = u''/ ( (1 + u'^2) ^(3/2)) $<eq_28>

While @Liu2019 established a geometric relationship for direct analytical curvature calculation in their specific case, no such relationship exists for the general case. Therefore, @eq_28 is adopted for this analysis.

With known displacements, derivatives can be obtained through numerical differentiation. Two main approaches are available: the well-established #gls("fd", long:true) methods @Baerwolff2020 @Meister2019 @Munz2019 @Richter2017 @Langtangen2017 and the less conventional Complex-Step @mdobook. Within the #gls("fd") methods, three common procedures exist.
These procedures, derived from Taylor series expansion, are subject to truncation error @mdobook. 
Additional rounding errors arise from numerical calculations @Baerwolff2020. Modern computers typically use double precision ($2^(-52) approx num("2.2 e-16")$ @Baerwolff2020), limiting the precision of numerical values beyond a certain decimal place. These rounding errors, while inevitable, demand particular attention when working with very small numbers and must be considered in relation to accuracy specifications.
The three common #gls("fd") methods are Forward, Backward, and Central Difference. 
The Central Difference method achieves higher accuracy as a second-order method, but requires two support points for derivative calculation at each point. 
In contrast, Forward and Backward methods are first-order methods that typically offer lower accuracy, yet require only one support point for derivative calculation. This characteristic makes them computationally more efficient and simpler to implement.
The choice between Forward and Backward methods depends on the specific case, as their derivative quality varies by application. Determining an appropriate step size typically calls for a convergence study, seeking an optimum that minimizes both rounding and truncation errors. 
While @mdobook suggests that a step size of $h approx 10^(-6)$ often yields high-quality results, this is impractical for structural mesh applications. In #gls("fem"), the step size $h$ is the distance between nodes of interest. Such a small distance between nodes is unusual in structural mechanics. 
For #gls("fem"), the step size will be dictated by the mesh size that can accurately solve the given mechanical problem.


// ------------------------------ complex step ------------------------------ //
The Complex-Step is mathematically proven to be a second-order method, as demonstrated in @mdobook. A notable characteristic of this method is that it necessitates only one support point. However, unlike the #gls("fd") methods which operate on discrete point values and their distances, the Complex-Step requires a mathematical function. Since the method eliminates the need to subtract function values at very small distances from each other, it avoids rounding errors and can operate at maximum machine precision (step size: $h approx 10^(-30)$) @mdobook. Nevertheless, the truncation error inherent to second-order methods remains.

The mathematical definitions of the #gls("fd") methods are expressed in @eq_29 - @eq_31, where $f'$ denotes the derivative function, $x_i$ represents discretization points, and $h$ indicates the step size or distance between two discretization points $x_i$ and $x_j$, where ($i != j$).
// ---------------------------- differential eqs ---------------------------- //
$ f'_("forward")(x_1) = (f(x_2) - f(x_1))/h $<eq_29>
$ f'_("backward")(x_1) = (f(x_1) - f(x_0))/h $<eq_30>
$ f'_("central")(x_1) = (f(x_2) - f(x_0))/(2h) $<eq_31>

@fig_37 illustrates the spatial arrangement of the discretization points $x_i$. This visualization provides essential context for understanding the #gls("fd") methods and their implementation.

// ------------------------------- single fdm ------------------------------- //
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/3_Simple_FDM.svg", 
  width: 47%),
  caption: [Spatial arrangement of discretization points $x_i$ for the #gls("fd") method.],
) <fig_37>

The mathematical formulation for the Complex-Step is expressed in @eq_32:

$ f'(x) = "Imag"[f(x + i space.thin h)]/h $<eq_32>

While it is possible to determine the approximation function for displacements using the Complex-Step, this would involve greater time expenditure and be potentially less generalizable. 
Additionally, given that the results are primarily compared with the diagram from @Liu2019 illustrated in @fig_34, such high precision is not warranted for this application.
//
// --------------------------- selected fd methods -------------------------- //
Consequently, a #gls("fd") method should be selected. The Central Difference method generally achieves higher accuracy than the first-order methods (Forward and Backward Difference). However, to understand the additional computational and implementation complexity associated with the central #gls("fd") method, it is instructive to examine a concrete example.
As shown in @fig_38, the structural mesh is discretized using eight-node elements. The variables $x_i$, where $i in [0, 7]$, represent the local nodal positions within each element.

// ------------------------------- 8 nodes fdm ------------------------------ //
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/4_FEM_Ele.svg", 
  width: 47%),
  caption: [Eight-node element representation showing discretization points $x_i$ for #gls("fd") methods.],
) <fig_38>

To calculate the derivative, both the local nodal coordinates and corresponding function values are required. Since the objective is to determine the curvature according to @eq_28, it is assumed that for each discretization point $x_i$, both its local coordinates and the corresponding displacement value $u$ are known. Applying a #gls("fd") method computes the derivative of displacement with respect to position, yielding the strain.
Given the nodal arrangement of a single element as illustrated in @fig_38, strain values can be calculated for two nodes only ($x_4$ and $x_6$) out of the total eight nodes, as expressed in @eq_35 and @eq_36, respectively.

$ f'_("central")(x_4) = (f(x_2) - f(x_3))/(h) $<eq_35>
$ f'_("central")(x_6) = (f(x_1) - f(x_0))/(h) $<eq_36>

Comparing @eq_35 and @eq_36 with @eq_31 reveals two important observations. First, the indices in @eq_35 and @eq_36 do not follow the pattern described in @eq_31. This underscores why the #gls("fd") equations should be interpreted in conjunction with their corresponding visual representations in @fig_37 and @fig_38. 
Second, while @eq_31 includes division by twice the step size $h$, the $h$ term in @eq_35 and @eq_36 already accounts for the correct distance between the nodes of interest in the Central Difference scheme.
Having established this intuitive understanding of the central #gls("fd") method, some significant limitations warrant elaboration. 
As shown in @fig_38, a single #gls("fem") element provides derivatives for only two nodes out of eight. 
Obtaining the remaining six derivatives requires proper identification and assignment of neighboring elements and nodes. 
This introduces complexity and consequently risk of mistake incorporation. The simplest scenario occurs when element IDs increase chronologically in all three dimensions, as illustrated for the two-dimensional case in @fig_39.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/5_Chron_Order.svg", 
  width: 47%),
  caption: [Idealized example of sequential element and node numbering in a structured mesh demonstrating chronological ordering.],
) <fig_39>


In practice, however, element IDs rarely follow such chronological ordering. A pictorial representation of this is given in @fig_40. For complex three-dimensional #gls("swith") simulation models, this non-sequential ordering increases the complexity of identifying and managing element and node neighborhood relationships.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/6_Complex_Ids.svg", 
  width: 47%),
  caption: [Possible real-world representation of non-sequential element ID distribution in a 2D structural mesh.],
) <fig_40>

// ----------------------------- forward method ----------------------------- //
While acknowledging the higher accuracy of the central #gls("fd") method, its drawbacks have been noted. The Forward and Backward Difference methods offer sufficient accuracy with comparatively simple implementation. For a #gls("fem") application, the step size is inherently defined by the mesh discretization. 
Considering both accuracy demands and implementation complexity, the Forward #gls("fd") method was preferred over the central #gls("fd") method for calculating the necessary derivatives for curvature evaluation.
In this thesis, #gls("fem") is used to simulate the structural behavior of the #gls("swith") model. When conducting #gls("fem") simulations, strains (first derivatives of displacement with respect to local coordinates) are extracted as part of its solution, alongside displacements. However, it is important to clarify how to obtain strains when only displacement values are available.

The rationale behind this approach is to strengthen the universal applicability of this dissertation. As previously explained, the presented method for calculating curvature can be applied equally to displacement data from various sources, including alternative simulation techniques such as beam models @Gross2021b @Gross2019 @Gross2021 @Gross2017 @Gross2021a @Gross2019a @Spura2019 and experimental measurements. 
By focusing on a method that requires only displacement data and coordinates, rather than leveraging #gls("fem")-specific outputs like strains, the approach maintains broad applicability. This generality enhances the practical value of the described methodology, as it can serve as a reference procedure for future work, regardless of how displacement data is sourced.

// ----------------------------- steps with fem ----------------------------- //

Having laid out the general nature of the proposed approach, concrete steps for curvature derivation using the #gls("fd") method shall be delineated. For this example, the structure model is discretized through elements as depicted in @fig_38. 
This example employs #gls("fem") meshing, yet the principles remain applicable across various methods.
With the local displacement values and their corresponding coordinates, five of the eight required derivatives per element can be computed without involving neighborhood relationships. These are expressed in @eq_37 to @eq_41, where the function $f(x_i)$ returns the displacement value at discretization point $x_i$.


$ f'_("forward")(x_0) = 2 space (f(x_4) - f(x_0))/(h) $<eq_37>
$ f'_("forward")(x_4) = 2 space (f(x_1) - f(x_4))/(h) $<eq_38>
$ f'_("forward")(x_7) = (f(x_5) - f(x_7))/(h) $<eq_39>
$ f'_("forward")(x_3) = 2 space (f(x_6) - f(x_3))/(h) $<eq_40>
$ f'_("forward")(x_6) = 2 space (f(x_2) - f(x_6))/(h) $<eq_41>


To obtain the derivatives of the three remaining discretization points $x_1, x_5 "and" x_2$, a neighboring element is required. 
According to @fig_39, the ending nodes of one element are the starting nodes of the next element. 
Leveraging this information and the scheme explained through @eq_37 to @eq_41, the forward #gls("fd") method can be applied to calculate the derivatives for the remaining points.
In order to derive the second-order gradients of the displacements, the output of @eq_37 to @eq_41 is used as input for @eq_42 to @eq_46.

$ f''_("forward")(x_0) = 2 space (f'(x_4) - f'(x_0))/(h) $<eq_42>
$ f''_("forward")(x_4) = 2 space (f'(x_1) - f'(x_4))/(h) $<eq_43>
$ f''_("forward")(x_7) = (f'(x_5) - f'(x_7))/(h) $<eq_44>
$ f''_("forward")(x_3) = 2 space (f'(x_6) - f'(x_3))/(h) $<eq_45>
$ f''_("forward")(x_6) = 2 space (f'(x_2) - f'(x_6))/(h) $<eq_46>


The presented procedure assumes a constant element size $h$ and ideally centered nodes. Thus, either $h$ or $h/2$ could be used as the step size, depending on the discretization points of interest. However, in practical applications, meshes may be distorted, and elements of different sizes or types may be used. 
In such cases, the element size cannot be taken as constant, and the geometric distance between discretization points $h$ must potentially be evaluated for each calculation.

While @eq_37 to @eq_46 along with neighboring relationships can be used with the forward #gls("fd") method, the global right-ending nodes require special treatment.
This issue is visualized in @fig_41, where the global right-ending discretization points are colored red.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/7_Ending.svg", 
  width: 47%),
  caption: [Limitation of purely using the forward #gls("fd") method for global red-colored right-end discretization points.],
) <fig_41>

// ----------------------------- backward story ----------------------------- //
To obtain the gradients of the red points shown in @fig_41 using the forward #gls("fd") method, additional discretization points would be needed to their right. However, since these are already the rightmost points, only discretization points to their left are available. 
Therefore, the backward #gls("fd") method could be employed for these points. Yet, depending on the relevance of the outermost region, implementing this feature might not be necessary.
If the curvature values of the rightmost nodes are not relevant, dummy values could be inserted instead. Should the outermost red nodes be required, the missing derivatives of the three remaining discretization points $x_1, x_5 "and" x_2$ according to @fig_38, can be formulated using the backward #gls("fd") method through @eq_47 to @eq_52.

$ f'_("backward")(x_1) = 2 space (f(x_1) - f(x_4))/h $<eq_47>
$ f'_("backward")(x_5) = (f(x_5) - f(x_7))/h $<eq_48>
$ f'_("backward")(x_2) = 2 space (f(x_2) - f(x_6))/h $<eq_49>

$ f''_("backward")(x_1) = 2 space (f'(x_1) - f'(x_4))/h $<eq_50>
$ f''_("backward")(x_5) = (f'(x_5) - f'(x_7))/h $<eq_51>
$ f''_("backward")(x_2) = 2 space (f'(x_2) - f'(x_6))/h $<eq_52>


// ---------------------------- first 3d results ---------------------------- //
With displacements, first and second derivatives known, the curvature can be calculated according to @eq_28. To cover a broad spectrum, the #gls("swith") model was computed with internal pressure variations between $150 "bar"$ to $1100 "bar"$ (or $15 "MPa"$ to $110 "MPa"$) using 30 linearly spaced values. While $150 "bar"$ is too low for economical aviation use, it represents a practical value for experimental testing environments. 
The upper limit of $1100 "bar"$ exceeds the maximum pressure currently storable in a type IV tank, as elaborated in @chap_1_2, where type V tanks are noted to provide a maximum pressure of $1000 "bar"$.
As explained in @chap_1_2, although type IV tanks currently offer the best compromise between safety and economic considerations, type V technology could become the preferred option as it advances. 
Given likely future technical advancements, type V tanks might eventually store hydrogen at pressures exceeding $1000 "bar"$ or even $1100 "bar"$. 

Moreover, using such high pressure values in the simulation emphasizes that pressure elevations are more readily implemented in numerical models than in experimental testing.
The lift coefficient variation $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5]$ was selected to cover the range from small aircraft to large aircraft with potential high-lift devices in application @Wild2022, leading to 180 total variations.
// a = np.linspace(15,110,30)
// a[11] = 51.034
An illustrative example of the displacement on the top left, the strains or first-order derivative on the top right, the second-order derivative on the bottom left, and the resulting curvature on the bottom right for a pressure of $p approx 510 "bar"$ and a lift coefficient of $C_L approx 0.6$ is depicted in @fig_42.

The magnitude values are calculated according to the Euclidean norm. 
For curvature, the calculation follows @eq_33, where $kappa_x$, $kappa_y$, and $kappa_z$ correspond to the curvature components in their respective spatial directions.

$ kappa_("mag") = sqrt(kappa_x^(2) + kappa_y^2 + kappa_z^2) $<eq_33>

Given the pivotal importance of tank structural behavior in #glspl("swith"), the corresponding information is provided separately for the tanks in @fig_43.

// -------------------------------- 3d plots -------------------------------- //
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/8_Skin_Ca_06_P_510.png", 
  width: 81%),
  caption: [Illustrative depiction of the displacements ([mm], top left), first-order derivative ([-], top right), second-order derivative ([$"mm"^(-1)$], bottom left) and curvature ([$"mm"^(-1)$], bottom right) for a #gls("swith") model at $C_L approx 0.6$ and internal pressure $p approx 510 "bar"$.],
) <fig_42>


#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/9_Tubes_Ca_06_P_510.png", 
  width: 81%),
  caption: [Illustrative depiction of the displacements ([mm], top left), first-order derivative ([-], top right), second-order derivative ([$"mm"^(-1)$], bottom left) and curvature ([$"mm"^(-1)$], bottom right) solely for the tubes of a #gls("swith") model at $C_L approx 0.6$ and internal pressure $p approx 510 "bar"$.],
) <fig_43>


// ---------------------------- model specialitis --------------------------- //
The application of curvature outcomes to real-world scenarios necessitates analysis of additional structural features. For that @fig_44 shall be viewed. 
@fig_44 presents the first-order derivatives of displacement (strain) with enhanced scaling to identify critical wing regions that warrant particular attention in simulation result interpretation.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/2_Curv_Application/10_Tubes_Ca_06_P_510.png", 
  width: 100%),
  caption: [Focused and scaled depiction of the first-order derivatives (strain) at $C_L approx 0.6$ and internal pressure $p approx 510 "bar"$. Top left: wing-fuselage intersection; top right: landing gear and engine; bottom left: end of inner wing and tubes; bottom right: outer wing end.],
) <fig_44>


The top left of @fig_44 exhibits notably high strains at the inner wing's skin interface. This occurs due to the implementation of a dummy stiffness value in this region where the wing extends into the fuselage. The skin stiffness is reduced to a minimal value here, while retaining the fuselage area to facilitate aerodynamic modeling and calculations.
At the landing gear and engine connection points, as well as tank ends, circumferential rings with high stiffness are added.  
Due to local stiffening elements, abrupt stiffness differences are expected and observable. 
One example is shown by the circumferential rings, with these differences noticeable in the top right at the landing gear position and the bottom left at the tube ending position in @fig_44.


Discontinuities in the first derivative propagate to the second derivative calculations. These discontinuities also appear in the curvature results, as curvature depends on both derivatives of displacement. 
For small first derivatives ($u' << 1$), the curvature formula given in @eq_28 simplifies to @eq_34 @Gross2021. This demonstrates direct proportionality between curvature $kappa$ and the second derivative $u$.

$ kappa approx u'' $<eq_34>

The first derivative exhibits abrupt behavior, yet this does not contradict $u' << 1$. For example, values of $1 times 10^(-3)$ and $1 times 10^(-9)$ differ by six orders of magnitude, while both remain significantly smaller than 1.
The numerical output of @eq_28 alone is insufficient to verify if the critical curvature was exceeded. Proper interpretation of local curvature discontinuities requires understanding of both curvature derivation and engineering principles.
When evaluating the influence of the fill medium, only structurally relevant areas should be considered to determine whether the critical curvature $kappa_"krit"$ has been exceeded.
Including non-representative areas would lead to misinterpretation.
To emphasize the significance of proper engineering evaluation, an additional consideration for real-world application shall be viewed. 
The evaluation of filling agent impact needs to be limited to the inner wing section, as the tanks are exclusively positioned within this region. Consequently, the outer wing section falls outside the scope of this analysis.

Based on the real-world-guided simulation model of a #gls("swith") and the essential interpretations presented, fundamental guidelines for assessing critical curvature were provided. 
Upon inspection, the results, accounting for modeling aspects and their implications, yield a significant finding: the curvature remains below the critical threshold within undisturbed regions.
This observation, derived from the #gls("fem") simulation model of a potential real-world #gls("swith") design, suggests that the choice of fill medium does not substantially influence the maximum sustainable bending moment.
However, the interpretation of curvature calculations for complex three-dimensional models raises serious challenges and requires meticulous attention to detail. 
The complexity of this assessment process introduces opportunities for misinterpretation when thorough investigations are not conducted. 
Recognizing these barriers, @chap_3_3 introduces an enhanced methodology designed to facilitate result interpretation and reduce the likelihood of errors in critical curvature assessment.
It is essential to acknowledge the limitations of these insights within the framework of the underlying assumptions. The analysis employed linear-static solutions, excluding considerations of gas compression effects and potential nonlinearities. These constraints might need to be taken into account when applying the outcomes to practical applications.

#pagebreak(weak: true)
// --------------------------------- summary -------------------------------- //
#summary_([

In summary, a methodology for calculating curvature and its interpretation was provided. For this analysis, a #gls("fem") simulation model of a #gls("swith") was utilized. The procedure for obtaining required derivatives was explained in detail. Since the methodology was developed from a displacement-based foundation, it can be applied to both analytical and numerical simulation approaches.
Furthermore, the method's applicability extends beyond simulation, as displacement data could alternatively be acquired from experimental investigations. 
Through important examples of critical curvature assessment, the challenges of directly comparing computed curvature outcomes with the critical curvature value for complex structures like aircraft became evident.
The interpretation of the results indicated that for experimental testing, hydrogen could be replaced with an alternative filling agent without significantly impacting the maximum bearable bending moment. Finally, the complexity of assessing critical curvature in three-dimensional space was acknowledged, leading to the introduction of an enhanced approach in @chap_3_3.

])