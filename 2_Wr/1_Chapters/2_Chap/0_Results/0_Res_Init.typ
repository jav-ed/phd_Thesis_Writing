/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */
#pagebreak(weak:true)


// TODO section required
// subsection required 
// proper intro for section and subseciton required


// TODO Title
= Results <chap_5>

// what expected to see here and why
the colloboration with IMA helped to find some real world demands. Based on these findings, the found demands shall be provided as the formualtion of optimization probelems. The optiiaztion formaulaiton shall be provided, explained, solved and 
// maybe add, also interpreted when required
depcited.
Moreover, based on the multiple optimization problem defintions the flexibility of the presented approach can be seen.
The conducated optimiaztions are presented as optimization cases. Where it starts from Optimiaztion Case A where it is the most straight forward and simplest approach. 
// the idea is to descirbe that for K2H2 much coorperation was conducted with IMA. We had some iterations, some optimizatiosn were presented. IMA told, they need this and that. And such so we got to more concrete optimiaztion defintions - which have high relevance for actual real world application.
// yet depending on what is actually needed, any of presented optimization case could be the right one. it does not have to be last and most compelx one.
// through shwoing multiple optimaiztion cases, it is also hihglgihted how optimiaztion can be used to incorpaorte multiple and different real world demands, that likely aircraft manufacturer or any testing company would have.
 togehter, iteratively more concrete and complex demands for the optimiaztions were added. These were found through presented  form real world demands through the cooprtation with IMA, additional optimization cases were added.


== Optimization Case A <chap_5_0>
// --------------------------------- opti A --------------------------------- //
lets start with the first optimization model. The objective fucntion is given in
// @


// explain design vars, bounds, constraints
// scipy math notation


// beam model
// adapt figure caption
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_A/0_True_Bem_combined.svg", 
  width: 85%),
  caption: [beam schematic, reaction forces, shear and bending moment distirbution over the normalized span for optimization model A.],
)<fig_79>

// important note
the optimizaiton was carried out using the units Nmm. Since Nmm is more accurate than Nm, therefore the bending moment infromaiton on the beam model depicted in @fig_79 are in Nmm. Yet, for püractical applicaiton the units are desired to be shown in Nm, there fore in the upcoming optimization result depcitions, the bending moments are shown In Nm.


// constraints
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/1_Pos_Graph_Ink.svg", 
  width: 100%),
  caption: [scetch to understand the constraints, visuallay],
)<fig_80>


// explain beam model boundary coniditons - need heavy language modifcation - just quick fragements
@fig_79 shows the beam model and it solution that used as reference for the optimization.
the first row in @fig_79, the beam schematic is depicted. it gives infromaiton about the poissiiton and type of the support. here it can be observed that at the left beginning of the beam, there is a clamp, that is, the the movement along the horizontal and vertical direction are not permitted.
Also it can bear a bending moment.
Next, the arrows in the beam schematic give infromation about the direciton of the force. Since the aerodynamical force is pointing upwards to keep the airplaine in the air, the arrows point upwards. 
Comapring @fig_79 to @fig_70, the concrete values of the disitrbuted laods are not given. The reason for that is, that the, aerodynamical force that was obtained through APAME as is obtained as many disitrbuted laods as explained in @chap_4_0_1.
The high number of these loads, does not allow to add the concrete numbered values of the actual distributed load. Otherweise it would be so mcuh text, that no single disibutrion load as actual load quanity could be read.
Therefore the added red distirbution is meant to give informaiton about the true aerodynamic load distribution.

The reaction forces in @fig_79 are given in second row and provide value infromation about the reuslting shear force and bending moment that are acting at the position of support points.
The thired and fourth rows of @fig_79 depict the shear force and bending moment diagram.
For all subfigures the span length was nromlaized
This information is important since it exaplins why the maximal bending moment has such a hihg mangnitude. Furthermore, it is important to know, the longer the span is, the bigger the available design space becomes.
A big design space mean that the optimizer has to go through more possible design variable combinations to find an optimized result. Thus, the computaitonal for an optimiaztion with a high span length is expected to increase the computatioanl time.  
// make it more clear that a span length of 1 mm spans a design space between 0 and 1
The number of possible combinations is smaller on span length that is strected between 0 and 1 mm.
Contrary to this notion, as mentioned in @chap_1_0_6 large aircraf can have span lengths of around $80 "m "$ or $num("80000") "mm"$. 
However, currently no large #gls("swith") is known, yet as mentioned in @chap_0_7 APUS @APUS_0 attempts to design and manufacture a small #gls("swith").
Because higher span lengths increase the availabel design space for optimiaztion and because the i-2 of APUS is a small aircraft, the optimiaztion provided here are focused on a beam length that fits small aircraft.
Furthermore, with the asusmption of the wings being symtrically along the vertical axis, the half span can be used.
In this case the length was chosen to be simmilar to the halfspan of the Apus i-2 @APUS_1.
However, note that the presented method can be used regardless of span length. 
// maybe the repetation is not fine here?
The only as mentioned drawback with a high span length is that the calculation time for the optimiaztion is inccreased.


// shows results of optimiaztion
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_A/int_Forc_4.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization model A. 4 #glspl("lie") was selected.],
)<fig_81>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_A/int_Forc_8.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization model A. 8 #glspl("lie") was selected.],
)<fig_82>

// optimiaztion progress
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_A/opti_Bar.svg", 
  width: 95%),
  caption: [optimization model A. shows objective funciton values and the required number of iterations for the differen number of #glspl("lie").],
)<fig_83>


// interpret the results 
// explain impact of number of lies through fig_83
// if you can mention that kmeans centroid pos gives helpful convergence behaviour



// --------------------------------- opti B --------------------------------- //

== Optimization Case B <chap_5_1>
// now introduce that this is the next optiiaztion model that could have releveance for real world application
// explain why 

// beam model 

// needs better structre, potentially duplacites, make it more clear
the beam model is NOT the same is in case A. it was changed to a support type which was beleived to be more relasitc for a #gls("swith"). This first highlgihts the fact that the chosen beam models needs to be flexible, that is powerful in allowing to make changed. next it needs ot be quick such htat these changes are possible within a short time frame.
The ratioanle behind this support decision cannot shared with the public. Nonthelöess, regarldess of the rationale, an actual support type for an actual #gls("swith") is not public available. The later is partly because there is no #gls("swith") available for comerical bought. Again because of the innovative factor the actual final support system can be very different from presented here. Also, in case one day many #glspl("swith")  should be availabel, there is no gurantee that all #gls("swith") will ahve the same support system. Chances are they are not going to have them - which again is a reason why a flexible beam modeler is required

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/0_True_Bem_combined.svg", 
  width: 95%),
  caption: [optimization model B. shows objective funciton values and the required number of iterations for the differen number of #glspl("lie").],
)

// results 
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/int_Forc_4.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization model B. 4 #glspl("lie") was selected.],
)

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/int_Forc_8.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization model B. 8 #glspl("lie") was selected.],
)

// important note for the overlapping text for figutre with 8 lies
in fig (the one above) the paclement of the #glspl("lie") - 8 vairation -the force text is alternating shifted in the vertical direction which was done on purpose.
Otherwise the text would have intersected with each other and no reaidbility would be given.
Furhtermore the scale was kept to maintain consitancy. with this deicion the other subplots keep the same axis scaling. Due to the colorcoded text looking carefully still allows to get all relevant information.


// optimiaztion progress
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/opti_Bar.svg", 
  width: 95%),
  caption: [optimization model B. shows objective funciton values and the required number of iterations for the differen number of #glspl("lie").],
)




// results interpretation


// compare against case A
