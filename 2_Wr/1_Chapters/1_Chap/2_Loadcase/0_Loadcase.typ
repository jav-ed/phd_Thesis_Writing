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


The identification of critical load cases for structure-integrated hydrogen tanks presents a complex engineering challenge when designed as integral components of general aviation aircraft wings. The inherent complexity arises from the dual-nature of #glspl("swith"): these components simultaneously function as integral elements of the wing structure bearing aerodynamic loads while containing high internal pressures. This duality necessitates that each conventional load case be evaluated across a spectrum of pressure conditions, from unpressurized states through various pressure levels, substantially expanding the testing matrix.

The challenge of identifying critical load cases is significant even for conventional general aviation aircraft, considering the extensive range of scenarios prescribed in certification standards @EASA_CS_23 @EASA_CS_25. A comprehensive experimental investigation encompassing all potential load cases proves prohibitive from both economic and environmental sustainability perspectives.

While computational approaches offer a potential alternative pathway, these methods introduce their own set of challenges. Single aerodynamic load calculations may require months of processing time, with the computational demands varying significantly based on accuracy requirements @Yang2021a @HernandezAguirre2022 @Kochkov2021 @Blazek2015 @Fu2020

// --------------------- drawbacks of regular simulation -------------------- //
According to @Yang2021a, Direct Numerical Simulation (DNS) requires 100 times more computational resources than wall-resolved large-eddy simulation (WRLES) for Reynolds numbers ranging from $10^7$ to $10^9$ @Sigloch2022 @Schlichting2017. 
Following Moore's @Moore1998 or Koomey's @Koomey2011 law, which predicts computing capability doubling every two years, the Reynolds number range currently accessible to WRLES would become accessible to DNS in approximately 13 years @Yang2021a. The computational hierarchy extends further: WRLES itself demands significantly more resources than wall-modeled LES (WMLES), with computational costs scaling as $"Re"^2.72$ and $"Re"^1.14$ respectively @Yang2021a.

The practical implications of these computational demands are substantial. A DNS study conducted on Argonne's Mira supercomputer demonstrates these resource requirements. The investigation required 25 million core hours, while comparable WMLES cases averaged only 150,000 core hours on the same system, revealing DNS to be approximately 150 times more computationally intensive than WMLES @Fu2020. Direct numerical simulations face significant scalability challenges. Despite their foundation in fundamental physics laws and equations of motion, these simulations remain computationally infeasible at scales necessary for critical applications such as climate and weather modeling @Kochkov2021.

While simplified aerodynamic simulations can be achieved by omitting friction effects and introducing other simplifications @Barba2019 @Drela1989 @aerosandbox_phd_thesis @Verdugo2022 @Liu2022a @Wild2022, such compromises potentially yield accuracy levels that fall short of certification requirements.



// -------------------------------- ml models ------------------------------- //
Machine Learning @Brunton2022 @Bishop2006, and particularly deep learning @Goodfellow2016 @prince2023understanding, have found widespread applications across science and industry for solving diverse problems @Cuomo2022 @Habehh2021 @Alanazi2022 @Masud2021 @Black2022. Machine learning and deep learning approaches demonstrate capability in replicating physics-based mathematical equations with varying degrees of accuracy @Brunton2022.
The development of surrogate models through these approaches requires substantial training data. For high-fidelity simulations, this training data necessarily comprises outputs from existing high-fidelity computational models. When sufficient training data is available, numerous modeling approaches can be implemented @Charbuty2021 @Palimkar2021 @Cristianini2000 @Murty2016 @Suyal2022 @Dumitrescu2022 @Itoo2020 @Ahmad2020 @Li2023c @vaswani2017attention @Sastrawan2022 @You2022 @Qu2024 @Robinson2022. While model training demands significant computational resources, the inherent structure of machine learning algorithms, particularly deep learning architectures, enables efficient parallelization of these computations.


To reduce training time, GPUs (Graphics Processing Units) @Kaur2023 @DeLuca2024 are essential computational resources. The widespread adoption of machine learning has driven advances in software frameworks that enable parallel training across multiple GPUs, further accelerating model development @Paszke2019 @tensorflow2015_whitepaper @Sergeev2018 @link_ray2024 @link_deepspeed2024 @link_accelerate2024.
While the training phase of deep learning models can be time-intensive, the subsequent inference time is substantially lower @butt2021development. Inference, which refers to generating model outputs, can often be performed in real-time. Additionally, depending on the neural network architecture, models trained on multiple GPUs may operate efficiently on a single GPU or even a CPU (Central Processing Unit). For models that fit within RAM (Random Access Memory), inference operations on standard CPUs typically execute orders of magnitude faster than high-fidelity #gls("fem") or #gls("cfd") simulations.


Significant computational speed improvements through machine learning applications have been demonstrated in various fields. An example of this is found in a case study of particle accelerator simulations @Edelen2020. In their primary test case, while the physics simulation required 590 seconds using 8 computing cores, the neural network surrogate model executed in less than one millisecond on a single laptop core, representing a speedup of $cal(O)(10^6)$ times.
The efficiency gains extended beyond raw execution speed. The machine learning approach required 132 times fewer simulation evaluations and reduced total core-hours by a factor of 144 compared to traditional physics simulations. Through iterative retraining, potential further reductions of 330-550 times fewer simulation evaluations were identified. Their more complex test case, the IsoDAR cyclotron, demonstrated even more substantial improvements, with the neural network executing $cal(O)(10^7)$ times faster than the original physics simulation. These improvements maintained good accuracy compared to the underlying physics simulations, while the neural network training required only 10 minutes on a laptop.
Comparable efficiency improvements have been documented in fluid dynamics, with speedup factors between 40 and 80 reported for #gls("cfd") applications @Kochkov2021.


Having mentioned some advantages of machine learning models as surrogates, two important factors require emphasis. First, the cited speedup in calculations refers specifically to the inference phase, not the training phase. Second, developing machine learning models requires substantial input data. For high-fidelity simulations, this means conducting computationally expensive simulations to generate training data. Therefore, if pre-trained models are not available, the initial high-fidelity numerical simulations remain necessary. Consequently, all challenges associated with high-fidelity simulations persist during the data generation stage for machine learning models.

Given these limitations in both traditional simulation approaches and machine learning alternatives, establishing comprehensive simulation capabilities presents significant resource challenges beyond just computational power. Even with advanced computing methods, successful analysis requires expertise in several technical domains. These include computational fluid dynamics for accurate aerodynamic load prediction, structural mechanics for understanding load distribution and material behavior, and multi-disciplinary approaches @Wang2021 @Meng2022 @Mader2020 @Meng2021 @Li2019a. The complexity is further increased by the potential need for multi-objective optimization techniques @Tian2021 @Li2023d @Ridha2021 to manage the vast solution space.

The challenge extends to additional physical phenomena such as crash dynamics @PrabhaharanS_2022 @FragosoMedina2021 @MortazaviMoghaddam2021, multi-body interactions @Balena2021 @Rahnejat2023 @Benmeddah2024, dynamic structural responses, and thermomechanical effects. Beyond these individual phenomena, certain analyses require coupling between different disciplines. 
For example, accurate flutter investigations necessitate the coupling of aerodynamic and structural analyses to capture the complex interactions between airflow and structural deformation @Kaneko2022. Even with state-of-the-art high-performance computing infrastructure, such coupled analyses across multiple load cases remain computationally intractable for real-time analysis.
Yet, it is important to note that the fundamental challenge lies not in solving any single physics or coupled problem, but rather in the systematic evaluation of numerous load cases, each potentially requiring different combinations of physical models and solver configurations.
Moreover, the interpretation of such multidimensional results requires sophisticated post-processing methodologies to identify truly critical load cases, as the interaction between different physical phenomena may lead to non-obvious failure modes. 

To give some perspective on why load case simulations for #gls("swith") are complex and multidisciplinary, @tab_12 and @tab_13 provide relevant examples. The diverse expertise required becomes evident when comparing different test scenarios. For instance, simulating a gunfire test demands fundamentally different capabilities than those needed for a pneumatic cycle test or a glass transition temperature test.
The reasons for inclusion of pressurized cylinder tests for #glspl("swith") were elaborated in @chap_1_0_6. Since this thesis focuses on #glspl("swith") using #gls("cgh2", long:true), it is reasonable to anticipate that some or all tests required for pressurized cylinders may also be applicable to high-pressure vessels when integrated as load-bearing components within an aircraft's wing. Additionally, aircraft standards such as @EASA_CS_23 and @EASA_CS_25 outline numerous potential load cases requiring consideration.


// --------------------------- general load cases --------------------------- //
The following description of general loads that occur during flight and on ground operations draws primarily from @heinze2023aircraft. Aerodynamic forces induced during flight operations, specifically the pressure differentials that generate lift and negative lift forces, constitute a primary category. These aerodynamic loads manifest predominantly during dynamic flight maneuvers. During coordinated turns, the required lift coefficient must exceed the weight-induced load factor to maintain the desired flight path. Similarly, the transition from descent to level flight at low altitudes necessitates substantial lift forces that exceed those required for steady-state flight conditions.
Atmospheric perturbations, particularly gust loads, constitute another critical category of aerodynamic forces. These are complemented by control surface-induced loads, where rudder deflections alter the pressure distribution patterns and generate supplementary force components.
Buffeting represents another significant flight phenomenon, characterized by highly non-linear dynamic and fluctuating loads that cause noticeable vibrations in the aircraft structure. This phenomenon can occur in various flight conditions: during transonic flight, at high angles of attack, when flying through vortices, when encountering wake turbulence, or due to shock wave oscillations (fluctuating shock location) in transonic conditions @Caruana2005. Additional aerodynamic loads can arise from complex flow interactions, particularly in regions such as the wing-fuselage junction.

Beyond aerodynamic loads, inertial forces constitute another significant load category. These forces arise whenever the aircraft or its components experience acceleration or deceleration. This encompasses all phases of operation including takeoff acceleration, landing deceleration, and general flight maneuvers. 
Component-specific vibrations and flutter phenomena also contribute to the inertial load spectrum. Additionally, propulsion-related forces encompass thrust forces, gyroscopic effects from rotational speed variations, and the dynamic interactions between engine, pylon, and airframe systems @heinze2023aircraft.
Ground operations introduce a distinct set of loads: landing impact forces and subsequent braking loads, runway surface irregularities, towing forces during ground handling, and maintenance-related loads such as jacking operations @heinze2023aircraft. 
Of particular concern are tool drop scenarios during maintenance, which must be considered in the structural analysis.
It's important to note that these various load cases do not act uniformly across the aircraft structure, nor do they necessarily occur simultaneously. Rather, specific locations experience characteristic load combinations that can result in critical stress states, forming the fundamental basis for structural dimensioning @heinze2023aircraft.


// TODO - 

// or explain that these loadcase studies would become their own book
// transition required
Given the outlined challenges, this work leverages established industry knowledge to identify potentially critical load cases for #glspl("swith"). The former company MBB performed a statistical evaluation to determine the probability of each load case being critical. Their findings in percentage, that is, in how many times one load case was found to be critical, is given in @tab_29.

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

The critical load cases mentioned in @tab_29 were obtained through a presentation in the lecture course #emp_[Design of Commercial Aircraft II] at TU Braunschweig in Germany @heinze2023aircraft, delivered by Dr. Heinze. Such data of load cases represents valuable proprietary knowledge typically protected within large aerospace companies and rarely accessible to the broader scientific community. The availability of this data through academic channels provides unique insights into industry-validated load case hierarchies.

// ------------------------------ explain table ----------------------------- //
In the following brief explanations about the critical load cases identified in @tab_29 shall be given. Vertical gusts and elevator maneuvers represent the most critical load cases with 100% probability, where vertical gusts generate significant structural loads through rapid angle of attack changes affecting the entire airframe @Gudmundsson2014.
// TODO is this true?
The elevator maneuvers create initial control surface forces leading to complex dynamic structural responses. 
Landing impact follows at 90% criticality, characterized by the dynamic response of the airframe during touchdown, where vertical acceleration loads are transmitted through the landing gear into the primary structure. 
Aileron maneuvers and ground rolling (80%) introduce asymmetric lift distributions with substantial moment arms to the wing root, while ground rolling creates dynamic loads through partially-fueled wings interacting with runway irregularities. 
Lateral gusts and rudder maneuvers (70%) primarily influence fuselage design through asymmetric loading conditions, with distributed side forces and concentrated loads at the vertical tail transmitted through the fuselage structure. 

Steady pull-up maneuvers (50%) involve transition from descent to level flight, generating elevated but not maximum load factors @heinze2023aircraft. 
Frontal gusts (40%) create longitudinal loads, though their criticality is generally lower. 
Crash landing and cabin pressure cases (20%) ensure minimum structural integrity for occupant survivability, with cabin pressure's lower criticality often resulting from other load cases determining basic skin thickness requirements @heinze2023aircraft. 
Single engine failure and maximum engine thrust (10%) typically become critical only in localized areas around engine mounts and pylons.
// -------------------------------------------------------------------------- //

Within the scope of this thesis, experimental and simulative replication of all identified critical load cases is not feasible. Rather than attempting to address all load cases for general aircraft, this work aims to contribute some important findings. These findings could support a final certification process of #glspl("swith") within a feasible timeframe and available scientific resources. This reasoning necessitates a focused approach, concentrating on the single most important load case.


// ---------------------------------- here ---------------------------------- //
// ----------------------- selected critical load case ---------------------- //
According to @tab_29, vertical gust loading represents one of the most probable critical load cases, with a 100% probability of being dimensioning.
Thus, for this thesis the vertical gust loading with additional internal pressure is selected as the critical load for #glspl("swith").
As elaborated in @chap_1_0_3 the internal pressure has big implications on the weight, costs and safety of the pressure vessel.

From the economicl perspectrive, higher perspective allow to store more hydrogen.
From the structral perspective: higher pressure values increase the load onto the pressue vessel and because of the structral integration as well on the wing.
From the safety perspective as elaboratred in @chap_2_0_1 and @chap_2_0_2, in case of leaks, higher pressure value increase the risk of self-ignition.
From an a practical perspective as mentioned in @chap_1_0_6 with @tab_14 there is a limit on the maximal pressure that can be used for experimental structral validation tests. 
Moreover @chap_2_0_2 explained and laid out a pathway for conducating stutrucal validation tests with #glspl("swith").
Answering the question for an internal pressure when the filling agent is #gls("cgh2") is difficult and has huge implications on safety of the #gls("swith"), the test validation environment and the human operators.
In @chap_3_0_1 it is laid out wheter the filling agent can be replaced with another medium without chaning the structral properties.
These finding should be used to make a more sophisticated decision.

// ------------------------------- v-n-diagram ------------------------------ //
This vertical gust load can be obtained systematically and analyzed through V-n diagrams. 
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


// ---------------------- positve effects because of vn --------------------- //
Because the vertical gust load case which is declared to be critical can be obtained through the V-n diagramm some postive effects can be mentioned.
Because the V-n diagram is valid for different categories light aircrafts, such as normal, utility, aerobatic and commuter and large aircraft, the selected load case open doors for #glspl("swith") in the same categories and sizes.
However, note, depending on the aircraft category and size, different rules apply for creating the flight envelope. 
Moreover, since the loads from V-n diagrams are defined through velocity and load factor, they can be directly integrated into existing simulation models.
To demonstrate this with a concrete example: Any point in the flight envelope (@fig_28) can be characterized by its velocity and corresponding load factor. Using these values, the lift coefficient that incorporates the load factor can be determined through @eq_13, where $L$ represents lift, $rho$ density, $u$ velocity, $S$ reference area, and $n$ load factor.

$ C_L = L / ( rho/2 u^2 S) space.thin n $<eq_13>

This lift coefficient, combined with the aircraft's geometrical data, serves as input for lift distribution tools such as the 3D panel method solver APAME @Filkovic. The resulting spanwise lift distribution can then be applied as loading conditions for both simplified structural models and high-fidelity structural analysis through #gls("fem") models.

With having provided proper background for the critical load cases and the V-n diagram, the following can be said. Meetings were held with two German companies: a pionieering aircraft manufacturer and one of Europe's leading aerospace testing facilities #footnote[Company names withheld due to confidential knowledge], known for conducting structural validation tests on large commercial aircraft.
Both organizations have concrete interest in structurally testing, developing and getting #glspl("swith") commerically ertifed. 
These companies investigated critical load cases and made their findings available to the author. While the specific details are protected under confidentiality and cannot be shared publicly, it is noteworthy that their analyses also identified numerous load cases from the V-n diagram as critical. Therefore, the V-n modeler can be considered a valuable component also for the structural validation test of #glspl("swith").


// --------------------------------- summary -------------------------------- //
#summary_[
In summary, it can be finding critical laod cases for regualr aircraft is already a highly demanding task. Yet, when it comes to #glspl("swith"), which is a combination of a aircraft and a pressuirzed vessel, load cases from both domains can be expected to become important.
Thus, finding critical load cases as of wirting of this thesis is hihgly challening.
Thorugh hihgly valueable staitcal knowledge a list for critical load cases for general aviation could be obtained. From them one critical load case for #glspl("swith") was inferred. The sensibility of the taken approach was confirmed by two leading german aerospace companies. Moreover, important information about the V-n diagramm were provided to expose the link  between the critical load case and the V-n diagram. ]