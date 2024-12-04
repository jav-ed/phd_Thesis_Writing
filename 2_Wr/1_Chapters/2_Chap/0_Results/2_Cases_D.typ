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
In the third constraint of @eq_117 the baribale $Beta$ is a factor that decies how much of the tube-wing length can be used to place #glspl("lie") on it.
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
the inverse gives the amount of free lenbgth that must be free of #glspl("lie").
// ---------------------------------- here ---------------------------------- //

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

