/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// import graphs
#import "../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/4_Beam_Optim/1_Opti_Step.typ": *


// INFO
// all refs
// all figs - the image data was not copied
// all eqs
// compared with true german text




// Title was tested and is inshallah fine
== Integration of Structural Analysis for Optimization  <chap_4_0_4>
In @chap_4_0_0 it was explained how to discretize load distributions, in @chap_4_0_1 how to obtain the aerodynamic loads, in @chap_4_0_2 important fundamental information about the beam model and in @chap_4_0_3 some general background about optimization was provided. 
This section builds upon the collected knowledge and explains how the beam model solver can be incorporated into an optimization framework. 
First, it explains what goal such a constellation pursues. 
Subsequently, an investigation comparing beam model and #gls("fem") solvers is conducted, leading to the selection of one method based on rationale. Finally, it was explained how this selection could be integrated within an optimization framework.
// -------------------------------------------------------------------------- //

The primary objective centers on determining optimal parameters for the experimental structural testing of #glspl("swith"). Among others, these parameters encompass the quantity of #glspl("lie", long:true), their spatial distribution throughout the test structure, and the magnitude of forces applied during testing. The determination of these parameters could be achieved through direct coupling with a #gls("fem") solver, provided appropriate optimization formulations are established. This computational approach would enable the optimization algorithm to access detailed structural information through #gls("fem") calculations while exploring the available solution space.
The iterative nature of optimization processes necessitates multiple #gls("fem") solutions for each function evaluation. 
This computational burden becomes particularly apparent when considering evolutionary algorithms. During each iteration, the algorithm evaluates numerous parameter combinations for the design variables. 
Every parameter combination requires at least one function evaluation, 
with certain objective function formulations potentially demanding multiple #gls("fem") calculations per combination. 
For example, an objective function might require two distinct #gls("fem") analyses to generate its output. 

// -------------------------------------------------------------------------- //
When function evaluations prove computationally efficient regarding temporal and hardware requirements, the cumulative computational burden becomes a minor consideration in the overall analysis framework. 
However, the computational demands increase substantially when applying three dimensional structural analyses to an #gls("swith"), as the aggregation of multiple #gls("fem") calculations within the optimization process can lead to prohibitive computational costs under various circumstances.
A second compelling reason emerges from the requirement of developing physics-informed optimization formulations, as outlined in @chap_4_0_3. The process can involve iterative refinement of multiple interconnected elements within the optimization framework. 
These elements include the selection of appropriate design variables that capture essential physical characteristics and the establishment of mathematical bounds and constraints that govern the solution space. The definition of objective functions requires careful consideration to provide meaningful performance metrics that evaluate the effectiveness of potential solutions for the specific engineering task under investigation.
Initial optimization formulations generate preliminary results that often reveal opportunities for improving the representation of physical phenomena. However, when individual optimization cycles demand computational periods extending from one week to one month, the ability to implement and evaluate such physics-based modifications becomes severely constrained. This temporal limitation can impede the methodological refinement process, potentially affecting the quality of the final physics-informed formulation.

// -------------------------------------------------------------------------- //
A systematic comparison between beam model and #gls("fem") approaches reveals their fundamental characteristics regarding accuracy and computational requirements. While beam models exhibit reduced accuracy in structural response reproduction, they demonstrate enhanced computational efficiency when compared to detailed #gls("fem") analyses. This trade off manifests in several practical advantages that warrant careful consideration.
The development and implementation of beam models present notable efficiency advantages. Model creation proceeds with increased rapidity, enabling engineers to evaluate multiple design variants within compressed time frames. This accelerated development cycle facilitates comprehensive exploration of structural configurations, providing valuable insights.
The theoretical foundation of beam models offers distinct educational and practical benefits. The mathematical principles underlying beam theory demonstrate enhanced accessibility for practitioners new to structural analysis. 
These fundamental concepts present reduced conceptual barriers when compared with the mathematical complexities inherent in #gls("fem") formulations. Such accessibility extends to educational settings, where students can engage effectively with structural analysis concepts through practical implementation.

The computational implementation draws substantial benefit from available open source Python libraries, as documented in @chap_4_0_2. These frameworks maintain mathematical transparency while providing accessible tools for beam analysis implementation. The modest computational requirements enable analyses on standard computing hardware, eliminating dependence on specialized computational resources. This accessibility yields additional advantages, including reduced financial costs and environmental impact associated with computational resource usage. Furthermore, the relative simplicity of beam models can expedite the identification and resolution of numerical issues during development.
The computational efficiency of beam models proves particularly advantageous within optimization frameworks. The reduced calculation times become especially valuable when considering the numerous function evaluations required for optimization procedures. This temporal efficiency permits more extensive exploration of design spaces within practical time constraints, potentially enabling more comprehensive optimization studies. Such advantages become particularly relevant when considering the iterative nature of optimization processes explained previously.

// -------------------------------- fem story ------------------------------- //
The implementation of #gls("fem") analyses reveals several critical considerations that necessitate thorough examination. The development of #gls("fem") models demands extensive time investment while potentially requiring specialized commercial solvers, thereby introducing notable financial barriers to implementation. These resource constraints become particularly pronounced in optimization contexts where parallel processing across multiple computational cores often serves as a prerequisite for efficient analysis. 
The implementation of parallel analyses necessitates multiple concurrent software licenses for commercial #gls("fem") tools, which can introduce substantial economic considerations. 
This requirement becomes more pronounced when scaling computational resources across numerous nodes, as the licensing fees increase proportionally with expanded processing capacity.

The innovative character of #glspl("swith") introduces additional methodological complexities, as standardized commercial variants do not yet exist for reference or validation purposes. This absence of established benchmarks necessitates careful evaluation of the scientific value derived from detailed #gls("fem") analyses during these early research phases. 
The ongoing development of #glspl("swith") encompasses numerous design parameters that may undergo modifications as the technology evolves. 
These modifications can significantly alter the structural behavior and 
other important characteristics. 
While detailed finite element analyses offer comprehensive insights through precise modeling of geometries, material properties, and boundary conditions, their value requires assessment within the context of technological maturity. 
Given that no commercially available #gls("swith") exists and the technology remains in an innovative development stage, extensively detailed analyses conducted on current configurations may yield findings with limited long-term applicability. 
This temporal consideration introduces questions regarding resource allocation efficiency. 
The investment of substantial computational resources toward highly detailed #gls("fem") studies appears unlikely to provide proportional scientific or industrial value during these early development phases.

// ----------------------------- final decision ----------------------------- //
The combination of computational efficiency considerations and the demonstrable advantages of beam modeling presents a compelling rationale for employing beam analysis within the optimization framework. 
This selection reflects proper evaluation of both the immediate analytical requirements and the broader context of technological development. 
The beam modeling approach offers an appropriate balance between computational resource allocation and analytical depth for the current developmental stage. 
Based on these considerations, the optimization framework implements beam model analysis as its primary computational methodology.

// ------------------------- optimizer step overview ------------------------ //
The integration of knowledge from @chap_4_0_0 to @chap_4_0_3 into an optimization framework is illustrated in @fig_77. 
The diagram demonstrates that APAME generates the aerodynamic loads, which undergo conversion into a one-dimensional aerodynamic distributed load, as previously detailed in @chap_4_0_1. 
This distributed load serves as input for the beam model solver, which generates two primary outputs: the shear force distribution and bending moment distribution corresponding to the actual aerodynamic loading, denoted as $Q_"true"$ and $M_"true"$, respectively. 
The optimization process, depicted in the lower portion of @fig_77, functions by transmitting various combinations of design variables to the beam model solver. 
The resulting solutions yield what are termed the discrete or optimized distributions: the shear force distribution $Q_"optim"$ and the bending moment distribution $M_"optim"$.
The fundamental objective of the optimization process involves determining the optimal set of design variables that minimizes the disparity between the actual and optimized bending moment distributions. This optimization criterion is quantified through the deviation between $M_"optim"$ and $M_"true"$, represented in @fig_77 as $Delta M = M_"optim" - M_"true"$.

// adapt caption
#figure(
    box(
    stroke: 1pt, // defines the border thickness
    radius: 5pt, // optional: adds rounded corners
    inset: 1.3em, // adds some padding between content and border

    diag_opti_step
  // -------------------------------- box end ------------------------------- //
  ),
  caption:[Conceptual workflow diagram illustrating the comparison between aerodynamically derived and optimizer generated bending moment distributions within a single iteration.]

  )<fig_77>

Each combination of design variables produces a specific deviation between the optimized and true bending moment distributions, expressed as $Delta M = M_"optim" - M_"true"$. 
The optimization process seeks to minimize this deviation, ensuring the optimized bending moment distribution approaches the true bending moment distribution obtained from the APAME aerodynamic load analysis. 
The mathematical formulation of this optimization problem leads to the  objective function presented in @eq_106.
The objective function utilizes specific notation wherein $J$ represents the objective function value. 
The index $i$ denotes individual points along the moment distribution, while $n_s$ represents the total number of measurement points in the analysis. The formulation incorporates absolute values in accordance with the mean absolute error calculation, following the L1 norm definition previously established in @eq_72.

$ op("argmin",limits: #true)_(bold(x)_d)   J = (sum_(i)^n abs(M_("true",i) - M_("optim",i)))/n_s $<eq_106>

In the context of optimization problems, lowercase bold letters denote vectors. The design variable vector $bold(x)_d$ therefore encompasses multiple design variables that influence the optimization process. 
The formulation of the objective function $J$ considers only the bending moment deviation, although it would be mathematically feasible to incorporate shear force deviations. 
This focused approach rests upon the assumption that bending moment distributions provide a more comprehensive representation of the structural behavior characteristics.
The optimization framework exhibits adaptability through design variables, bounds, and constraints that can be modified according to project requirements.
A detailed exposition of these optimization parameters for each investigated scenario appears in @chap_5. 
Despite these case-specific adaptations, the fundamental form of the objective function presented in @eq_106 remains unchanged throughout all investigations documented in @chap_5.

The computational implementation utilizes the differential evolution algorithm @Storn1997 @osti_1163659 @Suganthan2012 @Wong @Wang2012 through its integration in the open-source numerical computing package SciPy @Virtanen2020a. 
This selection was motivated by several technical and practical considerations. 
The primary advantage stems from the seamless integration capabilities between SciPy and the beam model solver IndeterminateBeam @interdetbeam_tool, both being free and open-source tools. 
This compatibility facilitates reproducibility of the research findings, enabling other researchers to build upon this work without requiring substantial financial resources.
The SciPy package offers additional advantages through its robust documentation, straightforward installation process, and established reliability within the scientific computing community. 
A particularly relevant feature of the SciPy differential evolution implementation lies in its ability to utilize multiple #gls("cpu") cores while providing extensive customization options for the optimization.

// --------------------------- application to lie --------------------------- //
The optimization process yields a discretized representation of the aerodynamic loads, providing essential parameters for experimental structural testing. These parameters determine the dimensional specifications of #glspl("lie"), establish the optimal number of #glspl("lie"), and define their corresponding force magnitudes. 
Detailed examples demonstrating these optimization results appear in @chap_5_0 to @chap_5_3.
The discretized one-dimensional forces obtained through optimization prove sufficient for direct implementation in experimental testing, contingent upon the required accuracy levels and the particular #glspl("lie") selected. 
This direct application manifests when considering, for instance, collets as the selected #glspl("lie").
Given that collets encompass the complete airfoil profile, the force magnitude can be appropriately applied at the collet center.
The transformation of the optimized one-dimensional discretized loads back to three-dimensional discretized force vectors serves two distinct purposes. 
First, experimental testing might necessitate the application of forces at specific localized areas rather than across entire profile sections. 
Second, as illustrated in @fig_78, the discretized loads resulting from optimization can be transformed and applied to the three-dimensional #gls("fem") model of a #gls("swith").

// -------------------------------------------------------------------------- //
  #figure(
    box(
      stroke: 1pt, // defines the border thickness
      radius: 5pt, // optional: adds rounded corners
      inset: 1.3em, // adds some padding between content and border

      diag_comparison_beam_opti_2
 
    ),
    caption: [Schematic representation of how optimized force and continuous aerodynamic loads can be used within a high-fidelity #gls("fem") model.],
  )<fig_78>

The lower portion of @fig_78 demonstrates how continuous aerodynamic loads obtained from APAME are incorporated into the #gls("fem") model.
Both load cases are compared against each other to evaluate their structural responses. This comparison can consider relevant mechanical quantities such as deformation, stress distributions, and strain measurements.
The determination of appropriate assessment criteria requires consideration of two fundamental aspects.
The primary consideration stems from the material selection, as #glspl("swith") utilize #gls("cfrp") material in their construction. 
The second consideration relates to the comparative analysis objective, which aims to verify consistency in overall structural behavior. 
This behavioral consistency requires the prevention of unexpected localized failures while maintaining identical failure modes. Furthermore, stress and strain distributions must exhibit matching patterns and peak magnitudes across comparative analyses
The utilization of composite materials necessitates the selection of appropriate failure criteria, rendering traditional approaches such as the Von Mises criterion unsuitable for this application @Altenbach2018 @markmiller2024cas. 
The Von Mises criterion was specifically developed for metallic materials, which exhibit isotropic behavior due to their statistically oriented crystalline structure. This statistical orientation results in uniform material properties across all directions @Hans_Bargel_2022.

Composite materials diverge fundamentally from this behavior, as they are engineered to exhibit superior strength characteristics along specific directional axes. 
This intentional introduction of anisotropic properties represents a defining advantage of composite materials in structural applications.
Given these material characteristics, the assessment methodology should incorporate failure criteria specifically developed for composite materials. Appropriate options include the ZTL criterion, Hashin criterion, or Puck criterion @Altenbach2018 @markmiller2024cas.

// ---------------------------------- here ---------------------------------- //
The quantitative evaluation approach presented in @fig_78 enables the assessment of #gls("ld") behavior in three-dimensional space. 
The precision of this evaluation relies upon multiple parameters that require proper examination. The selected procedure for transforming one-dimensional discretized loads into three-dimensional force distributions constitutes a principal factor that shapes the evaluation outcomes. 
Additionally, the particular structural configuration of the #gls("swith") introduces further complexities into the evaluation process. It can be assumed that the #gls("ld") optimization efficacy correlates with the uniformity of material properties, notably the consistency of stiffness characteristics throughout the structure.
In practical applications, the open-source tool meshio @schlomer2022meshio provides comprehensive capabilities for processing element and nodal values, enabling the calculation of deviations between distinct #gls("fem") solutions. 
This functionality extends to open-source platforms while remaining compatible with various commercial #gls("fem") solvers, thereby providing a systematic approach for structural response comparisons

// --------------------------------- summary -------------------------------- //
#summary_([
The analysis of structural methods suitable for optimization framework integration examined beam modeling and detailed #gls("fem") analysis. Considering computational efficiency, implementation requirements, educational benefits, open-source availability, and particularly the early developmental stage of #glspl("swith"), beam modeling emerged as the appropriate choice. Subsequently, it was demonstrated how the beam model solver could be integrated within an optimization framework to answer questions relevant for #gls("ld") through #glspl("lie") for experimental structural testing.
])