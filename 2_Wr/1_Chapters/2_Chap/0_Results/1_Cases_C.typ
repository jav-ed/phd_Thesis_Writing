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


// --------------------------------- opti D --------------------------------- //

== Optimization Case D <chap_5_3>
// talk about overlappting collets and how this issues was resolved
// case L,M,N,O
// D 50%
// D 66% 
// D 71%
// D 75%

// beam model - the same as in B/C

// results 
depicted only the resuls that were found by the optimizer while not violating any constraints.
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_50/int_Forc_8.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization model D. 4 #glspl("lie") was selected.],
)

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_66/int_Forc_7.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization model D. 8 #glspl("lie") was selected.],
)

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_71/int_Forc_6.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization model D. 8 #glspl("lie") was selected.],
)

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D_75/int_Forc_5.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization model D. 8 #glspl("lie") was selected.],
)



// optimiaztion progress
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_D/1_L_Comb_Obj.svg", 
  width: 100%),
  caption: [optimization model D (50%, 66%, 71%, 75%) shows objective funciton values and the required number of iterations for the differen number of #glspl("lie").],
)

// intepret convergence behaviour
// solutions are found, however,t he constraints are violoated


// results interpretation


// compare against case A, B, C

