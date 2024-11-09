/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// INFO
// all refs
// all figs - the image data was not copied
// all eqs

// TODO the original text seems to be incomplete
== Combination of Optimization and Beam Model<chap_4_2>

In the previous sections, important fundamental information about the beam model and optimization was provided. This section will explain, building on that foundation, how the beam model and optimization can be combined. Furthermore, it will first explain what goal such a constellation pursues. Afterward, the advantages and disadvantages of the chosen systematic approach will be discussed.

The global goal is to answer important questions for the experimental trial. Among other things, how many #gls("lie") (Load Introduction Elements) should be used, where should they be placed, and what forces should be applied. If a suitable objective function is found, this question could be answered directly with a #gls("fem") coupling. In other words, it is entirely possible for the optimizer to have access to the #gls("fem") solver. In this case, the optimizer could obtain important structural information through a #gls("fem") calculation while exploring the unknown territory. Since optimization is generally an iterative process, a #gls("fem") solution would be needed for each individual function evaluation. However, within a single iteration step, significantly more function evaluations might be required. This can be understood particularly easily using an evolutionary algorithm as an example. In each individual iteration step, multiple parameter combinations for the design variables are examined. For each individual parameter combination, at least one function evaluation would be required. Depending on how exactly the objective function is defined, multiple function evaluations might also be required for a single parameter combination. The latter would be possible if two #gls("fem") calculations were necessary. If a function evaluation is cost-effective in terms of time and hardware, this factor can be neglected.

However, with a three-dimensional structural model of an aircraft, the summation of multiple function calls of a #gls("fem") calculation might be unacceptably high under certain circumstances. This is the first reason why an alternative to the #gls("fem") calculation in the optimization loop was sought. The other reason is that initially, no clear objective function was known for the present problem. This itself was found iteratively. If each individual optimization were associated with about a month of calculation time, undesirable limitations would occur. When comparing the beam model with the #gls("fem") calculation, the following is clear: The beam model has lower accuracy reproduction, but is faster in calculation than the high-quality #gls("fem") model.

At this point, there are two possible ways to proceed with the optimization. The first option would be to find a suitable objective function through the flexible beam optimization model. This could then be recalculated in a higher-quality FEM optimization. The other option should be explained using Figures @fig_21 and @fig_22. From Figure @fig_21, it becomes apparent that APAME was used to obtain the aerodynamic loads. These were, as already explained, converted into a one-dimensional distributed load. This load can now be sent to the beam model. The output is the shear force and bending moment distribution of the actual aerodynamic loading, as APAME would give in 1D. The task of the optimization is now to adjust the design variables so that the difference between the actual bending moment distribution and the discrete bending moment distribution is as small as possible. The discrete bending moment distribution is the output of the optimization.

To verify whether the optimization output can be considered acceptable, Figure @fig_22 should be considered. The discrete load obtained from the optimization is first converted back to a three-dimensional load. After that, this can be applied again to the FEM model. The results of this discrete FEM analysis should be recorded. On the other hand, the continuous aerodynamic load should be used to apply it to the FEM model. Once the results from both phases, discrete and continuous, are available, they can be compared with each other. The comparison should pay attention to characteristic structural behavior, such as locality of failure, stress peaks, and stress jumps. If the structural behavior is sufficiently similar, the results with the beam optimization model can be used.

For the continuing work, the comparison procedure, which was previously described as the second option, was initially chosen. In the following section, initial optimization results with the described procedure will be shown.

#figure(
  image("../../1_Data/2_Figures/1_Ch_Figs/1_Ch/9.svg", 
  width: 100%),
  caption: [Exemplary illustration of the internal force distributions from @fig_19],
)<fig_21>

#figure(
  image("../../1_Data/2_Figures/1_Ch_Figs/1_Ch/9.svg", 
  width: 100%),
  caption: [Exemplary illustration of the internal force distributions from @fig_19],
)<fig_22>