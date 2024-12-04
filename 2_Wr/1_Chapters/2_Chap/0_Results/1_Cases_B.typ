/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


// --------------------------------- opti B --------------------------------- //

== Optimization Case B <chap_5_1>

// ------------------------------- beam model ------------------------------- //

// needs better structre, potentially duplacites, make it more clear
The beam model used for tehe optimiaztion case B is depcited in @fig_84. It is  NOT the same is in case A. it was changed to a support type which was beleived to be more relasitc for a #gls("swith"). 
Instead of having one single clamp at the beginning of the wing, now two are placed with a small distance to each other.
The first support prevents the displacment in the horizontal direction and the can bear a bending moment. However, it allows the movement in the vertical direciton.
The second support allows a movement in the horizontal direction, but prevents the movement in the vertical direction and also can bear a bending moment.
This kind of unconverntional support system first highlgihts the fact that the chosen beam modler needs to be flexible, that is powerful in allowing to make changes. 
This unconverntional support system was approved by the IMA and 
not all aspects of the ratioanle behind this support decision cannot shared with the public. Nontheless, regarldess of the rationale, an actual support type for an actual #gls("swith") is not public available. The later is partly because there is no #gls("swith") available for comerical bought. Again because of the innovative factor the actual final support system can be very different from presented here. Also, in case one day many #glspl("swith")  should be availabel, there is no gurantee that all #gls("swith") will ahve the same support system. Chances are they are not going to have them - which is another reason for why a flexible beam modeler is required

From the first row of @fig_84 it can be observed that the aerodynamical force is not applied along the full wing.
For regualr aircraft wings usally the whole wing is desired to be laoded with the aerodynamic load. However, for #glspl("swith") there are rea-world reasons why not the entire full wing shall be laoded witht he aerodynamic forces.
The first one is that the pressurized tubes of #glspl("swith") are not mandated to have tubes that go through the entire wing span lenght. 
It could be that tubes are only placed only inside the inner wing and the outer wing is made tank-free.
This design would allow to have replaceable outer wing sections. 
Replaceable outer wing sections can have many benefits.
First by being flexible in chaning the outer wign, aerodynamic properties of the aircraft can be modieed. One main #gls("swith") design could be used with replaceable outer wings to suffice for different requirements and needs.
Next, if the outer wing would be replaceable, it could be removed to get access to the tubes.
Furhtermore, since #glspl("swith") are an innoative project, where the pressurized tubes are presenting the main modifcation, this would allow to conduct simulaitons and experiemntal investigations soley on the wing-tube section while adding a potential dummy structre as the outer wing.

Next from the row of @fig_84 it can be observed that there is small distance between the left and right support and there is no aerodynamic load on this gapa s well.
The reason for that is this gap representing the fueselage and its connection with the wing. 


#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/0_True_Bem_combined.svg", 
  width: 95%),
  caption: [beam schematic, reaction forces, shear and bending moment distirbution over the normalized span for optimization case B.],
)<fig_84>

// now introduce that this is the next optiiaztion model that could have releveance for real world application
// explain why 

The deifntion of the optimization problem for the optimiaztion case B is given in @eq_113

$
op("argmin",limits: #true)_(bold(x)_d) 
J_B = &(sum_(i)^n abs(M_("true",i) - M_("optim",i)))/n_s \

// constraints
"subject to" quad 
& x_("cl",i)/2 <= "ha" - x_i - Phi\
& x_("cl",i)/2 <=  x_i \
& sum_i^n x_("cl",i) <=  "ha" - Phi \

// bounds
"bounds" quad 
& 0.03 "ha" <= x_("cl",i) <= "ha"/n_"cl"
$<eq_113>

Comparing the optimiaztion problem B with A, it can be noted that the first and thrid constraint have changed. In the first constraint the variable $Phi$ was introduced and it denotes the outer wing length. Therfore, the first constraint only allows #glspl("lie") to be placed within the inner wing. 
The third constraint demands that the sum of all #gls("lie") lengths need to be within the length of the inner wing.
While the effective length of the #glspl("lie") was reduced, the the bounds were kept as in optimiaztion case A. This was done because the bounds and the consrtaints togehter will ensure that the #glspl("lie") do not become longer than allowed.
However, this time the #glspl("lie") lengths are more flexible. It could be that the legnth of one #gls("lie") is notably higher than of others. This should generally improivde in minimzing the objective funciton. 
Similar as done for the optimiaztion case A, the matrix notaiton that is relevant for practial computaitoanl iompleemtnation is given as @eq_114 to @eq_116.

// ---------------------------------- scipy --------------------------------- //
// ------------------------------ constraint 1 ------------------------------ //
$
underbrace(
mat( 0; 0; 0; dots.v; 0 ) ,
bold(l) \
"left side"
)

<= 
underbrace(
mat(
  1/2, 0, 0, dots.h, 0; 
  0, 1/2, 0, dots.h, 0; 
  0, 0, 1/2, dots.h, 0; 
  dots.v, dots.v, dots.v, dots.down, 0; 
  0, 0, 0, dots.h, 1/2; 
),
bold(A)_c \
"design variable
coefficient matrix"
)

underbrace(
mat(
  x_("cl",0);
  x_("cl",1);
  x_("cl",2);
  dots.v;
  x_("cl",n-1)
),
bold(x)_d \
"design variables"
)

<=
underbrace(
mat(
  "ha" - x_(0) - Phi;
  "ha" - x_(1) - Phi;
  "ha" - x_(2) - Phi;
  dots.v;
  "ha" - x_(n-1) -Phi;

),
bold(r) \
"right side"
)

$ <eq_114>

// ------------------------------ constraint 2 ------------------------------ //
$
underbrace(
mat( 0; 0; 0; dots.v; 0 ) ,
bold(l)\
"left side")

<= 
underbrace(
mat(
  1/2, 0, 0, dots.h, 0; 
  0, 1/2, 0, dots.h, 0; 
  0, 0, 1/2, dots.h, 0; 
  dots.v, dots.v, dots.v, dots.down, 0; 
  0, 0, 0, dots.h, 1/2; 
),
bold(A)_c \
"design variable
coefficient matrix"
)

underbrace(
mat(
  x_("cl",0);
  x_("cl",1);
  x_("cl",2);
  dots.v;
  x_("cl",n-1)
),
bold(x)_d \
"design variables"
)

<=
underbrace(
mat(
  x_(0);
  x_(1);
  x_(2);
  dots.v;
  x_(n-1);

),
bold(r)\
"right side"
)

$ <eq_115>
// ------------------------------ constraint 3 ------------------------------ //
$
underbrace(
 0 ,
bold(l)\
"left side")

<= 
underbrace(
mat(
  1, 1,1, dots.h, 1 
),
bold(A)_c \
"design variable
coefficient matrix"
)

underbrace(
mat(
  x_("cl",0);
  x_("cl",1);
  x_("cl",2);
  dots.v;
  x_("cl",n-1)
),
bold(x)_d \
"design variables"
)

<=
underbrace(
"ha" - Phi,
bold(r)\
"right side"
)

$ <eq_116>



Analougly to the presentaion gave in optimiizaiton case A, the optimiaztion results for 4 and 8 #glspl("lie") are given in @fig_85 and @fig_86, respectively.
Similar as seen in optimiaztion case A, the shear force as well as the bending moment approximation is of vey high quality. This is true for both presented variations, with four and eight #glspl("lie").
// important note for the overlapping text for figutre with 8 lies
in @fig_86 the paclement of the #glspl("lie") - 8 vairation -the force text is alternating shifted in the vertical direction which was done on purpose.
Otherwise the text would have intersected with each other and no reaidbility would be given.
Furhtermore the scale was kept to maintain consitancy. with this deicion the other subplots keep the same axis scaling. Due to the colorcoded text looking carefully still allows to get all relevant information.
It can be observed that the #glspl("lie") placing do not overlap, therefore the constraints are obyed. 
However, the constraints allowed the whole inner wing length as total length to place #glspl("lie"), which the optimizer found to be the most suitable design choice. 
If there is no need to have any of the wing-tube part free of #glspl("lie"), this optimizaion defition is appropriate.
However, when desiring to apply epseically optical mesaurement devices, some parts of the wing-tube part need to be free.
This will be convered in optimiaztion case D in @chap_5_3.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/int_Forc_4.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case B. 4 #glspl("lie") was selected.],
)<fig_85>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/int_Forc_8.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case B. 8 #glspl("lie") was selected.],
)<fig_86>

The impact of the number of #glspl("lie") can be observed through @fig_87.
Similar as sein in optimization case A, the higher the number of #glspl("lie") the lowe the objective funciton becomes. Consequently, the better the load approximation becomes.
While the number of iterations for optimiaztion case B has increased compared to topimzaiton case A, still the number of iterations is very low.

// optimiaztion progress
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_B/opti_Bar.svg", 
  width: 95%),
  caption: [optimization model B. shows objective funciton values and the required number of iterations for the differen number of #glspl("lie").],
)<fig_87>
