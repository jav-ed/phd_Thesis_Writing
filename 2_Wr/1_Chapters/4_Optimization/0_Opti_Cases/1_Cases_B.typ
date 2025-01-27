/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Word rep ins. done

// Title was tested and is inshallah fine 
=== Optimization Case B <chap_4_5_1>

// ------------------------------- beam model ------------------------------- //
The beam model utilized for optimization case B, depicted in @fig_84, differs significantly from case A through its modified support configuration. 
Preliminary assessments suggest that this configuration more closely resembles the real-world support characteristics of a #gls("swith").
Rather than employing a single clamp at the wing root, the new model incorporates two supports positioned in close proximity to each other.
The first support restricts displacement in the horizontal direction and can withstand bending moments, but it permits vertical movement. 
Conversely, the second support allows horizontal movement and constrains vertical displacement while also bearing bending moments. 
This unconventional support configuration emphasizes the necessity for flexibility in the beam modeling approach. As mentioned in @chap_4_4, this flexibility is particularly important in accommodating various structural modifications.

Although this support system has received approval from the IMA Dresden, certain aspects of its underlying rationale remain proprietary. 
Yet, it shall be highlighted that the absence of #glspl("swith") in commercial markets means that no standardized support configuration has been established.
Given the innovative nature of #glspl("swith"), the final support system implementation may deviate substantially from the presented configuration. Furthermore, as #glspl("swith") become commercially available, support systems may vary across different designs, reinforcing the demand for a versatile beam modeling approach.

// -------------------------------------------------------------------------- //
Inspection of @fig_84 reveals that the aerodynamic force is not applied along the entire wing span. 
In contrast to conventional aircraft wings, which typically experience aerodynamic loading across their full span, several practical considerations justify this partial loading approach for #glspl("swith").
A primary consideration stems from the design flexibility of the pressurized tubes. The #gls("swith") concept does not dictate tubes to extend through the complete wing span. Instead, tubes may be confined to the inner wing section, leaving the outer wing tank-free. 
This configuration enables the implementation of replaceable outer wing sections, offering multiple advantages for both operational and research purposes.
The modular outer wing design permits customization of aerodynamic properties through interchangeable sections, allowing a single primary #gls("swith") design to accommodate varying performance requirements. Additionally, removable outer wing sections facilitate maintenance access to the pressurized tubes. This design approach is particularly beneficial for research and development, as it enables focused simulation and experimental investigation of the wing-tube section while utilizing simplified outer wing structures for testing purposes.

Furthermore, @fig_84 shows a small gap between the left and right supports where no aerodynamic load is applied. This gap represents the fuselage-wing junction area, accounting for the structural interface between these major components.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/0_True_Bem_combined.svg", 
  width: 87%),
  caption: [Beam schematic with boundary conditions, corresponding reaction forces, shear force distribution, and bending moment distribution across the normalized span for optimization case B.],
)<fig_84>

The optimization problem formulation for case B is presented in @eq_113.

$
op("argmin",limits: #true)_(bold(x)_d) 
J_B = &(sum_(i)^n abs(M_("true",i) - M_("optim",i)))/n_s \

// constraints
"subject to" quad 
& x_("cl",i)/2 <= "ha" - x_i - Phi\
& x_("cl",i)/2 <=  x_i \
& sum_i^n x_("cl",i) <=  "ha" - Phi \

// bounds
"bounds" quad 
& 0.03 "ha" <= x_("cl",i) <= "ha"/n_"cl"
$<eq_113>

A comparison between optimization cases A and B reveals modifications in the first and third constraints. The first constraint introduces the variable $Phi$, representing the outer wing length, which effectively restricts the placement of #glspl("lie") to the inner wing region. The third constraint stipulates that the cumulative length of all #glspl("lie") must remain within the inner wing length.
Despite the reduction in effective length available for #glspl("lie") placement, the bounds remain consistent with optimization case A. This design choice was made as the combined effect of bounds and constraints ensures appropriate #gls("lie") length limitations. The current formulation offers enhanced flexibility in #gls("lie") length distribution, allowing individual #glspl("lie") to vary significantly in length relative to others. This flexibility potentially facilitates improved minimization of the objective function.
Following the methodology established in optimization case A, the matrix notation necessary for practical computational implementation is presented in @eq_114 to @eq_116.

// ---------------------------------- scipy --------------------------------- //
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
  "ha" - x_(0) - Phi;
  "ha" - x_(1) - Phi;
  "ha" - x_(2) - Phi;
  dots.v;
  "ha" - x_(n-1) -Phi;

),
bold(r) \
"right side"
)

$ <eq_114>

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

$ <eq_115>
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
"ha" - Phi,
bold(r)\
"right side"
)

$ <eq_116>

As established in optimization case A (@chap_4_5_0), the optimization results are presented for configurations with 4 and 8 #glspl("lie") in @fig_85 and @fig_86, respectively. Analogous to the findings in case A, these variations achieve high-quality approximations of both shear force and bending moment distributions.
For clarity in @fig_86, the force text annotations for the 8 #glspl("lie") configuration are deliberately positioned with alternating vertical offsets. This arrangement was necessary to prevent textual overlap between adjacent annotations. 
The visualization maintains consistent scaling across all subplots to enable direct comparisons between different configurations. The color-coded text scheme aids in distinguishing individual force components.
The results demonstrate that the #glspl("lie") positions satisfy the constraint that prohibits overlapping between individual #glspl("lie"). The optimizer utilized the entire available inner wing length for #gls("lie") placement, identifying this as the optimal design configuration.
While this optimization definition proves suitable for scenarios without restrictions on #gls("lie") placement within the wing-tube section, applications requiring optical measurement devices necessitate specific regions to remain free of #glspl("lie"). This consideration is addressed in optimization case D, presented in @chap_4_5_3.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/int_Forc_4.svg", 
  width: 95%),
  caption: [Comparison of reference and optimized load distributions showing distributed loads, shear forces, bending moments, and #gls("lie") positions for optimization case B with four #glspl("lie").],
)<fig_85>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/int_Forc_8.svg", 
  width: 95%),
  caption: [Comparison of reference and optimized load distributions showing distributed loads, shear forces, bending moments, and #gls("lie") positions for optimization case B with eight #glspl("lie").],
)<fig_86>

The influence of varying #gls("lie") quantities on optimization performance is illustrated in @fig_87. In alignment with the findings from optimization case A (@chap_4_5_0), increasing the number of #glspl("lie") leads to a reduction in the objective function value, resulting in improved load approximation accuracy. 
Although optimization case B requires more iterations to converge compared to case A, the overall computational effort remains modest, with relatively few iterations needed to reach the optimal solution.

// optimiaztion progress
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/opti_Bar.svg", 
  width: 95%),
  caption: [Performance metrics for optimization case B showing objective function values and required iteration counts across varying numbers of #glspl("lie").],
)<fig_87>
