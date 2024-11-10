/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// TODO
// Title
// word repetition
// Proper intro
=== Physical Load Application<chap_3_0_4>
In @chap_3_0_0 critical load case for #gls("swith", long:true) were established. Hydrogen's properties were exmained in @chap_2_0_0, with particular attention to safety considerations in @chap_2_0_1 and @chap_2_0_2. 
Based on the current lack of technical progress regarding safely handling hydrogen within high pressure and long dimensional tube experiments, an filling agent study was conducted in @chap_3_0_1 to @chap_3_0_3. The analysis determined that alternative filling agents could potentially replace hydrogen for structural validation testing without significantly altering the structural behavior.

While numerical simulations offer considerable advantages in analyzing structural behavior, as demonstrated in @chap_3_0_3 and @chap_3_0_4, experimental validation remains essential. 
Numerical methods allow straightforward modification of parameters such as internal pressure and benefit from well-established theoretical frameworks for load application. 
This differs signitficalty from expermeintal investigations.
While Applying pyhsical forces for experimental tests on aircraft is already a complex and demanding task, its complexity is increased when having tubes that are set under high pressue, in the case of #gls("swith")

This subsection addresses experimental challenges by first identifying the required forces for structural testing. A comprehensive examination of various methods for physical load introduction on the wings of aircraft.  Is is accompanied by detailed analysis of each method's advantages and disadvantages. Through systematic comparison criteria, these methods are evaluated to determine the most suitable approach for structural testing. 

The findings from this analysis hold particular significance as they inform the optimization process detailed in subsequent chapters. Understanding the practical implications of different load introduction methods provides crucial insights for developing effective structural testing procedures that balance theoretical requirements with experimental feasibility.


// -------------------------------------------------------------------------- //

// = Load Introduction <chap_1_>
In the previous chapter @chap_0, we revisited the topic of structurally integrated #gls("cfrp") hydrogen tanks located in the aircraft wing. 
We then explained why understanding the influence of the filling medium on structural behavior is particularly significant for experimental testing.
The previous chapter @chap_0 concluded by answering this question and conducting several physical plausibility studies.

Now that we have established that we could fill the tanks with water for experimental testing, the next major consideration is the introduction of aerodynamic loads. 
This section will first explain which forces need to be introduced, where, and why.
Then, possible methods for physically applying loads to the aircraft will be presented,
followed by investigations conducted to determine the most suitable method.

// ---------------------------- not checkec above --------------------------- //

Besides the internal pressure elaborated previously within this thesis, aerodynamic forces constitute the other crucial loads experienced by this aircraft configuration during flight operations. 
To achieve representative test conditions that accurately reflect the in-flight structural behavior, it is essential to simultaneously apply both internal pressure and aerodynamic loads during experimental investigations.
Three fundamental approaches can be considered for applying aerodynamic forces to the wing and fuselage skin structure. 
The first approach involves conducting experimental tests during actual flight conditions. However, this option presents significant challenges for the current aircraft concept, including numerous technical uncertainties and potentially catastrophic safety risks. 
Additionally, the financial requirements for flight testing would substantially exceed the project's current budgetary constraints, rendering this approach infeasible.

The second approach involves wind tunnel testing @Goizueta2022 @Zhao2022 @He2022, which offers relatively accurate representation of external aerodynamic forces. This method benefits from extensive implementation in both research institutions and industry, providing access to established expertise and validated procedures. Although wind tunnel operational costs are considerable, they remain within potentially manageable ranges for a pioneering project's scope. 
However, significant challenges arise regarding environmental control and safety considerations. The generation of high-velocity flows within enclosed spaces necessitates extensive safety protocols and specialized containment measures.

A critical consideration in wind tunnel testing relates to the management of environmental conditions within the test facility. The generation of flight-representative velocities within an enclosed space necessitates comprehensive safety protocols and specialized containment measures.
Primary safety considerations include the secure anchoring of all test equipment and auxiliary components to prevent displacement under high-velocity conditions. Furthermore, strict operational protocols must be established to ensure personnel safety, particularly regarding maximum permissible wind speed exposure levels during test operations.
Even with the implementation of robust safety measures and successful pressurization protocols for the tanks, significant technical challenges persist regarding instrumentation. The high-velocity environment poses two critical concerns: potential degradation of measurement accuracy and the risk of instrument detachment under aerodynamic loading.
Given that the #gls("swith") represents a pioneering aircraft project, it can be assumed that comprehensive experimental data acquisition is essential for monitoring as many aspects as possible. This necessitates extensive instrumentation to measure multiple physical parameters simultaneously without interference. The potential adverse effects of high-velocity airflow, exerted not only on the aircraft but also on the attached measurement devices, could represent a significant technical constraint.
These instrumentation restrictions, combined with the aforementioned safety considerations, render wind tunnel testing unsuitable for the structural validation of the current aircraft configuration.

// ------------------------------ third option ----------------------------- //
The third approach involves conducting structural tests in a controlled facility environment, rather than in flight or wind tunnel conditions. This method requires the application of aerodynamic loads through physical devices within a secure testing hall. The approach utilizes #glspl("lie") that can be actuated through either tension or compression to approximate aerodynamic forces.
This methodology raises several fundamental questions regarding implementation:

1. Which possible #gls("lie", long:true) configurations are viable
2. How should the selection criteria be established
3. How many #glspl("lie") should be utilized
4. Where should the #glspl("lie") be optimally positioned
5. How should the #glspl("lie") be dimensioned
6. How should spacing between adjacent #glspl("lie") be determined
7. Which force magnitudes and directions should be applied

The first two questions are addressed within this subsection, while the remaining aspects are examined throughout 
// TODO
// @chap_4_0 
.
Before proceeding with the detailed analysis, it is pertinent to elaborate on the rationale behind selecting this approach over the previously mentioned alternatives.
As mentioned in @chap_0_6, this research was conducted within the framework of the K#sub[2]H#sub[2] project. Through collaboration with the industrial partner IMA Materialforschung und Anwendungstechnik GmbH Dresden (IMA Dresden), valuable practical insights were obtained for this thesis.
IMA's expertise encompasses extensive experience in experimental structural testing of aircraft across various size categories, including the Airbus A380 @link_Lufthansa_Airbus_380.
Their established methodology primarily employs #glspl("lie") in ground-based testing configurations. This existing expertise offers significant advantages regarding implementation efficiency. The sustained application of this testing methodology by IMA demonstrates both its economic viability and technical reliability. Moreover, cost projections for this approach are considerably lower than the alternative methods, primarily due to existing infrastructure, established procedures, and personnel expertise.

A significant advantage of this approach relates to instrumentation implementation. The absence of high-velocity airflow around the wing structure enables optimal placement and utilization of measurement systems with minimal environmental interference. However, it is important to acknowledge that this method presents certain limitations regarding aerodynamic load approximation accuracy.
While flight testing would theoretically provide the most representative aerodynamic loading conditions, it is noteworthy that even this approach cannot guarantee purely undisturbed aerodynamic loading. The installation of measurement devices on the wing surface inevitably alters its geometry. This geometric modification, however minimal, significantly influences the flow behavior due to the fundamental characteristics of fluid dynamics. Turbulent fluid flows are recognized as chaotic systems @Roessler1976 @Lu2002 @Rickles2007 @SPROTT2020 @Boeing2016 @Chen1999 @dryer2007spontaneous @Argyris2017 @Strogatz2019 @Datseris2022, characterized by their extreme sensitivity to initial conditions. This phenomenon, formally known as *Sensitive Dependence on Initial Conditions* @Datseris2022 @Strogatz2019, results in exponential divergence of system behavior over time, even from imperceptible variations. Current physical understanding employs the Navier-Stokes equations @Blazek2015 as the most comprehensive model for fluid behavior, these being non-linear coupled differential equations that inherently exhibit chaotic characteristics.


These considerations suggest that experimental flight testing would not necessarily provide purely undisturbed aerodynamic forces. The same limitations regarding flow disturbance apply to wind tunnel testing. The viability of the ground-based testing approach depends primarily on the fidelity with which continuous aerodynamic loading experienced during flight can be approximated through discrete load application.
For scenarios where the approximation quality proves suboptimal, further investigation would be required to quantify the influence of external aerodynamic loads on the overall structural response. It is conceivable that beyond certain internal pressure thresholds, the relatively smaller aerodynamic loads might become negligible in terms of their structural impact.

// ---------------------------- burst example ---------------------------- //
The controlled environment of ground-based testing offers an additional significant advantage through its capability to conduct burst testing procedures. This testing methodology enables precise control over both internal pressure magnitudes and external bending loads - a capability that proves particularly valuable for structural validation. The controlled manipulation of these parameters would present substantial technical challenges in both flight and wind tunnel configurations.
Implementation of burst testing during flight operations would require remote adjustment of both internal pressure and aerodynamic loading parameters. This necessitates supplementary pressurization equipment that would not be present during normal flight operations, potentially compromising the representativeness of the test conditions. While aerodynamic loads could be modified through adjustments in flight velocity or angle of attack, such modifications might deviate from representative flight conditions. Additionally, burst testing during flight operations would require identification of suitable testing zones that accommodate potential structural failure scenarios, introducing significant logistical and safety complexities.
Wind tunnel implementation presents distinct technical challenges. 
The requirement for explosion-proof containment systems introduces substantial complexity to facility design. Furthermore, structural failure events could result in significant facility damage under high-pressure conditions. The spatial requirements for comprehensive instrumentation systems, pressure regulation equipment, and containment structures exceed typical wind tunnel facility capabilities. These dimensional constraints suggest that existing facilities might prove inadequate, potentially necessitating development of purpose-built testing infrastructure.
Through systematic evaluation of these considerations, ground-based testing in a secure facility emerges as the most viable approach for structural validation. 
This methodology enables implementation of comprehensive safety protocols while maintaining precise control over experimental parameters. Having established this foundational testing approach, @tab_30 lists conventional physical #glspl("lie").

#figure(
  table(
    columns: (1fr),
    align: left + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    /* --- header --- */
    table.header([*Load Introduction Method*]),
    /* -------------- */

    [Discrete mass elements (sandbags)],
    [Profile-conforming collets],
    [Air cushions or other gases],
    [Hydraulic cylinder with pads],
    [Various combinations of the methods mentioned above],
  ),

  kind: table,
  caption: [Established methods for physically introducing forces into the wing structure.],
  )<tab_30>

// ---------------------------------- here ---------------------------------- //

Load introduction represents an important investigation since not every method can be used for arbitrary structures.
Essential points that must always be considered are the geometry of the object to be loaded (test specimen), the type of loading (static, dynamic), the magnitude of the force to be applied, and the direction of the force vector.
Depending on requirements, load application accuracy may also be a significant factor.
The load might need to be achieved precisely to the Newton or Newton-meter (bending load) at the position with given coordinates.
It could also be that the structure being loaded must undergo the same test multiple times after the experimental structural test or be subjected to other tests afterward.
In pioneering projects, manufacturing structures is usually associated with high costs.
In this case, it can be assumed that only a limited number of test specimens is available.
Therefore, a reasonable requirement could be that the test specimen survives the structural test undamaged and remains available for practical use.
In the latter case, drilling holes or similar material removal would not be permitted.
Furthermore, it would not be allowed to work with adhesives that do not permit removal.
Beyond these major damage cases, it might also be required that the test specimen must not sustain any paint damage (removal of paint).

Once the conditions under which the test specimen may be tested are clearly defined, the following must always be considered when choosing the load introduction method.
The load introduction elements must have significantly higher strength than the test specimens being loaded.
Failure of the #gls("lie") can lead to undesired effects up to the failure of the test specimen and thus render the results unusable @Rossow_2014.
A significant difference that arises when testing standardized structures versus complex structures is the existence of existing test facilities.
For example, there are typical geometries used in tensile testing.
For complex geometries, #gls("lie") usually need to be newly manufactured.
The following will discuss the individual #gls("lie") from @tab_30 in detail.
// --------------------------------- sandbag -------------------------------- //
One of the oldest, most cost-effective, and simplest methods for introducing physical loads onto a wing is through heavy objects. 
Sandbags are frequently used for small aircraft.
For an example, refer to @fig_56.

// --------------------------------- collets -------------------------------- //
Collets represent a structure that encases the wing's profile contour and to which the load is applied.
For an example of a collet, refer to @fig_57.
Collets are used together with a load harness and typically with a crane.
Collets are usually made of wood, have an upper and lower side, which are compressed or held together with metal screws.
To prevent damage to the wing skin at the contact point between collet and wing, a soft material can be placed between them as protection.
//
// -------------------------------- air bags -------------------------------- //
The next #gls("lie") mentioned in @tab_30 are air cushions.
This is a method where a balloon-like cushion is filled with gas.
It can then be adhered at the point where the load is to be introduced and, for example, pressed by a cylinder.
//
// -------------------------------- cylinder -------------------------------- //
Another possibility for introducing loads into physical objects is cylinders.
These are movable and can either be pressed directly onto a local area of the test specimen with adhesive pads or connected to other #gls("lie").
Pads are plastics used to distribute the load area-wise on one hand and to protect the test specimen as much as possible on the other.
@fig_58 shows an example of how movable cylinders could be connected to collets to structurally test a fighter aircraft @leski2016full.


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/4_Phyiscal_Load/0_Sandbags.png", 
  width: 100%),
  caption: [Exemplary illustration of sandbags in use when loading a wing of a small aircraft, taken from @ho2022development],
)<fig_56>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/4_Phyiscal_Load/1_Collet.png", 
  width: 100%),
  caption: [Exemplary illustration of collets in use, taken from @yeniceli2014design],
)<fig_57>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/4_Phyiscal_Load/2_Cylinder.png", 
  width: 100%),
  caption: [Exemplary illustration of cylinders connected to collets to test a fighter aircraft, taken from @leski2016full],
)<fig_58>

After the individual #gls("lie") have been named and briefly explained, a detailed investigation should be conducted to find a favorite.
Relevant evaluation criteria are needed to systematically identify a favorite. These are shown in @tab_31.
The following will describe both the individual chosen criteria in more detail.
Additionally, it will show the argumentation behind how the individual points were awarded.

// TODO get it into two columns
#figure(
  table(
    columns: (auto, auto),
    align: left + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    /* --- header --- */
    table.header([*Number*],[*Criterion*]),
    /* -------------- */
  [1],    [Cost],
  [2],    [Load introduction accuracy],
  [3],    [Number of required #gls("lie")],
  [4],    [Availability of #gls("lie")],
  [5],    [Reusability of #gls("lie")],
  [6],    [Safety],
  [7],    [Control system effort],
  [8],    [Specially trained personnel],
  [9],    [Reproducibility],
  [10],   [Innovation factor],
  [11],   [Constraint forces],
  [12],   [Possibility for introducing tension loads],
  [13],   [Modeling effort],
),

  kind: table,
  caption: [Evaluation criteria for systematically identifying a suitable #gls("lie")],
) <tab_31>

// ========================================================================== //
// =========================== Assessment sandbag =========================== //
// ========================================================================== //
#hor_Line("Assessment: Sandbag")
Starting with sandbags, it can be said about the costs that they are comparatively very inexpensive per sandbag.
Even if a high number of sandbags should be needed, it is assumed that this would be by far the cheapest method.
Additionally, no further energy costs are incurred. 
Energy costs could be caused, for example, by a stage lift or for moving a crane and cylinder.
The accuracy with which loads can be introduced is significantly lower when using sandbags compared to other methods, even when considering potential modifications. 
When using sandbags, it is only possible to apply loads vertically. 
Load application in other directions is only possible through imprecise placement of the sandbags, whereby only very small force components can be generated in the two other axes. 
Regarding the number of required #gls("lie"), it shows that when using sandbags, a comparatively high number is required. 
A single electrically operated cylinder could, for example, replace a large quantity of sandbags, which demonstrates the efficiency of other methods. 
Despite these limitations, sandbags offer the advantage that they are not special orders and thus have high availability and are easy to procure. Furthermore, the sandbags can be reused for any purpose, which underlines their practicality in various applications.

When using sandbags as #gls("lie") in regular wing tests conducted without internal pressure, there are generally no safety concerns. 
However, significant limitations arise in special scenarios, such as our case, where an internal tank is filled with water and under high pressure. 
Additionally, #gls("cfrp") is used as the material for the tank and wings. 
Should the tanks burst, the released fine and sharp #gls("cfrp") particles could easily cause skin cuts. 
The question of whether these #gls("cfrp") particles could damage measuring instruments and connected lines and what consequences this would have requires detailed investigation. Moreover, there is a risk that the particles could enter the human body through the respiratory tract.

If the tanks burst, the sandbags would only prevent the spread of #gls("cfrp") particles vertically upward, thus only partially mitigating the safety risks. 
Typically, adjusting the number and placement of sandbags on a small aircraft wing during structural verification allows for flexible design of the load distribution. 
In our specific case, however, once the tank has been pressurized, any modification of the number and placement of sandbags could be life-threatening. 
This means that adjusting the load distribution after pressurizing the tank is not readily possible with current knowledge and available means.

If different load cases with varying load distributions are desired, the pressure in the tank would first need to be reduced.
It is also likely that the filling media would need to be emptied and exchanged for each additional investigation.
Furthermore, regulations from the automotive industry for high-pressure vessels require dynamic investigations in addition to static ones, for which the load distribution cannot be adjusted with sandbags.
Thus, dynamic structural verifications, such as running through load cycles, are not possible with sandbags as a load introduction method.

The control system effort varies greatly depending on the requirements for load distribution quality.
To achieve high quality in load distribution, the effort is considerable.
However, the effort is minimal if only a rough load distribution at a specific target load is required.
During the placement of sandbags, unwanted load cases can occur, necessitating a precise investigation of the placement sequence.
In our specific case, where a new procedure is being tested that should also be validated through simulations, high load distribution quality is particularly desirable.

Regarding the need for specially trained personnel, it is evident that no special training is necessary for handling sandbags.
Operating a hand truck or forklift and carefully placing sandbags should generally suffice.
It is only important that someone monitors that the sandbags are correctly placed to achieve the desired load distribution.

The reproducibility of a structural verification suffers from the low load distribution quality that results from using sandbags, leading to poor repeatability.
Regarding the innovation factor, the use of sandbags offers no innovation as it is a known method.
However, when using sandbags, no constraint forces are expected since axial loading occurs and local profile sections do not need to be enclosed.

The possibility of introducing tension loads is limited through the sole use of sandbags, as no tensile forces can be achieved on the wing.
The modeling effort, however, is rated positively as the load from a sandbag can be assumed to be an approximately constant surface load.
This assumption allows for simple integration of the load into the simulation model without much additional effort.

To briefly summarize the sandbag section: As #gls("lie"), they represent a cost-effective and easily accessible option that requires no specially trained personnel.
However, significant limitations must be expected regarding the accuracy of load distribution.
Once an object has been loaded, further adjustment of the load distribution through human intervention is no longer permissible due to safety concerns; instead, automated solutions such as drones or robotic arms might be needed to make subsequent adjustments.
Overall, loading through sandbags is rated as suboptimal compared to other methods, highlighting the importance of carefully reviewing the requirements for each individual project to determine the most suitable load introduction method.