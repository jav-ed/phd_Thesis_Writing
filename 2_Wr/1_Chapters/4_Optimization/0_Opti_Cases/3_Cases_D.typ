/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Word rep ins. done
// proofread ins. done


// Title was tested and is inshallah fine 
=== Optimization Case D <chap_4_5_3>
// talk about overlapping collets and how this issues was resolved
// case L,M,N,O
// D 50%
// D 66%
// D 71%
// D 75%

In optimization Case B (@chap_4_5_1), the #glspl("lie") were positioned in close proximity to one another, utilizing nearly the entire tube-wing length. The subsequent optimization Case C (@chap_4_5_2) introduced a prohibited domain. However, since this constraint did not address the spacing between #glspl("lie"), they maintained their tight spatial arrangement.
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

To understand the optimization definition for Case D, the design variables require clear specification. The design variable vector $bold(x_d)$ for optimization Case D consists of the #glspl("lie") lengths $x_("cl",i)$ and the forces $x_(F,i)$ that act on the corresponding #glspl("lie"). The mathematical description of the design variable vector $bold(x_d)$ is given in @eq_118.

$ bold(x)_d =  [
  x_("cl",0), x_("cl",1), x_("cl",2) ... x_("cl",n_"cl"-1), quad
  x_(F,0), x_(F,1), x_(F,2) ... x_(F,n_"cl"-1)     ]
$<eq_118>

With the design variables established, attention can be directed to the second constraint in @eq_117. This constraint has been modified by incorporating the term $x_(s,2)$. 
By adding the term $x_(s,2)$, which defines the position of the second support point, it is ensured that the #glspl("lie") cannot be placed to the left of the second support position. 
The underlying beam model remains consistent with that used in optimization Cases B and C, of which the schematic is depicted in the first row of @fig_84.
In the third constraint of @eq_117, the variable $beta$ serves as a factor that determines what proportion of the tube-wing length may be utilized for the placement of #glspl("lie").
Regarding the force design variables $x_(F,i)$, bounds have been implemented. 
Here, $F_(r,i)$ represents the resultant force obtained by summing the force members within a cluster, as detailed in @chap_4_0.
The lower force factor $gamma_l$ and upper force factor $gamma_u$ can be applied to the resultant force to constrain its possible values.

// ---------------------------------- scipy --------------------------------- //
For practical computational implementation, the matrix form of the constraints is presented in @eq_119 to @eq_121. Since this optimization case involves an increased number of design variables that no longer corresponds directly to the number of #glspl("lie"), the indexing notation has been adapted accordingly. The variable $n_"cl"$ denotes the number of #glspl("lie"), while $n$ indicates the total number of design variables. The force design variables $x_(F,i)$ do not contribute to the first and second constraints, therefore their corresponding coefficients in the design variable coefficient matrix $bold(A)$ are set to zero in @eq_119 and @eq_120.

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
Different $beta$ values were analyzed in the subsequent results. The parameter $beta$, as defined in @eq_117, determines the maximum proportion of tube-wing length available for placing #glspl("lie"). Its complement (1 - $beta$) represents the proportion of length that must remain free of #glspl("lie"), referred to as the visibility demand in later analyses. 
The investigated $beta$ values were $beta = [0.5, space 0.33, space 0.285, space 0.25]$, corresponding to visibility demands (free lengths) of $[50%, space ~66.7%, space 71.5%, space 75%]$. These outcomes are illustrated in @fig_91 to @fig_94.
The number of the #glspl("lie") selected for these results is based on the analysis presented in @fig_95.
@fig_95 depicts the objective function for four different visibility demands and five different numbers of #glspl("lie").
Not all objective functions appear in the plots, as only solutions satisfying all constraints were considered feasible and displayed in the first row of @fig_95. 
It is important to note that the absence of plotted solutions does not indicate a lack of solutions altogether, but rather suggests that these solutions violated one or more constraints.

Analysis of the first row in @fig_95 reveals that the lowest objective function value for a 50% visibility demand was achieved with eight #glspl("lie"). 
For a 66.7% visibility demand, the optimal #gls("ld", long:true) was achieved with seven #glspl("lie"), while maintaining constraint compliance. 
Similarly, for visibility demands of 71% and 75%, the best results were obtained with six and five #glspl("lie"), respectively. 
These findings informed the selection of #glspl("lie") numbers for @fig_91 to @fig_94.
Further examination of the objective function values in @fig_95 indicates that increasing the number of #glspl("lie") generally improves the quality of #gls("ld"). 

However, the second row of @fig_95 demonstrates that higher numbers of #glspl("lie") significantly increase the optimization complexity.
This complexity manifests itself in the number of iterations required. Solutions for four #glspl("lie") were found for all visibility demands. Notably, increasing the number of #glspl("lie") led to iteration counts approaching the maximum limit of 3000.
The computational demand becomes particularly evident when comparing the number of iterations required for eight #glspl("lie") (1907) and four #glspl("lie") (244) at a 50% visibility demand. 
The case with eight #glspl("lie") necessitated approximately eight times as many iterations to find a solution ($1907/244 approx 7.82$). 
Moreover, for the other three visibility demands with eight #glspl("lie"), no constraint-satisfying solutions were found, even after 3000 iterations.

// -------------------------------------------------------------------------- //

Finally, especially @fig_95, which shows information about objective function values across different numbers of #glspl("lie"), can be used to determine the optimal number of #glspl("lie").
Generally, it can be assumed that the lower the number of #glspl("lie"), the lower the cost of obtaining these physical #glspl("lie"). 
Likewise, the costs of maintenance and the potential need for control engineering are reduced.
If a higher number of #glspl("lie") does not result in better #gls("ld"), there is no need to purchase additional #glspl("lie"). 
However, if costs are a concern, trade-offs can be evaluated through @fig_95 by answering the question of whether adding additional #glspl("lie") would significantly improve the #gls("ld") quality.



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



// optimization progress
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D/1_L_Comb_Obj.svg",
  width: 100%),
  caption: [Objective function values and the required number of iterations for different numbers of #glspl("lie") and visibility demands (50%, 66.7%, 71%, 75%) for optimization Case D.],
)<fig_95>


// --------------------------------- summary -------------------------------- //
#summary_([

The optimization cases presented in @chap_4_5_0 to @chap_4_5_3 build upon the optimization framework elucidated in @chap_4_4. This framework was developed to determine key parameters of #glspl("lie"), including their dimensions, positioning, force magnitudes, and optimal number. These parameters significantly influence both testing quality and economic efficiency in static structural evaluation procedures.
The progression of optimization cases reflects increasingly sophisticated engineering demands. 
Case A (@chap_4_5_0) demonstrates the elementary implementation with a single clamped support configuration, establishing the baseline approach for #gls("ld"). 
Case B (@chap_4_5_1) adapts to specific structural requirements by implementing a dual-support system based on proprietary data to better represent #gls("swith") characteristics.
While maintaining the core optimization framework, Case C (@chap_4_5_2) addresses practical installation requirements by incorporating spatial restrictions for essential components, such as landing gear and propulsion systems. 
Case D (@chap_4_5_3) extends these practical considerations by implementing visibility requirements, ensuring sufficient unobstructed areas for measurement and monitoring equipment, without compromising the fundamental optimization approach.



// -------------------------------------------------------------------------- //
Analysis of configurations ranging from four to eight #glspl("lie") showed a generally positive correlation between #gls("lie") quantity and load approximation accuracy. 
Despite computational complexity increasing across all cases with higher #gls("lie") 
quantities, Case D exhibited particularly significant computational demands.
The developed optimization framework successfully answered critical questions for experimental structural testing, including the dimensioning, spatial distribution, force magnitudes, and quantity determination of #glspl("lie").

Some optimizations were conducted on the High-Performance Computing (HPC) cluster #emp_[Barnard] at the TUD Dresden University of Technology. 
However, all optimization cases can also be executed on conventional desktop computers. 
This was confirmed by performing the majority of computations on standard hardware (Intel i5-10500 CPU, 3.10 GHz, 6 cores/12 threads, 16 GB RAM). 
Using these hardware specifications, the complete analysis, spanning configurations from four to eight #glspl("lie"), yielded computation times ranging from a few hours to less than a day, depending on the number of required iterations.

In conclusion, the results demonstrate the feasibility of achieving satisfactory #gls("ld") while adhering to practical engineering constraints. 
Furthermore, the framework's flexibility and adaptability underscore its value for the potential structural testing and certification processes of #glspl("swith") in the future.

])