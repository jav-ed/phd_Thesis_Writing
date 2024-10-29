/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */
#pagebreak(weak:true)

// TODO Title
== Loadcase <chap_3_0>
In @chap_1_0, the primary objective was to identify specific requirements for experimental structural certification tests of #gls("swith", long:true). The analysis revealed that no single standard currently exists dedicated to the certification of #glspl("swith"). Consequently, existing state-of-the-art standards were evaluated and filtered to establish essential certification requirements.These identified standards not only serve certification purposes but could also be leveraged to inform design decisions.

The evaluation of these standards indicated varying flexibility regarding tank filling agents. While some testing protocols permitted the substitution of hydrogen with alternative filling agents, others mandated the use of hydrogen. For practical applications involving hydrogen, a thorough understanding of its properties is essential. These properties were extensively elaborated in @chap_2_0. In @chap_2_0_2, it was established that while hydrogen can be utilized in experimental settings, its direct application in long tubes under high pressure, as typically required for #glspl("swith"), presents significant challenges.
To safely conduct experimental investigations, a long-term strategy was proposed for working with high-pressure hydrogen in tubes of aircraft wing dimensions. This approach advocates for a gradual progression of simulations and experiments, starting with smaller tube lengths and lower pressure values, systematically increasing both parameters as safety protocols are validated. 
The current technical capabilities for safely handling high-pressure hydrogen in long tubes cannot adequately protect human operators, testing equipment, and the #gls("swith") itself from potential hydrogen-related incidents during experiments. Due to these safety limitations, alternative methods for conducting the certification tests must be explored.

The primary objective of this section is to determine whether hydrogen can be substituted with an alternative filling agent without significantly altering the structural properties that would invalidate test results. 
To address this question, the most critical load cases will be examined in @chap_3_0_0. These findings will inform the central question addressed in @chap_3_0_1: Can hydrogen be replaced with an alternative medium in the tanks without significantly affecting the structural properties during experimental structural investigation?


// TODO Title

// TODO is this intro actually fulfilled?
// intro should have more content
=== Most prominent laodcases<chap_3_0_0>
This subsection addresses the significance of identifying critical load cases and examines how load cases for #glspl("swith") deviate from conventional scenarios. Following this analysis, a methodological approach specific to #glspl("swith") is presented and justified.


Defining critical load cases for structure-integrated hydrogen tanks, designed as integral parts of light aircraft wings, presents a complex engineering challenge. This complexity stems from the dual-nature of #glspl("swith"): the tanks are both integrated into the wing structure, bearing structural loads, and subjected to high internal pressure. Consequently, each conventional load case must be evaluated both without pressure and across various pressure ranges, significantly expanding the testing matrix.
The identification of critical load cases poses significant challenges even for conventional light aircraft, given the vast array of possible scenarios defined in certification standards @EASA_CS_23 @EASA_CS_25. A comprehensive experimental investigation of each load case is neither economically viable nor environmentally sustainable. 


While simulative approaches offer an alternative, they present their own set of challenges. Depending on accuracy requirements, 
a single aerodynamic load calculation may require months of computational time @Yang2021a @HernandezAguirre2022 @Kochkov2021 @Blazek2015 @Fu2020.

// --------------------- drawbacks of regular simulation -------------------- //
According to @Yang2021a Direct Numerical Simulation (DNS)  requires 100 times more computational resources than wall-resolved large-eddy simulation (WRLES) for their considered Reynolds number range ($10^7 <= "Re" <= 10^9$) @Sigloch2022 @Schlichting2017. 
If Moore's @Moore1998 or Koomey's @Koomey2011 law holds and computing ability doubles every two years, the Reynolds number range that is accessible to WRLES today would be accessible to DNS in about 13 years @Yang2021a. Furthermore, WRLES is significantly more computationally expensive than wall-modeled LES (WMLES), with computational costs scaling as $"Re"^2.72$ and $"Re"^1.14$ respectively @Yang2021a.
According to @Kochkov2021, despite a direct link between the equations of motion and the basic laws of physics, it would be impossible to carry out direct numerical simulations at the scale required for these important problems such as climate and weather.
The DNS conducted in @Fu2020 took 25 million core hours Argonne's Mira supercomputer. In comparison, thee WMLES cases only required about 150,000 core hours on average on the same machine.
Thus, the DNS is about 150 times more computationally expensive than WMLES.
Faster aerodynamical simulations can be achieved by neglecting friction and introducing simplifications @Barba2019 @Drela1989 @aerosandbox_phd_thesis @Verdugo2022 @Liu2022a @Wild2022 . 
However, these compromises may result in accuracy levels insufficient for certification requirements. 

// -------------------------------- ml models ------------------------------- //
Machine Learning  @Brunton2022 @Bishop2006 and especially deep learning
@Goodfellow2016 @prince2023understanding
are used in science and industry to solve a high number of problems
@Cuomo2022 @Habehh2021 @Alanazi2022 @Masud2021 @Black2022. 
Focusing on the current given problem, general machine leanring and deep learning can be used to replicate to some degree of acuracy pyhsical based mathematical equations @Brunton2022.
In order to obtain a surrogate model trainign data is required.
In the case of high fidelity simulations, the training data would consist of the output of high fidelity simulations.
If enough trianing data is required a high number of models is available
@Charbuty2021 @Palimkar2021 @Cristianini2000 @Murty2016 @Suyal2022 @Dumitrescu2022 @Itoo2020 @Ahmad2020 @Li2023c @vaswani2017attention @Sastrawan2022 @You2022 @Qu2024 @Robinson2022.
The trianing of the model generally requires a lot of computaiton power.
Due to the nature of a lot of machine learning models and espeically deep learning, their training can be paralliztied. 

Thus, in order to reduce the time requird fore training a GPU (Graphics Processing Unit) @Kaur2023 @DeLuca2024 should be used. 
Because of the high amount of application of machine learning models, the current software ability is so advances that even multiple GPUs can be used in parallel to train the model even faster @Paszke2019 @tensorflow2015_whitepaper @Sergeev2018@link_ray2024 @link_deepspeed2024 @link_accelerate2024.
While the training pahse of deep leanring models can take a high amount of time, the inferece time is much lower @butt2021development. The inference of machine learning models refers to obtaining their output and can be in real-time.
Furthermore, depending on the size of the neuronal network, it could be that the model that was trained on multiple GPUs, runs smoothly on a single GPU or even CPU (Central Processor Unit). 
If the models fits within the RAM (Random access memory), generally it can be expected that the inference even on regular CPUs are magnitudes of orders faster than a high fidelty #gls("fem") or #gls("cfd") simualtion.


Some comparisons in how machine learning could help to improve computational speed were conducted in @Edelen2020 for particle accelerator simulations 
For their primary test case, they found that while the physics simulation required 590 seconds using 8 computing cores, the neural network surrogate model could execute in less than one millisecond on a single laptop core.  This represents a speedup of $cal(O)(10^6)$ times. Beyond raw execution time, the machine learning approach demonstrated broader efficiency gains in the optimization process: it required 132 times fewer simulation evaluations and reduced the total core-hours by a factor of 144 compared to using physics simulations alone. Through iterative retraining, they suggested potential further improvements of 330-550 times fewer simulation evaluations needed. For their more complex test case, the IsoDAR cyclotron, the neural network achieved even greater speedup, executing $cal(O)(10^7)$ times faster than the original physics simulation. Notably, these improvements were achieved while maintaining good accuracy compared to the underlying physics simulations, and the neural network training itself only required about 10 minutes on a laptop. 
Another example where concrete speedups for using machine learning techniques for #gls("cfd") are given in @Kochkov2021 with factors between 40 and 80.

Having mentioned big advatages of using machine learning models as surrogate models, two improtant factor shall be reiterated. 
When saying machine learning model would speedup caluclations, the inferece pahse is refered to, not the trianing pahse.
Next, in order to traing machine learning model, input data is required. For the case of high fidelity simulation, high fidelty time and computaitonal expensive simualtion would need to be carried out. Thus, if no trained model are provided, the inital high fidelty numiercal simulations cannot be skipped. Because of this all diffucilzties faced with high-fidelty simulation are also faced during the data generation stadium for machine learning models.

Given these limitations in both traditional simulation approaches and machine learning alternatives, establishing comprehensive simulation capabilities presents significant resource challenges. 
Depending on the specific loadcase this could encompass expertise computational fluid dynamics for accurate aerodynamic load prediction, structural mechanics for understanding load distribution and material behavior, multi-disciplinary @Wang2021 @Meng2022 @Mader2020 @Meng2021 @Li2019a, and multi-objective optimization techniques @Tian2021 @Li2023d @Ridha2021 for handling  complex requirementsments as well the vast solution space. 
Furthermore, depending on the specific load case, additional physical phenomena must be considered, including crash dynamics
@PrabhaharanS_2022 @FragosoMedina2021 @MortazaviMoghaddam2021, multi-body interactions @Balena2021 @Rahnejat2023 @Benmeddah2024, dynamic structural responses, and thermomechanical effects. Each of these domains introduces its own set of numerical complexities and computational demands.

Moreover, some load cases depending on accuracy demands could require the coupling of multiple disciplines. These physical phenomena further compounds the computational complexity, leading to potential stability issues and increased computational overhead. Even with state-of-the-art high-performance computing infrastructure, the simultaneous consideration of aerodynamic effects, structural responses, and internal pressure loads across multiple load cases remains computationally intractable for real-time analysis. 

Yet, it is important to note that the challenge is not in solving any single multiphysics problem, but rather in the systematic evaluation of numerous load cases, each potentially requiring different combinations of physical models and solver configurations. 
Moreover, the interpretation of such multidimensional results requires sophisticated post-processing methodologies to identify truly critical load cases, as the interaction between different physical phenomena may lead to non-obvious failure modes. 


In order to give some perspective on why the simulation of some load cases especially for a #gls("swith") is considered to be complex and multidisciplinary @tab_12 and @tab_13 shall be viewed. It should be understandable that the expertise required to simulate a gunfire test is very different from simualting a pneumicatic cycle test, or a glass trnaistion temperature test.
The reason for mentioning tests that pressriziruzed cylinder must undergo was given in @chap_1_0_6. In short it can be said, since for this thesis #glspl("swith") are used with #gls("cgh2", long:true) it is reasonable to assume that all or some tests deamnded for pressurized cylinders also could be demanded for high pressure cylinders when they are a load bearing and integratedd part of an aircraft's wing.
Moreover, the high number of the high amount of laod cases to potentially consider can be viewed in aircrafts standards like @EASA_CS_23 and @EASA_CS_25.


// --------------------------- general load cases --------------------------- //
Zeile 202 - 345
Next, some general loads that occur during flight and on the ground shall be mentioned @heinze2023aircraft.
Primary consideration could be given to aerodynamic forces induced during flight operations, specifically the pressure differentials that generate lift and negative lift forces. 
These aerodynamic loads manifest predominantly during dynamic flight maneuvers. 
In coordinated turns, the required lift coefficient needs to exceed the weight-induced load factor to maintain the desired flight path. 
Similarly, during the transition from descent to level flight at low altitudes, necessitate the generation of substantial lift forces that exceed those required for steady-state flight conditions. 
Atmospheric perturbations, particularly gust loads, constitute another critical category of aerodynamic forces. These are complemented by control surface-induced loads, where rudder deflections alter the pressure distribution patterns and generate supplementary force components. 
One important phenomenon that needs to be mentioned when talking about general laods that can be met during flight is Buffeting. It is a phenomenon where the aircraft experiences highly non-linear dynamic and fluctuating loads. These loads cause noticeable vibrations in the aircraft structure. Buffeting can occur in various flight conditions such as flying through vortices, during transonic flight, at high angles of attack, when encountering wake turbulence, or due to shock wave oscillations (fluctuating shock location) in transonic @Caruana2005. 
Other aerodynamical load can occur due to the complex flow interactions for example between the wing-fuselage area

Beyond aerodynamic loads, inertial forces constitute another significant load category. These forces arise whenever the aircraft or its components experience acceleration or deceleration. This encompasses all phases of operation including takeoff acceleration, landing deceleration, and general flight maneuvers. 
Component-specific vibrations and flutter phenomena also contribute to the inertial load spectrum. Additionally, propulsion-related forces encompass thrust forces, gyroscopic effects from rotational speed variations, and the dynamic interactions between engine, pylon, and airframe systems @heinze2023aircraft.
Ground operations introduce a distinct set of loads: landing impact forces and subsequent braking loads, runway surface irregularities, towing forces during ground handling, and maintenance-related loads such as jacking operations @heinze2023aircraft. 
Of particular concern are tool drop scenarios during maintenance, which must be considered in the structural analysis.
It's important to note that these various load cases do not act uniformly across the aircraft structure, nor do they necessarily occur simultaneously. Rather, specific locations experience characteristic load combinations that can result in critical stress states, forming the fundamental basis for structural dimensioning @heinze2023aircraft.


// TODO - 
// phd link could be added here, either explain what the focus of the phd is 
// or explain that these loadcase studies would become their own book
// transition required
The fundamental challenges in both computation and analysis underscore the current limitations in achieving comprehensive, high-fidelity simulations for all specified load cases.
Given these challenges, the identification of potentially critical load cases for #glspl("swith") was approached by leveraging established industry knowledge. 
The former company MBB perfomed a statistical evaluation to determine the probability of each load case being critical.
Their findings in percentage, that is, in how many times one load case was to be found critical is given in @tab_29.

// TODO
#figure(
  table(
    columns: (0.3fr, auto),
    align: (col, row) => if row == 0 { left + horizon } else { left + horizon },
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    // ------------------------------- header ------------------------------- //
    [*Probability*], [*Critical Load Case*],
    // ---------------------------------------------------------------------- //
    [100%], [Elevator maneuver and vertical gust],
    [90%], [Landing impact],
    [80%], [Aileron maneuver and ground rolling],
    [70%], [Lateral gust and rudder maneuver],
    [50%], [Steady pull-up],
    [40%], [Frontal gust],
    [20%], [Crash landing and cabin pressure],
    [10%], [Single engine failure and maximum engine thrust],
  ),
  kind: table,
  caption: [Critical load cases from the lecture #emp_[Design of Commercial Aircraft II] @heinze2023aircraft.],
) <tab_29>


// here layout 
For this thesis data for critical load cases given in @tab_29 were obtained through a presention in the lecture course #emp_[Design of Commercial Aircraft II] at TU Braunschweig in Germany @heinze2023aircraft, delivered by Dr. Heinze.
Such data of load cases represents valuable proprietary knowledge typically protected within large aerospace companies and rarely accessible to the broader scientific community. The availability of this data through academic channels provides unique insights into industry-validated load case hierarchies.

// TODO mention other companies
Furthermore, meetings with two companies that have concrete intetrest in structrally testing and developing #glspl("swith") were held. They also investigated critical load cases and made them available to the author of this thesis. As this information was provided confidentially, it cannot be shared with the public. However, it should be noted that in this case as well, numerous load cases from the V-n diagram were classified as critical. 
Therefore, the developed V-n modeler can be considered a valuable component.

// ------------------------------ explain table ----------------------------- //
Vertical gusts and elevator maneuvers represent the most critical load cases (100% probability), where vertical gusts generate significant structural loads through rapid angle of attack changes affecting the entire airframe @Gudmundsson2014. 

The elevator maneuvers create initial control surface forces leading to complex dynamic structural responses. 
Landing impact follows at 90% criticality, characterized by the dynamic response of the airframe during touchdown, where vertical acceleration loads are transmitted through the landing gear into the primary structure. 
Aileron maneuvers and ground rolling (80%) introduce asymmetric lift distributions with substantial moment arms to the wing root, while ground rolling creates dynamic loads through partially-fueled wings interacting with runway irregularities. 
Lateral gusts and rudder maneuvers (70%) primarily influence fuselage design through asymmetric loading conditions, with distributed side forces and concentrated loads at the vertical tail transmitted through the fuselage structure. 
Steady pull-up maneuvers (50%) involve transition from descent to level flight, generating elevated but not maximum load factors @heinze2023aircraft. 
Frontal gusts (40%) create longitudinal loads, though their criticality is generally lower. 
Crash landing and cabin pressure cases (20%) ensure minimum structural integrity for occupant survivability, with cabin pressure's lower criticality often resulting from other load cases determining basic skin thickness requirements @heinze2023aircraft. 
Single engine failure and maximum engine thrust (10%) typically become critical only in localized areas around engine mounts and pylons.
// -------------------------------------------------------------------------- //



Within the scope of this thesis, experimental and stimulative replication of all identified critical load cases is not feasible.
The aim of this thesis is not to focus on all found load cases for general aircrafts, but rather contribute with some critical findings that could be used for a final certifaction process of #glspl("swith") within a time and resourcesframe that is feasible and possible for a scientific work.
This reasoning necessitates on a focused approach, where the focus is set on the one most improtant load case.
// ------------------------------- v-n-diagram ------------------------------ //
According to @tab_29, vertical gust loading represents one of the most probable critical load cases, with a 100% probability of being dimensioning, thus warranting detailed investigation. 
This load case can be obtained systematically and analyzed through V-n diagrams. 
The V-n diagramm is also called flight envelope or v-g diagramm.
The flight envelope shows specific load factors over airspeed that an airplane has been designed to operate within @Gudmundsson2014 @Rossow_2014. 
It shows two differnt kind of loads, maneuver and gust laods @Rossow_2014.
An illustrative example of a V-n diagramm according to the EASA CS-23 @EASA_CS_23 for the normal category is depicted in @fig_28.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/0_Load/0_Vn_Diag.svg", 
  width: 100%),
  caption: [illustrative V-n diagramm (flight envelope, V-g diagram) according to EASA CS-23 @EASA_CS_23 for the normal category.],
) <fig_28>

The horizontal axis of the flight envelope in @fig_28 shows the Equivalent Airspeed (EAS) in knots (KEAS) and is given as @eq_10. The varaiables $rho, rho_0$ and $ V_"TAS"$ denote the density at current flight altitude, density at sea level and the true airspeed, respectively. The true airspeed defines the relative speed between the undistrbed far-field and the aircraft @Gudmundsson2014.

$ V_"EAS" = sqrt(rho /rho_0) space V_"TAS" $<eq_10>

The vertical axis of @fig_28 shows the load factor n following @Rossow_2014 can be described as @eq_11. 
The variable $P$ is denoted as a force usally acting against the mass force $G$, where $m "and " g$ stand for the mass and gracitional constant. 

$ n = P/G = P / (m space.thin g) $<eq_11>

Note that the load factor is unitless and corresponds to the safe load or limit load @Rossow_2014. The definition of limit load is that is the highest load that is expected during regular operating lifetime without any plastic or remaining defelections to occur @Rossow_2014. 
No structural failure should occur before reaching the ultimate load, which is given as @eq_12, where the standard safety factor is 1.5. 

$ "ultimate load" = 1.5 times "limit load" $<eq_12>

This is intended to minimize the probability of component failure despite existing variations in loads and material properties, as well as possible inaccuracies in calculation methods. Additionally, this factor helps prevent catastrophic structural failure if operating limits are slightly exceeded @Rossow_2014.
The flight envelope is obtained by drawing out the outer lines that the gust and maneuver loads create. The loads that occur due to the gusts are indiicated through the orange lines  and the manuever laods are drawn in a pink color @fig_28.
Their resulting flight envelope is given as the cross-hatched blue region.
Next, some points of the legends in @fig_28 are commonly used and shall be spelled out following the definitions provided by @Rossow_2014 @Gudmundsson2014 @EASA_CS_Abbrevs 

- *Design Maneuvering Speed V#sub[A]*: V#sub[A] is the design limit speed up to which a full deflection of any one control surface (aileron, elevator, and rudder) is possible with retracted flaps without causing structural failure. Simultaneous full deflections of multiple control surfaces as well as multiple deflections of a single control surface are not permitted at V#sub[A].
  
- *Design speed for maximum gust intensity V#sub[B]*: Most often used for commuter-class aircraft.

- *Design Cruising Speed V#sub[C]*: V#sub[C] is the design speed for cruise flight. When determining V#sub[C], economic aspects such as low fuel consumption must be considered along with the boundary conditions specified in the certification requirements applicable to the respective aircraft class.

- *Design Diving Speed V#sub[D]*: V#sub[D] is the maximum flight speed for which the aircraft structure is designed. Certification requirements often mandate a minimum margin between V#sub[D] and V#sub[C], which depends on the aircraft class.

- *Design Flap Speed V#sub[F]*: V#sub[F] is the maximum design speed for flight with extended high-lift flaps on the wing.

- *Stalling Speed V#sub[S]*: V#sub[S] is the minimum flight speed in level flight with retracted flaps at which no flow separation occurs on the wing (stall speed). In other words, this is flight at the maximum lift coefficient C#sub[L,max].
  
// make sure it is understood it shall only be  notice, for the actual equations standrds can be read
After having spelled the vlecoties out, it is improtant to know that for constructing V-n diagrams, the mathematical relationships between velocities can be found in standards such as @EASA_CS_23 CS-23 and @EASA_CS_25.
Next, it is important to note that generally the V-n diagramm limits itself to symtrical flight loads, thus cannot encompass asymtrical load cases.
While the banked turn is strictrly asymtrical load case it still can be considered through the V-n diagram @Rossow_2014.
Besides reading the V-n diagramm to obtain infromation about the aircraft's strucutre, pilots can derive important infomation as well.
These include, what airspeed they can fully deflect control surfaces, what is the dive speed, or the airspeed at which slowing down is required @Gudmundsson2014.

After having explained some concrete details the reader is refered to literature like  @Rossow_2014 @Gudmundsson2014 @EASA_CS_23. For understanding how V-n diagrams are drawn in detail educational books like @Gudmundsson2014 and standards like @EASA_CS_23 @EASA_CS_25 should be considered. The V-n diagram displayed in @fig_28 was generated with open-source aerodynamics tool #emp_[ADRpy] @link_ADRpy. The tool was compared against the #gls("cs")-23 specifications @EASA_CS_23 and approved for following the given regulations. So within this work, it can only be confirmed that @link_ADRpy generates the V-n diagrams correctly for small aircraft.
// TODO proper transition
The only changed that were made, were how the output is generated. Instead of using Matplotlib @Hunter2007 as the default plotting libtary, a sperate plotting code with Plotly @plotly_2015 was generated.


The one main critical load case for this thesis was selected as the vertical gust load case according to @tab_29. This load cases obtained through the V-n diagramm.
Because the V-n diagram is valid for different categories light aircrafts, such as normal, utility, aerobatic and commuter and large aircraft, the selected load case open doors for #glspl("swith") in the same categories and sizes.
However, note, depending on the aircraft category and size, different rules apply for creating the flight envelope. 
Moreover, since the loads from V-n diagrams are defined through velocity and load factor, they can be directly integrated into existing simulation models.
To demonstrate this with a concrete example: Any point in the flight envelope (@fig_28) can be characterized by its velocity and corresponding load factor. Using these values, the lift coefficient that incorporates the load factor can be determined through @eq_13, where $L$ represents lift, $rho$ density, $u$ velocity, $S$ reference area, and $n$ load factor.

$ C_L = L / ( rho/2 u^2 S) space.thin n $<eq_13>

This lift coefficient, combined with the aircraft's geometrical data, serves as input for lift distribution tools such as the 3D panel method solver APAME @Filkovic. The resulting spanwise lift distribution can then be applied as loading conditions for both simplified structural models and high-fidelity structural analysis through #gls("fem") models.

