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

The global goal is to answer important questions for the experimental trial. Among other things, how many #glspl("lie", long:true) should be used, where should they be placed, and what forces should be applied. 
// give an intro for that we want to compare fem and beam solver based optimization
// wording can be improved
If a suitable objective function can be found, this question could be answered directly with a #gls("fem") coupling. 
In other words, it is entirely possible for the optimizer to have access to the #gls("fem") solver. In this case, the optimizer could obtain important structural information through a #gls("fem") calculation while exploring the unknown territory. Since optimization is generally an iterative process, a #gls("fem") solution would be needed for each individual function evaluation. 
However, within a single iteration step, 
// word significant overused
significantly more function evaluations might be required. This can be understood particularly easily using an evolutionary algorithm as an example. 
In each individual iteration step, multiple parameter combinations for the design variables are examined. 
For each individual parameter combination, at least one function evaluation would be required. Depending on how exactly the objective function is defined, multiple function evaluations might also be required for a single parameter combination. The latter would be possible if two #gls("fem") calculations were necessary as an input for the objective function. 
If a function evaluation is cost-efficient in terms of time and hardware, this factor can be neglected.

However, with a three-dimensional structural model of an #gls("swith", long:true), the summation of multiple function calls of a #gls("fem") calculation might be unacceptably high under certain circumstances. 
This is the first reason why an alternative to the #gls("fem") calculation in the optimization loop was sought. 
The other reason is that when defining an optimization function as elaborated in @chap_4_0_3 often the final objective function with its design variables, bounds and constraints are found thorugh an iterative process. 
If each individual optimization were associated with about a week to a month of calculation time, undesirable limitations would occur. When comparing the beam model with the #gls("fem") calculation, the following is clear: The beam model has lower accuracy reproduction, but is faster in calculation than the high-quality #gls("fem") model.
// proper intro to a more detailed comparision
in the following a detaield comparison between modeling the structral behaviour through a beam model or through #gls("fem") shall be given

// advantage of the beam model 
desinging a beam model is faster, thus variiation of multiple different beam models is faster  
if have to learn new about beam model, can be understood easier than fem
free and open-source implementations in Python available as mentioned in @chap_4_0_2
mathamtical and theory behind it can be comphrenseded eaiser than of Fem,
calculation time 
// word significant overused
significant lower than those fem, highly advantge for optimiztation because of the mentioned multiple function calling
calculation can be done on a regular laptop or even on a raspberry pi
// some other adanvatage that can be integrated if not duplicated:
// 	1. personal pc, laptop, even smartphzone can be assumed to suffice
// 	2. costs go down
// 		1. no need to rent high perfomance clusters
// 	3. environmetal impact goes down
// 	6. easier to debug if somehting goes wrong
// 	7. easier to expand, because of some of the rasons mentioned above
// 	8. can be used for teaching students

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
