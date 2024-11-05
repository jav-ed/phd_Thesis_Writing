/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

=== Application for Impact Filling Agent<chap_3_0_3>
This subsection stems from the need to reduce the likelhood of making mistakes during the interperation of the curvature results.
In @chap_3_0_1 it was introduced how the curvature could be used in orde to answer the question wheter the filling agent has an impact on the structral behaviour.
THis is of vital improtance, when attempting to replace hydrogen in an experimtnal structral validation test with another filling agent.
The lack of current technical state of the art for deailing safe with hydrogen for long tubes and high pressures is explained in  @chap_2_0_1 and @chap_2_0_2.
In @chap_3_0_2, it was explained how the curvature could be calculated when displaxment data and correspoinding coorindate ifnromation were available.
While, the 3d curvature results are valid, interpreting curvature values for complex 3d geomtries like the #gls("swith", long:true) has, is a demanding and error prone task.
Therefore in this section two concepts will be introduced, how the 3d curvature data can be transfered to 1d curvature results.
This is supposed to allow the signitficatnly ease the curature interpreation.
// too long, break into multiple sentces
As a consequence, statements about the execcidiung critical curvuate and consequently deciding wheter the filling agent has an impact on the strucutral behaviour or not is not only made  easier but also less error-prone and thus more reliable. 


The curvatre cauclations and the critical crtuvature assment was in preiovus @chap_3_0_2 were made in three dimensions. However, evaluating the results in 1d is significantly less prone to errors and simpler to interpret. Additionally, performing additonaly investigations on 1d data is generally less complex and less ocmputaitonal demanding than wokring on 3d data. 
For these reasons, the influence of the filling medium on the maximum sustainable bending moment is motivated to be conducted on 1d curvatures.
In order to transfer 3d curvature values into one dimension, the curvature values can be averaged along the two other axis

There are two possibilities for averaging the curvatures. In the first method, the displacements, derivatives, and curvatures are calculated for the entire structure. 
Once these are available, the curvatures can be averaged along the wing span. 
To make the concept easier to understand, see Figure 40. 
The vertical and depth curvature components are added up and averaged for each individual span value. The second method calculates the displacements and averages them directly along the span. The averaged displacements are used to calculate the corresponding averaged derivatives and curvatures. In the first method, averaging occurs only after obtaining the curvatures, whereas the second method begins directly with averaged displacements.

To answer the question of whether there is a difference between the two presented approaches, equations (20) and (21) should first be considered. 

Abbildung 40: Konzept der Mittelung der Krümmungen entlang der Flügelspannweite


Equation (20) shows the case where all curvatures are first calculated and then averaged over these. In this case, only two curvature values are used for averaging for illustration. In equation (21), the derivatives are first averaged and then the mean curvature is calculated.

$ kappa_("mean",1) = (u_1 ^'' / ( (1 + u_1 ^') ^(3/2)) + u_2 ^'' / ( (1 + u_2 ^') ^(3/2)))  1/2 $ <20>

$ kappa_("mean",2) = ((u_1 ^'' + u_2 ^'')/2) / ([1 +
 (u_1 ^' + u_2 ^')/2] ^(3/2)) $ <21>

Since it is not directly apparent from this form of the equations whether there is a difference between the two variants, equations (22) and (23) should be inserted as examples. This leads to equations (24) and (25).

$ u_1 = cos(x) \
   u_2 = sin(x) $ <22>

$ u_1' = -sin(x) \
   u_2' = cos(x) \
   u_1'' = -cos(x) \
   u_2'' = -sin(x) $ <23>

$ kappa_("mean",1) = (-cos(x)/(1 - sin(x))^(3/2) + (-sin(x))/(1 + cos(x))^(3/2))(2) $ <24>

$ kappa_("mean",2) = (-cos(x) - sin(x))(2(1 + (-sin(x) + cos(x))/2)^(3/2)) $ <25>

For equation (25), the relationship in equation (26) was assumed, which can generally be assumed for differentiation:

$ (u_1'' + u_2'')/2 = (u_1 + u_2')/2 \
   (-cos(x) + (-sin(x)))/2 = (-sin(x) + cos(x))/2 \
   (f_1 + f_2)' = f_1' + f_2' \
   (f_1 dot f_2)' != f_1' dot f_2' $ <26>

Finally, an angle of $x = pi/2$ should be assumed for sine and cosine. This results in equations (27) and (28). Formula (29) shows as the final result that it makes a difference how the curvatures are averaged.

$ kappa_("mean",1)(x = pi/2) = 0 + (-1)(1 + 0)^(3/2) = -1 $ <27>

$ kappa_("mean",2)(x = pi/2) = (-1)(2(1 + (-1)/2)^(3/2)) approx (-1)(2 dot 0.353) $ <28>

$ (kappa_("mean",1) = -1) != (kappa_("mean",2) approx (-1)(2 dot 0.353)) $ <29>

Another important aspect that must be considered when calculating curvature averaging is the neighboring elements and nodes. Node overlaps in the FE mesh create new nodes on the wing and tank mesh. The distance from existing nodes to the new nodes can be very small along the span. Detailed investigation shows that this is the case. When looking at Figure 41 left, it can be seen that entries 001-008 differ minimally in their span position.
The distances to the respective subsequent entries are shown on the right in the figure. The slightly varying nodes, which are all located in one element each, would not be counted as a single span point in a conventional averaging. This would distort the averaging at these points, as erroneous abrupt curvature deviations are to be expected at these positions. The following can be imagined: if there were 10 nodes, 5 of which had a positive curvature and the other 5 a negative curvature. The first 5 values would be "coincidentally" assigned to point $y_1$ and the other 5 values to point $y_2$. If this were plotted, a jump or discontinuity would become visible in a very small distance $(Delta y approx 10^(-9))$. Therefore, nodes that have a distance according to equation (30) were combined into one node for averaging.

[Figure 41: Left: Chronologically ordered span coordinates of individual nodes. Right: Distance to neighboring entries or span coordinates of individual nodes among each other]


$ "dist"(y_1, y_2) <= 0.9 $ <30>

For averaging, all line elements (girders, engine and landing gear connections, and stiffening elements) were deliberately neglected. The curvatures are calculated exclusively for the skin and tubes (eight-node shell elements). If the line elements were included in the calculation of curvature averaging of wing and tank, the result would be incorrect. For example, the curvatures of the engine nodes do not influence the curvature behavior of the wing and tanks.

For presenting the following results, first all curvatures of the individual nodes were calculated and then averaged as described. For safe and easy evaluation of the results, all averaged curvatures for all selected pressure values were saved as an interactive animation in an HTML file. This allows the curvature curves of individual pressure values to be displayed first with a click. Areas that are classified as particularly important can be zoomed into. To avoid having to approximately read the results from the scale labels, the actual values are displayed via popup when placing the mouse cursor over the desired location. The integrated screenshot function can be used for quick sending of results.

[Figure 42: Excerpt from the results of averaged curvatures along the span for $C_L = 1.5$ and a pressure value of $p = 70.69$ MPa]

This shows the averaged curvature profile over the entire wing span. It becomes clear that local effects occur in the undisturbed regions. These were already discussed previously and will therefore not be explained again. The undisturbed region is shown in Figure 43.

[Figure 43: Detailed view of the undisturbed region of averaged curvatures for $C_L = 1.5$ and $p = 70.69$ MPa]

The scale shows a maximum curvature value of $0.02$ 1/m, which is significantly below the critical curvature of $0.4$ 1/m.

It can be noted that the maximum curvature in the undisturbed region does not exceed the critical curvature, but remains significantly below it. Additionally, the influence of the $C_L$ value and pressure was investigated. If the $C_L$ value is increased, an increase in the maximum occurring curvature can be observed, which applies to both the undisturbed and disturbed regions. This is to be expected, as a larger $C_L$ value causes greater deflection and can be verified by comparing Figure 42 with Figure 44. The increase in pressure has hardly any visible influence, which can be verified by comparing Figure 44 with Figure 45.

[Figure 44: Excerpt from the results of averaged curvatures along the span for $C_L = 1.0$ and a pressure value of $p = 70.69$ MPa]

[Figure 45: Excerpt from the results of averaged curvatures along the span for $C_L = 1.0$ and a pressure value of $p = 15$ MPa]

In summary, the investigation with averaged curvature has also shown that the influence of the filling medium should be negligibly small at expected $C_L$ values and pressures.

