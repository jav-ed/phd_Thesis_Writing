/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Word rep ins. done
// proofread ins. done

// Title was tested and is inshallah fine 
=== Optimization Case C <chap_4_5_2>
In the previous @chap_4_5_1, optimization case B was introduced with its results being shown and interpreted. 
For optimization case C, the underlying beam model remains identical to that presented in optimization case B through @fig_84. 
Similarly, the optimization definition maintains consistency with case B, as provided in @eq_113. 

The primary contribution of optimization case C emerges from addressing a constraint, commonly encountered in real-world applications.
In practical aircraft design, certain sections of the wing-tube structure are inherently unsuitable for placing #glspl("lie", long:true).
This limitation typically arises in areas where critical components, such as propulsion systems and landing gear, are mounted to the wing-tube section.
Even in scenarios where these components could theoretically be relocated, existing structural connection elements may preclude the placement of standard #glspl("lie").
// -------------------------------------------------------------------------- //
As explained in @chap_4_1, the k-means++ algorithm @Arthur2006 outputs centroids that represent the centers of the #glspl("lie"). Modifying its input matrix $bold(X)$ allows for the accommodation of these constraints. 
For this investigation, the region between $approx 0.21$ and $approx 0.289$ is designated as a prohibited domain for #glspl("lie") placement. 
To implement this constraint, all forces within the prohibited domain are redistributed to adjacent regions on either side. This modification ensures centroid placement occurs exclusively outside the prohibited domain.

More concretely, the redistribution process employs a systematic approach to relocate forces away from the prohibited domain. Initially, the midpoint of the prohibited domain (between $approx 0.21$ and $approx 0.289$) serves as a reference point. Forces originally located within this domain are redistributed outward based on their relative position to this midpoint. Specifically, if a force point lies to the left of the midpoint, it is shifted further left by a distance equal to the prohibited zone's half-width plus a safety margin. Conversely, force points to the right of the midpoint are shifted rightward by the same distance. This methodology ensures a balanced redistribution while maintaining sufficient clearance from the prohibited domain boundaries.
// -------------------------------------------------------------------------- //

The results of optimization case C implementing four and eight #glspl("lie") are presented in @fig_88 and @fig_89, respectively. The influence of the prohibited domain is evident in the uppermost plots, where the optimized load distribution exhibits clear avoidance of the region between $approx 0.21$ and $approx 0.289$. As anticipated, this additional constraint leads to a degradation in objective function performance, which is quantitatively demonstrated in @fig_90.
Analysis of the relationship between #glspl("lie") quantity and optimization performance through @fig_90 reveals a notable departure from the trends observed in optimization cases A (@chap_4_5_0) and B (@chap_4_5_1). In contrast to previous cases, increasing the number of #glspl("lie") does not consistently yield improved objective function values. For optimization case C, the optimal configuration is achieved with six #glspl("lie"), resulting in an objective function value of $97.04 "Nm"$.

// results 
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_C/int_Forc_4.svg", 
  width: 95%),
  caption: [Comparison of reference and optimized load distributions showing distributed loads, shear forces, bending moments, and #gls("lie") positions for optimization case C with four #glspl("lie").],
)<fig_88>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_C/int_Forc_8.svg", 
  width: 95%),
  caption: [Comparison of reference and optimized load distributions showing distributed loads, shear forces, bending moments, and #gls("lie") positions for optimization case C with eight #glspl("lie").],
)<fig_89>


// optimiaztion progress
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_C/opti_Bar.svg", 
  width: 95%),
  caption: [Performance metrics for optimization case C showing objective function values and required iteration counts across varying numbers of #glspl("lie").],
)<fig_90>


