/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Title was tested and is inshallah fine 
=== Optimization Case D <chap_5_3>
// talk about overlappting collets and how this issues was resolved
// case L,M,N,O
// D 50%
// D 66%
// D 71%
// D 75%

In optimization Case B (@chap_5_1), the #glspl("lie") were positioned in close proximity to one another, utilizing nearly the entire tube-wing length. The subsequent optimization Case C (@chap_5_2) introduced a prohibited domain. However, since this constraint did not address the spacing between #glspl("lie"), they maintained their tight spatial arrangement.
For optimization Case D, the problem definition has been modified to incorporate a designated free wing-tube length. As the constraints become more restrictive, the objective function typically exhibits higher values. To mitigate this effect, the forces applied to the #glspl("lie") have been incorporated as additional design variables. The complete mathematical formulation of this optimization problem is presented in @eq_117.

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

To understand the optimization definition for Case D, the design variables require clear specification. The design variable vector for optimization Case D consists of the #glspl("lie") lengths $x_("cl",i)$ and the forces $x_(F,i)$ that act on the corresponding #glspl("lie"). The mathematical representation is given in @eq_118.

$ bold(x)_d =  [
  x_("cl",0), x_("cl",1), x_("cl",2) ... x_("cl",n_"cl"-1), quad
  x_(F,0), x_(F,1), x_(F,2) ... x_(F,n_"cl"-1)     ]
$<eq_118>

With the design variables established, attention can be directed to the second constraint in @eq_117. This constraint has been modified by incorporating the term $x_(s,2)$. 
By adding the term $x_(s,2)$, which represents the position of the second support point, it is ensured that #glspl("lie") cannot be placed in the region left of the second support position. 
The underlying beam model remains consistent with that used in optimization Cases B and C, as illustrated in @fig_84. In the third constraint of @eq_117, the variable $beta$ serves as a factor that determines what proportion of the tube-wing length may be utilized for #glspl("lie") placement.
Regarding the force design variables $x_(F,i)$, bounds have been implemented where $F_(r,i)$ represents the resultant force when force members within a cluster are summed, as detailed in @chap_4_0_0. 
The lower force factor $gamma_l$ and upper force factor $gamma_u$ can be applied to the resultant force to constrain its possible values.

// ---------------------------------- scipy --------------------------------- //
For practical computational implementation, the matrix form of the constraints is presented in @eq_119 to @eq_121. Since this optimization case involves an increased number of design variables that no longer corresponds directly to the number of #glspl("lie"), the indexing notation has been adapted accordingly. The variable $n_"cl"$ denotes the number of #glspl("lie"), while $n$ represents the total number of design variables. The force design variables $x_(F,i)$ do not contribute to the first and second constraints, therefore their corresponding coefficients in the design variable coefficient matrix $bold(A)$ are set to zero in @eq_119 and @eq_120.

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
Different $beta$ values were analyzed in the subsequent results. The parameter $beta$, as defined in @eq_117, determines the maximum proportion of tube-wing length available for placing #glspl("lie"). 
Its complement (1 - $beta$) represents the proportion of length that must remain free of #glspl("lie"), referred to as the visibility demand in subsequent analyses. 
The investigated $beta$ values were $beta = [0.5, space 0.33, space 0.285, space 0.25]$, corresponding to visibility demands (free lengths) of $[50%, space ~66.7%, space 71.5%, space 75%]$. These outcomes are illustrated in @fig_91 to @fig_94.
The number of #glspl("lie") selected for these results is based on the analysis presented in @fig_95, which depicts the objective function for four different visibility demands. 
Not all objective functions appear in the plots, as only solutions satisfying all constraints were considered feasible and displayed in the first row of @fig_95. It is important to note that the absence of plotted solutions does not indicate a lack of solutions altogether, but rather suggests that these solutions violated one or more constraints.

Analysis of the first row in @fig_95 reveals that the lowest objective function value for a 50% visibility demand was achieved with eight #glspl("lie"). 
For a 66.7% visibility demand, the optimal #gls("ld", long:true) was achieved with seven #glspl("lie"), while maintaining constraint compliance. Similarly, for visibility demands of 71% and 75%, the best results were obtained with six and five #glspl("lie"), respectively. These findings informed the selection of #glspl("lie") numbers for @fig_91 to @fig_94.
Further examination of the objective function values in @fig_95 reveals that increasing the number of #glspl("lie") generally improves the quality of #gls("ld"). However, the second row of @fig_95 demonstrates that higher numbers of #glspl("lie") significantly increase the optimization complexity.
This complexity manifests in the number of iterations required. Solutions for four #glspl("lie") were found for all visibility demands. However, increasing the number of #glspl("lie") led to iteration counts approaching the maximum limit of 3000.

The computational demand becomes particularly evident when comparing the number of iterations required for eight #glspl("lie") and four #glspl("lie") at a 50% visibility demand. The case with eight #glspl("lie") required approximately eight times more iterations to find a solution. Moreover, for the other three visibility demands with eight #glspl("lie"), no constraint-satisfying solutions were found even after 3000 iterations.

// ---------------------------------- here ---------------------------------- //
// -------------------------------------------------------------------------- //
Finally, all the figures shwoing infromaiton aboout objective function values across different number of #glspl("lie") can be used to decide on the final number of #glspl("lie"). Generally, it can be assumed the lower the number of #glspl("lie") the lwoer the cost for obtianing these physical #glspl("lie"). Likewose the cost of maintaining and 
// maybe control engineering or somehting else?
control theory is reduced. If a higher number of #glspl("lie") does not give better #gls("ld") there is no need to buy more #glspl("lie"). However, if costs is a concern, trade offs can be made througha nsweing the question, wheter adding additional #glspl("lie") would significantly improve the #gls("ld") quality.

// adapt the figure caption?
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_50/int_Forc_8.svg",
  width: 95%),
  caption: [Comparison of reference and optimized load distributions showing distributed loads, shear forces, bending moments, and #gls("lie") positions for optimization Case D with eight #glspl("lie") and a visibility demand of 50%.],
)<fig_91>


#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_66/int_Forc_7.svg",
  width: 95%),
  caption: [Comparison of reference and optimized load distributions showing distributed loads, shear forces, bending moments, and #gls("lie") positions for optimization Case D with seven #glspl("lie") and a visibility demand of 66.7%.],
)<fig_92>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_71/int_Forc_6.svg",
  width: 95%),
  caption: [Comparison of reference and optimized load distributions showing distributed loads, shear forces, bending moments, and #gls("lie") positions for optimization Case D with six #glspl("lie") and a visibility demand of 71%.],
)<fig_93>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_75/int_Forc_5.svg",
  width: 95%),
  caption: [Comparison of reference and optimized load distributions showing distributed loads, shear forces, bending moments, and #gls("lie") positions for optimization Case D with five #glspl("lie") and a visibility demand of 75%.],
)<fig_94>



// optimiaztion progress
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D/1_L_Comb_Obj.svg",
  width: 100%),
  caption: [optimization case D (50%, 66.7%, 71%, 75%) shows objective funciton values and the required number of iterations for the differen number of #glspl("lie").],
)<fig_95>


// --------------------------------- summary -------------------------------- //
#summary_([

This investigation presents a systematic optimization approach for #gls("ld"), establishing methodologies for determining optimal #gls("lie") configurations in structural testing applications. 
The strategic selection and placement of #glspl("lie") can significantly influence both testing quality and economic efficiency in static structural evaluation procedures.
The progression of optimization cases reflects increasingly sophisticated engineering demands. Case A introduces the foundational framework with a single clamped support configuration, establishing the baseline approach for load discretization. Case B adapts to specific structural requirements by implementing a dual-support system, incorporating proprietary data to better represent #gls("swith") characteristics. While maintaining the core optimization framework, Case C addresses practical installation requirements by incorporating spatial restrictions for essential components such as landing gear and propulsion systems. Case D extends these practical considerations by implementing visibility requirements, ensuring sufficient unobstructed areas for measurement and monitoring equipment while preserving the fundamental optimization approach.

Analysis of configurations ranging from four to eight #glspl("lie") showed a generally positive correlation between #gls("lie") quantity and load approximation accuracy. While computational complexity increased across all cases with higher #gls("lie") quantities, Case D exhibited particularly significant computational demands. 
The developed optimization framework successfully answered essential questions for experimental structural testing, including #gls("lie") dimensioning, spatial distribution, force magnitude, and quantity determination.

All optimizations were performed on standard computing hardware (Intel i5-10500 CPU, 3.10GHz, 6 cores/12 threads, 16GB RAM), demonstrating the methodology's accessibility without specialized computational resources. When optimizing all configurations from four to eight #glspl("lie"), solution times ranged from hours to under a day, varying with required iterations.
The results demonstrate the feasibility of achieving satisfactory #gls("ld") using accessible computational resources while meeting practical engineering constraints. The framework's adaptability to diverse requirements indicates its potential value for future #gls("swith") structural testing and certification processes.
])