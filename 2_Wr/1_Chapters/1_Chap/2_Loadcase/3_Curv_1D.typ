/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

=== Assessment of Impact Filling Agent in 2D<chap_3_0_3>
This subsection stems from the need to reduce the likelhood of making mistakes during the interperation of the curvature results.
In @chap_3_0_1 it was introduced how the curvature could be used in orde to answer the question wheter the filling agent has an impact on the structral behaviour.
THis is of vital improtance, when attempting to replace hydrogen in an experimtnal structral validation test with another filling agent.
The lack of current technical state of the art for deailing safe with hydrogen for long tubes and high pressures is explained in  @chap_2_0_1 and @chap_2_0_2.
In @chap_3_0_2, it was explained how the curvature could be calculated when displaxment data and correspoinding coorindate ifnromation were available.
While, the 3d curvature results are valid, interpreting curvature values for complex 3d geomtries like the #gls("swith", long:true) has, is a demanding and error prone task.
Therefore in this section two concepts will be introduced, how the 3d curvature data can be transfered to 1d curvature results or to a 2d span curvature representation.
This is supposed to allow the signitficatnly ease the curature interpreation.
// too long, break into multiple sentces
As a consequence, statements about the execcidiung critical curvuate and consequently deciding wheter the filling agent has an impact on the strucutral behaviour or not is not only made  easier but also less error-prone and thus more reliable. 


The curvatre cauclations and the critical crtuvature assment was in preiovus @chap_3_0_2 were made in three dimensions. However, evaluating the results in 2d is significantly less prone to errors and simpler to interpret. Additionally, performing additonaly investigations on 2d data is generally less complex and less ocmputaitonal demanding than wokring on higher dimensional data. 
For these reasons, the influence of the filling medium on the maximum sustainable bending moment is motivated to be conducted in 2d.
In order to transfer 3d curvature values into one dimension, the curvature values can be averaged along the two other axis
Three methods could be identified as possible approaches for averaging the curvatures.
However, before going to the deails about these methods, some fundamentals shall be convered to ensure readers can follow.

When viewing results of a 3d #gls("fem") model of #gls("swith"), the displacment, the first order, second order and the resulting curvature are all three-dimensional as well.
For each of the mentioned output, the components in the three axis are available and the magnitude as a scalar can be obtained for instance through the Euclidean norm shown in @eq_33.
Moreover, the output of these discrete quantities is linked to corresponding nodes of the #gls("fem") mesh. 
Thus, in order to represent one single entry for these variables a 6d vector is required.
This, vector contains the three coorindate directions for the node and the three compoents of the considered variable.
Due to the fact that the #gls("fem") mesh consists of a high number of nodes matrices of the shape $bold(A)^(n times 6)$ are required, where $bold(A)$ is a placeholder for an matrix and n represents the total number of nodes.
Following that, there in 3d each of the variable, that is, displacement, first and second order derivative and curvature, can be throught of a own matrix, $bold(U), bold(U'), bold(U''), bold(kappa)$, respectively.

Having mentioned some basics about the dimensions about the curvuate related variables, the frist averaging method shall be looked upon.
In the first method, the displacements and required derivatives are calculated to get the curvature for the entire structure in 3d.
Once all curvature values are available, the curvature values for a constant spanwise position $y_i$ can be averaged across the two remaining axes: the chordwise (x) and vertical (z) directions.
More precisely, for each constant spanwise position $y_i$, the corresponding nodal distribution is defined by their $(x,z)$ coordinates in the plane perpendicular to the spanwise direction. 
This collection of nodes at constant $y_i$ forms a planar slice through the structural geometry.
Moreover, since the computations are conducted numerically, small deviations from the exact $y_i$ position are permitted when identifying nodes belonging to the same planar slice.
The concept of averaging along the remaining axis chordwise (x) and vertical (z) directions for one given $y_i$ value is depcicted in @fig_45.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/0_Spanwise.svg", 
  width: 87%),
  caption: [Curvature averaging scheme along the orthogonal axes (x,z) to the span direction.],
) <fig_45>

The arrows in @fig_45 are hinting in the direction of the axes that are averaged along.
This process of the first method can be formualted mathemtically for each $y_i$ as @eq_53.
The variables are denoted as, displacement $u$, first order derivate $u'$, second order derivative $u''$, curvatre $kappa$, total number of nodes $n_("y,const")$ for one span section at a numiercally constant $y_i$ and $j$ for the axis compoent.

// -------------------------------- method 1 -------------------------------- //
$ overline(kappa_(1, y_i,j)) &= 1/n_("y,const") sum_i ^(n_("y,const")) u_("i,j") ^'' / ( (1 + u_("i,j")^(2')) ^(3/2))  \
&=  1/n_("y,const") sum_i ^(n_("y,const")) kappa_("i,j") $ <eq_53>


For a selected span section $y_i$ and a axis $j$ the output of @eq_53 is a scalar valued averaged compoent of the curvature $overline(kappa_(1, y_i,j))$.
However, since the output of three axis is required, the combined output becomes a 3d curvature vector.
In order to get one single scalar averaged mean value for the curvate the Euclidean norm can be used following @eq_33.

// ------------------------------ second method ----------------------------- //
The second method calculates takes the displacements as input and averages them across the chordwise (x) and vertical (z) axes for one numerical constant span section $y_i$.
In this method the missing required gradients $u'$ and $u''$ are caluclated as well as the resulting mean curvature $overline(kappa_2)$ based on the averaged displacements $overline(u)$.
Therefore the gradients are referred to as mean gradients $overline(u_(y_i,j))^(')$, $overline(u_(y_i,j))$ for a slected a span section $y_i$ and a dimension axis $j$.
The mathematical description of the second averaging apporach is given in @eq_54.

$ 
overline(u_(y_i,j)) &= 1/n_("y,const") sum_i ^(n_("y,const")) u_("i,j") \
overline(u_(y_i,j))^(') &=  (overline(u_(y_i,j)))'  \
overline(u_(y_i,j))^('') &=  (overline(u_(y_i,j))')' \
overline(kappa_(2, y_i,j)) &= (overline(u_(y_i,j))^('') ) / (1+ 
overline(u_(y_i,j))^(2')
)^(3/2)

 $ <eq_54>

Simmilar to @eq_53 the combined output of the three spatial dimensions result into a 3d curvature vector.
Again a norm can be used to obtain one single scalar averaged mean value for the curvate.
// ------------------------------ third method ------------------------------ //
In the third method all the curvature related varaibles are calculated as in the first method. However, the averaging does not occur after the curvarure values are caluclated, but for each required variable sepeately.
In the third method the first order displacement $u'$ is averaged acroos the $x$ and $z$ axis and is inserted as the input for the mean curvature calcualtion.
The same also happens for the second order gradient $u''$.
They differ from method 2 in that, the gradients $u'$ and $u''$ were obtained based on the averaged dispalxments $u$.
The the gradients $u'$ and $u''$ are not based on the mean of the displacment, but are obtained like in method 1.
The mathematical descirption for method 3 is provided as @eq_55

$
overline(u_(y_i,j))' &= 1/n_("y,const") sum_i ^(n_("y,const")) u_("i,j")^' \
overline(u_(y_i,j))'' &= 1/n_("y,const") sum_i ^(n_("y,const")) u_("i,j")^('') \
overline(kappa_(3, y_i,j)) &= (overline(u_(y_i,j))^('') ) / (1+ 
overline(u_(y_i,j))^(2')
)^(3/2)
$<eq_55>

// ---------------------------- shape information --------------------------- //
When averaging the curvature with the three apporahces presented in @eq_53 to @eq_55, the goal is to get the 3d curvature representation to a 1d curvature representation.
More precisely it can be said that the curvature matrix is tranformed from a dimension of $bold(kappa)^(n times 6)$ to a dimension of $bold(kappa)^(n_y times 4)$ or $bold(kappa)^(n_y times 2)$.
The variable $n_y$ is denoted as the total number of discretization points along the span direction or y axis.
The original dimension of $bold(kappa)^(n times 6)$ has its first three filled with the local cooridnate infromation, that is, coordinate information for each spatial axis ($x,y,z$).
The remaining three columns provice infromation about the curvature compoents in the correpsonding directions.
The shape $bold(kappa)^(n_y times 4)$ is obtained when the curavture compoents for a numericla constant span section $y_i$ are averaged across the chrod (x) and vertical axis (z). 
Thus the first column only has the position along the span and the three remaining columns provide the curvature compoents in the three spatial directions.
If the three curvature compoents are used to calculate the magnitude, the result is a scalar valued curvature magnitude. With this $bold(kappa)^(n_y times 2)$ is obtained.
In this version the first column gives infromaiton about the span wise direction $y_i$ and the second column the corresponding scalar valued mean curvature.
The shape $bold(kappa)^(n_y times 2)$ is the desired final outcome since, it the inrepreation through a simple 2d plot and further greants the adanvatges mentioned at the beginning of this subsection.

// ----------------------------- examples calcs ----------------------------- //
While three seeimlgy distanict approaches for averaging the curvatures, through making using of simple analytical analysis it can be observed that there are only two distanict different methods.
In order to conduct this analytical analysis, trigonemtrical terms are inserted in @eq_53 to @eq_55.
For sake of understandbaility, this is demonstraed for one single spanwise section $y_i$, with one dimension and for the sum in mean curvature equations two term shall be used.
The terms are given in @eq_56. Their first derivatives are given in @eq_57 and the second order derivatives in @eq_58

$ u_1 &= cos(x) \
u_2 &= sin(x) $ <eq_56>

$ u_1^' &= -sin(x) \
u_2^' &= cos(x) $ <eq_57>

$ u_1^('') &= -cos(x) \
u_2^('') &= -sin(x) $ <eq_58>

// ----------------------------- example meth 1 ----------------------------- //
Inserting @eq_56 to @eq_58 into the method 1 according to @eq_53, the result can be desribed as @eq_59 and @eq_60

$ overline(kappa_(1)) &= 1/2  [ 
   u_1^('') /(1 + u_1^(2'))^(3/2) +
   u_2^('') /(1 + u_2^(2'))^(3/2)
  ]  $ <eq_59>


$ overline(kappa_(1)) &= 1/2  [ 
   -cos(x) /(1 + (-sin(x))^2)^(3/2) 
   -sin(x) /(1 + cos(x)^2)^(3/2)
  ]  $ <eq_60>


// ----------------------------- exmaple meth 2 ----------------------------- //
The analoug for method 2 according to @eq_54 is provided in @eq_61 to  @eq_63.


$ 
overline(u) &= (cos(x) + sin(x)) / 2  \
overline(u)' &= ( -sin(x) + cos(x)) / 2 \
overline(u)'' &= (-cos(x) - sin(x)) / 2 
   $ <eq_61>

$ overline(kappa_2) = overline(u)'' / (1 + overline(u)^(2'))^(3/2) $ <eq_62>

$ overline(kappa_2) = ((-cos(x) - sin(x)) / 2)  / [1 + ( (-sin(x) + cos(x)) / 2)^(2)]^(3/2)
   $ <eq_63>

// ----------------------------- exmaple meth 3 ----------------------------- //
The analoug for method 2 according to @eq_55 is provided in @eq_64 to  @eq_66.

$ 
overline(u)' &= ( -sin(x) + cos(x)) / 2 \
overline(u)'' &= (-cos(x) - sin(x)) / 2 
   $ <eq_64>


$ overline(kappa_3) = overline(u)'' / (1 + overline(u)^(2'))^(3/2) $ <eq_65>
$ overline(kappa_3) = ((-cos(x) - sin(x)) / 2)  / [1 + ( (-sin(x) + cos(x)) / 2)^(2)]^(3/2)
   $ <eq_66>

// ------------------------------ inert 90 deg ------------------------------ //
In order to see which methods end in giving the same results and which differ among each other, the input arugemnt or the angle will be chosen to be 90 degree or $pi/2$.
Note that $sin(x = 90 degree = pi/2) = 1$ and $cos(x = 90 degree = pi/2) = 0$.
Inserting the defined varaibles in @eq_60, the results for the frist method are given in @eq_67.

// ---------------------------------- kap_1 --------------------------------- //
$ overline(kappa_(1)) &= 1/2  [ 
   cancel(-cos(x=pi/2) /(1 + (-sin(x=pi/2))^2)^(3/2) ) 
   -sin(x = pi/2) /(1 + cancel( cos(x=pi/2)^2) )^(3/2)
  ]  \ 

  &= 1/2 [ 0 -  1/ (1 + 0)^(3/2)] = -1/2
  
  $<eq_67>

Inserting the defined varaibles in @eq_63, the results for the second method are given in @eq_68.

// ---------------------------------- kap 2 --------------------------------- //
$ overline(kappa_2) &= (( cancel(-cos(x= pi/2)) - sin(x= pi/2)) / 2)  / [1 + ( (-sin(x= pi/2) + cancel(cos(x= pi/2))) / 2)^(2)]^(3/2) \

&= (-1/2) / [1 + (-1/2)^2] ^(3/2) = (-1/2) / [1 + 1/4] ^(3/2) = (-1) / (2 (5/4) ^(3/2))
   $ <eq_68>

Inserting the defined varaibles in @eq_66, the results for the third method are given in @eq_69.

// ---------------------------------- kap 3 --------------------------------- //
$ overline(kappa_3) &= ((cancel(-cos(x= pi/2)) - sin(x= pi/2)) / 2)  / [1 + ( (-sin(x= pi/2) + cancel(cos(x= pi/2))) / 2)^(2)]^(3/2) \

&= -1/2 / [1 + (-1/2)^2] ^(3/2) = -1/2 / [1+ 1/4]^(3/2) = -1/ (2 (5/4)^(3/2))
   $ <eq_69>

Thus it can be oberved that the output of method 1 is $overline(kappa_(1)) = -1/2$ which is neither equal to the output of method 2 $overline(kappa_2) = (-1) / (2 (5/4) ^(3/2)) $  nor to the method 3 $overline(kappa_3) = -1/ (2 (5/4)^(3/2))$ ($overline(kappa_(1)) != overline(kappa_(2)) "and" overline(kappa_(1)) != overline(kappa_(3))$).
However, it can be observed that the curvatre following the method 2 and 3 are the same $overline(kappa_2) = overline(kappa_3) =  (-1) / (2 (5/4) ^(3/2))$.
Thus, while having arugemnted for three approaches how the curature can be obtained as a $bold(kappa)^(n_y times 2)$ matrix, effectilvey only two are actually avaialble.

// --------------------------------- results -------------------------------- //
Having covered the theoretical fundamentals some results shall be displaxed.
Note that the results shown for method 2 are the equaivalent for method 3.
The results for method 1 are depcited in @fig_46 to @fig_49.
@fig_46 the magntiude of the curvated that are averaged aclong the chord (x) and the vertical (z) axis along the normalized span posistion.
The averaged curvatures are shown for six different lift coeeficents, $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5 ]$ and with a constant pressure of $51.03 "MPa"$. 
It can be observed that generally with increasing the lift coefficient the curvature is increased as well.
Consequently, the highest curvature values are obtained with a lift coeeficents value of $C_L = 2.5$.
The critical curvature $kappa_"crit"$ is drawn as a horizontal red line.
If this line is exeeded, the impact of the filling agent can not be neglected.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/1_510bar_Ca_Var_Method_1.svg", 
  width: 100%),
  caption: [magnitude of the averaged curvature for the normalized span position using method 1 accroding to @eq_53 for six lift coefficients $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5 ]$ and a constant pressure of  $51.03 "MPa"$.],
) <fig_46>

Considering the arugemnts provided in this text, a undistributed area can be found. @fig_47 displays the averaged curvature for the normalized span position for one portion of the undistributed area. The other parameters remain the same as for @fig_46.
It can be osberved that even the highest lift coeeficents value $C_L = 2.5$ does not show any curvate that is close the the critical curvature.
While the critical curvater was set to $kappa_"crit" = 0.4$, the found curvatures are much smaller than $0.4 space upright("m")^(-1)$.
Not only that they do not come close to $0.4 space upright("m")^(-1)$, but the curvature values are signitifcantly smaller than $0.1 space upright("m")^(-1)$.
Thus in order to see proper identify the impact of the the lift coefficient values, a scale needs be shown, where the critical cruvature far away from or not visible anymore.
The main result from @fig_47 is that for a pressure of $51.03 "MPa"$ and lift coefficents up to $C_L = 2.5$ the impact of the filling agent on the maximal bearable bedning moment for a experimental structral validation test can be neglected. Thus, the replacement of hydrhogen through water would be allowed for it.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/2_510bar_Ca_Var_Undisturbed_Method_1.svg", 
  width: 100%),
  caption: [magnitude of the averaged curvature for the normalized span position for one portion of the undistributed area using method 1 accroding to @eq_53 for six lift coefficients $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5 ]$ and a constant pressure of  $51.03 "MPa"$.],
) <fig_47>

The results displayed @fig_46 and @fig_47 were investigating the impact of the lift coeeficent $C_L$ for a constant selected pressure of $51.03 "MPa"$.
Following method 1, the impact of pressure for a constant lit coeffiecent value of $C_L approx 0.6$ is given in  @fig_48 and @fig_49.
@fig_48 iluustrates that the selected pressure has an impact on the resulting curvature.
However, from a very high varrying range of $15 "MPa"$ to $110 "MPa"$ the impact is very small.
// ---------------------------- method 1 pressure --------------------------- //
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/3_Ca_0.6_Pr_Variabel_Method_1.svg", 
  width: 100%),
  caption: [magnitude of the averaged curvature for the normalized span position using method 1 accroding to @eq_53 for different pressure values ranging from $15 "MPa"$ to $110 "MPa"$ and a constant lift coefficent of  $C_L approx 0.6$.],
) <fig_48>

Simmilar to @fig_47, @fig_49 depcits a focused view on the undisturbed area. Simmilar to the case of @fig_47 it can be seen that the obtained curvature are far under the critical curvature.
The distance is soo high that in order to proerly investigate the impact on the pressure, the newly selected figure portraying scale would not display the critical curvatre anymore.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/4_Ca_0.6_Pr_Variabel_Undisturbed_Method_1.svg", 
  width: 100%),
  caption: [magnitude of the averaged curvature for the normalized span position for one portion of the undistributed area using method 1 accroding to @eq_53 for different pressure values ranging from $15 "MPa"$ to $110 "MPa"$ and a constant lift coefficent of  $C_L approx 0.6$.],
) <fig_49>

// ========================================================================== //
// ================================ method 2 ================================ //
// ========================================================================== //

The results using method 1, are clear in that they would allow the replacement of hydrogen through for exampel with water without modiying the maximal bearbale bending moment.
In order to compare it with the output of method 2 that follows @eq_54, @fig_50 to @fig_55 shall be viewed. 
@fig_50 shows the magnitude of the averaged displaxment $overline(u)$ for the normalized span position for six lift coefficients $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5 ]$ and a constant pressure of  $51.03 "MPa"$.
The imapact of the lift coefficent is clearly visible.
The higher the lift coefficent the higher the observed displaxment.
Consequently the highest displaxment is found with $C_L = 2.5$ and at the tip of the wing.
The latter is expected since there is no support at the the tip of the wing.
Thus, the maximal stress is to be expected at the support posistion and the highest deflection at the tip of the wing, where the lever arm has its peak.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/5_510bar_Ca_Var_Method_2_Disp.svg", 
  width: 100%),
  caption: [magnitude of the averaged displaxment $overline(u)$ for the normalized span position using method 2 accroding to @eq_54 for six lift coefficients $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5 ]$ and a constant pressure of  $51.03 "MPa"$.],
) <fig_50>

The magnitude of the averaged curvature for the normalized span position using method 2 accroding to @eq_54 for six lift coefficients $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5 ]$ and a constant pressure of  $51.03 "MPa"$ is displayed in @fig_51.
The inrepreations that were provided for method 1 for @fig_46 can be used to describe the output for method 2 in @fig_51.
The influence of the lift coefficeint is clealry visible, yet, it is rather small.
Taking into consideration that local distrbutatiosn need to be filtered out for the final assment the undistributed area is shown depicted in @fig_52.
This allows to asses wheter the filling agent has an impact of the structral behaviour or not.
The found behavior is simmilar to the one presented in @fig_47 based on method 1.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/6_510bar_Ca_Var_Method_2_Curv.svg", 
  width: 100%),
  caption: [magnitude of the averaged curvature for the normalized span position using method 2 accroding to @eq_54 for six lift coefficients $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5 ]$ and a constant pressure of  $51.03 "MPa"$.],
) <fig_51>


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/7_510bar_Ca_Var_Method_2_Curv_Undis.svg", 
  width: 100%),
  caption: [magnitude of the averaged curvature for the normalized span position for one portion of the undistributed area using method 2 accroding to @eq_54 for six lift coefficients $C_L = [0.5, 0.6, 1.0, 1.5, 2.0, 2.5 ]$ and a constant pressure of  $51.03 "MPa"$.],
) <fig_52>


The impact of the pressure on the agnitude of the averaged displacment $overline(u)$ is given in @fig_53. It depcits the magnitude of the averaged displacment $overline(u)$ for the normalized span position using method 2 accroding to @eq_54 for different pressure values ranging from $15 "MPa"$ to $110 "MPa"$ and a constant lift coefficent of  $C_L approx 0.6$.
The impact on the pressure is not linear. Depending on the local span position, a higher pressure can result in a higer defelction or in a lower.
For example the pressure of $110 "MPa"$ exhibits higher displacments from wing root to more than %80 of the upcoming span length. Close to the span tip, the effect is revered and higher pressure values result in lower dispalcments than lower pressure value. 

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/8_Ca_0.6_Pr_Variabel_Method_2_Disp.svg", 
  width: 100%),
  caption: [magnitude of the averaged displacment $overline(u)$ for the normalized span position using method 2 accroding to @eq_54 for different pressure values ranging from $15 "MPa"$ to $110 "MPa"$ and a constant lift coefficent of  $C_L approx 0.6$.],
) <fig_53>

The impact on the magnitude of the averaged curvature is depicted in @fig_54. It shows the magnitude of the averaged curvature for the normalized span position using method 2 accroding to @eq_54 for different pressure values ranging from $15 "MPa"$ to $110 "MPa"$ and a constant lift coefficent of  $C_L approx 0.6$.
Simmilar to the case with method 1 depicted in @fig_48, the impact of the pressure is there, but is very small.
The undistributed version of the same configuration is presented in @fig_55.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/9_Ca_0.6_Pr_Variabel_Method_2_Curv.svg", 
  width: 100%),
  caption: [magnitude of the averaged curvature for the normalized span position using method 2 accroding to @eq_54 for different pressure values ranging from $15 "MPa"$ to $110 "MPa"$ and a constant lift coefficent of  $C_L approx 0.6$.],
) <fig_54>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/3_Curv_1D/10_Ca_0.6_Pr_Variabel_Method_2_Curv_undist.svg", 
  width: 100%),
  caption: [magnitude of the averaged curvature for the normalized span position for one portion of the undistributed area using method 2 accroding to @eq_54 for different pressure values ranging from $15 "MPa"$ to $110 "MPa"$ and a constant lift coefficent of  $C_L approx 0.6$.],
) <fig_55>


The presented results with methodf 1 according to @eq_53 and method 2 according to @eq_54 across different lift coefficeint $C_L$ and pressure values show much simmiarites.
THe most important infromation that they have in common is that, when the undistributed region is viewed, the obtained curvatures are much smaller than the critical curvature.
Thus, if an experimental investigation were to be conducted with a physical model based on the simulation model the following could be noted.
For the experiemntal structral validation test, the hydorgen could be replaced through another filling agent, without chaning the maxmimal bending moment.
Because the critical curvatre in the undistributed region was far from being reached the differences between the two methods to not need deeper investigation.
However, in the event of curvatre coming close to the critical curvature, the differences between the two presented methods needs to be investigated in order to obtain a deeper understaning between their differences and application fields.



// --------------------------------- summary -------------------------------- //
#summary_([

In summary it can be said that fundeamnetla infromation were provided about the shapes of the curvature and its related variables matrices.
This was required to comprehendin seemly 3d data as actual 6d data.
Having mentioned that the tree methods for transfering the $bold(A)^(n times 6)$ matrices to $bold(A)^(n times 2)$ were introduced.
Through providing not descirptions through, words, mathematical formuala but also concrete examples the actual application of these approaches was demonsted.
Furthermore it was explained why only two effectively different methods were found, while having initally mentioned three. 
Having provided the background for these three methods, results for the obtained curvature was dispaled.
The latter for six different lift coeffcient values pressure values from a range between $15 "MPa"$ to $110 "MPa"$.
With it the impact of the lift coeeficent as well as of the internal pressure were elaborated.
Finally, the results were used to make deicsions on wheter for an experimental structral validation test hydrogen could be replaced through another filling agent, without having a stiffer or  more compliant material behaviour.

])