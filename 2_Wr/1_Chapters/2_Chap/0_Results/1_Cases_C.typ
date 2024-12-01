/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// --------------------------------- opti C --------------------------------- //

== Optimization Case C <chap_5_2>
// now introduce that this is the next optiiaztion model that could have releveance for real world application
// explain why 

// beam model 

// the same as in case B
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_C/0_True_Bem_combined.svg", 
  width: 95%),
  caption: [optimization model C. shows objective funciton values and the required number of iterations for the differen number of #glspl("lie").],
)

// results 
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_C/int_Forc_4.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization model C. 4 #glspl("lie") was selected.],
)

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_C/int_Forc_8.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization model C. 8 #glspl("lie") was selected.],
)

// important note for the overlapping text for figutre with 8 lies
in fig (the one above) the paclement of the #glspl("lie") - 8 vairation - has some overlapping text, which decreases reaidbility, the scale was kept to maintain consitancy. with this deicion the other subplots keep the same axis scaling. Due to the colorcoded text looking carefully still allows to get all relevant information.


// optimiaztion progress
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_C/opti_Bar.svg", 
  width: 95%),
  caption: [optimization model C. shows objective funciton values and the required number of iterations for the differen number of #glspl("lie").],
)




// results interpretation


// compare against case A and B

// ------------------------------ final results ----------------------------- //
// exokain which lie was chosen and why -> selected collets 
// note some of the statements made below were before the plotting codes were modifed
// give an reason why you selected collets - say one side open collets as mentioend  in @ 

for the ongoing work we will assume that we aew
// this was based on the demand of having enough free visible area such that optical devices can be used.
// furthermore they can be obtained easily, the IMA has high experince with their application
// the knowledge of already carried out optimiaztions for the IMA was included in thsi decision.
// finally the one side open collet reduces the risk of constraint forces
// inspired from these real world experince, the collets is chosenm. therefore in the figure it will be called collet placing.
// yet, again, one of the main objetive of the optimiaztion is to answer questions, which could lead to another gls("lie") than the collet.
// therefore, combining the reasonong provided in @ and the otucome here in the optimiaztion with your project specifix requirements, another #gls("lie") could be selected.