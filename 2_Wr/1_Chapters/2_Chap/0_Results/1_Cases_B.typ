/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


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
Furhtermore the scale was kept to maintain consitancy. with this deicion the other subplots keep the same axis scaling.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/int_Forc_4.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case B. 4 #glspl("lie") was selected.],
)

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/int_Forc_8.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case B. 8 #glspl("lie") was selected.],
)




// optimiaztion progress
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/opti_Bar.svg", 
  width: 95%),
  caption: [optimization model B. shows objective funciton values and the required number of iterations for the differen number of #glspl("lie").],
)




// results interpretation


// compare against case A
