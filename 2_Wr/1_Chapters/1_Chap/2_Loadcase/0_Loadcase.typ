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
a single aerodynamic load calculation may require months of computational time @Yang2021a @HernandezAguirre2022 @Kochkov2021 @Blazek2015 @Fu2020 .

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

having mentioned big advatages of using machine learning models as surrogate models, two improtant factor shall be reiterated. 
When saying machine learning model would speedup caluclations, the inferece pahse is refered to, not the trianing pahse.
Next, in order to traing machine learning model, input data is required. For the case of high fidelity simulation, high fidelty time and computaitonal expensive simualtion would need to be carried out. Thus, if no trained model are provided, the inital high fidelty numiercal simulations cannot be skipped. Because of this all diffucilzties faced with high-fidelty simulation are also faced during the data generation stadium for machine learning models.

Given these limitations in both traditional simulation approaches and machine learning alternatives, establishing comprehensive simulation capabilities presents significant resource challenges. 

The  general development and implementation of fast, accurate simulation capabilities is possible. It demands extensive technical expertise and computaitonal resources.
Depending on the specific loadcase this could encompass expertise computational fluid dynamics for accurate aerodynamic load prediction, structural mechanics for understanding load distribution and material behavior, multi-disciplinary @Wang2021 @Meng2022 @Mader2020 @Meng2021 @Li2019a, and multi-objective optimization techniques @Tian2021 @Li2023d @Ridha2021 for handling  complex requirementsments as well the vast solution space. Furthermore, depending on the specific load case, additional physical phenomena must be considered, including crash dynamics
@PrabhaharanS_2022 @FragosoMedina2021 @MortazaviMoghaddam2021, multi-body interactions @Balena2021 @Rahnejat2023 @Benmeddah2024, dynamic structural responses, and thermomechanical effects. Each of these domains introduces its own set of numerical complexities and computational demands.

Moreover, some loadcases could require the coupling of multiple disciplines. These physical phenomena further compounds the computational complexity, leading to potential stability issues and increased computational overhead. Even with state-of-the-art high-performance computing infrastructure, the simultaneous consideration of aerodynamic effects, structural responses, and internal pressure loads across multiple load cases remains computationally intractable for real-time analysis. The challenge is not in solving any single multiphysics problem, but rather in the systematic evaluation of numerous load cases, each potentially requiring different combinations of physical models and solver configurations. 
Moreover, the interpretation of such multidimensional results requires sophisticated post-processing methodologies to identify truly critical load cases, as the interaction between different physical phenomena may lead to non-obvious failure modes. These fundamental challenges in both computation and analysis underscore the current limitations in achieving comprehensive, high-fidelity simulations for all specified load cases.


Given these computational challenges, the identification of potentially critical load cases for #glspl("swith") was approached by leveraging established industry knowledge. The analysis draws upon critical load case data originally developed by the former company MMM, as presented in @tab_29. 
The data was presented in the lecture course #emp_[Design of Commercial Aircraft II] at TU Braunschweig in Germany @heinze2023aircraft, delivered by Dr. Heinze.
MMM's approach involved comprehensive load case simulations followed by statistical evaluation to determine the probability of each load case being dimensioning. Such probabilistic classification of load cases represents valuable proprietary knowledge typically protected within large aerospace companies and rarely accessible to the broader scientific community. The availability of this data through academic channels provides unique insights into industry-validated load case hierarchies.



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


Within the scope of this thesis, experimental replication of all identified critical load cases is not feasible due to resource constraints, necessitating a focused approach on one or two critical cases. Similarly, comprehensive simulative modeling of all critical load cases from @tab_29 presents significant challenges, requiring extensive computational resources for high-fidelity #gls("cfd", long:true) calculations, fluid-structure coupling, multi-body simulation, crash analysis, or combinations thereof.

// ------------------------------- v-n-diagram ------------------------------ //
According to @tab_29, vertical gust loading represents one of the most probable critical load cases, with a 100% probability of being dimensioning, thus warranting detailed investigation. 
This load case can be systematically analyzed through V-n diagrams. 
The V-n diagramm is also called flight envelope or v-g diagramm.
The flight envelope shows specific load factors over airspeed that an airplane has been designed to operate within @Gudmundsson2014 @Rossow_2014. 
It shows two differnt kind of laods, maneuver and gust laods @Rossow_2014.
An illustrative example is depicted in @fig_28 according to the EASA CS-23 @EASA_CS_23 for the normal category.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/0_Load/0_Vn_Diag.svg", 
  width: 100%),
  caption: [illustrative V-n diagramm (flight envelope, V-g diagram) according to EASA CS-23 @EASA_CS_23 for the normal category.],
) <fig_28>

The horizontal axis of the flight envelope in @fig_28 shows the Equivalent Airspeed (EAS) in knots (KEAS) and is given as @eq_10. The varaiables $rho, rho_0$ and $ V_"TAS"$ denote the density at current flight altitude, density at sea level and the true airspeed, respectively. The true airspeed defines the relative speed between the undistrbed far-field and the aircraft @Gudmundsson2014.

$ V_"EAS" = sqrt(rho /rho_0) space V_"TAS" $<eq_10>

The vertical axis of @fig_28 shows the load factor n following @Rossow_2014 can be descibed as @eq_11. 
The variable $P$ is denoted as a force usally acting against the mass force $G$, where $m "and " g$ stand for the mass and gracitional constant. 
Note that the load factor is unitless and corresponds to the safe load or limit load @Rossow_2014.  

$ n = P/G = P / (m space.thin g) $<eq_11>

Next, some points of the legends in @fig_28 are commonly used and shall be spelled out following the definitions provided by @Rossow_2014 @Gudmundsson2014 @EASA_CS_Abbrevs 

- *Design Maneuvering Speed V#sub[A]*: VA is the design limit speed up to which a full deflection of any one control surface (aileron, elevator, and rudder) is possible with retracted flaps without causing structural failure. Simultaneous full deflections of multiple control surfaces as well as multiple deflections of a single control surface are not permitted at V#sub[A].
  
- *Design speed for maximum gust intensity VB* Most often used for commuter-class aircraft.

- *Design Cruising Speed V#sub[C]*: VC is the design speed for cruise flight. When determining VC, economic aspects such as low fuel consumption must be considered along with the boundary conditions specified in the certification requirements applicable to the respective aircraft class.

- *Design Diving Speed V#sub[D]*: V#sub[D] is the maximum flight speed for which the aircraft structure is designed. Certification requirements often mandate a minimum margin between V#sub[D] and V#sub[C], which depends on the aircraft class.

- *Design Flap Speed V#sub[F]*: VF is the maximum design speed for flight with extended high-lift flaps on the wing.

- *Stalling Speed V#sub[S]*: V#sub[S] is the minimum flight speed in level flight with retracted flaps at which no flow separation occurs on the wing (= stall speed). In other words, this is flight at the maximum lift coefficient C#sub[L,max].
  

Next, it is important to note that generally the V-n diagramm limits itself to symtrical flight loads, thus cannot encompass asymtrical load cases.
While the banked turn is strictrly asymtrical load case it still can be considered through the V-n diagram @Rossow_2014.
Besides reading the V-n diagramm to obtain infromation about the aircraft's strucutre, pilots can derive important infomation as well.
These include,  what airspeed they can fully deflect control surfaces, what is the dive speed, or the airspeed at which slowing down is required @Gudmundsson2014.

After having explained some for mor concrete details the reader is refered to literature like  @Rossow_2014 @Gudmundsson2014 @EASA_CS_23. For understnaind how V-n diagrams are drawn @Gudmundsson2014 and standards like @EASA_CS_23 @EASA_CS_25 should be considered. 

Since the load cases obtained through the V-n diagramm can be represnted through load factors, they can easily be integrated in existing strucutre simualtions.
The latter is true for  simple beam models, where any existing load can be sacled with a factor, but also for more intricate #gls("fem") models, where the applied loads can be scaled in similar way.

// ---------------------------------- here ---------------------------------- //
Moreover while V-n diagrams encompass a broad spectrum of load cases, critical conditions within this spectrum have been well-documented in literature @heinze2023aircraft.

// TODO light aircraft, bigb aircraft - focus on light aircraft, because it is believed swith it would be more reasonable to ahve smaller swiths than bigger acs
Significantly, V-n diagrams maintain validity across various light aircraft configurations, suggesting that findings from this research could potentially extend to other hydrogen-powered light aircraft designs.

This potential for broader applicability motivated the development of independent V-n diagram generation capabilities. An open-source aerodynamics tool, ADRpy 
// @github_sobester_2023
, was identified and thoroughly validated against CS-23 specifications for V-n diagram generation. The tool's functionality was subsequently enhanced with additional features to meet specific research requirements.

// -------------------------------------------------------------------------- //
For this thesis, it is not possible to experimentally replicate all identified load cases. Rather, due to cost and time constraints, it is necessary to select one or at maximum two load cases. 
Simulative modeling of the critical load cases from @tab_29 is also not readily feasible. Depending on accuracy requirements, high-quality and time-intensive #gls("cfd") calculations, fluid-structure coupling, multi-body simulation, crash analysis, or a combination thereof must be computed.
Given that vertical gust loading is considered one of the most significant loads, it warrants closer examination.
The loads can be derived from a V-n diagram and can be practically implemented into existing methods. The V-n diagram itself prescribes an entire range of possible load cases. However, the critical cases among these have already been identified in the literature. Furthermore, the V-n diagram is valid for all common types of light aircraft. Thus, there exists the possibility that the knowledge gained through K2H2 may also be applicable to other hydrogen-powered light aircraft.
Motivated by this, possibilities for creating V-n diagrams independently were investigated. A free tool was identified (ADRpy, https://github.com/sobester/ADRpy, last accessed on 26.04.2023), which was initially verified against each individual point specified in CS-23 for creating a V-n diagram. Subsequently, the tool was extended with several desired features.


Concurrent discussions were held with the light aircraft manufacturer APUS. This company had also investigated critical load cases and made them available to the project consortium. As this information was provided confidentially, it currently cannot be shared with the public. However, it should be noted that in this case as well, numerous load cases from the V-n diagram were classified as critical. Therefore, the developed V-n modeler can be considered a valuable component.
In summary, it can be stated that from the many possible load case ranges, a significant load case range could be identified and justified. This range prescribes its load cases through a V-n diagram. Motivated by this, K2H2 now has its own small tool available for the creation of V-n diagrams.

// VN-Diag


// other companies mentioned