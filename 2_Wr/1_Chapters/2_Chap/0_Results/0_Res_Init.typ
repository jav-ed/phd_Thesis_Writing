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


// --------------------------------- opti A --------------------------------- //
lets start with the first optimization model. The objective fucntion is given in
// @


// explain design vars, bounds, constraints
// scipy 


// adapt figure caption
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/0_True_Bem_combined.svg", 
  width: 85%),
  caption: [beam schematic, reaction forces, shear and bending moment distirbution over the normalized span for optimization model A.],
)<fig_79>


// TODO png looksn terrible, need to be replaced through proper svg using inkscape
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/1_Pos_Graph.png", 
  width: 100%),
  caption: [scetch to understand the constraints, visuallay],
)<fig_80>

// TODO png looksn terrible, need to be replaced through proper svg using inkscape
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/out.svg", 
  width: 100%),
  caption: [out],
)
// TODO png looksn terrible, need to be replaced through proper svg using inkscape
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/inksccape.svg", 
  width: 100%),
  caption: [out],
)

$ x_("cl",i)": collet length"$

$x_i": centroid position"$

$x": span direction"$

$x$

$x_i$

$x_("cl",i)$


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

// interpret the results 

// give an reason why you selected collets - say one side open collets as mentioend  in @ 

for the ongoing work we will assume that we 
// this was based on the demand of having enough free visible area such that optical devices can be used.
// furthermore they can be obtained easily, the IMA has high experince with their application
// the knowledge of already carried out optimiaztions for the IMA was included in thsi decision.
// finally the one side open collet reduces the risk of constraint forces
// inspired from these real world experince, the collets is chosenm. therefore in the figure it will be called collet placing.
// yet, again, one of the main objetive of the optimiaztion is to answer questions, which could lead to another gls("lie") than the collet.
// therefore, combining the reasonong provided in @ and the otucome here in the optimiaztion with your project specifix requirements, another #gls("lie") could be selected.


// --------------------------------- opti B --------------------------------- //
// now introduce that this is the next optiiaztion model that could have releveance for real world application
// explain why 

// beam model 
// results + interpret

