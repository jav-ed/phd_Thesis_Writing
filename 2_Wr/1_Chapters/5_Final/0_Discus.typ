/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */
// Word rep ins. done

= Discussion <chap_6>

Starting with @chap_0_2, it was explained that aviation has become an indispensable part of the global economy, serving both personal and business sectors with fast and reliable transportation.
However, its negative environmental impact necessitated recognition, prompting research into alternative and more environmentally friendly fuels.
Hydrogen emerged as a promising candidate, not only for aviation but across various sectors, making research in this area broadly valuable. 
In this context, #gls("swith", long:true) represent a novel approach. 
The hydrogen tanks not only store fuel but also actively function as part of the wing, sharing loads between the wing and the tanks.
This innovative design aims to optimize space usage and potentially increase wing stiffness, showcasing how scientific ingenuity could address multiple challenges simultaneously.

// ------------------------------ state of art ------------------------------ //
The detailed definition of a #gls("swith") and its comparison with other structure integrated concepts as well with regular aircraft is given in @chap_0_7.
Here, it was concluded that all hydrogen-powered aircraft concepts share the same primary objective: the reduction of negative environmental impact. 
The structural integration of hydrogen tanks provides a dual advantage by combining fuel storage with load-sharing capabilities.
At the time of writing, two distinct approaches to structural integration were identified: fuselage-integrated and wing-integrated.
The field of #glspl("swith") is characterized by a scarcity of scientific literature. This paucity of research embodies both advantages and barriers. 
On one hand, it enhances the value and supports the novelty aspect of #gls("swith") research. 
Hence, this situation underscores the need for further investigation into #glspl("swith"), potentially encouraging more researchers to explore this topic.
Conversely, the limited availability of prior work means that scientists have a reduced foundation of existing research upon which to build. As a result, it poses initial hurdles that need to be overcome in the pursuit of sustainable aviation.

// ------------------------------- 0_Standards ------------------------------ //
Beyond these general research obstacles, a critical concern for #glspl("swith") lies in their standardization, development, and certification, as detailed in @chap_1. 
The role of standards for #gls("swith") certification is multifaceted and remains in its infancy.
While the innovative nature of #glspl("swith") faces challenges for standard application, they also create opportunities for advancing both the technology and their regulatory framework.
As of this writing, no known standards or regulations exist for certifying #glspl("swith"). 
This absence of certification procedures significantly constrains industrial and scientific applications of #glspl("swith").
Consequently, there is a pressing need for appropriate standards upon which industry and scientific institutions can build.
This proactive approach to standardization is crucial for overcoming current limitations and facilitating broader adoption of #glspl("swith").
Through careful adaptation of existing standards and certifications and the development of #gls("swith")-specific regulations, researchers and engineers could establish robust validation procedures. 
These procedures should ensure that #glspl("swith") are developed and structurally validated in a manner that is safe and efficient, while meeting industry and regulatory requirements.

// ---------------------------- 1_Aero_Standards ---------------------------- //
However, the path toward establishing these standards presented several obstacles. While there are currently available standards that, in theory, could be applied to #gls("swith")-certification, authorities can reject their application due to fundamental differences in pressure requirements and tank scale.
To bridge this gap, two standards specifically for hydrogen-powered general aviation were announced: SAE AS 6679 @SAE_Liquid and SAE AS 7373 @SAE_Gas. Though not currently commercially available, their potential applicability to #glspl("swith") is unclear for several reasons.
Firstly, the scope of these SAE standards regarding tank configuration remains uncertain. 
In particular, currently it is not clear whether these standards will be limited to non-integral, non-external loaded, and thus non-load-carrying hydrogen tanks, or if they will extend to external-load carrying integrated designs.
While they may address fuselage-integral hydrogen tanks, their applicability to wing-integral tanks is not guaranteed. 
Therefore, the relevance of these announced SAE standards to #gls("swith") certification has yet to be determined.
Secondly, these standards may require modifications before gaining acceptance within European regulatory frameworks.
The timeline of aerospace standardization developments provided additional context. 
In 2018, ANSI/AIAA S-081B-2018 @ansi_standard_2018 was released for space systems. 
Subsequently, in 2019, SAE initiated the development of SAE AS7373 @SAE_Liquid for liquid hydrogen in aviation. 
Notably, this development continues as of late 2024, five years after its initiation. This extended development period demonstrates that adapting space standards for general aviation applications requires substantial time and effort.

// --------------------------- 2_Pressure_Vessels --------------------------- //
While standards development progressed, the broader context of hydrogen pressure vessels exhibited promising opportunities. 
As derived in @chap_1_2, there exists a vast field of applications for hydrogen pressure vessels.
The examination of different mobility sectors, which are pivotal drivers of economic and scientific growth, underscored the fundamental importance of hydrogen pressure vessels. 
Analysis of the five known tank types, including their applications, advantages, and disadvantages, outlined in @chap_1_2, led to a clear conclusion: tank Type IV emerged as the most suitable choice for #gls("swith") design.
This choice is justified by its maturity, commercial availability, and optimal balance between performance and safety considerations

// ------------------------------ 3_Automotive ------------------------------ //
Beyond tank selection, @chap_1_3 explored potential insights from the automotive sector. Academic work in the automotive industry revealed common aims with aerospace regarding structural integral hydrogen tanks, demonstrating interest in this technology across multiple transportation sectors.
Similar to the aerospace field, available literature on this topic remained scarce.
The most relevant academic contribution from the automotive sector, presented by @Bleser2012, investigated the use of hydrogen tanks as torque absorbers.
However, this research lacked crucial details, particularly regarding experimental methodology.
Consequently, the state of automotive research offered limited guidance for certification-oriented experimental structural validation tests of #glspl("swith").
While existing patents described tanks as load-bearing structural integral components, they too provided insufficient details to support such tests.
This gap in specialized technical documentation emphasized the need for more comprehensive research spanning both automotive and aerospace industries.

// ---------------------------- 4_Various_Fields ---------------------------- //
Moving beyond transportation sectors, @chap_1_4 added a broader perspective on hydrogen standards. A significant number of standards relating to hydrogen applications were identified. 
These standards existed in various stages of development. Some standards were in use, whereas others were undergoing updates. 
Additionally, several standards had been announced, but still awaited their initial publication.
Given this extensive array of standards, a systematic approach emerged as imperative for identifying the ones most applicable to #gls("swith") development and certification processes.

// -------------------------- 5_Essential_Standards ------------------------- //
The implementation of this systematic approach, as detailed in @chap_1_5, yielded 
meaningful results. 
Through the application of specific assessment criteria, four essential standards were identified as particularly relevant to the development and certification of #glspl("swith"). 
Although these standards do not comprehensively cover all unique aspects of #glspl("swith"), they represent the current state of the art in relevant regulatory frameworks.
As such, they provide valuable insights into potential certification requirements and testing protocols.
Among these selected standards, two offer critical specifications regarding working nominal pressure. 
The maximum allowable nominal pressure varies between standards, ranging from $437.5 "bar"$ to $525 "bar"$. 
This upper bound was not arbitrary but rather constrained by the capabilities of existing test facilities, which cannot exceed certain pressure levels for experimental structural verification tests.
These findings emphasized the dual considerations necessary for #gls("swith") development and certification: adherence to both hydrogen containment and aircraft-specific regulations, as well as acknowledging the current technological limits in testing high-pressure systems.

// -------------------------------- 0_H2_Prop ------------------------------- //
Given these regulatory requirements and testing constraints, a comprehensive understanding of the physical properties and behavior of hydrogen became essential for successful #gls("swith") development and certification.
@chap_2_0 provided an overview of hydrogen's fundamental properties that underpin its potential as an aviation fuel.
Furthermore, the examined properties demonstrated hydrogen's predominantly positive characteristics as an energy carrier. 
One notable hurdle, however, was hydrogen's invisibility to the human eye due to its small molecular size, which presents specific detection and measurement requirements.
The analysis of hydrogen's theoretical gravimetric energy density in relation to its practical energy density in real-world storage systems highlighted opportunities as well as challenges in its implementation as a fuel source.
The analytical functions introduced for calculating hydrogen mass from density and volume across various pressure and temperature ranges deepen this understanding. 
By accounting for real gas behavior, these functions support the modeling and simulation of hydrogen storage in applications such as #glspl("swith"). 
Furthermore, the custom analysis tool, developed using these functions, provides valuable insights into hydrogen's behavior under varying pressure and temperature conditions.

// -------------------------------- 1_Safety -------------------------------- //
Although these analytical capabilities are helpful, they must be complemented by a thorough understanding of hydrogen's safety implications, especially for high-pressure #glspl("swith").
The focus on safety aspects in @chap_2_1 revealed that hydrogen's potential for ignition, explosion, and detonation depends significantly on specific air-hydrogen mixtures.
Two factors particularly impact safety considerations: the wide range of ignitable mixture ratios and the sufficiency of small static discharges to trigger ignition to detonation. 
Additionally, hydrogen's diffusion behavior and material compatibility emerged as another critical hurdle for safe containment. 
While metals provide superior retention compared to plastics, they face the concern of potential hydrogen embrittlement. The analysis in @chap_2_1 emphasized the critical importance of addressing hydrogen safety in real-world applications. 
It also underscored the value of integrating numerical simulations and experimental tests to bridge the gap between theoretical insights and practical implementation. This integration is essential for the experimental structural validation tests of #glspl("swith"), where precise prediction and management of hydrogen behavior are crucial for both safety and performance.


// ------------------------------ 2_Experiment ------------------------------ //
Building on these safety considerations, experimental investigations identified specific obstacles and proposed mitigation strategies.
The experimental investigations mentioned in @chap_2_2 demonstrated that hydrogen self-ignition represents a tangible concern in real-world applications.
Additionally, @chap_2_2 identified the primary geometrical factors that can precipitate ignition and outlined the necessary modifications to mitigate this risk. 
Despite the threat of hydrogen self-ignition requiring serious scrutiny, the literature review supported the feasibility of secure hydrogen application, provided its properties are thoroughly understood and appropriately accounted for.
A critical aspect emerges when evaluating the transferability of hydrogen applications from the automotive industry to #glspl("swith") for large commercial aircraft, such as the Airbus A350-1000 @link_Airbus_350. 
Rather than direct transposition, a structured approach becomes necessary.
This involved conducting a series of smaller-scale experimental and numerical studies, progressively advancing toward large aircraft scale. 
Such a methodical progression enables systematic knowledge accumulation while carefully managing the risks associated with scaling up hydrogen technologies in aviation.
The research delineated a potential development path that emphasized this gradual, methodical approach to research and development, ensuring that each step builds upon validated understanding from previous investigations.


// --------------------------- 3_Pressurized_Body --------------------------- //
Since #glspl("swith") must withstand internal pressure from hydrogen storage as well as aerodynamic loads during flight, it is crucial to assess the behavior of pressurized vessels under external loading conditions.
The literature review presented in @chap_2_3 revealed substantial research on pressurized vessels under external dynamic loading. 
The reviewed studies demonstrated that, for their specific test configurations, internal pressure significantly influences structural behavior, with lateral loads typically generating higher stresses than axial loads. 
The documented failure mechanisms progress from initial deformation through local failure to global failure, depending on impact energy levels.
While these studies provided valuable insights into pressure vessel behavior for dynamic loading conditions, which are essential for aircraft certification, they did not address quasi-static loading scenarios. 
Quasi-static testing, such as ultimate load testing, represents another crucial requirement for aircraft certification and, consequently, for potential #gls("swith") certification. 
This identified gap in current research emphasized the necessity for additional investigations into pressure vessel behavior under external static loads.

// ------------------------------- 0_Loadcase ------------------------------- // 
The challenge of understanding static load behavior becomes particularly significant when framed within the broader context of aircraft load cases.
As mentioned in @chap_3_0, the task of identifying critical load cases for conventional aircraft already presents significant complexity. 
For #glspl("swith"), this complexity increases substantially due to their hybrid nature, combining characteristics of both aircraft and pressurized vessels. This dual characteristic necessitates consideration of load cases from both domains, creating a more intricate evaluation scenario.
Nevertheless, @chap_3_0 demonstrated that through careful statistical assessment, a comprehensive list of critical load cases for general aviation can be established. 
From this foundational investigation, a key load case for #glspl("swith") has been derived. The validity of this methodological approach gains pronounced credibility through confirmation from two leading German aerospace companies. 
Furthermore, detailed examination of the V-n diagram provided essential insights into the relationship between the identified critical load case and the flight envelope.


// ------------------------------ 1_Curv_Theory ----------------------------- //
Building upon this understanding of load cases, @chap_3_1 explored another crucial aspect: the effects of fill media on pressurized structures under static external loading. The research revealed that both internal pressure and medium selection substantially influence structural behavior. 
Comparative studies demonstrated that water-filled pipes consistently outperformed their air-filled counterparts, achieving higher maximum bending moments and enhanced curvature tolerance across all pressure ranges evaluated. 
The observed relationship between internal pressure and structural response exhibited distinct patterns: while both media showed comparable increases in maximum bending moment with elevated pressure, their curvature responses differed markedly. 
A simplified conceptual model was proposed to explain these experimental observations. The model suggested that in water-filled pipes, the confined liquid acts as an integral part of the structural system. 
Under pressure, water particles maintain relatively fixed positions, enabling effective load transfer and redistribution across the pipe's inner surface. 
In contrast, gases maintain greater particle spacing even under compression, requiring higher pressures to achieve similar structural effects.
These findings carry important implications for current testing standards, particularly regarding the use of substitute fill media in certification procedures. 
The research proposed statistical methodologies for quantifying relationships between different fill media, potentially informing future testing protocols. 
Such insights prove especially relevant for #glspl("swith"), where pressurized vessels must withstand external loading conditions while maintaining structural integrity.

// -------------------------------- 2_Curv_3D ------------------------------- //
To further advance the understanding of these structural behaviors, @chap_3_2 presented a comprehensive methodology for curvature calculation and interpretation. 
The study employed a #gls("fem", long:true) simulation model of a #gls("swith") configuration and detailed the procedure for obtaining necessary derivatives. 
A key strength of this approach lies in its displacement-based foundation, enabling application to both analytical solutions and numerical simulations.
The methodology's versatility extends beyond computational applications, as displacement data can also be sourced from experimental investigations.
The critical curvature indicates whether the impact of the filling media on structural properties can be neglected. Through illustrative examples of critical curvature assessment, the work revealed significant challenges in directly comparing computed results with this reference value for complex structures like aircraft.
The outcome yielded practical implications for experimental testing: hydrogen could potentially be substituted with an alternative filling agent without significantly affecting the maximum bearable bending moment. 
However, the examination also highlighted the complexities involved in assessing critical curvature in three-dimensional space, necessitating the development of an enhanced approach.

// -------------------------------- 3_Curv_2D ------------------------------- //
@chap_3_3 addressed the aforementioned complexity by introducing transformation methods. The resulting mathematical framework facilitated the conversion of six-dimensional matrix representations ($bold(A)^(n times 6)$) into simplified two-dimensional forms ($bold(A)^(n times 2)$).
While three averaging approaches were initially considered, mathematical evaluation demonstrated that only two fundamentally different methods exist.
These methods were systematically evaluated using a range of lift coefficients and internal pressures from $150 "bar"$ to $1100 "bar"$ ($15 "MPa"$ to $110 "MPa"$). 
The analysis revealed that for the studied simulation model and load cases, the curvatures in the undisturbed region stayed substantially below the critical threshold.
This finding led to a practical conclusion, potentially specific to the investigated simulation model. 
Under the analyzed load conditions, hydrogen could be substituted with an alternative filling agent in experimental structural validation testing. 
This substitution would not affect the structural behavior, as the material's stiffness characteristics would remain unchanged.
However, while the interpretation needs to be done for each specific simulation configuration, the laid out method is of general nature.

// ----------------------------- 4_Physical_Load ---------------------------- //
// ---------------------------- 5_Physical_Collet --------------------------- //
As another crucial aspect of experimental structural testing, @chap_3_4 tackled a fundamental requirement by delineating the core principles of load introduction in aircraft testing, with particular emphasis on #glspl("swith").
Following an examination of critical load cases and safety considerations from previous sections, the analysis presented three potential approaches for experimental load application: flight testing, wind tunnel testing, and ground-based structural testing. After establishing ground-based testing as the most viable approach, four distinct load introduction methods were extensively evaluated: sandbags, profile-conforming collets, air cushions, and hydraulic cylinders with pads.
A comprehensive evaluation framework comprising thirteen criteria was developed and applied to each method, incorporating factors ranging from economic viability to technical implementation challenges. 
The assessment results were obtained through analytical reasoning and concise evaluation matrices, enabling clear comparison across the methods. 

The evaluation of the innovation criterion demonstrated how different perspectives can lead to opposing yet equally valid conclusions. 
This highlighted the methodical nature as well as the inherent complexity of the assessment process.
The analysis revealed that optimal #gls("lie", long:true) selection depends strongly on context-specific aspects and some identified crucial parameters. 
These crucial parameters required rigorous determination through load approximation analysis.
This investigation provided a methodological foundation for #gls("lie") selection and formed the motivation for the detailed #gls("ld", long:true) analysis outlined in @chap_4.

// ---------------------------- 0_Discretize_Aero --------------------------- //#
Building upon this, @chap_4_0 established the fundamental concepts and methodologies for #gls("ld"), defining it as the systematic approximation of continuous aerodynamic loads through discrete point and area loads.
The investigation presented two primary approaches for determining optimal #gls("lie") configurations: regression-based methods and k-means++ clustering, an unsupervised machine learning technique.
Initial analysis explored regression methods, examining their capabilities through the lens of interpolation, extrapolation, and various error metrics including L1 and L2 norms. The mathematical foundations of these approaches were thoroughly investigated to assess their applicability to load approximation tasks.
Subsequently, k-means++ clustering emerged as a particularly promising methodology, offering direct computation of #gls("lie") positions through centroid calculation and enabling physical interpretation of cluster regions. 
The algorithm's capability to return both positional information and to compute force magnitudes through cluster summation demonstrated significant advantages over regression-based approaches.
Furthermore, the widespread implementation of k-means++ across diverse scientific applications supported its selection as the preferred method.

However, major limitations were identified in the k-means++ approach, especially regarding the determination of individual #gls("lie") dimensions and the maintenance of unobstructed viewing areas necessary for inspection and measurements. 
These limitations, while substantial, do not diminish the method's value as an initial parameter derivation tool. 
Rather, they highlighted the necessity for additional steps to overcome practical constraints in structural testing applications. 
The integration of k-means++ outputs with a comprehensive optimization framework, as examined in @chap_4_5_0 to @chap_4_5_3, provided a pathway for resolving these remaining challenges. This approach also retains the advantages of the clustering method.


// ------------------------------- 1_Get_Aero ------------------------------- //
To implement this optimization framework effectively, @chap_4_1 introduced a sophisticated methodology for transforming complex three-dimensional aerodynamic loads into manageable one-dimensional resulting point loads.
The investigation began with explaining the derivation of aerodynamic loads and their structural relevance. 
This was followed by an examination of the data format requirements for k-means++ clustering.
To bridge the identified gaps between APAME's outputs and k-means++ requirements, a systematic transformation procedure was developed. 
The procedure addressed some key hurdles. 
First, it enabled the conversion of distributed loads to point loads while maintaining their physical significance. 
Second, it resolved mesh density variations that can bias k-means++ clustering results.
The implementation of a reference-length-based force discretization proved instrumental in resolving these obstacles. 
The development process was supported by numerous visual illustrations and mathematical equations to ensure clear understanding.

The reduction of the three-dimensional load distributions to one-dimensional representations enabled the use of computationally efficient beam models as alternatives to #gls("fem") analysis. 
This simplified modeling approach proved particularly advantageous within optimization frameworks, where computational efficiency becomes crucial due to iterative model evaluations.
The findings outlined in @chap_4_1 provided the essential foundation for understanding the concepts elaborated in @chap_4_2 to @chap_4_4 and their practical implementations highlighted in @chap_4_5_0 to @chap_4_5_3.

// ------------------------------ 2_Beam_Model ------------------------------ //

Building upon these computational efficiency considerations, @chap_4_2 delved into the core mathematical foundations of beam modeling theory. 
Despite analytical solutions for individual beam models using traditional pen-and-paper methods being feasible, this approach is impractical for integration within numerical optimization frameworks. 
To overcome this limitation, the programming language Python was adopted as the computational environment, with a detailed justification delineated for this choice.
The investigation examined two beam model solvers, which were first validated against proven textbook solutions and subsequently integrated into an optimization framework.
The transformation of three-dimensional support conditions of #glspl("swith") to two-dimensional representations can introduce additional complexity, as it can yield statically indeterminate beam models. 
Consequently, the IndeterminateBeam @interdetbeam_tool solver emerged as the most appropriate option.

// ----------------------------- 3_Optim_Basics ----------------------------- //
With the beam modeling approach established, @chap_4_3 transitioned to the fundamental principles of optimization. 
It introduced essential optimization terminology, including objective functions, design variables, constraints, and boundaries.
The iterative nature of formulating complete optimization problems was demonstrated through a practical example, emphasizing the intricate relationships of integrating these components into a coherent problem definition. 
The elaboration substantiated the practical relevance of local optima in real-world applications and explained the distinctions between gradient-based and gradient-free optimization.
Optimization is a very large field that finds application in various industries. For interested readers, several helpful book resources were listed: @Gritzmann2013 @Papageorgiou2015 @Stein2018 @Stein2018a @Koop2018 @Grimme2018 @Scholz2018 @Jarre2019 @Dietz2019 @Schumacher2020. Additionally, for multidisciplinary optimization, reference was made to the textbook @mdobook.

// ------------------------------- 4_Beam_Opti ------------------------------ //
Having established the fundamentals of beam modeling in @chap_4_2 and the principles of optimization in @chap_4_3, @chap_4_4 critically assessed beam modeling and detailed #gls("fem") analysis for their potential integration into an optimization framework.
Considering computational efficiency, implementation requirements, educational benefits, open-source availability, and particularly the early developmental stage of #glspl("swith"), beam modeling emerged as the appropriate choice. 
Subsequently, it was demonstrated how the beam model solver could be integrated within an optimization framework to answer questions relevant for #gls("ld") through #glspl("lie") for experimental structural testing.


// --------------------------- optimiaztion cases --------------------------- //
The optimization cases presented in @chap_4_5_0 to @chap_4_5_3 built upon the optimization framework elucidated in @chap_4_4. This framework was developed to determine key parameters of #glspl("lie"), including their dimensions, positioning, force magnitudes, and optimal number. These parameters significantly influence both testing quality and economic efficiency in static structural evaluation procedures.
The progression of optimization cases reflects increasingly sophisticated engineering demands. Case A (@chap_4_5_0) demonstrated the elementary implementation with a single clamped support configuration, establishing the baseline approach for #gls("ld"). 
Case B (@chap_4_5_1) adapted to specific structural requirements by implementing a dual-support system based on proprietary data to better represent #gls("swith") characteristics.
While maintaining the core optimization framework, Case C (@chap_4_5_2) addressed practical installation requirements by incorporating spatial restrictions for essential components, such as landing gear and propulsion systems. 
Case D (@chap_4_5_3) extended these practical considerations by implementing visibility requirements, ensuring sufficient unobstructed areas for measurement and monitoring equipment, without compromising the fundamental optimization approach.

Analysis of configurations ranging from four to eight #glspl("lie") showed a generally positive correlation between #gls("lie") quantity and load approximation accuracy. 
Although computational complexity increased across all cases with higher #gls("lie") quantities, Case D exhibited particularly significant computational demands. 
The developed optimization framework successfully answered pivotal questions for experimental structural testing, including the dimensioning, spatial distribution, force magnitudes, and quantity determination of #glspl("lie").


Some optimizations were conducted on the High-Performance Computing (HPC) cluster #emp_[Barnard] at the TUD Dresden University of Technology. 
However, all optimization cases can also be executed on conventional desktop computers. This was confirmed by performing the majority of computations on standard hardware (Intel i5-10500 CPU, 3.10 GHz, 6 cores/12 threads, 16 GB RAM). 
Using these hardware specifications, the complete analysis, spanning configurations from four to eight #glspl("lie"), yielded computation times ranging from a few hours to less than a day, depending on the number of required iterations.

In conclusion, the results demonstrate the feasibility of achieving satisfactory #gls("ld") while adhering to practical engineering constraints. 
Furthermore, the framework's flexibility and adaptability underscore its value for the potential structural testing and certification processes of #glspl("swith") in the future.