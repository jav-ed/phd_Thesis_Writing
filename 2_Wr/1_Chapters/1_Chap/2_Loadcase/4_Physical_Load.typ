/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// TODO
=== Physical Load Application<chap_3_0_4>

Critical load case found identified, proper infromaiton about hydrogen properties. focused on the hazard properties of hydrogen.
Decided wehter based on the given technical advantages it is feasible to conduct a experimental structral validation test with hydrogen
Found a method how to assess whter hydrogen could be replaced througha nother filling agent without chaning important structral properties.

There are many advatages of numeircal simualtion over experiemntal investigatosn. One could be noted for fem simulations in @chap_3_0_3 and @chap_3_0_4. Chaning simulation parameter like the internal pressure do not require much effort. Addtionaly applying loads into the simulaiton model already has its theoretical background covered. However, for experimental investigations, mehtod to securely and accurately apply loads into the wings through physical objects is required.
Thus, this section has the focus on first generally presenting methods tht can be utilized to apply physical into a #gls("swith", long:true). 
The found options shall be explained briefly, mentioning advantage and disadvantge.
for clear reading table presentatoion shall be given.
The output of this section is important for the upcoming optimization

one side opned: zwangskräfte verringern


// -------------------------------------------------------------------------- //

// = Load Introduction <chap_1_>
In the previous chapter @chap_0, we revisited the topic of structurally integrated #gls("cfrp") hydrogen tanks located in the aircraft wing. 
We then explained why understanding the influence of the filling medium on structural behavior is particularly significant for experimental testing.
The previous chapter @chap_0 concluded by answering this question and conducting several physical plausibility studies.

Now that we have established that we could fill the tanks with water for experimental testing, the next major consideration is the introduction of aerodynamic loads. 
This section will first explain which forces need to be introduced, where, and why.
Then, possible methods for physically applying loads to the aircraft will be presented,
followed by investigations conducted to determine the most suitable method.

Besides the internal pressure, which has been discussed several times in this report, aerodynamic forces are the primary forces experienced by this type of aircraft during flight.
To make the experimental investigation as close as possible to real flight conditions, both internal pressure and aerodynamic forces must be applied.
There are principally three different methods for applying aerodynamic forces that act on the wing and fuselage skin.
The first option would be to conduct the experimental test during flight.
However, there are too many unknowns for the present aircraft concept. Additionally, such a test carries potentially lethal risks.
Furthermore, the costs would far exceed the project's current technical standards and budget. Therefore, the option of experimental testing during flight is ruled out.
The second option would be to conduct the experimental test in a wind tunnel. This would allow for relatively accurate representation of external aerodynamic forces. 
Wind tunnel testing is well-established in research and industry, allowing existing expertise to be utilized.
While wind tunnel operation costs are not insignificant, they are presumably manageable.
However, the key problem identified relates to environmental conditions.
When high velocities or flight speeds are generated in an enclosed space, special safety measures must be taken.

First, all objects would need to be secured to the floor or other fixed locations. Additionally, it would need to be determined what wind speeds humans can safely be exposed to in the wind tunnel airflow.
Even if all safety aspects were properly addressed and safe pressurization of the tanks was possible, there would still be a crucial issue to resolve.
What impact would the high velocities have on each installed measuring instrument?
Beyond the pure influence on measurement accuracy, there's also the question of whether the attached measuring instruments risk becoming detached or sliding off.
The K2H2 project is working on pioneering technology. 
Therefore, it can be assumed that particularly extensive measurement technology is required to cover as many aspects as possible without interference.
Restricting allowable measurement methods can be considered a significant obstacle.
Based partly on this last argument, the option of conducting experimental tests in a wind tunnel is also ruled out.

// ------------------------------ third option ----------------------------- //
The final option is to test the aircraft neither in the air nor in a wind tunnel.
The aerodynamic loads should be applied in a secure hall.
This requires physical objects that conform to the wing's contour.
These physical objects, which shall be referred to as #gls("lie"), can then be either pulled or pushed.
The pulling or pushing should approximate the aerodynamic force.
This method raises several questions:

1. What possible #gls("lie") exist
2. What criteria should be used to determine a favorite
3. Where exactly should the #gls("lie") be attached
4. What length should the #gls("lie") have
5. What spacing should be maintained between #gls("lie")
6. What forces should be applied to pull or push the #gls("lie")

The first two questions will be answered in this chapter. 
The remaining ones will be addressed throughout the report.
However, before discussing the initial answers, a brief explanation should be given as to why this option was selected as the best option from the previous ones.

Our industry partner, IMA, has experience conducting experimental structural tests on aircraft.
This includes both small aircraft and large aircraft.
The tests that IMA conducts are usually performed on the ground using #gls("lie"). 
Thus, the first point is that the existing expertise of the industrial partner could be utilized most efficiently.
Furthermore, precisely because this type of testing has proven to be an economical and efficient possibility, IMA has been using it for years.
The next point is cost. These are estimated to be lower than the two other mentioned options due to existing personnel, methods, and experience through IMA.
Another essential point is the measurement technology.
Since there would be no high wind velocities near the wing, the measurement technology could be applied and used as safely as possible.
One disadvantage that could arise from this option would be the accuracy of aerodynamic approximation.
Flight testing would come closest to the actual aerodynamic loading. 
However, even this would not provide purely undisturbed aerodynamic loading. 
This is because even the smallest geometric change on the wing affects the flow behavior.
Air flows are understood as chaotic systems 
@Roessler1976 @Lu2002 @Rickles2007 @SPROTT2020 @Boeing2016 @Chen1999 @dryer2007spontaneous @Argyris2017 @Strogatz2019 @Datseris2022
.
For chaotic systems, even the smallest change invisible to the naked eye leads to exponential differences over time.
This phenomenon is known as *Sensitive Dependence on Initial Conditions* @Datseris2022 @Strogatz2019. 
According to current physical understanding, the Navier-Stokes equations best model fluids (liquids and gases).
The Navier-Stokes equations are non-linear coupled differential equations that are chaotic in nature.

We can conclude that experimental flight testing would not necessarily lead to identical undisturbed aerodynamic forces.
The previously mentioned reasoning can also be applied to wind tunnel testing.
Depending on how well the continuous aerodynamic loading seen in flight can be converted into discrete aerodynamic loading, the third option could potentially compete with the other two options.
In the case of unfavorable approximation quality, it would need to be examined what influence the external aerodynamic load has on the overall structural behavior.
It could be that above a certain high pressure, the much smaller aerodynamic loads can be considered negligibly small.

// ---------------------------- burst example ---------------------------- //
Another important factor supporting the third option is that a burst test could also be conducted here.
On one hand, the internal pressure could be increased, but on the other hand, the external bending load could be adjusted as desired.
This would prove extremely difficult and cost-intensive during flight and in the wind tunnel.
If this were to be conducted during flight, both the internal pressure and external aerodynamic loading would need to be adjusted from a safe distance.
Additional equipment would be required to increase internal pressure, which would very likely not be present in real undisturbed flight.
This might potentially distort the results.
To increase aerodynamic loads, flight speed or angle of attack could be increased, for example. 
However, these might not be considered representative of undisturbed flight.
If we assume these modifications are permissible, a safe location would need to be found where the aircraft could burst and then fall to the ground.
In the case of the wind tunnel, an explosion-proof enclosure would be mandatory.
On the other hand, the wind tunnel could sustain significant damage.
To store all the measurement technology along with the pressure increase concept in one room, particularly large space is required.
This raises the question of whether the enclosure and other essential components required for experimental testing in a wind tunnel would all fit in a rentable wind tunnel, or whether a new dedicated wind tunnel would need to be built.

Based on the stated considerations, the third option for experimental testing on the ground in a secure hall has been chosen.
Now that this initial question has been clearly answered, methods should be presented for how a load can be physically applied to the aircraft through #gls("lie").
A list of methods that were considered is given in @tab_30.

#figure(
  table(
    columns: (auto),
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

  [Sandbags or similar loading objects],
  [Collet],
  [Air cushions or other gases],
  [Cylinders with pads],
  [Various combinations of the above possibilities],

),

  kind: table,
  caption: [List of possible methods for physically introducing forces into the wing],
)<tab_30>

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

// -------------------------------- air bags -------------------------------- //
The next #gls("lie") mentioned in @tab_30 are air cushions.
This is a method where a balloon-like cushion is filled with gas.
It can then be adhered at the point where the load is to be introduced and, for example, pressed by a cylinder.

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