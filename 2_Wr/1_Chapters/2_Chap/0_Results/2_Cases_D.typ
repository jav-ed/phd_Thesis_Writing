/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// --------------------------------- opti D --------------------------------- //

== Optimization Case D <chap_5_3>
// talk about overlappting collets and how this issues was resolved
// case L,M,N,O
// D 50%
// D 66%
// D 71%
// D 75%

In optimiaztion Case B (@chap_5_1) it could be observed that the #glspl("lie") were placed tighly toghether and made use of nearly the full tube-wing length. In the optimiaztion case C (@chap_5_2) a prohibtted domain was added, but the #glspl("lie") still were placed tightly next to each other.
In the optimization case D, the deifntion of the optimiaztion problem is modifed, such that a free wing-tube length can be added.
When making the demands more restrictive, the objective funciton tends to get larger.
In order to combat this effect the forces thart are applied on the #glspl("lie") are also introduces as additioanl design variables.
The deinftion of the optimiaztion problem is given in @eq_117

$
op("argmin",limits: #true)_(bold(x)_d)
J_D = &(sum_(i)^n abs(M_("true",i) - M_("optim",i)))/n_s \

// constraints
"subject to" quad
& x_("cl",i)/2 <= "ha" - x_i - Phi\
& x_("cl",i)/2 <=  x_i  - x_(s,2)\
& sum_i^n x_("cl",i) <=  ("ha" - Phi) beta \

// bounds
"bounds" quad
& 0.03 "ha" <= x_("cl",i) <= "ha"/n_"cl"\
& gamma_l dot F_(r,i) <= x_(F,i) <= gamma_u dot F_(r,i)
$<eq_117>

To understand the optimization deifntion for case D, first the design varaibles shall be clearly spelled out. The design variable vector for the optimiaztion case D, consits of the #glspl("lie") lengths $x_("cl",i)$ and the forces $x_(F,i)$ that act on the corresponding #glspl("lie"). Mathematically it can be descirbed as @eq_118.

$ bold(x)_d =  [
  x_("cl",0), x_("cl",1), x_("cl",2) ... x_("cl",n_"cl"-1), quad
  x_(F,0), x_(F,1), x_(F,2) ... x_(F,n_"cl"-1)     ]
$<eq_118>

Having been introduced to the design variables, the second cosntraint in @eq_117 shall be viewed.
This constraint was modifed with adding the term $x_(s,2)$ which stands for the posistion of the second support point.
The udnerlying beam model is the same as used for optimiaztion case B and C, given through @fig_84.
In the third constraint of @eq_117 the baribale $beta$ is a factor that decies how much of the tube-wing length can be used to place #glspl("lie") on it.
For the force design variables $x_(F,i)$ bounds have been added, where $F_(r,i)$ denote the resulting force if the force memebers inside a cluster are added as explained in @chap_4_0_0.
The lower force factor $gamma_l$ and upper force factr $gamma_u$ can be used with the resulting force to shrink the possible resulting force values.

// ---------------------------------- scipy --------------------------------- //
For practical computaiotnal implementation the matrix form of the consrtaints is given as @eq_119 to @eq_121. Note that since for this optimiazton case the number of the desing variables is increased ansd thus is not anymore the same as the number of #glspl("lie") the notation for indexies is adapted accordingly. Here $n_"cl"$ is denoted as the number of #glspl("lie") and $n$ as the number of design variables. The force design varaibles $x_(F,i)$ have no contribution for the first and second constriant. Thus their corresponding coefficients inside the the design variable coefficient matrix $bold(A)$ are all set to zero in @eq_119 and @eq_120. 

// ------------------------------ constraint 1 ------------------------------ //
$
underbrace(
mat( 0; 0; 0; dots.v; 0 ) ,
bold(l) \
"left side"
)

<= 
underbrace(
mat(
  1/2, 0, 0, 0, 0, dots.h, 0;
  0, 1/2, 0, 0, 0, dots.h, 0; 
  0, 0, 1/2, 0, 0, dots.h, 0; 
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.down, 0; 
  0, 0, 0, 0, 0, dots.h, 0; 
),
bold(A)_c \
"design variable
coefficient matrix"
)

underbrace(
mat(
  x_("cl",0);
  dots.v;
  x_("cl",n_("cl")-1);
  x_(F,0);
  dots.v;
  x_(F,n_("cl")-1);
),
bold(x)_d \
"design variables"
)

<=
underbrace(
mat(
  "ha" - x_(0) -Phi;
  "ha" - x_(1) -Phi;
  "ha" - x_(2) -Phi;
  dots.v;
  "ha" - x_(n_"cl"-1) - Phi;

),
bold(r) \
"right side"
)

$ <eq_119>

// ------------------------------ constraint 2 ------------------------------ //
$
underbrace(
mat( 0; 0; 0; dots.v; 0 ) ,
bold(l)\
"left side")

<= 
underbrace(
mat(
  1/2, 0, 0, 0, 0, dots.h, 0; 
  0, 1/2, 0, 0, 0, dots.h, 0; 
  0, 0, 1/2, 0, 0, dots.h, 0; 
  dots.v, dots.v, dots.v, dots.v, dots.v, dots.down, 0; 
  0, 0, 0, 0, 0, dots.h, 0; 
),
bold(A)_c \
"design variable
coefficient matrix"
)

underbrace(
mat(
  x_("cl",0);
  dots.v;
  x_("cl",n_("cl")-1);
  x_(F,0);
  dots.v;
  x_(F,n_("cl")-1);
),
bold(x)_d \
"design variables"
)

<=
underbrace(
mat(
  x_(0) -x_(s,2);
  x_(1) -x_(s,2);
  x_(2) -x_(s,2);
  dots.v;
  x_(n-1) -x_(s,2);

),
bold(r)\
"right side"
)

$ <eq_120>
// ------------------------------ constraint 3 ------------------------------ //
$
underbrace(
 0 ,
bold(l)\
"left side")

<= 
underbrace(
mat(
  1, 1,1, dots.h, 1 
),
bold(A)_c \
"design variable
coefficient matrix"
)

underbrace(
mat(
  x_("cl",0);
  dots.v;
  x_("cl",n_("cl")-1);
  x_(F,0);
  dots.v;
  x_(F,n_("cl")-1);
),
bold(x)_d \
"design variables"
)

<=
underbrace(
("ha" - Phi) beta,
bold(r)\
"right side"
)

$ <eq_121>



// -------------------------------------------------------------------------- //
In the following results with different $beta$ values are be shown. Note, while $beta$ as given in @eq_117 defines the maximal length of the tube-wing length that can be used for placing #glspl("lie"), the inverse can be calculated.
the 
// is it really the inverse? 1-0.33 = 0.667 = 66.7%
inverse gives the amount of free lenbgth that must be free of #glspl("lie").
The following $beta$ values are considered: $beta = [0.5, space 0.33, space 0.285, space 0.25]$, which constitutes to a free length of $[50%, space ~66.7%, space 71.5%, space 75%]$.
The results are depicted in @fig_91 to @fig_94.
The number of selected #glspl("lie") of these results are based on the otuput presented in @fig_95.
@fig_95 depicts the objective function of the four different visibility demands.
It can be observed that depedning on the chosen $beta$ value and the number of #glspl("lie") not all objective functions were plotted. 
The reason for that is that only objective functions that were obtained while fulfilling the cosntraints were considered as feasible solutions and shown in the first row of @fig_95.
// this need to be become clear
Note, not having plotted the solutions of the other cases does nto mean no solution was obtained. it only means that solutions voiolated given constraints.
Based on informaiton given in the first row of @fig_95, the the lowest objective function a visibility demand of 50% could be achieved with 8 #glspl("lie"). 
The best #gls("ld", long:true) with a visibility demand of  66.7% could be achieved with seven #glspl("lie") while fulfilling the constraints.
Accordingly, for a visibility demand of 71% and 75% the best #gls("lie") could be ahcieved with six and five #glspl("lie"), while fulfilling the constraints, respecitvely.
Based on this fidning the number of #glspl("lie") for @fig_91 to @fig_94, were selected.
Furthermore, inspecting all objective funciton values over the number of #glspl("lie"), given in the first row of @fig_95, it can be observed that the higher the number of #glspl("lie"), the better the #gls("ld") becomes.
Furthermore, considering the second row of @fig_95, it can be observed that the higher the number of #glspl("lie") had become the complexer the optimiaztion task had become.
This is suggested by the high number of iterations. For four #glspl("lie") solutions fulfilling the constraints for all four visibility demands are found. However, as increasing the number of #glspl("lie") the number of iterations increases up to the maximal allowed iteration number of 3000.
This effect goes so far that for eight #glspl("lie") required nearly 8 times as much iterations as for finding a solution when comapred with four #glspl("lie") with a visibility demand of 50%.
For the other three visibility demands for eight #glspl("lie"), even after running 3000 iterations no solutions could be found that would not violate the constraint.

Finally, all the figures shwoing infromaiton aboout objective function values across different number of #glspl("lie") can be used to decide on the final number of #glspl("lie"). Generally, it can be assumed the lower the number of #glspl("lie") the lwoer the cost for obtianing these physical #glspl("lie"). Likewose the cost of maintaining and 
// maybe control engineering or somehting else?
control theory is reduced. If a higher number of #glspl("lie") does not give better #gls("ld") there is no need to buy more #glspl("lie"). However, if costs is a concern, trade offs can be made througha nsweing the question, wheter adding additional #glspl("lie") would significantly improve the #gls("ld") quality.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_50/int_Forc_8.svg",
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case D with a free length of 50%. 8 #glspl("lie") was selected.],
)<fig_91>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_66/int_Forc_7.svg",
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case D with a free length of 66.7%. 7 #glspl("lie") was selected.],
)<fig_92>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_71/int_Forc_6.svg",
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case D with a free length of 71% . 6 #glspl("lie") was selected.],
)<fig_93>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_75/int_Forc_5.svg",
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case D witha free length of 75%. 5 #glspl("lie") was selected.],
)<fig_94>



// optimiaztion progress
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D/1_L_Comb_Obj.svg",
  width: 100%),
  caption: [optimization case D (50%, 66.7%, 71%, 75%) shows objective funciton values and the required number of iterations for the differen number of #glspl("lie").],
)<fig_95>


// --------------------------------- summary -------------------------------- //
#summary_([

// summary required not only for case D, but for all shown optimiaztion cases.
// Also,  epxlain that collet was chosen, because IMA has much experince with it

// TODO add hardware infromation here
// add the infromaiton that all carried out optimiaztions were carried out on a regular working pc, hardware information are 16GB RAM

// this information is of importance since it allows to back the general statement, that the presente dmethods can be used on a regular non hpc pc or even laptop.
// regarding the time for the otpimiaztons carried out, depending on the required number of iteratiosns or depdning on the optimiaztion case obtaineing the solution of all variations between four and eight #glspl("lie") took some hours to less than a day.

// with the presnted optimiaztion important questions, including 
// 1. How many #glspl("lie") should be used?
// 2. At which locations should the #glspl("lie") be attached?
// 3. What dimensions should the #glspl("lie") have?
// 4. What load magnitudes must the #glspl("lie") have?
// 5. What minimum and maximum spacing between #glspl("lie") should be maintained?

// can be answered. These answers not only help in deciding on the final #gls("lie") type, but also explains how the #gls("ld") cannot be carried out in a perfomant way

// TODO there is one more file, add the infos from there here in

])