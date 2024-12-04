/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// --------------------------------- opti C --------------------------------- //

== Optimization Case C <chap_5_2>
// now introduce that this is the next optiiaztion model that could have releveance for real world application
// explain why 

For the optimization case C, the udnerlying beam model is the same as presented in optimiaztion case B, thorugh @fig_84.
The defintion of the optimiaztion is also the same as in case B as provided with @eq_113.
The main contribution of optimiaztion case C stems from a demand that is very likely to oocur in real-world applicaitons.
It could be that on the aircraft there are certain parts of the wing-tube section that that are not allowed for having #glspl("lie") placed there.
This could be for instance when the propulsion and the landing gear are mounted on the wing-tube section and cannot be removed.
Even in the case they can be removed, chances that strcutral connection elements are at place, which would hinder to place regular #gls("lie") there.  
Since the output of k-means++ provides centroids, which are the central position of the #glspl("lie") the input matrix $bold(X)$ for the k-means++ alogoithm can be modifed. For that case it is assumed that the are between $approx 0.21$ and $ approx 0.289$ are progibitted for having #glspl("lie") placed here.
For this, all forces that are within this prohibited domain are shifted to the left and to the right of it.
With this the centroids can only be placed outside of the prohibitted domain.
For the shifting, center posistion of the prohibitted domain can be calculated. 
// you are wathcing from the center - make it more clear
Depending on wheter the considered force point is closer to the right or left side, the force is shifted with the the half length and some added constant either to the right or to the left.

The results for the optimaiztion case C for four and eight #glspl("lie") are given in @fig_88 and @fig_89, respectively.
The imapct of the prohibitted domain can be seen in the first rows, where the optimized load is not placed within the region $approx 0.21$ and $ approx 0.289$.
Because of this added constraint, the objectuve function is expected to get worse, as can be verified through @fig_90.
Comapring the impact of the #glspl("lie") thorugh @fig_90 it can be noted that contrary to the result seen in optiimaztion case A and B, in C, a higher number of #glspl("lie") does not always lead to a lower objective function. For the case C, the best best objective funciton is obtained with six #glspl("lie") with a objective function value of $97.04 "Nm"$

// results 
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_C/int_Forc_4.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case C. 4 #glspl("lie") was selected.],
)<fig_88>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_C/int_Forc_8.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case C. 8 #glspl("lie") was selected.],
)<fig_89>


// optimiaztion progress
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_C/opti_Bar.svg", 
  width: 95%),
  caption: [optimization case C. shows objective funciton values and the required number of iterations for the differen number of #glspl("lie").],
)<fig_90>




// results interpretation


// compare against case A and B

