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
lets start with the first optimization case. The optimization problem's definition is given as @eq_107.

$
op("argmin",limits: #true)_(bold(x)_d) 
J_A = &(sum_(i)^n abs(M_("true",i) - M_("optim",i)))/n \

// constraints
"subject to" quad 
& x_("cl",i)/2 <= "ha" - x_i \
& x_("cl",i)/2 <=  x_i \
& sum_i^n x_("cl",i) <=  "ha" \

// bounds
"bounds" quad 
& 0.03 "ha" <= x_("cl",i) <= "ha"/n_"cl"
$<eq_107>

The first sub equation in @eq_107 defines the general objective function and was already explained in @chap_4_0_4. The subscript "A" to the objectuve funtion $J$ was added to unambigiusly link it to the oiptimiaztion case A.
The design variables are denoted as the vector $bold(x)_d$.
It can be observed that in the provided objective function's equartion it is not explicitly hihglighted that the bending moments are dependt on the design variables. 
The rason for that is that the bending moment are depending on a high number of varaibles, such as type of support, posisiton of support, acting forces, beam length. 
Therefore, in order to not make the equation unnessarly long, the concrete depencies were not given.
Instead with this it was mentioned concreltey, that the bending moments depend on the design variables.
For the optimization case A, the design variable vector only includes the collet lengths $x_("cl",i)$ ($bold(x)_d = {x_("cl",i)}$).
With that the three upcoming constraints given in the subject to par can be considered.
Since it is an minimization problem they are given in the form design variables to the left $<=$ non design variable parameter.
Also, this notation helps to incorpaorte optimiaztion problem in framework like SciPy.
it is important to note that $x_i$ are not design variables, they provide give the locations to the center of the centroids.
These centroids are obtained through k-means++ as explained in @chap_4_0_0 and @chap_4_0_1.
The physical meaning behind is that the centroid locations represent the centers of the #glspl("lie").
The first constraint ensures that the #glspl("lie") are not allowed to be positioned outside of the considered bea, length. 
Here ha denotes the half span length. Often it can be assumed that the wings of the aircraft are symtric aroud the vertical axis.
Leveraging this knowledge allows the beam length to become shorter, reducing computational time.

In order to understand this and the other constraints easier first @fig_79 shall be viewed.
It depicts the span direction $x$, the centroid locations $x_i$ and the #gls("lie") lengths $x_("cl",i)$. Next, the first constraint can be rearagned in a way that helps human to comprehend the constraint easier, which is given as @eq_108. With these two supplmenariy matierals it should become evident, that the first constraints demands that the sum of the centroid posistion and the collet lenght needs to be within the halfspan length.

// constraints
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/1_Pos_Graph_Ink.svg", 
  width: 100%),
  caption: [scetch to understand the constraints, visuallay],
)<fig_79>

$ x_i + x_("cl",i) <= "ha" $ <eq_108>

The second constraint demands that the placing of the #glspl("lie") needs to be on the wing, that is, the #glspl("lie") are not allowed to be palced on empty place. The constraint becomes easier to comprhend when rerphased to @eq_109. It says that, when being at the posistion of the center of a #gls("lie") removing the half length of the same #gls("lie") needs to be within the length defined for the wing or beam.

$ x_i - x_("cl",i)/2 >= 0 $ <eq_109>

The third constraint from @eq_107 demands that the total length of all #glspl("lie") when added together, is not allowed to go over the maximal length which is defined through the halfspan ha.
These constraints stem from pyhsical demands and thus do not requires additioanl explanaitons for why they were introduced to the optimiaztion formualtion.
Next, the bounds in @eq_107 define the maximal and minimal length that each #gls("lie") need to obey. For this a minimal #gls("lie") length of 3% of the halfspan length was selected.
The maximal #gls("lie") length was selected as $"ha"/ n_"cl"$, where $n_"cl"$ denotes the total number of #glspl("lie"). 
Thus it has been ensured that each of the #gls("lie") has the same meaining or importance, since each of them can take up to the same maixmal fracitonal length.

// ----------------------------- scipy notation ----------------------------- //
Since this work attemps to provide inital helpful guidance for #glspl("swith") certifaciton, when possible computaitonal tools free chosen such that they are free and open-source. 
This aimes to ensure that they are accesible by people around the globe.
Which consequenlty enables other scientists to leverage this work to build upon it.
For these reasons, as mentioned, SciPy was selected as the optimiaztion framework. In order to stick to this commitment the matrix notaiton for Scipy is proivded as @eq_110 to @eq_112.
The left side and right the in the mentioned equations provide the lower and uppwer bounds for the linear constraint.
They are vectors and have the dimension of the the number of constraints $m$.
The design variable coefficient matrix gives weighting to each design variables and has the dimension of number of constraints $m$ times number of design variables $n$. 
// maybe you can provide a reason why shape infromation is helpful or why such kind presentaiton can be handy
This shape infromaiton can be wirtten out as: 
$bold(l)^(m) <= bold(A)_c^(m times n) space bold(x)_d^(n) <= bold(r)^(m)$

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
  "ha" - x_(0);
  "ha" - x_(1);
  "ha" - x_(2);
  dots.v;
  "ha" - x_(n-1);

),
bold(r) \
"right side"
)

$ <eq_110>

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

$ <eq_111>
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
"ha",
bold(r)\
"right side"
)

$ <eq_112>


// ------------------------------- beam model ------------------------------- //
// explain beam model boundary coniditons - need heavy language modifcation - just quick fragements
@fig_80 provides essential infromation about the beam model and its solution that used as reference for the optimization.
the first row in @fig_80, the beam schematic is depicted. it gives infromaiton about the poissiiton and type of the support. here it can be observed that at the left beginning of the beam, there is a clamp, that is, the the movement along the horizontal and vertical direction are not permitted.
Also it can bear a bending moment.
Next, the arrows in the beam schematic give infromation about the direciton of the force. Since the aerodynamical force is pointing upwards to keep the airplaine in the air, the arrows point upwards. 
Comapring @fig_80 to @fig_70, the concrete values of the disitrbuted laods are not given. The reason for that is, that the, aerodynamical force that was obtained through APAME as is obtained as many disitrbuted laods as explained in @chap_4_0_1.
The high number of these loads, does not allow to add the concrete numbered values of the actual distributed load. Otherweise it would be so mcuh text, that no single disibutrion load as actual load quanity could be read.
Therefore the added red distirbution is meant to give informaiton about the true aerodynamic load distribution.

// adapt figure caption
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_A/0_True_Bem_combined.svg", 
  width: 85%),
  caption: [beam schematic, reaction forces, shear and bending moment distirbution over the normalized span for optimization case A.],
)<fig_80>


The reaction forces in @fig_80 are given in second row and provide value infromation about the reuslting shear force and bending moment that are acting at the position of support points.
The thired and fourth rows of @fig_80 depict the shear force and bending moment diagram.
For all subfigures the span length was nromlaized
This information is important since it exaplins why the maximal bending moment has such a hihg mangnitude. 
Furthermore, it is important to know, the longer the span is, the bigger the available design space becomes.
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

// important note before showing the optimiaztion plots
the optimizaiton was carried out using the units Nmm. Since Nmm is more accurate than Nm, therefore the bending moment infromaiton on the beam model depicted in @fig_80 are in Nmm. Yet, for ppactical applicaiton the units are desired to be shown in Nm, there fore in the upcoming optimization result depcitions, the bending moments are shown in Nm.
The outcome of the optimiaztion is depicted for four and eight #glspl("lie") in @fig_81 and @fig_82, respectively.
Both figures follow the same conventional, the first row depicts in blue the disitrbuted that represents the aerodynamic load obtained from APAME and modified as explained in @chap_4_0_1.
The red 

// shows results of optimiaztion
#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_A/int_Forc_4.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case A. 4 #glspl("lie") was selected.],
)<fig_81>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/2_Chap/0_Results/Case_A/int_Forc_8.svg", 
  width: 95%),
  caption: [real and optimized otucome, load, shear borde and bending moment distribution over the normalized span for optimization case A. 8 #glspl("lie") was selected.],
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
