/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */
#pagebreak(weak:true)

// Word rep ins. done

// Title was tested and is inshallah fine 
== Optimization-Based Load Discretization for Structural Testing <chap_4_5>

This section reports on research outcomes focused on utilizing numerical optimization to discretize aerodynamic loads. The optimization framework provides solutions to crucial engineering questions, including the determination of optimal #gls("lie") quantities, force magnitudes, lengths, and precise positioning. IMA Materialforschung und Anwendungstechnik GmbH Dresden was consulted to incorporate real-world engineering concerns relevant for potential #gls("swith") certification processes. Through systematic analysis, these practical requirements were translated into mathematical optimization problems. The optimization formulations are presented, explained, solved, and interpreted with respect to their performance.

The investigation is structured into multiple optimization cases, beginning with Case A as the fundamental approach. 
Each subsequent case incorporates additional constraints and engineering considerations that emerged through iterative consultations with structural testing experts at IMA Dresden. These considerations reflect real-world requirements, ensuring the optimization framework's practical applicability. 
The progressive refinement of constraints through expert consultation serves multiple purposes. 
It bridges the gap between theoretical optimization and practical test implementation requirements for potential #gls("swith") certification. 
This iterative development process also offers broader benefits for the field. The methodology demonstrates adaptability to varying experimental testing demands. Furthermore, it reveals how distinct optimization problem definitions can effectively address different requirements. This flexibility proves valuable for both certification authorities and manufacturers, who may encounter diverse technical specifications and constraints.

It is noteworthy that while the cases are presented in order of increasing complexity, this hierarchy does not imply superiority of later cases. Rather, each optimization case represents a distinct definition suitable for specific scenarios. 
The presentation of multiple optimization cases serves to illustrate how the mathematical framework and implemented tools can be adapted to incorporate diverse project-specific demands while maintaining consistent optimization methodology.

// Title was tested and is inshallah fine 
=== Optimization Case A <chap_4_5_0>
Optimization case A serves as the first application of the theoretical foundations established in @chap_4_0 to @chap_4_4. The primary objective is to achieve #gls("ld", long:true) of a numiercal continuous aerodynamic load distribution through numerical optimization. 
By solving this optimization problem, critical questions posed in @chap_4_0 are addressed, specifically regarding the optimal number of #glspl("lie"), their attachment locations, dimensions, and required load magnitudes. 
As this case serves as the foundation for subsequent optimization scenarios, the mathematical formulation and its implications are explained in detail. The mathematical formulation of optimization case A is given in @eq_107.


$
op("argmin",limits: #true)_(bold(x)_d) 
J_A = &(sum_(i)^n abs(M_("true",i) - M_("optim",i)))/n_s \

// constraints
"subject to" quad 
& x_("cl",i)/2 <= "ha" - x_i \
& x_("cl",i)/2 <=  x_i \
& sum_i^n x_("cl",i) <=  "ha" \

// bounds
"bounds" quad 
& 0.03 "ha" <= x_("cl",i) <= "ha"/n_"cl"
$<eq_107>

The first equation in @eq_107 defines the general objective function, previously explained in @chap_4_4. The subscript #emp_[A] added to the objective function $J$ establishes a clear link to optimization case A. The design variables are denoted as vector $bold(x)_d$.

While the objective function includes bending moments, their explicit dependency on the design variables is not shown in the equation. 
This simplified notation was chosen because bending moments depend on multiple parameters, including support type and position, acting forces, and beam length.
To maintain equation clarity and conciseness, these dependencies are acknowledged explicitly by stating that the bending moments are functions of the design variables.

For optimization case A, the design variable vector consists solely of the #gls("lie") lengths $x_("cl",i)$ ($bold(x)_d = {x_("cl",i)}$). 
The constraints that follow in the "subject to" portion are formatted with design variables on the left side of the inequality ($<=$ non-design variable parameters), a convention that facilitates implementation in optimization frameworks such as SciPy.

It should be noted that the positions $x_i$ are not design variables but rather define the centers of the centroids, determined through k-means++ clustering as detailed in @chap_4_0 and @chap_4_1. These centroid locations physically correspond to the centers of the #glspl("lie").

The first constraint ensures that #glspl("lie") remain within the considered beam length, where ha denotes the half-span length. 
This half-span approach leverages the common assumption that aircraft wings are symmetric about the vertical axis, effectively reducing the computational domain and, consequently, the computational time required for optimization.
For better understanding of these and subsequent constraints, @fig_79 provides a visual representation. The figure illustrates the span direction $x$, the centroid locations $x_i$, and the #gls("lie") lengths $x_("cl",i)$. 
The first constraint can be rearranged into a more intuitive form, presented in @eq_108. Through these supplementary materials, it becomes evident that the first constraint ensures the sum of the centroid position and the #gls("lie") length to remain within the halfspan length.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/1_Pos_Graph_Ink.svg", 
  width: 100%),
  caption: [Schematic representation of the span direction, centroid locations, and #gls("lie") lengths for constraint visualization.],
)<fig_79>

$ x_i + x_("cl",i) <= "ha" $ <eq_108>

The second constraint ensures that #glspl("lie") are properly positioned on the wing structure, preventing placement in void spaces. This constraint can be expressed more intuitively as shown in @eq_109, which specifies that the center position of each #gls("lie") minus half its length must remain within the defined wing or beam length.

$ x_i - x_("cl",i)/2 >= 0 $ <eq_109>

The third constraint from @eq_107 stipulates that the cumulative length of all #glspl("lie") must not exceed the halfspan length ha. If this constraint were not imposed, the optimization might suggest #gls("lie") lengths that would physically overlap or extend beyond the wing structure, which would be difficult or impossible to implement in practice. As these constraints stem from physical demands, their inclusion in the optimization formulation is self-evident.
The bounds defined in @eq_107 establish the permissible range for each #gls("lie") length. A minimum length of 3% of the halfspan was selected as the lower bound. The upper bound was set to $"ha"/ n_"cl"$, where $n_"cl"$ represents the total number of #glspl("lie"). This choice of bounds ensures equal treatment of all #glspl("lie") in the optimization, as each can occupy the same maximum fractional length of the span.

// ----------------------------- scipy notation ----------------------------- //
In alignment with the objective of providing initial guidance for #glspl("swith") certification, this work prioritizes the use of free and open-source computational tools whenever feasible. This approach ensures global accessibility of the methodology, facilitating its adoption and further development by the scientific community. Following this principle, SciPy was chosen to serve as the core optimization engine.

To maintain consistency with this open-source commitment and enhance reproducibility, the matrix notation utilized in SciPy is presented in @eq_110 to @eq_112. 
These equations express the linear constraints through lower and upper bounds, described as vectors with dimensions corresponding to the number of constraints $m$. The design variable coefficient matrix, which assigns weights to each design variable, maintains dimensions of $m$ constraints by $n$ design variables.

The complete shape information for the optimization problem can be expressed compactly as:
$bold(l)^(m) <= bold(A)_c^(m times n) space bold(x)_d^(n) <= bold(r)^(m)$

This matrix formulation proves particularly valuable for implementation purposes, as it directly maps to SciPy's optimization interface while maintaining mathematical rigor. Furthermore, this representation facilitates the verification of dimensional consistency across the optimization problem and enables efficient computational implementation. Understanding this standardized matrix structure establishes a foundation for constructing more complex optimization cases, as subsequent formulations can follow the same systematic approach regardless of their specific constraints or objectives. 
This transferability of knowledge not only reduces implementation effort but also minimizes the likelihood of errors through consistent structure and enables straightforward verification of new optimization formulations through dimensional analysis.
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
  1/2, 0, 0, dots.h, 0; 
  0, 1/2, 0, dots.h, 0; 
  0, 0, 1/2, dots.h, 0; 
  dots.v, dots.v, dots.v, dots.down, 0; 
  0, 0, 0, dots.h, 1/2; 
),
bold(A)_c \
"design variable
coefficient matrix"
)

underbrace(
mat(
  x_("cl",0);
  x_("cl",1);
  x_("cl",2);
  dots.v;
  x_("cl",n-1)
),
bold(x)_d \
"design variables"
)

<=
underbrace(
mat(
  "ha" - x_(0);
  "ha" - x_(1);
  "ha" - x_(2);
  dots.v;
  "ha" - x_(n-1);

),
bold(r) \
"right side"
)

$ <eq_110>

// ------------------------------ constraint 2 ------------------------------ //
$
underbrace(
mat( 0; 0; 0; dots.v; 0 ) ,
bold(l)\
"left side")

<= 
underbrace(
mat(
  1/2, 0, 0, dots.h, 0; 
  0, 1/2, 0, dots.h, 0; 
  0, 0, 1/2, dots.h, 0; 
  dots.v, dots.v, dots.v, dots.down, 0; 
  0, 0, 0, dots.h, 1/2; 
),
bold(A)_c \
"design variable
coefficient matrix"
)

underbrace(
mat(
  x_("cl",0);
  x_("cl",1);
  x_("cl",2);
  dots.v;
  x_("cl",n-1)
),
bold(x)_d \
"design variables"
)

<=
underbrace(
mat(
  x_(0);
  x_(1);
  x_(2);
  dots.v;
  x_(n-1);

),
bold(r)\
"right side"
)

$ <eq_111>
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
  x_("cl",1);
  x_("cl",2);
  dots.v;
  x_("cl",n-1)
),
bold(x)_d \
"design variables"
)

<=
underbrace(
"ha",
bold(r)\
"right side"
)

$ <eq_112>


// ------------------------------- beam model ------------------------------- //
@fig_80 presents the fundamental beam model configuration and its analytical solution, which serves as the reference for optimization. The figure consists of four key elements arranged in rows, each providing essential information for the analysis.
In the first row, the beam schematic illustrates the support configuration and loading conditions. The beam's left end features a fixed support (clamp), which constrains both translational and rotational degrees of freedom, enabling it to resist forces in horizontal and vertical directions while bearing bending moments. The applied loads are indicated by upward-pointing arrows, corresponding to the aerodynamic lift forces that maintain the aircraft's altitude during flight.
A notable difference between @fig_80 and @fig_70 lies in the depiction of distributed loads. 
While APAME generates numerous discrete load values as detailed in @chap_4_1, displaying individual numerical values would compromise the figure's clarity due to the high density of data points. Instead, a continuous red distribution curve is employed to characterize the true aerodynamic load distribution, providing a clear visual representation of the loading pattern while maintaining figure legibility.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_A/0_True_Bem_combined.svg", 
  width: 85%),
  caption: [Beam schematic with boundary conditions, corresponding reaction forces, shear force distribution, and bending moment distribution across the normalized span for optimization case A.],
)<fig_80>

// original:
// The presented boundary conditions establish a surrogate model that serves as an efficient preliminary wing modeling approach. 
//
// newly added
By synthesizing the outlined information, a surrogate model that serves as an efficient preliminary wing modeling approach can be established.
//
This simplified representation serves multiple purposes in aerospace engineering beyond optimization tasks. 
Its applications include preliminary sizing of structural components, quick assessment of different load scenarios, evaluation of various support configurations, and rapid iteration of design concepts. 
The second row of @fig_80 shows the reaction forces, providing quantitative information about the resulting shear forces and bending moments at the support locations. 
The third and fourth rows illustrate the shear force and bending moment distributions, respectively. 
All diagrams utilize a normalized span length, which facilitates data interpretation and comparison across different configurations.

The span length selection significantly influences both the optimization process and its computational requirements. The optimization search space expands proportionally with span length, as longer spans create more possible combinations for design variable values. For instance, a normalized span length of 1 mm creates a relatively confined design space between 0 and 1, whereas actual aircraft spans can be substantially larger. As referenced in @chap_1_5, large aircraft can have span lengths of approximately $80 "m "$ or $num("80000") "mm"$, creating a vast design space that demands increased computational resources.
Current #gls("swith") development focuses primarily on smaller aircraft, as evidenced by APUS's efforts mentioned in @chap_0_7 @APUS_0. Given this context and considering computational efficiency, this study employs a beam length corresponding to smaller aircraft dimensions. Specifically, the length was selected to match the half-span of the APUS i-2 @APUS_1, leveraging the assumption of vertical axis symmetry in wing design. 
However note, the methodology's formulation remains scale-independent, making it applicable across various aircraft categories from small unmanned aerial vehicles to large commercial aircraft.
// -------------------------------------------------------------------------- //

Prior to presenting the optimization results, it is important to note the unit conventions employed in this analysis. The optimization calculations were performed using Newton-millimeters (Nmm) for enhanced numerical precision. 
While @fig_80 shows the beam model results in Nmm, subsequent optimization results are converted to Newton-meters (Nm) to align with common engineering practice.
The optimization results are provided for configurations using four and eight #glspl("lie") in @fig_81 and @fig_82, respectively. Both figures maintain consistent visualization conventions across four rows:

1. The first row compares the reference aerodynamic load distribution (blue) obtained from APAME and modified as detailed in @chap_4_1, with the optimized discretized load distribution (red)
2. The second row presents the shear force distributions for both the reference model and the optimization output
3. The third row displays the corresponding bending moment distributions
4. The fourth row illustrates the #glspl("lie") placement through paired arrows of matching colors indicating the start and end positions of each #gls("lie"). Each pair of arrows is annotated with the normalized span position and its corresponding distributed load value.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_A/int_Forc_4.svg", 
  width: 95%),
  caption: [Comparison of reference and optimized load distributions showing distributed loads, shear forces, bending moments, and #gls("lie") positions for optimization case A with four #glspl("lie").],
)<fig_81>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_A/int_Forc_8.svg", 
  width: 95%),
  caption: [Comparison of reference and optimized load distributions showing distributed loads, shear forces, bending moments, and #gls("lie") positions for optimization case A with eight #glspl("lie").],
)<fig_82>

// ----------------------------- interpretation ----------------------------- //
Analysis of the optimization results reveals that the computed bending moment distributions closely match the reference cases, showing minimal visible deviation. Although the objective function specifically targeted bending moment behavior, the shear force distributions also demonstrate good agreement between the optimized and reference cases. The approximation accuracy notably improves with an increasing number of #glspl("lie"), as evidenced by comparing @fig_81 and @fig_82.

This improvement in accuracy is further quantified through the objective function values presented in @fig_83, which indicate a clear inverse relationship between the number of #glspl("lie") and the objective function value. The second row of @fig_83 illustrates the computational efficiency of the approach through the number of iterations required for convergence.
The relatively low iteration count indicates favorable computational efficiency. It can be reasonably attributed to the strategic use of k-means++ clustering for determining #gls("lie") center positions. This approach significantly reduces the number of design variables compared to implementations where #gls("lie") positions would be additional optimization parameters. For a half-span length ranging between $gt.approx 5000/2 "mm"$ and $frac(approx #num("80000"),2) "mm"$, this reduction in design variables substantially constrains the optimization search space, leading to faster convergence times. The significance of this computational advantage becomes particularly evident in the subsequent optimization cases.


#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_A/opti_Bar.svg", 
  width: 95%),
  caption: [Performance metrics for optimization case A showing objective function values and required iteration counts across varying numbers of #glspl("lie").],
)<fig_83>