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

// explain beam model boundary coniditons
note that the span was normalized. This information is important since it exaplins why the maximal bending moment has such a hihg mangnitude. Furthermore, it is important to know, the longer the span is, the bigger the available design space becomes.
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

