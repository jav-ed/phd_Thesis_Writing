/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// import graphs
#import "../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/4_Beam_Optim/1_Opti_Step.typ": *


// INFO
// all refs
// all figs - the image data was not copied
// all eqs
// compared with true german text

// TODO proper justification why used and not why fem is used
// firt explain some basics aout beam model, then about optimiaztion, then the reasoining provided why beam model can be used with optimization over FEm and optimiaztion are more clear to understand in 4_Beam_Opti

// Title
=== Combination of Optimization and Beam Model <chap_4_0_4>
// this pre intro of the upcomoing text inside the subsection. this might not be fully consistent with the actual content
In @chap_4_0_0 it was explained how to discretize load distributions, in @chap_4_0_1 how to obtain the aerodynamic loads, in @chap_4_0_2 important fundamental information about the beam model and in @chap_4_0_3 some general background about optimization was provided. 
This subsection builds upon the collected knowledge and expaplins how the beam model solver can be incorporated into a optimiaztion framework. 
Furthermore, it will first explain what goal such a constellation pursues. Afterward, the advantages and disadvantages of the chosen systematic approach will be mentioned.
// add the following: it was explained why beam model solver was used instead of fem solver 
// -------------------------------------------------------------------------- //

The primary objective centers on determining optimal parameters for the experimental structural testing of #glspl("swith", pl:true). Among others, these parameters encompass the quantity of #glspl("lie", long:true), their spatial distribution throughout the test structure, and the magnitude of forces applied during testing. The determination of these parameters could be achieved through direct coupling with a #gls("fem") solver, provided appropriate optimization formulations are established. This computational approach would enable the optimization algorithm to access detailed structural information through #gls("fem") calculations while exploring the available solution space.
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
A methodological comparison between beam model and #gls("fem") approaches reveals their fundamental characteristics regarding accuracy and computational requirements. While beam models exhibit reduced accuracy in structural response reproduction, they demonstrate enhanced computational efficiency when compared to detailed #gls("fem") analyses. This trade off manifests in several practical advantages that warrant careful consideration.
The development and implementation of beam models present notable efficiency advantages. Model creation proceeds with increased rapidity, enabling engineers to evaluate multiple design variants within compressed time frames. This accelerated development cycle facilitates comprehensive exploration of structural configurations, providing valuable insights.
The theoretical foundation of beam models offers distinct educational and practical benefits. The mathematical principles underlying beam theory demonstrate enhanced accessibility for practitioners new to structural analysis. 
These fundamental concepts present reduced conceptual barriers when compared with the mathematical complexities inherent in #gls("fem") formulations. Such accessibility extends to educational settings, where students can engage effectively with structural analysis concepts through practical implementation.

The computational implementation draws substantial benefit from available open source Python libraries, as documented in @chap_4_0_2. These frameworks maintain mathematical transparency while providing accessible tools for beam analysis implementation. The modest computational requirements enable analyses on standard computing hardware, eliminating dependence on specialized computational resources. This accessibility yields additional advantages, including reduced financial costs and environmental impact associated with computational resource usage. Furthermore, the relative simplicity of beam models can expedite the identification and resolution of numerical issues during development.
The computational efficiency of beam models proves particularly advantageous within optimization frameworks. The reduced calculation times become especially valuable when considering the numerous function evaluations required for optimization procedures. This temporal efficiency permits more extensive exploration of design spaces within practical time constraints, potentially enabling more comprehensive optimization studies. Such advantages become particularly relevant when considering the iterative nature of optimization processes explained previously.

// -------------------------------------------------------------------------- //

// some here, but please complete it
desinging a fem model takes more time, special solver required, could cost money, #gls("swith") is innoative, thus therefore there is no single #gls("swith") available that could be bought. 
// At this early stage focusing on a single #gls("fem") model could have disadvantages, because there is no ensurance, that the one model cretead is the one that is actually  --- see the following, especially ion the context that fem modiufcations are time intensive
// 1. using a complex strucutre can be aruged of no actual benefit at the moment
// 	1. the goal would be to not only do caluclations because we can do them, but do calucaltions that have soe meaining
// 	2. the meaning would occur, if we have a actual aircraft for which we could do some calucaltion
// 	3. for the moment too early to decide one one special geomtry or confiuguration
// 	4. reason for that: it could change, there is a lot of research that needs to be done until we are at the point that we know what works and what not. for the moment to much design variables that could change. their change could have quite big impacts. so results for one complex geomtry not represent work for a jother. for exampoel it could be, that we have chosen a complex gemotry where the simmilarity is just fine and the mehtod seems to work. if non experts who have not fully understood the idea behind it, see some of the results, they might assume, they could simply use this. this could go very wrong for another complex gemotry. in could be that the change in the geomtry now not any longer allow to make use of this method in a feasible way (not close enough to fem).
// 	5. in order to understand when this metrhod can be used and when not, very heavy and long parameter studies are required. for this however, we would need already build aircrafts that we could compare to each other. based on that compairsion we could idifenty the parameter that have changed. now these parameter could changed to carry out the parameter study to find out wherter the simpler beam method is accruate enough or the compuationally hevaier fem is required.
   


// say you chose the beam model in proper 

// ------------------------- optimizer step overview ------------------------ //
The overview how to combine the knowledge provided from @chap_4_0_0 to @chap_4_0_3 into an optimiaztion framework shall be given through @fig_77.
From @fig_77, it becomes apparent that APAME was used to obtain the aerodynamic loads. These were, as already explained in @chap_4_0_1, converted into a one-dimensional aerodynamic distributed load. 
This load can now be sent to the beam model solver as input. The output is the shear force and bending moment distribution of the actual aerodynamic loading $Q_"true", M_"true"$. 
On the lower right side of  @fig_77 it can be observed that the optimizer sends a combination of design varaibles to the beam model solver. The solution of the beam modeler is now called discrete or optimized shear force distribution $Q_"optim"$ and  bending moment distribution $M_"optim"$.
The task of the optimizer is to find these design variable such that the difference between the actual bending moment distribution and the optimized bending moment distribution is as small as possible. 
For this the deviation between $M_"optim"$ and $M_"true"$ , which in @fig_77 is denoted as $Delta M = M_"optim" - M_"true" $.

// adapt caption
#figure(
    box(
    stroke: 1pt, // defines the border thickness
    radius: 5pt, // optional: adds rounded corners
    inset: 1.3em, // adds some padding between content and border

    diag_opti_step
  // -------------------------------- box end ------------------------------- //
  ),
  caption:[Rough Illustative overview of one iteration of how the optimizer works ]

  )<fig_77>

With a choice of design variable combination a $Delta M = M_"optim" - M_"true" $ is achieved. The smaller $Delta M$ the closer the bending moment distribution is to the true bending moment distribution that is achieved when the APAME aerodynamic load is applied. The initial objective function thus can be stated as @eq_106.
Here the index the objective function is denoted as $J$, the index $i$ is used to highlight that it is a moment distribution, $n_s$ denotes the total number of measurement points and the absolute value are taken according to the mean absolute error or the L1 norm as given in @eq_72.

$ op("argmin",limits: #true)_(bold(x)_d)   J = (sum_(i)^n abs(M_("true",i) - M_("optim",i)))/n_s $<eq_106>

Furthermore, it shall be noted when giving optimization problems small bold letter stand for vector. Consequently, the design variable vector $bold(x)_d$ can contain multiple design variables.
While it would also be ppossible to integrate the shear force into the objective function $J$, soley the bending moment deviation was chosen, because bending moments is assumed to have a better representation of the characteristics of the structural behaviour.
// not that clear - could be improved
Depending on the concrete requirements the design variables, bounds and constraints change. Thus, for each investigated case the optimization problem including design variables, bounds and constraints are explained along in @chap_5.
However the overall optimiaztion function given in @eq_106 remains consistent across all made investigations in @chap_5.

For the numerical optimizer, the differential evolution algorithm @Storn1997 @osti_1163659 @Suganthan2012 @Wong @Wang2012 implemented in the freely and openly available numiercal tool SciPy @Virtanen2020a was used. 
The reasons for chosing it that it can be combined well with the other open-source and free tool, that is, the beam model solver IndeterminateBeam @interdetbeam_tool.
Thus, the work can be recreated by others in order to build upon it without much financial backing required.
Furthermore, SciPy can be obtained without any barriers, it can be installed easily and there is great number of online documentation, making its application fast and reliable.
Furthermore, the implementation of the differential evolution in scipy can leverage multiple #gls("cpu") cores and offers a high number of customizations.

// --------------------------- application to lie --------------------------- //
Once the final discretization of the aerodynamic load is obtained through the optimization important question such as the lengths of the #glspl("lie", long:true), their number and the magnitude of the forces are known. Concrete examples on this are shown in @chap_5 .
Depending on the required accuracy and the selected #glspl("lie") the 1d discreitiized forces from the optimizer suffices and can be directly incorporated into an experimental test.
The latter can be understood when for example vieweing collets. Since collets encapsulate the entire airfoil profile the force magntiude could be applied at the center of the collet.
For two reasons it could be desired to transfer the resulting ndiscreizized 1d back to a 3d discreizized force vector.
The first one is, if for the experimental tests it is desired to pinpoint forces at local areas instead over an entire profile section.
Another reason is given through @fig_78. It can be observed that the discretized load, which is the output of the optimization is transferred such that it can be applied again onto the 3d #gls("fem") model of the #gls("swith").

// -------------------------------------------------------------------------- //
  #figure(
    box(
      stroke: 1pt, // defines the border thickness
      radius: 5pt, // optional: adds rounded corners
      inset: 1.3em, // adds some padding between content and border

      diag_comparison_beam_opti_2
 
    ),
    caption: [Exemplary illustration of the internal force distributions from @fig_70],
  )<fig_78>

The lower left part of @fig_78 shows that the continuous aerodynamic as received from APAME is injectied into the #gls("fem") model.
Now both versions are send to a comparision block. In this block the deivation with resepct a structral meaniningful quantity could be caluclated, such as the deviation, stress, strain.

In order to derive a proper assessment criteria, two main things need to be considered.
First  #glspl("swith") are expected to be made of #gls("cfrp") material.
Seocnd one of the major goals of the comparison is to determine wheter the overal strucutral behaviour remains consistent, that is, no unexpected local failure, same failure modes, consistent palces and magntiude of stress, strain peaks and general stress and strain distribution should match. 
Because composite material is used, failure criterion such as the Von Mises failure criterion cannot be used @Altenbach2018 @markmiller2024cas.
Von Mises failure criterion was developed for metals. Here the material behaves the same way in all directions (isotropy). In metals, this makes sense because their crystalline structure is typically randomly oriented, so statistically, the properties are the same in all directions @Hans_Bargel_2022. However, composites are intentionally designed to be stronger in some directions than others. This directional dependency (anisotropy) is actually the main advantage of composites.
Instead criterion criteria such as ZTL, Hashin, or Puck @Altenbach2018 @markmiller2024cas should be used as the assesment criteria.

With a proper assesment criteria the comaprison block from @fig_78 can be used to determine how well #gls("ld") performed in 3d.
The latter depends on multiple variables. First, it depends on the methods that were used to tranform the 1d discreiized load into 3d. Second, it depends on the considered model of the #gls("swith"). It is assumed that the more consistent material properties like the stiffness remain, the better the #gls("ld") through the optimization should work.
For practial applications, if open-source #gls("fem") solver are used and for some commerical #gls("fem") solver as well, the free and opensource tool meshio @schlomer2022meshio can be used to easily work with element and nodes values to obtain the deviations between two #gls("fem") results.

// --------------------------------- summary -------------------------------- //
// summary based on the provided text above is missing
