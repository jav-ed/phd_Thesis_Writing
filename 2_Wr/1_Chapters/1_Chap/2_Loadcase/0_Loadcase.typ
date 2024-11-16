/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */
#pagebreak(weak:true)

// Title was tested and is inshallah fine

== Load Case Assessment and Filling Media Influence<chap_3_0>
In @chap_1_0, the primary objective was to identify specific requirements for experimental structural certification tests of #gls("swith", long:true). The analysis revealed that no single standard currently exists dedicated to the certification of #glspl("swith"). Consequently, existing state-of-the-art standards were evaluated and filtered to establish essential certification requirements. These identified standards not only serve certification purposes but could also be leveraged to inform design decisions.

The evaluation of these standards indicated varying flexibility regarding tank filling agents. While some testing protocols permitted the substitution of hydrogen with alternative filling agents, others mandated the use of hydrogen. For practical applications involving hydrogen, a thorough understanding of its properties is essential. These properties were extensively elaborated in @chap_2_0. In @chap_2_0_2, it was established that while hydrogen can be utilized in experimental settings, its direct application in long tubes under high pressure, as typically required for #glspl("swith"), presents significant challenges.
To safely conduct experimental investigations, a long-term strategy was proposed for working with high-pressure hydrogen in tubes of aircraft wing dimensions. This approach advocates for a gradual progression of simulations and experiments, starting with smaller tube lengths and lower pressure values, systematically increasing both parameters as safety protocols are validated. 
The current technical capabilities for safely handling high-pressure hydrogen in long tubes cannot adequately protect human operators, testing equipment, and the #gls("swith") itself from potential hydrogen-related incidents during experiments. Due to these safety limitations, alternative methods for conducting the certification tests must be explored.

The primary objective of this section is to determine whether hydrogen can be substituted with an alternative filling agent without substantially altering the structural properties that would invalidate test results. 
To address this question, the most critical load cases will be examined in @chap_3_0_0. These findings will inform the central question addressed in @chap_3_0_1 to @chap_3_0_3: Can hydrogen be replaced with an alternative medium in the tanks without significantly affecting the structural properties during experimental structural investigation?
Finally, in @chap_3_0_4, practical methods for introducing physical loads during experimental tests are evaluated against selected criteria. The insights gained from this evaluation establish the foundation for the aerodynamic load discretization and optimization methodology developed in @chap_4_0.



// Title was tested and is inshallah fine
// word repetition task inshallah completed
=== Study of Critical Load Cases<chap_3_0_0>
Findings from @chap_2_0_1 and @chap_2_0_2 demonstrate that conducting experimental structural tests with hydrogen in long tubes under high pressure presents severe safety risks for both the testing environment and engineering personnel. This raises the question of whether an alternative filling agent could be used to mitigate these safety concerns.
To address this question, it is first necessary to establish the primary prerequisite: identifying concrete load cases for analysis. Thus, this subsection focuses on identifying critical load cases and explains why testing all potential load cases, either experimentally or through simulation, is not feasible. Based on these constraints, an alternative methodological approach is presented and justified. It is demonstrated how one crucial load case can be filtered from the many available scenarios. Additionally, an introduction to the V-n diagram is provided to establish the relationship between the primary critical load case and the flight envelope.

The identification of crucial load cases for structure-integrated hydrogen tanks presents a complex engineering challenge when designed as integral components of general aviation aircraft wings. The inherent complexity arises from the dual-nature of #glspl("swith"): these components simultaneously function as integral elements of the wing structure bearing aerodynamic loads while containing high internal pressures. This duality necessitates that each conventional load case be evaluated across a spectrum of pressure conditions, from unpressurized states through various pressure levels, substantially expanding the testing matrix.
The challenge of identifying critical load cases is crucial even for conventional general aviation aircraft, considering the extensive range of scenarios prescribed in certification standards @EASA_CS_23 @EASA_CS_25. A comprehensive experimental investigation encompassing all potential load cases proves prohibitive from both economic and environmental sustainability perspectives.

While numerical approaches offer a potential alternative pathway, these methods introduce their own set of obstacles. Single aerodynamic load calculations may require months of processing time, with the computational demands varying significantly based on accuracy requirements @Yang2021a @HernandezAguirre2022 @Kochkov2021 @Blazek2015 @Fu2020
// --------------------- drawbacks of regular simulation -------------------- //
According to @Yang2021a, Direct Numerical Simulation (DNS) requires 100 times more computing resources than wall-resolved large-eddy simulation (WRLES) for Reynolds numbers ranging from $10^7$ to $10^9$ @Sigloch2022 @Schlichting2017. 
Following Moore's @Moore1998 or Koomey's @Koomey2011 law, which predicts computing capability doubling every two years, the Reynolds number range currently accessible to WRLES would become accessible to DNS in approximately 13 years @Yang2021a. The numerical simulation hierarchy extends further: WRLES itself demands considerably more resources than wall-modeled LES (WMLES), with computational costs scaling as $"Re"^2.72$ and $"Re"^1.14$ respectively @Yang2021a.

The practical implications of these calculation demands are substantial. A DNS study conducted on Argonne's Mira supercomputer demonstrates these resource requirements. The investigation required 25 million core hours, while comparable WMLES cases averaged only 150,000 core hours on the same system, revealing DNS to be approximately 150 times more compute intensive than WMLES @Fu2020. Direct numerical simulations face significant scalability challenges. Despite their foundation in fundamental physics laws and equations of motion, these simulations remain technically infeasible at scales necessary for critical applications such as climate and weather modeling @Kochkov2021.
While simplified aerodynamic simulations can be achieved by omitting friction effects and introducing other simplifications @Barba2019 @Drela1989 @aerosandbox_phd_thesis @Verdugo2022 @Liu2022a @Wild2022, such compromises potentially yield accuracy levels that fall short of certification requirements.



// -------------------------------- ml models ------------------------------- //
Machine Learning @Brunton2022 @Bishop2006, and particularly deep learning @Goodfellow2016 @prince2023understanding, have found widespread applications across science and industry for solving diverse problems @Cuomo2022 @Habehh2021 @Alanazi2022 @Masud2021 @Black2022. Machine learning and deep learning approaches demonstrate capability in replicating physics-based mathematical equations with varying degrees of accuracy @Brunton2022.
The development of surrogate models through these approaches requires substantial training data. For high-fidelity simulations, this training data necessarily comprises outputs from existing high-fidelity numerical models. When sufficient training data is available, numerous modeling approaches can be implemented @Charbuty2021 @Palimkar2021 @Cristianini2000 @Murty2016 @Suyal2022 @Dumitrescu2022 @Itoo2020 @Ahmad2020 @Li2023c @vaswani2017attention @Sastrawan2022 @You2022 @Qu2024 @Robinson2022. While model training demands notable computational resources, the inherent structure of machine learning algorithms, particularly deep learning architectures, enables efficient parallelization of these calculations.


To reduce training time, #glspl("gpu", long:true) @Kaur2023 @DeLuca2024 are essential processing resources. The widespread adoption of machine learning has driven advances in software frameworks that enable parallel training across multiple #glspl("gpu"), further accelerating model development @Paszke2019 @tensorflow2015_whitepaper @Sergeev2018 @link_ray2024 @link_deepspeed2024 @link_accelerate2024.
While the training phase of deep learning models can be time-intensive, the subsequent inference time is substantially lower @butt2021development. Inference, which refers to generating model outputs, can often be performed in real-time. Additionally, depending on the neural network architecture, models trained on multiple #glspl("gpu") may operate efficiently on a single #gls("gpu") or even a #gls("cpu", long:true). 
For models that fit within RAM (Random Access Memory), inference operations on standard #glspl("cpu") typically execute orders of magnitude faster than high-fidelity #gls("fem") @Mittelstedt2021 @Mittelstedt2022 @Werkle2021a @Hahn2018 @Langtangen2016 @Langtangen2019 @Dhondt2004 or #gls("cfd") simulations.


Significant computational speed improvements through machine learning applications have been demonstrated in various fields. An example of this is found in a case study of particle accelerator simulations @Edelen2020. In their primary test case, while the physics simulation required 590 seconds using 8 computing cores, the neural network surrogate model executed in less than one millisecond on a single laptop core, representing a speedup of $cal(O)(10^6)$ times.
The efficiency gains extended beyond raw execution speed. The machine learning approach required 132 times fewer simulation evaluations and reduced total core-hours by a factor of 144 compared to traditional physics simulations. Through iterative retraining, potential further reductions of 330-550 times fewer simulation evaluations were identified. Their more complex test case, the IsoDAR cyclotron, demonstrated even more substantial improvements, with the neural network executing $cal(O)(10^7)$ times faster than the original physics simulation. These improvements maintained good accuracy compared to the underlying physics simulations, while the neural network training required only 10 minutes on a laptop.
Comparable efficiency improvements have been documented in fluid dynamics, with speedup factors between 40 and 80 reported for #gls("cfd") applications @Kochkov2021.


Having mentioned some advantages of machine learning models as surrogates, two important factors require emphasis. First, the cited speedup in calculations refers specifically to the inference phase, not the training phase. Second, developing machine learning models demands substantial input data. For high-fidelity simulations, this means conducting computationally expensive simulations to generate training data. Therefore, if pre-trained models are not available, the initial high-fidelity numerical simulations remain necessary. Consequently, all challenges associated with high-fidelity simulations persist during the data generation stage for machine learning models.

Given these limitations in both traditional simulation approaches and machine learning alternatives, establishing comprehensive simulation capabilities presents considerable resource difficulties beyond just computational power. Even with advanced computing methods, successful analysis requires expertise in several technical domains. These include #gls("cfd") for accurate aerodynamic load prediction, structural mechanics for understanding load distribution and material behavior, and multi-disciplinary approaches @Wang2021 @Meng2022 @Mader2020 @Meng2021 @Li2019a. The complexity is further increased by the potential need for multi-objective optimization techniques @Tian2021 @Li2023d @Ridha2021 to manage the vast solution space.

The challenge extends to additional physical phenomena such as crash dynamics @PrabhaharanS_2022 @FragosoMedina2021 @MortazaviMoghaddam2021, multi-body interactions @Balena2021 @Rahnejat2023 @Benmeddah2024, dynamic structural responses, and thermomechanical effects. Beyond these individual phenomena, certain analyses require coupling between different disciplines. 
For example, accurate flutter investigations necessitate the coupling of aerodynamic and structural analyses to capture the complex interactions between airflow and structural deformation @Kaneko2022. Even with state-of-the-art high-performance computing infrastructure, such coupled analyses across multiple load cases remain numerically intractable for real-time analysis.
Yet, it is important to note that the fundamental challenge lies not in solving any single physics or coupled problem, but rather in the systematic evaluation of numerous load cases, each potentially requiring different combinations of physical models and solver configurations.
Moreover, the interpretation of such multidimensional results requires sophisticated post-processing methodologies to identify truly critical load cases, as the interaction between different physical phenomena may lead to non-obvious failure modes. 

To give some perspective on why load case simulations for #gls("swith") are complex and multidisciplinary, @tab_12 and @tab_13 provide relevant examples. The diverse expertise required becomes evident when comparing different test scenarios. For instance, simulating a gunfire test demands fundamentally different capabilities than those needed for a pneumatic cycle test or a glass transition temperature test.
The reasons for inclusion of pressurized cylinder tests for #glspl("swith") were elaborated in @chap_1_0_6. Since this thesis focuses on #glspl("swith") using #gls("cgh2", long:true), it is reasonable to anticipate that some or all tests required for pressurized cylinders may also be applicable to high-pressure vessels when integrated as load-bearing components within an aircraft's wing. Additionally, aircraft standards such as @EASA_CS_23 and @EASA_CS_25 outline numerous potential load cases requiring consideration.


// --------------------------- general load cases --------------------------- //
The following description of general loads that occur during flight and on ground operations draws primarily from @heinze2023aircraft. Aerodynamic forces induced during flight operations, specifically the pressure differentials that generate lift and negative lift forces, constitute a primary category. These aerodynamic loads manifest predominantly during dynamic flight maneuvers. During coordinated turns, the required lift coefficient must exceed the weight-induced load factor to maintain the desired flight path. Similarly, the transition from descent to level flight at low altitudes necessitates substantial lift forces that exceed those required for steady-state flight conditions.
Atmospheric perturbations, particularly gust loads, constitute another critical category of aerodynamic forces. These are complemented by control surface-induced loads, where rudder deflections alter the pressure distribution patterns and generate supplementary force components.
Buffeting represents another important flight phenomenon, characterized by highly non-linear dynamic and fluctuating loads that cause noticeable vibrations in the aircraft structure. This phenomenon can occur in various flight conditions: during transonic flight, at high angles of attack, when flying through vortices, when encountering wake turbulence, or due to shock wave oscillations (fluctuating shock location) in transonic conditions @Caruana2005. Additional aerodynamic loads can arise from complex flow interactions, particularly in regions such as the wing-fuselage junction.

Beyond aerodynamic loads, inertial forces constitute another significant load category. These forces arise whenever the aircraft or its components experience acceleration or deceleration. This encompasses all phases of operation including takeoff acceleration, landing deceleration, and general flight maneuvers. 
Component-specific vibrations and flutter phenomena also contribute to the inertial load spectrum. Additionally, propulsion-related forces encompass thrust forces, gyroscopic effects from rotational speed variations, and the dynamic interactions between engine, pylon, and airframe systems @heinze2023aircraft.
Ground operations introduce a distinct set of loads: landing impact forces and subsequent braking loads, runway surface irregularities, towing forces during ground handling, and maintenance-related loads such as jacking operations @heinze2023aircraft. 
Of particular concern are tool drop scenarios during maintenance, which must be considered in the structural analysis.
It's important to note that these various load cases do not act uniformly across the aircraft structure, nor do they necessarily occur simultaneously. Rather, specific locations experience characteristic load combinations that can result in critical stress states, forming the fundamental basis for structural dimensioning @heinze2023aircraft.

// ----------------------------------- MBB ---------------------------------- //
Given the outlined challenges, this work leverages established industry knowledge to identify potentially key load cases for #glspl("swith"). The former company MBB performed a statistical evaluation to determine the probability of each load case being critical. Their findings in percentage, that is, in how many times one load case was found to be critical, is given in @tab_29.

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
  caption: [Statistical probability distribution of critical load cases in commercial aircraft design, derived from lecture materials in #emp_[Design of Commercial Aircraft II] @heinze2023aircraft.],
) <tab_29>

The critical load cases mentioned in @tab_29 were obtained through a presentation in the lecture course #emp_[Design of Commercial Aircraft II] at TU Braunschweig in Germany @heinze2023aircraft, delivered by Dr. Heinze. Such data of load cases represents valuable proprietary knowledge typically protected within large aerospace companies and rarely accessible to the broader scientific community. The availability of this data through academic channels provides unique insights into industry-validated load case hierarchies.

// ------------------------------ explain table ----------------------------- //
In the following brief explanations about the crucial load cases identified in @tab_29 shall be given. Vertical gusts and elevator maneuvers represent the most critical load cases with 100% probability, where vertical gusts generate significant structural loads through rapid angle of attack changes affecting the entire airframe @Gudmundsson2014.
The elevator maneuver involves the pilot executing and maintaining maximum elevator deflection from level flight. This creates substantial initial control forces on the horizontal tail, inducing fuselage bending and aircraft pitching motion. The subsequent climbing or descending motion generates additional aerodynamic forces on the wings, making these load cases often dimensioning for various structural areas, particularly the horizontal tail and aft fuselage section.
Landing impact follows at 90% criticality, characterized by the dynamic response of the airframe during touchdown, where vertical acceleration loads are transmitted through the landing gear into the primary structure. 
Aileron maneuvers and ground rolling (80%) introduce asymmetric lift distributions with substantial moment arms to the wing root, while ground rolling creates dynamic loads through partially-fueled wings interacting with runway irregularities. 
Lateral gusts and rudder maneuvers (70%) primarily influence fuselage design through asymmetric loading conditions, with distributed side forces and concentrated loads at the vertical tail transmitted through the fuselage structure. 
Steady pull-up maneuvers (50%) involve transition from descent to level flight, generating elevated but not maximum load factors @heinze2023aircraft. 
Frontal gusts (40%) create longitudinal loads, though their criticality is generally lower. 
Crash landing and cabin pressure cases (20%) ensure minimum structural integrity for occupant survivability, with cabin pressure's lower criticality often resulting from other load cases determining basic skin thickness requirements @heinze2023aircraft. 
Single engine failure and maximum engine thrust (10%) typically become crucial only in localized areas around engine mounts and pylons.
// -------------------------------------------------------------------------- //

Within the scope of this thesis, experimental and simulative replication of all identified critical load cases is not feasible. Rather than attempting to address all load cases for general aircraft, this work aims to contribute some important findings. These findings could support a final certification process of #glspl("swith") within a feasible timeframe and available scientific resources. This reasoning necessitates a focused approach, concentrating on the single most relevant load case.

// ----------------------- selected critical load case ---------------------- //
According to @tab_29, vertical gust loading represents one of the most probable critical load cases, with a 100% probability of being dimensioning. Consequently, this thesis identifies vertical gust loading combined with internal pressure as the crucial load case for #glspl("swith"). 
While gust loading is inherently a dynamic load case, for the experimental static strength verification only the maximum occurring loads are considered. Thus, the vertical gust load obtained through the V-n diagram can be treated as a static load case, where the peak load factor represents the governing design condition. This approach is consistent with standard aircraft structural testing practices, where static tests verify the structure's capability to withstand limit and ultimate loads.

// ---------------------------- why statical test --------------------------- //
The selection of a static load case is justified by several reasons. First, vertical gust loads can be obtained for all commercially available aircraft through the V-n diagram, thus promoting the generalizability of this work.
To emphasize the relevance of this work, it is important to note that once a setup for conducting static experimental structural tests is established, the same or similar setup can be used for multiple static tests.
Aircraft certification authorities require five static load cases for static strength substantiation @Rossow_2014. These are: preliminary static tests (calibration load cases), proof pressure tests, limit load tests, ultimate load tests ($1.5 times "limit load"$), and the rupture test ($gt.equiv 1.5 times "limit load"$). From these five tests, four can be conducted without requiring significant changes to the setup established for the major load case: preliminary static tests (calibration load cases), limit load tests, ultimate load tests ($1.5 times "limit load"$), and the rupture test ($gt.equiv 1.5 times "limit load"$).
Once a suitable setup is established, which is covered in 
// TODO - reference
// refernce that goes to the optimiaztion, where it is clear which lenght, distance, amount and so on for collets it required
// @chap_4_0, 
the loads can be gradually increased from calibration to limit to ultimate to rupture test.

While the static load testing sequence provides a framework for structural validation, for #glspl("swith") these tests must also account for internal pressure effects. 
As elaborated in @chap_1_0_3, the internal pressure significantly influences the weight, costs, and safety characteristics of the pressure vessel.
The implications of pressure selection can be analyzed from multiple perspectives. From an economic standpoint, higher pressure values enable increased hydrogen storage capacity. From a structural perspective, elevated pressure values intensify the loads on both the pressure vessel and the wing structure due to the structural integration. The safety implications, as elaborated in @chap_2_0_1 and @chap_2_0_2, indicate that higher pressure values increase the risk of self-ignition in case of leakage. From a practical testing perspective, as explained in @chap_1_0_6 with reference to @tab_14, experimental structural validation tests are constrained by maximum allowable pressure limits.
Furthermore, @chap_2_0_2 established a systematic pathway for conducting structural validation tests with #glspl("swith"). Determining appropriate internal pressure values when using #gls("cgh2") as the filling agent presents significant challenges, with substantial implications for the safety of the #gls("swith"), the test environment, and human operators. 
In @chap_3_0_1 to @chap_3_0_3 it is laid out whether the filling agent can be replaced with another medium without changing the structural properties. These findings should be used to make a more sophisticated decision.

// ------------------------------- v-n-diagram ------------------------------ //
Having established the critical nature of vertical gust loading for #glspl("swith"), it is essential to understand how these loads are determined in aircraft design. Vertical gust loads can be systematically obtained and analyzed through V-n diagrams, also known as flight envelopes or V-g diagrams. 
The flight envelope represents the relationship between load factors and airspeed within which an aircraft is designed to operate @Gudmundsson2014 @Rossow_2014. It encompasses two distinct categories of loads: maneuver loads and gust loads @Rossow_2014. An illustrative example of a V-n diagram conforming to #gls("easa") #gls("cs")-23 @EASA_CS_23 specifications for the normal category is depicted in @fig_28.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/0_Load/0_Vn_Diag.svg", 
  width: 100%),
  caption: [Illustrative V-n diagram for normal category aircraft showing flight envelope limits in accordance with #gls("easa") #gls("cs")-23 @EASA_CS_23.],
) <fig_28>

The horizontal axis of the flight envelope in @fig_28 represents the Equivalent Airspeed (EAS) in knots (KEAS), defined by @eq_10. The variables $rho$ and $rho_0$ denote the air density at current flight altitude and at sea level, respectively, while $V_"TAS"$ represents the True Airspeed. The True Airspeed is defined as the relative velocity between the undisturbed far-field flow and the aircraft @Gudmundsson2014.

$ V_"EAS" = sqrt(rho /rho_0) space V_"TAS" $<eq_10>

The vertical axis of @fig_28 represents the load factor $n$, which according to @Rossow_2014 can be described by @eq_11. The variable $P$ represents a force typically acting against the gravitational force $G$, where $m$ and $g$ denote the mass and gravitational constant, respectively.

$ n = P/G = P / (m space.thin g) $<eq_11>

Note that the load factor is dimensionless and corresponds to the safe load or limit load @Rossow_2014. The limit load is defined as the maximum load expected during regular operating lifetime that does not induce plastic deformation or permanent deflections @Rossow_2014. No structural failure should occur before reaching the ultimate load, which is given by @eq_12, where a standard safety factor of 1.5 is applied:

$ "ultimate load" = 1.5 times "limit load" $<eq_12>

The safety factor is intended to account for variations in loads and material properties, as well as potential inaccuracies in calculation methods. Additionally, it helps prevent catastrophic structural failure if operating limits are marginally exceeded @Rossow_2014.
The flight envelope is obtained by combining the effects of both maneuver and gust loads. In @fig_28, these load conditions are visually distinguished through different colors: the gust loads are represented by orange lines, while the maneuver loads are shown in pink. The intersection and overlap of these load conditions define the complete flight envelope, depicted as the cross-hatched blue region. This envelope represents the safe operating boundaries or limit loads within which the aircraft is designed to function.
The characteristic points marked in the legend of @fig_28 represent commonly used design speeds, which are defined below according to @Rossow_2014 @Gudmundsson2014 @EASA_CS_Abbrevs:

- *Design Maneuvering Speed V#sub[A]*: V#sub[A] is the design limit speed up to which a full deflection of any one control surface (aileron, elevator, and rudder) is possible with retracted flaps without causing structural failure. Simultaneous full deflections of multiple control surfaces as well as multiple deflections of a single control surface are not permitted at V#sub[A].
  
- *Design speed for maximum gust intensity V#sub[B]*: Most often used for commuter-class aircraft.

- *Design Cruising Speed V#sub[C]*: V#sub[C] is the design speed for cruise flight. When determining V#sub[C], economic aspects such as low fuel consumption must be considered along with the boundary conditions specified in the certification requirements applicable to the respective aircraft class.

- *Design Diving Speed V#sub[D]*: V#sub[D] is the maximum flight speed for which the aircraft structure is designed. Certification requirements often mandate a minimum margin between V#sub[D] and V#sub[C], which depends on the aircraft class.

- *Design Flap Speed V#sub[F]*: V#sub[F] is the maximum design speed for flight with extended high-lift flaps on the wing.

- *Stalling Speed V#sub[S]*: V#sub[S] is the minimum flight speed in level flight with retracted flaps at which no flow separation occurs on the wing (stall speed). In other words, this is flight at the maximum lift coefficient C#sub[L,max].
  

Having defined these velocities, it is important to note that the mathematical relationships between them for constructing V-n diagrams are specified in certification standards such as @EASA_CS_23 and @EASA_CS_25. The V-n diagram primarily addresses symmetrical flight loads and generally does not encompass asymmetrical load cases. An noteworthy exception exists for banked turns which, although technically asymmetrical load cases, can be incorporated into the V-n diagram analysis @Rossow_2014.
Beyond its use in structural analysis, the V-n diagram provides valuable operational information for pilots. By interpreting the diagram, pilots can determine critical flight parameters, such as the maximum airspeed for control surface deflection, dive speed limitations, and required deceleration points @Gudmundsson2014.

For a comprehensive understanding and detailed construction of V-n diagrams, readers are referred to standard references such as @Rossow_2014 @Gudmundsson2014, along with certification standards @EASA_CS_23 @EASA_CS_25. The V-n diagram presented in @fig_28 was generated using the open-source aerodynamics tool #emp_[ADRpy] @link_ADRpy, which has been validated against #gls("cs")-23 specifications @EASA_CS_23. Within the scope of this work, the validation confirms #emp_[ADRpy]'s accuracy specifically for small aircraft V-n diagrams. The only modification to the standard #emp_[ADRpy] output was the implementation of Plotly @plotly_2015 as the visualization library, replacing the default Matplotlib @Hunter2007 plotting system.

// ---------------------- positve effects because of vn --------------------- //
The selection of vertical gust loading as a critical load case, obtainable through V-n diagram analysis, offers several advantageous implications for #gls("swith") development. A primary benefit stems from the broad applicability of V-n diagrams across various aircraft categories, including normal, utility, aerobatic, and commuter classifications, as well as large aircraft. This universality enables the extension of #gls("swith") applications across diverse aircraft categories and size ranges. It is important to note that the construction of flight envelopes varies according to specific aircraft categories and dimensions, with distinct regulatory requirements governing each case.

A significant advantage of utilizing V-n diagram-derived loads lies in their compatibility with existing simulation frameworks. The characterization of loads through two fundamental parameters—velocity and load factor—facilitates direct integration into existing numerical simulation models. 
The practical implementation is demonstrated through the flight envelope (@fig_28), where each point defines a specific operating state through its velocity and load factor. 
At any point in the flight envelope, the lift force must equal $n$ times the aircraft weight. This relationship can be expressed through the lift coefficient calculation, as shown in @eq_13.
The variables are denoted as lift coefficient $C_L$, lift force $L$, aircraft weight $W$, aircraft mass $m$, gravitational acceleration $g$, air density $rho$, velocity $u$, reference area $S$, and load factor $n$.

$ C_L = L / ( rho/2 u^2 S)  =  (W space.thin n) / ( rho/2 u^2 S) =  (m space.thin g space.thin n) / ( rho/2 u^2 S) $<eq_13>

This lift coefficient, combined with the aircraft's geometrical data, serves as input for lift distribution tools such as the 3D panel method solver APAME @Filkovic. The resulting spanwise lift distribution can then be applied as loading conditions for both simplified structural models and high-fidelity structural analysis through #gls("fem") models.

Having established the theoretical foundation for critical load cases and V-n diagram analysis, industry consultation provided empirical validation. Meetings were conducted with two German companies: a pioneering aircraft manufacturer and one of Europe's leading aerospace testing facilities 
// TODO
#footnote[Company names withheld due to confidential knowledge], the latter being particularly experienced in structural validation testing of large commercial aircraft.

Both organizations demonstrated substantial interest in the structural testing, development, and commercial certification of #glspl("swith"). One of these companies conducted independent investigations of critical load cases and shared their findings with this research. While specific details remain confidential, it is substantial that both organizations corroborated the identification of multiple load cases from the V-n diagram as critical. This industry validation supports the adoption of V-n diagram analysis as a valuable methodology for the structural validation testing of #glspl("swith").

// --------------------------------- summary -------------------------------- //
#summary_[
In summary, identifying critical load cases for conventional aircraft already presents a highly demanding task. The complexity increases substantially for #glspl("swith"), as they combine characteristics of both aircraft and pressurized vessels, necessitating consideration of load cases from both domains. However, through valuable statistical analysis, a comprehensive list of critical load cases for general aviation was established. From this analysis, a specific crucial load case for #glspl("swith") was derived. The validity of this approach was confirmed by two leading German aerospace companies. Furthermore, analysis of the V-n diagram provided crucial insights into the relationship between the identified critical load case and the flight envelope.
]