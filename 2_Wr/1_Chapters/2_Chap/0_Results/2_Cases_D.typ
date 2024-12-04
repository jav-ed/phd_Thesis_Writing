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
The udnerlying beam model is the same as used for optimiaztion case B and C, given through @fig_84

// ---------------------------------- here ---------------------------------- //

explain third constraint

Furthermore, in order to 
// beam model - the same as in B/C

// results 
depicted only the resuls that were found by the optimizer while not violating any constraints.
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_50/int_Forc_8.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case D. 4 #glspl("lie") was selected.],
)

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_66/int_Forc_7.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case D. 8 #glspl("lie") was selected.],
)

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_71/int_Forc_6.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case D. 8 #glspl("lie") was selected.],
)

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_75/int_Forc_5.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case D. 8 #glspl("lie") was selected.],
)



// optimiaztion progress
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D/1_L_Comb_Obj.svg", 
  width: 100%),
  caption: [optimization case D (50%, 66%, 71%, 75%) shows objective funciton values and the required number of iterations for the differen number of #glspl("lie").],
)

// intepret convergence behaviour
// solutions are found, however,t he constraints are violoated


// results interpretation


// compare against case A, B, C

