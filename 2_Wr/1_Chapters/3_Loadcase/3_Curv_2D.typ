/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// TODO Word rep
// Title was tested and is inshallah fine
== Assessment of Filling Agent Impact in 2D<chap_3_0_3>
This subsection addresses the need to minimize potential errors in the interpretation of curvature results. In @chap_3_0_1, the application of curvature analysis was introduced as a method to evaluate the impact of filling agents on structural behavior. This evaluation becomes particularly critical when considering the replacement of hydrogen with alternative filling agents in experimental structural validation tests. The current limitations in safely handling hydrogen in long tubes at high pressures, as detailed in @chap_2_0_1 and @chap_2_0_2, necessitate this investigation.
@chap_3_0_2 established the methodology for calculating curvature based on displacement data and corresponding coordinate information. While the three-dimensional curvature results maintain their validity, the interpretation of these values for complex three-dimensional geometries, such as the #gls("swith", long:true), presents a challenging and potentially  error-prone task. To address this challenge, this subsection introduces two methodological approaches for transforming three-dimensional curvature data into either two-dimensional span curvature representations.
This transformation streamlines the interpretation of curvature data. The resulting representation enables more robust assessment of critical curvature thresholds, thereby facilitating more accurate determinations of filling agent impacts on structural behavior.

// -------------------------------------------------------------------------- //
The curvature calculations and critical curvature assessment presented in @chap_3_0_2 were conducted in three dimensions. However, evaluating results in two dimensions offers several advantages: it reduces the likelihood of interpretation errors and provides clearer insights. Furthermore, analyzing two-dimensional data requires less computational resources compared to processing higher-dimensional data.
Based on these advantages, this investigation of filling medium influence on maximum sustainable bending moment is conducted in two dimensions. The transformation from three-dimensional curvature values to lower dimensions is achieved by averaging along the remaining axes. Three averaging approaches have been identified for this transformation. Before detailing these methods, it is essential to establish some fundamentals.
When analyzing results from a three-dimensional gls("fem") model of a #gls("swith"), several quantities need be be considered: displacement, first-order derivatives, second-order derivatives, and the resulting curvature. Each of these quantities is inherently three-dimensional. For each quantity, components along all three axes are available, and their magnitude can be calculated using methods such as the Euclidean norm, as given in @eq_33.

These discrete quantities correspond to specific nodes within the #gls("fem") mesh. A six-dimensional vector is required to fully represent each nodal entry, comprising three coordinate directions and three components of the considered variable. Given the high node count in the #gls("fem") mesh, matrices of dimension $bold(A)^(n times 6)$ are necessary, where $bold(A)$ represents a generic matrix and $n$ denotes the total number of nodes. Consequently, in three dimensions, each variable can be represented by its own matrix: displacement $bold(U)$, first-order derivative $bold(U)'$, second-order derivative $bold(U)''$, and curvature $bold(kappa)$.

// -------------------------------------------------------------------------- //
Having established the fundamental concepts regarding curvature-related variables and their dimensions, the first averaging method can now be examined. This method begins by calculating the displacements and required derivatives to obtain the curvature for the entire structure in three dimensions.
Subsequently, for a constant spanwise position $y_i$, the curvature values are averaged across the two remaining axes: the chordwise (x) and vertical (z) directions. Specifically, at each constant spanwise position $y_i$, the corresponding nodal distribution is defined by its $(x,z)$ coordinates in the plane perpendicular to the spanwise direction. This collection of nodes at constant $y_i$ forms a planar slice through the structural geometry. Due to the numerical nature of the computations, small deviations from the exact $y_i$ position are acceptable when identifying nodes belonging to the same planar slice.
The process of averaging along the chordwise (x) and vertical (z) directions for a given $y_i$ value is depicted in @fig_45.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/0_Spanwise.svg", 
  width: 87%),
  caption: [Visualization of the curvature averaging methodology showing the averaging directions along the chordwise (x) and vertical (z) axes at a constant spanwise position $y_i$ for dimensional reduction of three-dimensional curvature data.],
  
) <fig_45>

The ellipses in @fig_45 indicate the directions of the axes along which averaging occurs. The process of the first method can be expressed mathematically for each $y_i$ as shown in @eq_53. The following variables are used in the equation: displacement $u$, first-order derivative $u'$, second-order derivative $u''$, curvature $kappa$, total number of nodes $n_(y,"const")$ for one span section at a numerically constant $y_i$, and $j$ for the axis component.

// -------------------------------- method 1 -------------------------------- //
$ overline(kappa_(1, y_i,j)) &= 1/n_(y,"const") sum_i ^(n_(y,"const")) u_(i,j) ^'' / ( (1 + u_(i,j)^(2')) ^(3/2))  \
&=  1/n_(y,"const") sum_i ^(n_(y,"const")) kappa_(i,j) $ <eq_53>


For a selected span section $y_i$ and axis $j$, the output of @eq_53 is a scalar-valued averaged component of the curvature $overline(kappa_(1, y_i,j))$. Since the output along all three axes is required, the combined result forms a three-dimensional curvature vector. To obtain a single scalar averaged mean value for the curvature, the Euclidean norm can be applied following @eq_33.

// ------------------------------ second method ----------------------------- //
The second method employs a different approach by using displacements as its primary input. These displacements are averaged across the chordwise (x) and vertical (z) axes for a numerically constant span section $y_i$. Based on these averaged displacements $overline(u)$, the method calculates the required gradients $u'$ and $u''$, which then yield the mean curvature $overline(kappa_2)$. For a selected span section $y_i$ and dimension axis $j$, these quantities are formally expressed as mean gradients $overline(u_(y_i,j))^(')$ and $overline(u_(y_i,j))^('')$. The mathematical formulation of this averaging approach is given in @eq_54.

$ 
overline(u_(y_i,j)) &= 1/n_(y,"const") sum_i ^(n_(y,"const")) u_(i,j) \
overline(u_(y_i,j))^(') &=  (overline(u_(y_i,j)))'  \
overline(u_(y_i,j))^('') &=  (overline(u_(y_i,j))')' \
overline(kappa_(2, y_i,j)) &= (overline(u_(y_i,j))^('') ) / (1+ 
overline(u_(y_i,j))^(2')
)^(3/2)

 $ <eq_54>

Similar to @eq_53, the combined output of the three spatial scalar components yields a three-dimensional curvature vector. The Euclidean norm, as defined in @eq_33, can then be applied to obtain a single scalar-valued mean curvature.
The third method follows a hybrid approach between methods 1 and 2. While it calculates the curvature-related variables similarly to the first method, it differs in the sequence of averaging operations. Rather than averaging the final curvature values, this method performs averaging at intermediate stages for each required variable independently.
In this approach, both the first-order displacement derivative $u'$ and the second-order gradient $u''$ are averaged across the $x$ and $z$ axes before being utilized in the mean curvature calculation. 
This distinguishes it from method 2, where the gradients $u'$ and $u''$ are derived from the averaged displacement $overline(u)$. The fundamental difference lies in the gradient computation, which follows the methodology of method 1 but applies averaging at each derivative stage. The mathematical formulation of this approach is presented in @eq_55.

$
overline(u_(y_i,j))' &= 1/n_(y,"const") sum_i ^(n_(y,"const")) u_(i,j)^' \
overline(u_(y_i,j))'' &= 1/n_(y,"const") sum_i ^(n_(y,"const")) u_(i,j)^('') \
overline(kappa_(3, y_i,j)) &= (overline(u_(y_i,j))^('') ) / (1+ 
overline(u_(y_i,j))^(2')
)^(3/2)
$<eq_55>

// ---------------------------- shape information --------------------------- //
The three approaches presented in @eq_53 to @eq_55 aim to transform the three-dimensional curvature representation into a one-dimensional representation. More specifically, this transformation converts the curvature matrix from a dimension of $bold(kappa)^(n times 6)$ to either $bold(kappa)^(n_y times 4)$ or $bold(kappa)^(n_y times 2)$, where $n_y$ represents the total number of discretization points along the span direction (y-axis).
The original $bold(kappa)^(n times 6)$ matrix structure comprises two main parts: the first three columns contain local coordinate information for each spatial axis ($x,y,z$), while the remaining three columns contain the curvature components in their corresponding directions. When the curvature components for a numerically constant span section $y_i$ are averaged across the chord (x) and vertical (z) axes, the matrix is reduced to $bold(kappa)^(n_y times 4)$. In this form, the first column represents the position along the span, and the remaining three columns contain the curvature components in the three spatial directions.
Further reduction to $bold(kappa)^(n_y times 2)$ is achieved by calculating the magnitude of the three curvature components, yielding a single scalar-valued curvature.  This final form contains the spanwise position $y_i$ in the first column and the corresponding scalar-valued mean curvature in the second column.
This $bold(kappa)^(n_y times 2)$ representation is the desired outcome as it enables straightforward interpretation through two-dimensional plotting and provides the advantages elaborated at the beginning of this subsection.

// ----------------------------- examples calcs ----------------------------- //
Although three seemingly distinct approaches for curvature averaging were presented, analytical analysis reveals that only two fundamentally different methods exist. This can be demonstrated through the application of trigonometric terms in @eq_53 to @eq_55.
For clarity, this analysis is demonstrated using a simplified case: a single spanwise section $y_i$, one dimension $j$, and two terms for the sum in the mean curvature equations. The trigonometric terms are presented in @eq_56, with their first derivatives given in @eq_57, and second-order derivatives in @eq_58.


$ u_1 &= cos(x) \
u_2 &= sin(x) $ <eq_56>

$ u_1^' &= -sin(x) \
u_2^' &= cos(x) $ <eq_57>

$ u_1^('') &= -cos(x) \
u_2^('') &= -sin(x) $ <eq_58>

// ----------------------------- example meth 1 ----------------------------- //
Inserting @eq_56 to @eq_58 into method 1, as defined by @eq_53, yields the results shown in @eq_59 and @eq_60.


$ overline(kappa_(1)) &= 1/2  [ 
   u_1^('') /(1 + u_1^(2'))^(3/2) +
   u_2^('') /(1 + u_2^(2'))^(3/2)
  ]  $ <eq_59>


$ overline(kappa_(1)) &= 1/2  [ 
   -cos(x) /(1 + (-sin(x))^2)^(3/2) 
   -sin(x) /(1 + cos(x)^2)^(3/2)
  ]  $ <eq_60>


// ----------------------------- exmaple meth 2 ----------------------------- //
The analogous expressions for method 2, following @eq_54, are presented in @eq_61 to @eq_63.

$ 
overline(u) &= (cos(x) + sin(x)) / 2  \
overline(u)' &= ( -sin(x) + cos(x)) / 2 \
overline(u)'' &= (-cos(x) - sin(x)) / 2 
   $ <eq_61>

$ overline(kappa_2) = overline(u)'' / (1 + overline(u)^(2'))^(3/2) $ <eq_62>

$ overline(kappa_2) = ((-cos(x) - sin(x)) / 2)  / [1 + ( (-sin(x) + cos(x)) / 2)^(2)]^(3/2)
   $ <eq_63>

// ----------------------------- exmaple meth 3 ----------------------------- //
The analogous expressions for method 3, following @eq_55, are presented in @eq_64 to @eq_66.

$ 
overline(u)' &= ( -sin(x) + cos(x)) / 2 \
overline(u)'' &= (-cos(x) - sin(x)) / 2 
   $ <eq_64>


$ overline(kappa_3) = overline(u)'' / (1 + overline(u)^(2'))^(3/2) $ <eq_65>
$ overline(kappa_3) = ((-cos(x) - sin(x)) / 2)  / [1 + ( (-sin(x) + cos(x)) / 2)^(2)]^(3/2)
   $ <eq_66>

// ------------------------------ inert 90 deg ------------------------------ //
To identify which methods yield identical results and which differ, an input angle of 90 degrees (or $pi/2$ radians) is selected for comparison. For this angle, the following trigonometric values apply: $sin(x = 90 degree = pi/2) = 1$ and $cos(x = 90 degree = pi/2) = 0$.
Inserting these defined variables into @eq_60, the results for the first method are presented in @eq_67.

// ---------------------------------- kap_1 --------------------------------- //
$ overline(kappa_(1)) &= 1/2  [ 
   cancel(-cos(x=pi/2) /(1 + (-sin(x=pi/2))^2)^(3/2) ) 
   -sin(x = pi/2) /(1 + cancel( cos(x=pi/2)^2) )^(3/2)
  ]  \ 

  &= 1/2 [ 0 -  1/ (1 + 0)^(3/2)] = -1/2
  
  $<eq_67>

Inserting the defined variables into @eq_63, the results for the second method are presented in @eq_68.

// ---------------------------------- kap 2 --------------------------------- //
$ overline(kappa_2) &= (( cancel(-cos(x= pi/2)) - sin(x= pi/2)) / 2)  / [1 + ( (-sin(x= pi/2) + cancel(cos(x= pi/2))) / 2)^(2)]^(3/2) \

&= (-1/2) / [1 + (-1/2)^2] ^(3/2) = (-1/2) / [1 + 1/4] ^(3/2) = (-1) / (2 (5/4) ^(3/2))
   $ <eq_68>

Inserting the defined variables into @eq_66, the results for the third method are given in @eq_69.

// ---------------------------------- kap 3 --------------------------------- //
$ overline(kappa_3) &= ((cancel(-cos(x= pi/2)) - sin(x= pi/2)) / 2)  / [1 + ( (-sin(x= pi/2) + cancel(cos(x= pi/2))) / 2)^(2)]^(3/2) \

&= -1/2 / [1 + (-1/2)^2] ^(3/2) = -1/2 / [1+ 1/4]^(3/2) = -1/ (2 (5/4)^(3/2))
   $ <eq_69>


Analysis of the results shows that the output of method 1, $overline(kappa_(1)) = -1/2$, differs from both method 2, $overline(kappa_2) = (-1) / (2 (5/4) ^(3/2))$, and method 3, $overline(kappa_3) = -1/ (2 (5/4)^(3/2))$ ($overline(kappa_(1)) != overline(kappa_(2)) "and" overline(kappa_(1)) != overline(kappa_(3))$).
However, methods 2 and 3 yield identical results: $overline(kappa_2) = overline(kappa_3) = (-1) / (2 (5/4) ^(3/2))$. Therefore, while three approaches were initially proposed for obtaining the curvature as a $bold(kappa)^(n_y times 2)$ matrix, effectively only two distinct methods exist.

// --------------------------------- results -------------------------------- //
Having established the theoretical fundamentals, the numerical results can now be presented. Note that the results shown for method 2 are equivalent to those of method 3. The results for method 1 are depicted in @fig_46 to @fig_49.

@fig_46 shows the magnitude of the curvature averaged along the chord (x) and vertical (z) axes versus the normalized span position. The averaged curvatures are presented for six different lift coefficients, $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5]$, at a constant pressure of $51.03 "MPa"$. 
The results demonstrate that curvature generally increases with increasing lift coefficient, with the highest curvature values occurring at $C_L = 2.5$. The critical curvature $kappa_"crit"$ is indicated by a horizontal red line; when this threshold is exceeded, the impact of the filling agent becomes significant.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/1_510bar_Ca_Var_Method_1.svg", 
  width: 100%),
  caption: [Averaged curvature magnitude along the normalized span position calculated using method 1 according to @eq_53, comparing six lift coefficients $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5]$ at a constant pressure of $51.03 "MPa"$.]
) <fig_46>

From the arguments presented in this text, an undisturbed region can be identified. @fig_47 displays the averaged curvature for the normalized span position for one portion of this undisturbed area, with all other parameters remaining identical to those in @fig_46.
The analysis reveals that even at the highest lift coefficient value ($C_L = 2.5$), no curvature approaches the critical threshold. While the critical curvature was set to $kappa_"crit" = 0.4$, the observed curvatures remain substantially below $0.4 space upright("m")^(-1)$. In fact, the curvature values are significantly smaller than $0.1 space upright("m")^(-1)$. To properly visualize the impact of varying lift coefficient values, a scale is used where the critical curvature lies beyond the visible range.
The interpretation of @fig_47 indicates that for this specific simulation model at a pressure of $51.03 "MPa"$ and lift coefficients up to $C_L = 2.5$, the filling agent's impact on the maximum bearable bending moment in experimental structural validation tests can be neglected. This interpretation suggests that for these specific conditions, hydrogen can be replaced with water for these tests. As with any simulation-based analysis, these findings are specific to the current model configuration and would need to be validated for different structural configurations or loading conditions.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/2_510bar_Ca_Var_Undisturbed_Method_1.svg", 
  width: 100%),
  caption: [Averaged curvature magnitude in the undisturbed region along the normalized span position calculated using method 1 according to @eq_53, comparing six lift coefficients $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5]$ at a constant pressure of $51.03 "MPa"$.]
) <fig_47>

// ---------------------------------- here ---------------------------------- //
The analysis presented in @fig_46 and @fig_47 examined the impact of the lift coefficient $C_L$ at a constant pressure of $51.03 "MPa"$. Following method 1, @fig_48 and @fig_49 investigate the pressure effects while maintaining a constant lift coefficient of $C_L approx 0.6$. Although @fig_48 demonstrates that pressure variations influence the resulting curvature, this impact remains notably small despite the considerable pressure range from $15 "MPa"$ to $110 "MPa"$.
// ---------------------------- method 1 pressure --------------------------- //
// fine
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/3_Ca_0.6_Pr_Variabel_Method_1.svg", 
  width: 100%),
  caption: [Averaged curvature magnitude along the normalized span position calculated using method 1 according to @eq_53, comparing pressure values from $15 "MPa"$ to $110 "MPa"$ at a constant lift coefficient of $C_L approx 0.6$.]
) <fig_48>

Analogous to @fig_47, @fig_49 presents a detailed examination of the undisturbed area. The analysis reveals that the obtained curvature values remain substantially below the critical curvature threshold. The magnitude of this difference is so significant that the critical curvature falls outside the selected scale range necessary for proper visualization of the pressure effects.

// fine
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/4_Ca_0.6_Pr_Variabel_Undisturbed_Method_1.svg", 
  width: 100%),
  caption: [Averaged curvature magnitude in the undisturbed region along the normalized span position calculated using method 1 according to @eq_53, comparing pressure values from $15 "MPa"$ to $110 "MPa"$ at a constant lift coefficient of $C_L approx 0.6$.]
) <fig_49>

// ========================================================================== //
// ================================ method 2 ================================ //
// ========================================================================== //
The results obtained using method 1 clearly indicate that hydrogen could be replaced with water without modifying the maximum bearable bending moment. To validate this finding through comparison with method 2, as defined in @eq_54, an analysis is depicted in @fig_50 to @fig_55.
@fig_50 presents the magnitude of the averaged displacement $overline(u)$ along the normalized span position for six lift coefficients ($C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5]$) at a constant pressure of $51.03 "MPa"$. The lift coefficient's influence exhibits a direct correlation with displacement magnitude: higher lift coefficients correspond to larger displacements. The maximum displacement occurs at $C_L = 2.5$ near the wing tip. This behavior aligns with structural mechanics principles, as the wing tip lacks direct support. Consequently, while maximum stress concentrations develop at the support position, the greatest deflection manifests at the wing tip due to the maximum lever arm effect.

// fine
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/5_510bar_Ca_Var_Method_2_Disp.svg", 
  width: 100%),
  caption: [Averaged displacement magnitude $overline(u)$ along the normalized span position calculated using method 2 according to @eq_54, comparing six lift coefficients $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5]$ at a constant pressure of $51.03 "MPa"$.]
) <fig_50>

@fig_51 displays the magnitude of the averaged curvature along the normalized span position using method 2, as defined in @eq_54, for six lift coefficients ($C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5]$) at a constant pressure of $51.03 "MPa"$. The interpretations previously established for method 1 in @fig_46 are applicable to the method 2 results presented in @fig_51. While the influence of the lift coefficient is evident, its magnitude remains relatively small.
As local distributions must be filtered out for the final assessment, the undisturbed area is presented in @fig_52. This representation enables evaluation of the filling agent's impact on structural behavior. The observed behavior closely corresponds to that shown in @fig_47 using method 1.

// fine
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/6_510bar_Ca_Var_Method_2_Curv.svg", 
  width: 100%),
  caption: [Averaged curvature magnitude along the normalized span position calculated using method 2 according to @eq_54, comparing six lift coefficients $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5]$ at a constant pressure of $51.03 "MPa"$.]
) <fig_51>

// fine
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/7_510bar_Ca_Var_Method_2_Curv_Undis.svg", 
  width: 100%),
  caption: [Averaged curvature magnitude in the undisturbed region along the normalized span position calculated using method 2 according to @eq_54, comparing six lift coefficients $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5]$ at a constant pressure of $51.03 "MPa"$.]
) <fig_52>



@fig_53 illustrates the impact of pressure on the magnitude of the averaged displacement $overline(u)$. It presents the displacement magnitude along the normalized span position using method 2, as defined in @eq_54, for pressure values ranging from $15 "MPa"$ to $110 "MPa"$ at a constant lift coefficient of $C_L approx 0.6$.
The pressure's influence demonstrates nonlinear behavior. The local span position determines whether increased pressure results in larger or smaller deflections. For instance, at $110 "MPa"$, higher displacements are observed from the wing root to beyond 80% of the span length. However, near the wing tip, this trend reverses, with higher pressure values yielding lower displacements than those observed at lower pressures.

// fine
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/8_Ca_0.6_Pr_Variabel_Method_2_Disp.svg", 
  width: 100%),
  caption: [Averaged displacement magnitude $overline(u)$ along the normalized span position calculated using method 2 according to @eq_54, comparing pressure values from $15 "MPa"$ to $110 "MPa"$ at a constant lift coefficient of $C_L approx 0.6$.]
) <fig_53>

The impact on the magnitude of the averaged curvature is depicted in @fig_54. The analysis comprises the averaged curvature magnitude along the normalized span position using method 2 according to @eq_54, examining pressure values ranging from $15 "MPa"$ to $110 "MPa"$ at a constant lift coefficient of $C_L approx 0.6$. The behavior exhibits a measurable but minimal impact of pressure variations, showing consistency with the method 1 analysis in @fig_48.
A focused examination of this configuration within the undisturbed region, isolated from local disturbances, is presented in @fig_55.

// fine
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/9_Ca_0.6_Pr_Variabel_Method_2_Curv.svg", 
  width: 100%),
  caption: [Averaged curvature magnitude along the normalized span position calculated using method 2 according to @eq_54, comparing pressure values from $15 "MPa"$ to $110 "MPa"$ at a constant lift coefficient of $C_L approx 0.6$.]
) <fig_54>

// fine
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/10_Ca_0.6_Pr_Variabel_Method_2_Curv_undist.svg", 
  width: 100%),
  caption: [Averaged curvature magnitude in the undisturbed region along the normalized span position calculated using method 2 according to @eq_54, comparing pressure values from $15 "MPa"$ to $110 "MPa"$ at a constant lift coefficient of $C_L approx 0.6$.]
) <fig_55>


The results obtained from method 1 according to @eq_53 and method 2 according to @eq_54, analyzed across various lift coefficients $C_L$ and pressure values, demonstrate substantial similarities. A key finding common to both methods is that the curvatures in the undisturbed region remain significantly below the critical curvature threshold.
This finding has important implications for experimental validation testing, though it must be noted that these results are specific to the current simulation model and load conditions. Based on the simulation results, it can be concluded that hydrogen could be substituted with an alternative filling agent in experimental structural validation tests without affecting the maximum bearable bending moment.
The substantial margin between measured and critical curvature values in the undisturbed region eliminates the need for detailed investigation of differences between method 1 and method 2. However, for scenarios where curvature values approach the critical threshold, a thorough comparative analysis would become necessary. Such an analysis would provide deeper insights into when each method might be preferential over the other.


// --------------------------------- summary -------------------------------- //
#summary_([
This subsection addressed the challenge of interpreting complex three-dimensional curvature data by developing transformation methods for two-dimensional analysis. The mathematical framework established how to convert six-dimensional matrix representations ($bold(A)^(n times 6)$) into more manageable two-dimensional forms ($bold(A)^(n times 2)$). While three averaging approaches were initially proposed, mathematical analysis demonstrated that only two fundamentally different methods exist.
These methods were systematically evaluated using a range of lift coefficients and internal pressures from $15 "MPa"$ to $110 "MPa"$. The analysis revealed that for the studied simulation model and load cases, the curvatures in the undisturbed region remained substantially below critical thresholds.
This finding led to a practical conclusion potentially specific to the investigated simulation model. 
Under the analyzed load conditions, hydrogen could be substituted with an alternative filling agent in experimental structural validation testing. 
This substitution would not affect the structural behavior, as the material's stiffness characteristics would remain unchanged.
However, while the interpretation needs to be done for each specific simulation configuration, the laid out method is of general nature.

])