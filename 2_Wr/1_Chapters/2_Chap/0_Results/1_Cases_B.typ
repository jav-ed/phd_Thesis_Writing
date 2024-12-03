/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


// --------------------------------- opti B --------------------------------- //

== Optimization Case B <chap_5_1>

// ------------------------------- beam model ------------------------------- //

// needs better structre, potentially duplacites, make it more clear
The beam model used for tehe optimiaztion case B is depcited in @fig_84. It is  NOT the same is in case A. it was changed to a support type which was beleived to be more relasitc for a #gls("swith"). 
Instead of having one single clmap at the beginning of the wing, now two are placed with a small distance to each other.
The first support prevents the displacment in the horizontal direction and the can bear a bending moment. However, it allows the movement in the vertical direciton.
The second support allows a movement in the horizontal direction, but prevents the movement in the vertical direction and also can bear a bending moment.
This kind of unconverntional support system first highlgihts the fact that the chosen beam modler needs to be flexible, that is powerful in allowing to make changes. 
This unconverntional support system was approved by the IMA and 
not all aspects of the ratioanle behind this support decision cannot shared with the public. Nontheless, regarldess of the rationale, an actual support type for an actual #gls("swith") is not public available. The later is partly because there is no #gls("swith") available for comerical bought. Again because of the innovative factor the actual final support system can be very different from presented here. Also, in case one day many #glspl("swith")  should be availabel, there is no gurantee that all #gls("swith") will ahve the same support system. Chances are they are not going to have them - which is another reason for why a flexible beam modeler is required

From the first row of @fig_84 it can be observed that the aerodynamical force is not applied along the full wing.
This is contrary to the regular wing, #glspl("swith") are not manted to have pressure tanks that go through the entire wing.
It also could be that there are two or more wing sections that can be put on, down or replaced with another wing section.
So the right side where no aerodynamic force is applied, these are locations where the wing sections are replaceable and the pressurized tubes are only  within the inner wing.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/0_True_Bem_combined.svg", 
  width: 95%),
  caption: [optimization model B. shows objective funciton values and the required number of iterations for the differen number of #glspl("lie").],
)<fig_84>

// now introduce that this is the next optiiaztion model that could have releveance for real world application
// explain why 



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
