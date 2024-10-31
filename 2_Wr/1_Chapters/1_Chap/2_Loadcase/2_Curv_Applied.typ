/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


// TODO
// Title Check
=== Application for Impact Filling Agent<chap_3_0_2>



// In this section, it will be explained how it was decided for K2H2 whether the fill medium had a noteworthy influence on structural behavior. For this purpose, it will be explained why an approach using critical curvature can be pursued. Subsequently, it will be discussed how the curvature can be calculated, which methods are available for this, and why the final method was chosen. Finally, the results of the conducted curvature study will be shown.

// Previously, it was already explained that K2H2's project plan does not provide for cost-intensive experimental investigations. Therefore, these cannot be conducted. However, an alternative method to still make qualitative statements for K2H2 can be found upon careful examination of the results from @Liu2019. @fig_33 shows that the bending moment curves, regardless of fill medium and pressure, have similar curvature values for a certain range. Through this, a critical curvature could be defined, up to which the bending moment is independent of fill medium and pressure. Figure 26 shows two possible critical values for curvature. Both 0.4 1/m and 0.5 1/m could be considered as permissible values. However, the author of this report chooses the safer variant and defines the critical curvature as 0.4 1/m. Through this, the deviation of the bending moment curves is just small enough to be considered negligible. For better overview, this definition should be given as formula (12):

// Figure 26: Comparison of moment M and curvature κ for air and water as fill medium for different pressure levels @Liu2019 with possible critical curvature values

// κ(crit) ≤ 0.4 (12)

// To check whether the curvature of the SIHT model exceeds the critical curvature, its curvature values must be calculated. The SIHT model is available as a Finite Element model. Here, the aerodynamic loads are first calculated separately through a frictionless panel method. The aerodynamic loads are applied to the structural mesh through coupling. The internal pressure of the four tanks is defined as a variable and can be adjusted accordingly. The solution of the Finite Element (FE) model provides, among other things, the displacements. Figure 27 shows an extract of the displacement values in the three spatial directions of all nodes of an element.

// Figure 27: Example representation of displacement values in the 3 spatial directions at all nodes of an element


// Besides the displacements, the element ID precisely indicates which element is located where and which nodes are assigned to this element. Through this, it is also known which elements are adjacent to each other, or their neighborhood relationships can be derived. To better understand what is meant, refer to Figure 28.

// Figure 28: Neighborhood relationships of individual elements is known through the numbered and color-highlighted element IDs

// For determining the curvature with known displacement values, formula (13) can be used. Here, u stands for displacement and u', u'' for the first and second derivatives of displacement with respect to the directional coordinate. In paper @Liu2019, a geometric relationship was found through which the curvature could be calculated directly analytically. However, according to the author's knowledge, no geometric relationship can be found for the general case, which is why formula (13) [29] should be used.

// κ = u''/(1 + u')^(3/2) (13)

// Since the displacements are known, the derivatives can be obtained through numerical differentiation. The Finite-Difference method and the less well-known Complex-Step are suitable for this. There are three common procedures used in the Finite-Difference method (FDM). All procedures are derived through Taylor series expansion and are subject to truncation error. Since calculations are performed numerically, rounding error is added to the truncation error. Common computers use double precision (2.2∙10^-16), which means that numerical values cannot be captured after a certain decimal place. Consequently, rounding errors are inevitable. Rounding errors are to be considered according to accuracy requirements and are of great importance when calculating with very small numbers. The three common FDMs are the Forward, Backward, and Central Difference methods. The Central Difference method is more accurate in calculating the derivative as it is a second-order method/accuracy. However, two support points are also needed to calculate the derivative of a point.

// The Forward and Backward methods are first-order methods and are in most cases less accurate than the Central Difference method, but only need one support point for calculating the derivative. This makes them faster in execution and simpler in implementation. Forward and Backward methods differ in the quality of their derivative depending on the case. Usually, a step size study must be conducted to find a suitable value. The latter is defined via a convergence criterion, where the optimum represents a minimum of rounding error and truncation error (step size: h ~ 10^-6).

// Through the mathematical derivation, which can be found in [30], the Complex-Step is a second-order method. The amazing thing, however, is that only one support point is needed for this. For it to be applied, a mathematical function is needed. Point values and their distance, as with the known Finite Difference methods, are not sufficient. Because function values at a very small distance from each other do not need to be subtracted, no rounding errors result and calculations can be performed with maximum machine precision (step size: h ~ 10^-30) [30]. However, the truncation error remains (second-order method). The mathematical definitions of the Finite Difference methods are given in formulas (14) - (16). The analog for the Complex-Step is found in formula (17). To understand what is meant by x₀, x₁, and x₂, Figure 29 should be considered. Furthermore, h stands for the step size or the distance between possible position values x₀, x₁, x₂.

// [Mathematical formulas 14-17 follow with their respective equations]

// // f'_forward(x_0) = (f(x_1) - f(x_0))/h                  (14)

// // f'_backward(x_1) = (f(x_1) - f(x_0))/h                 (15)

// // f'_central(x_1) = (f(x_2) - f(x_0))/(2h)               (16)

// // f'(x) = Imag[f(x + ih)]/h                              (17)

// Figure 29: Positions for understanding the Finite-Difference method

// For the Complex-Step, the approach function for mapping the displacements could be determined. However, this would involve greater time expenditure. Moreover, machine precision is not required since the results are compared with the diagram from @Liu2019. Higher accuracies can be achieved with the Central Difference method than with the other difference methods. However, with the information about the nodes of a single element, only two of the eight required derivatives can be calculated. For the remaining six derivatives, correct assignment of neighboring elements and nodes is required. The latter involves higher programming effort. In the simplest case, the elements have a chronologically ascending element ID in all three dimensions. For the 1D case, this is shown in Figure 30. In practice, however, it is usually the case that the element IDs do not increase chronologically. A pictorial representation of this is given in Figure 31. In such cases, as with K2H2, increased programming effort is required to capture the neighborhood relationships.

// The Forward and Backward Difference methods offer sufficient accuracy with comparatively simple implementation. For K2H2, due to accuracy requirements and time expenditure, the Forward Finite Difference method was chosen as the method for calculating the derivatives. The method/implementation was compared with solutions of analytical functions whose derivatives are known. An accuracy of order ~1e-[4; 7] was achieved. This would exceed the requirements for comparing the calculated curvatures with those from @fig_33.

// Figure 30: Simplest case: Elements are ordered chronologically and by dimension
// Figure 31: Real case: Element IDs are not chronologically arranged


// Concrete steps for calculating the first and second derivatives are given in Figures 32 and 33. Here, it should become apparent that the second derivative can only be calculated once the first derivative is available. When all derivatives are known, they can be inserted into the curvature formula (13). At this point, displacements, first and second derivatives, as well as curvatures are known for all relevant nodes of the FE mesh. By relevant nodes, it is meant that the presented method does not calculate derivatives and curvatures for the nodes at the end of the wing span. The idea is that the required quantities are calculated for the left and middle areas of an element. This can be understood using Figure 32. Once the same quantities are to be calculated for the neighboring element, the left nodes of the new element are the right nodes of the old element. This latter statement can be verified using Figure 30. Thus, the curvatures are calculated for all nodes except the outer ones at the wing tip.

// It would certainly be possible to calculate the curvature values for these as well. However, a single span-node row can be neglected. The second, much more important point is that the curvatures are significant in the area where the tanks are located under the wing skin. The wing tip is located on the outer wing, and the tanks already end in the inner wing. Therefore, the results can be used for evaluation without concerns.

// Figure 32: Calculation of the first derivative on a finite element
// Figure 33: Calculation of the second derivative on a finite element

// As a brief overview of where we are and what we want. The overarching question is: Can the influence of the fill medium be neglected in an experimental investigation? To answer this, we need to check whether the critical curvature is exceeded. The method for calculating this has already been described. Now the results will be discussed. For this purpose, a study was conducted with:
// - A pressure range of [15;110] MPa ≜ [150;1100] bar linearly distributed with 30 values
// - Lift coefficients Ca = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5]
// - A load factor of 3.72

// This corresponds to 180 variations of internal pressure and Ca values. For the small aircraft, a Ca value of ~1.0 is expected at this time. Values Ca ≥ 2 are highly unlikely for small aircraft and already enter the high-lift range. However, it is known about the tank tubes that they are designed to be very rigid. Therefore, the question naturally arises as to what limits the tank tubes have.

// [Figure 34: Absolute curvatures (1/mm) for entire wing with Ca = 1.5 and [pupper,left = 15, pupper,right = 31.37, plower,left = 60.86, plower,right = 110] MPa]

// Figure 34 shows the absolute curvatures for the entire wing including the tanks with Ca = 1.5 and the four pressure values of [15, 31.37, 60.86, 110] MPa ≜ [150, 313.7, 608.6, 1100] bar. The absolute value was calculated according to the usual Euclidean norm, as per formula (18), where the indices x, y, and z stand for the curvature component in the respective spatial direction.

// κmag = √(κx² + κy² + κz²) (18)

// Since particular emphasis is placed on the curvature behavior of the tubes, the latter is shown for the tubes in Figure 35.

// [Figure 35: Absolute curvatures (1/mm) for tanks with Ca = 1.5 and [pupper,left = 15, pupper,right = 31.37, plower,left = 60.86, plower,right = 110] MPa]

// For the final question regarding the influence of the fill medium, it is more purposeful to only display the elements which lie below the critical curvature κ < (κcrit = 0.4 1/m). Through this, it can be quickly determined visually whether, firstly, the critical curvature is exceeded. Secondly, in case of exceeding, further concrete investigations can be conducted. For this purpose, Figures 36 and 37, with the previously mentioned Ca and pressure values, only show the areas which fulfill the critical condition κ < (κcrit = 0.4 1/m). Initially, it can be determined that with increasing pressure, the curvatures at the inner and outer wing, as well as at the landing gear and engine connections, increase. In some places, the critical curvature is also exceeded.



// To evaluate whether exceeding these curvatures can be counted as a final end result, a deeper analysis of the results should be conducted. It can be observed that particularly high curvatures occur on the skin of the inner wing. This is because a placeholder value for stiffness is used here. It is an area that extends into the fuselage. Therefore, skin stiffness is virtually reduced to a very small value. The fuselage area was not removed as this simplifies aerodynamic modeling and calculations.

// At the landing gear and engine connection points, as well as tank ends, circumferential rings with high stiffnesses are used. Due to the stiff circumferential rings, abrupt stiffness differences are to be expected in their vicinity, as can also be seen in the shown figures. The described behavior becomes particularly apparent when considering the first derivative of displacement. The first derivative of displacement in absolute value for the wing and tank for a pressure value of 15 MPa ≜ 150 bar, Ca = 1.5, and a scaling factor of 900 is given in Figure 38.

// [Figure 36: Only absolute curvatures (1/mm) visible for entire wing which satisfy κ < (κcrit = 0.4) with Ca = 1.5, [pupper,left = 15, pupper,right = 31.37, plower,left = 60.86, plower,right = 110] MPa]

// [Figure 37: Only absolute curvatures (1/mm) visible for tanks which satisfy κ < (κcrit = 0.4) with Ca = 1.5, [pupper,left = 15, pupper,right = 31.37, plower,left = 60.86, plower,right = 110] MPa]


// [Figure 38: First derivative of displacement in absolute value for wing and tank with Ca = 1.5, p = 15 MPa and a scaling factor of 900]

// Here, the effects of the stiffness placeholder near the wing root are particularly well visible. Further abrupt behavior in the first derivatives is shown in Figure 39.

// [Figure 39: First derivative of displacement in absolute value for important sections with Ca = 1.5, p = 15 MPa and a scaling factor of 900]

// If the first derivative shows jumps, this will also be reflected in the second derivative. Since the curvature is based on the first and second derivatives of displacement, peculiarities are also to be expected at these points. If it is assumed that the first derivative is much smaller than 1 (u' ≪ 1), then formula (19) shows the direct proportionality. We already know that the first derivative exhibits abrupt behavior. However, this does not necessarily contradict u' ≪ 1. It is possible that two values differ by several orders of magnitude, yet both values are still significantly smaller than 1.

// κ ≈ u'' (19)

// Through the deeper analysis of the curvature results, it can be noted that local curvature elevations are to be expected for some areas. These must be consciously neglected when answering the question about the influence of the fill medium, as it would otherwise lead to misinterpretations. Furthermore, it can be stated that the curvature behavior of the outer wing cannot be part of the evaluation since the tanks are only located in the inner wing. If all discussed modeling measures and their consequences are considered, the following conclusion can be reached: In the undisturbed regions, it is clearly recognizable that the critical curvature is not exceeded. Therefore, it can be assumed that the fill medium has no significant influence on the maximum sustainable bending moment. Here, it is important to have clearly defined that the obtained results are only valid within the framework of the made assumptions. The calculations were solved linear-statically; gas compression effects and possible nonlinearities were not considered.

// In summary, an extensive investigation was conducted to determine whether the filling medium has an influence on the maximum sustainable bending moment. Through subsequent comparison with a critical curvature, it was found that within the scope of K2H2, the influence of the filling medium can be neglected. Thus, filling the tanks with water instead of hydrogen would be permissible in the experimental investigation.


// // -------------------------------------------------------------------------- //


// == II.15 Influence of the filling medium through averaged curvature

// In the previous section, it was derived how the question of the filling medium's influence on the maximum sustainable bending moment can be answered by calculating the curvature. The results were shown in three dimensions. However, evaluating the results in 2D is significantly less prone to errors and simpler to interpret. Additionally, this allows reliance on further corroborating investigation within an innovative project. For these reasons, the influence of the filling medium on the maximum sustainable bending moment should be investigated using averaged curvatures.

// There are two possibilities for averaging the curvatures. In the first method, the displacements, derivatives, and curvatures are calculated for the entire structure. Once these are available, the curvatures can be averaged along the wing span. To make the concept easier to understand, see Figure 40. The vertical and depth curvature components are added up and averaged for each individual span value. The second method calculates the displacements and averages them directly along the span. The averaged displacements are used to calculate the corresponding averaged derivatives and curvatures. In the first method, averaging occurs only after obtaining the curvatures, whereas the second method begins directly with averaged displacements.

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
