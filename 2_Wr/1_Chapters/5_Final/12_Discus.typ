= Discussion <chap_6>

Starting with @chap_0_2, it was explained that aviation has become an indispensable part of the global economy, serving both personal and business sectors with fast, reliable transportation. 
However, its negative environmental impact needs to be acknowledged.

Following that, it necessitates research into alternative, more environmentally friendly fuels. Hydrogen emerges as a promising candidate, not only for aviation but across various sectors, making research in this area broadly valuable. 
In this context, #glspl("swith", long:true) represent a novel approach. 
The hydrogen tanks not only store the fuel, but also are an active part of the wing such that loads across wing and hydrogen tanks are shared.
This innovative design aims to optimize space usage and potentially increase wing stiffness, showcasing how scientific ingenuity could address multiple challenges simultaneously.


// ------------------------------ state of art ------------------------------ //

The detailed definition of a #gls("swith") and its comparison with other structure integrated concepts as well with regular aircraft is given in @chap_0_7.
Here, it was concluded that all hydrogen-powered aircraft concepts share the same primary objective: the reduction of negative environmental impact. 
The structural integration of hydrogen tanks offers a dual advantage. 
These tanks not only store hydrogen but also share the load with the attached structural components. 
At the time of writing, two distinct approaches to structural integration have been identified: fuselage-integrated and wing-integrated.
The field of #glspl("swith") is characterized by a scarcity of scientific literature. This paucity of research presents both advantages and challenges. 
On one hand, it enhances the value and supports the novelty aspect of the #gls("swith") research. 
Hence, this situation underscores the need for further investigation into #glspl("swith"), potentially encouraging more researchers to explore this topic.
Conversely, the limited availability of prior work means that scientists have a reduced foundation of existing research upon which to build. As a result, it poses initial challenges that need to be overcome in the pursuit of sustainable aviation.

// ------------------------------- 0_Standards ------------------------------ //

// another word for aspect
Beyond these general research challenges, a critical concern for #glspl("swith") lies in their standardization and certification, as detailed in @chap_1. 
The role of standards in #gls("swith") development is multifaceted and remains in its infancy.
While the innovative nature of #glspl("swith") presents challenges for standard application, these challenges also create opportunities for advancing both the technology and their regulatory framework.
At the time of writing this thesis, no established standards or regulations exist for certifying #glspl("swith"). This absence of certification procedures significantly constrains both industrial and scientific application of #glspl("swith").
Consequently, there is a pressing need for appropriate standards upon which industry and scientific institutions can build.
This proactive approach to standardization is crucial for overcoming current limitations and facilitating broader adoption of #glspl("swith").
Through careful adaptation of existing standards and development of #gls("swith")-specific regulations, researchers and engineers can establish robust validation procedures. 
These procedures ensure that #glspl("swith") are developed and structurally validated in a manner that is both safe and efficient, while meeting industry and regulatory requirements.

// ---------------------------- 1_Aero_Standards ---------------------------- //
However, the path toward establishing these standards presents several challenges. While there are currently available standards that, in theory, could be applied to #gls("swith")-certification, authorities can reject their application due to fundamental differences in pressure requirements and tank scale.
To address this gap, two standards specifically for hydrogen-powered general aviation have been announced: SAE AS 6679 @SAE_Liquid and SAE AS 7373 @SAE_Gas. Though not yet commercially available, their potential applicability to #glspl("swith") remains uncertain for several reasons.
Firstly, the scope of these SAE standards regarding tank configuration remains uncertain. 
Specifically, it is not yet clear whether these standards will be limited to non-integral, non-external loaded, and thus non-load-carrying hydrogen tanks, or if they will extend to external-load carrying integrated designs.
While they may address fuselage-integral hydrogen tanks, their applicability to wing-integral tanks is not guaranteed. 
Therefore, the relevance of these announced SAE standards to #gls("swith") certification remains to be determined.
Secondly, these standards may require modifications before gaining acceptance within European regulatory frameworks.
The timeline of aerospace standardization developments provides additional context. 
In 2018, ANSI/AIAA S-081B-2018 @ansi_standard_2018 was released for space systems. 
Subsequently, in 2019, SAE initiated the development of SAE AS7373 @SAE_Liquid for liquid hydrogen in aviation. 
Notably, this development continues as of late 2024, five years after its initiation. This extended development period demonstrates that adapting space standards for general aviation applications requires substantial time and careful consideration.

// --------------------------- 2_Pressure_Vessels --------------------------- //

While standards development progresses, the broader context of hydrogen pressure vessels reveals promising opportunities. 
As outlined in @chap_1_2, there exists a vast field of applications for hydrogen pressure vessels.
The examination of different mobility sectors, which are crucial drivers of economic and scientific growth, underscores the fundamental importance of hydrogen pressure vessels. Moreover, #gls("swith") development can leverage current advances from these other mobility sectors.
Analysis of the five known tank types, including their applications, advantages, and disadvantages, presented in @chap_1_2 leads to a clear conclusion: tank Type IV emerges as the most suitable choice for #gls("swith") design, based on its maturity, commercial availability, and optimal balance between performance and safety considerations.

// ------------------------------ 3_Automotive ------------------------------ //
Beyond tank selection, @chap_1_3 explores potential insights from the automotive sector. Academic work in the automotive industry reveals common aims with aerospace regarding structural integral hydrogen tanks, demonstrating interest in this technology across multiple transportation sectors. 
As in the aerospace field, available literature on this topic remains scarce.
The most relevant academic contribution from the automotive sector, presented by @Bleser2012, investigates the use of hydrogen tanks as torque absorbers. 
However, this research lacks crucial details, particularly regarding experimental methodology. 
Consequently, the current state of automotive research offers limited guidance for certification-oriented experimental structural validation tests of #glspl("swith").
While existing patents describe tanks as load-bearing structural integral components, they too provide insufficient detail for experimental structural validation tests of #glspl("swith"). This gap in detailed technical documentation emphasizes the need for more comprehensive research spanning both automotive and aerospace industries.

// ---------------------------- 4_Various_Fields ---------------------------- //
Moving beyond transportation sectors, @chap_1_4 reveals a broader perspective on hydrogen standards. A significant number of standards addressing hydrogen applications have been identified. 
These standards exist in various stages of development. Some standards are currently in use, while others are undergoing updates. 
Additionally, several standards have been announced but still await their initial publication.
Given this extensive array of standards, a systematic approach emerges as imperative for identifying those most applicable to #gls("swith") certification.
This methodical evaluation will be crucial in determining which standards offer the most relevant guidance for #gls("swith") development and certification processes.

// -------------------------- 5_Essential_Standards ------------------------- //
The implementation of this systematic approach, as detailed in @chap_1_5, has yielded 
meaningful results. 
Through the application of specific assessment criteria, four essential standards have been identified as particularly relevant to the development and certification of #glspl("swith"). 
Although these standards do not comprehensively address all unique aspects of #glspl("swith"), they represent the current state of the art in relevant regulatory frameworks and provide valuable insights into potential certification requirements and testing protocols.
Among these selected standards, two offer critical specifications regarding working nominal pressure. 
The maximum allowable nominal pressure varies between standards, ranging from 437.5 to $525 "bar"$. 
This upper limit is not arbitrary but rather constrained by the capabilities of existing test facilities, which cannot exceed certain pressure thresholds for experimental structural verification tests.
These findings emphasize the dual considerations necessary in #gls("swith") development: adherence to both hydrogen containment and aircraft-specific regulations, while acknowledging the current technological constraints in testing high-pressure systems.

// -------------------------------- 0_H2_Prop ------------------------------- //
Given these regulatory requirements and testing limitations, a comprehensive understanding of the physical properties and behavior of hydrogen becomes essential for successful #gls("swith") development and certification.
@chap_2_0 provides an overview of hydrogen's fundamental properties that underpin its potential as an aviation fuel.
While safety aspects are addressed in @chap_2_1, the examined properties demonstrate hydrogen's predominantly positive characteristics as an energy carrier. 
One notable challenge, however, is hydrogen's invisibility to the human eye due to its small molecular size, which presents specific detection and measurement requirements.
The analysis of hydrogen's theoretical gravimetric energy density in relation to its practical energy density in real-world storage systems reveals both opportunities and challenges in its implementation as a fuel source. 
The analytical functions developed for calculating hydrogen mass from density and volume across various pressure and temperature ranges enhance this understanding. 

These functions, which account for real gas behavior, enable accurate modeling and simulation of hydrogen storage in applications such as #glspl("swith").
The custom analysis tool developed can offer valuable insights into hydrogen's behavior under various pressure and temperature conditions. 

// -------------------------------- 1_Safety -------------------------------- //
While these analytical capabilities are helpful, they must be complemented by a thorough understanding of hydrogen's safety implications, particularly for high-pressure applications like #glspl("swith").
The focus on safety aspects in @chap_2_1 reveals that hydrogen's potential for ignition, explosion, and detonation depends significantly on specific air-hydrogen mixtures.
Two factors particularly impact safety considerations: the wide range of ignitable mixture ratios and the sufficiency of small static discharges to trigger ignition to detonation. 
Additionally, hydrogen's diffusion behavior and material compatibility emerge as critical factors for safe containment. 
While metals provide superior retention compared to plastics, they face the challenge of potential hydrogen embrittlement.
The theoretical knowledge presented in @chap_2_1 emphasizes the need for heightened attention to hydrogen safety in real-world applications. 
It also highlights the importance of combining data from numerical simulations and experimental tests to bridge gaps between theoretical understanding and practical behavior. 
This synthesis of theory and practice proves crucial for the experimental structural validation tests of #glspl("swith"), where accurate prediction and management of hydrogen behavior are essential for both safety and performance.


// ------------------------------ 2_Experiment ------------------------------ //
Building on these safety considerations, experimental investigations provide further insights into specific challenges and mitigation strategies.
The experimental investigations mentioned in @chap_2_2 demonstrate that hydrogen self-ignition represents a tangible concern in real-world applications.
Additionally, @chap_2_2 identifies the primary geometrical factors that can precipitate ignition and outlines the necessary modifications to mitigate this risk. 
While the threat of hydrogen self-ignition requires serious consideration, the literature review supports the feasibility of secure hydrogen application, provided that its properties are thoroughly understood and appropriately managed.
A critical 
// consideration overused
consideration emerges when evaluating the transferability of hydrogen applications from the automotive industry to #glspl("swith") for large commercial aircraft, such as the Airbus A350-1000 @link_Airbus_350. 
Rather than direct transposition, a systematic approach becomes necessary.
This involves conducting a series of smaller-scale experimental and numerical studies, progressively advancing toward large aircraft scale. 
Such a methodical progression enables systematic knowledge accumulation while carefully managing the risks associated with scaling up hydrogen technologies in aviation.
The research outlines a potential development path that emphasizes this gradual, methodical approach to research and development, ensuring that each step builds upon validated understanding from previous investigations.


// --------------------------- 3_Pressurized_Body --------------------------- //
Given that #glspl("swith") must withstand both internal pressure from hydrogen storage and external aerodynamic loads during flight, understanding the behavior of pressurized vessels under external loading conditions becomes crucial.
The literature review presented in @chap_2_3 reveals substantial research on pressurized vessels under external dynamic loading. 
The reviewed studies demonstrate that, for their specific test configurations, internal pressure significantly influences structural behavior, with lateral loads typically generating higher stresses than axial loads. 
The documented failure mechanisms progress from initial deformation through local failure to global failure, depending on impact energy levels.
While these studies provide valuable insights into pressure vessel behavior for dynamic loading conditions, which are essential for aircraft certification, they do not address quasi-static loading scenarios. 
Quasi-static testing, such as ultimate load testing, represents another critical requirement for aircraft certification and, consequently, for potential #gls("swith") certification. 
This identified gap in current research emphasizes the necessity for additional investigations into pressure vessel behavior under external static loads.

// ------------------------------- 0_Loadcase ------------------------------- //
The challenge of understanding static load behavior becomes particularly significant when considering the broader context of aircraft load cases. As detailed in @chap_3_0, the task of identifying critical load cases for conventional aircraft already presents significant complexity. 
For #glspl("swith"), this complexity increases substantially due to their hybrid nature, combining characteristics of both aircraft and pressurized vessels. This dual characteristic necessitates consideration of load cases from both domains, creating a more intricate evaluation scenario.
Nevertheless, @chap_3_0 demonstrates that through careful statistical assessment, a comprehensive list of critical load cases for general aviation can be established. From this foundational investigation, a key load case for #glspl("swith") has been derived. The validity of this methodological approach gains significant credibility through confirmation from two leading German aerospace companies. 
Furthermore, detailed examination of the V-n diagram provides essential insights into the relationship between the identified critical load case and the flight envelope.


// ------------------------------ 1_Curv_Theory ----------------------------- //
Building upon this understanding of load cases, @chap_3_1 explores another crucial aspect: the effects of fill media on pressurized structures under static external loading. The research reveals that both internal pressure and medium selection significantly influence structural behavior. 
Comparative studies demonstrate that water-filled pipes consistently outperform their air-filled counterparts, exhibiting higher maximum bending moments and enhanced curvature tolerance across all pressure ranges evaluated. 
The observed relationship between internal pressure and structural response exhibits distinct patterns: while both media show comparable increases in maximum bending moment with elevated pressure, their curvature responses differ markedly. 
A simplified conceptual model was proposed to explain these experimental observations. The model suggests that in water-filled pipes, the confined liquid acts as an integral part of the structural system. 
Under pressure, water particles maintain relatively fixed positions, enabling effective load transfer and redistribution across the pipe's inner surface. 
In contrast, gases maintain greater particle spacing even under compression, requiring higher pressures to achieve similar structural effects.
These findings carry important implications for current testing standards, particularly regarding the use of substitute fill media in certification procedures. 
The research proposes statistical methodologies for quantifying relationships between different fill media, potentially informing future testing protocols. 
Such insights prove especially relevant for #glspl("swith"), where pressurized vessels must withstand external loading conditions while maintaining structural integrity.

// -------------------------------- 2_Curv_3D ------------------------------- //
To further advance the understanding of these structural behaviors, @chap_3_2 presents a comprehensive methodology for curvature calculation and interpretation. 
The study employs a #gls("fem") simulation model of a #gls("swith") configuration, detailing the procedure for obtaining necessary derivatives. 
A key strength of this approach lies in its displacement-based foundation, enabling application to both analytical solutions and numerical simulations.
The methodology's versatility extends beyond computational applications, as displacement data can also be sourced from experimental investigations. 
Through illustrative examples of critical curvature assessment, the work reveals inherent challenges in directly comparing obtained curvature results with critical curvature values for complex structures like aircraft.
The findings yield practical implications for experimental testing: hydrogen could potentially be substituted with an alternative filling agent without significantly affecting the maximum bearable bending moment. However, the examination also highlights the complexities involved in assessing critical curvature in three-dimensional space, necessitating the development of an enhanced approach, which is subsequently presented in @chap_3_3.



// -------------------------------- 3_Curv_2D ------------------------------- //
@chap_3_3 addresses this complexity by introducing transformation methods that convert three-dimensional curvature data into more manageable two-dimensional representations. The developed mathematical framework enables the conversion of six-dimensional matrix representations ($bold(A)^(n times 6)$) into simplified two-dimensional forms ($bold(A)^(n times 2)$). 
While three averaging approaches were initially considered, mathematical evaluation demonstrates that only two fundamentally different methods exist.
These methods were systematically evaluated using a range of lift coefficients and internal pressures from $15 "MPa"$ to $110 "MPa"$. 
The analysis revealed that for the studied simulation model and load cases, the curvatures in the undisturbed region remained substantially below critical thresholds.
This finding led to a practical conclusion potentially specific to the investigated simulation model. 
Under the analyzed load conditions, hydrogen could be substituted with an alternative filling agent in experimental structural validation testing. 
This substitution would not affect the structural behavior, as the material's stiffness characteristics would remain unchanged.
However, while the interpretation needs to be done for each specific simulation configuration, the laid out method is of general nature.

// ----------------------------- 4_Physical_Load ---------------------------- //
// ---------------------------- 5_Physical_Collet --------------------------- //
As another critical aspect of experimental structural testing, @chap_3_4 addresses a fundamental requirement by establishing the core principles of load introduction in aircraft testing, with particular emphasis on #gls("swith") configurations.
Following an examination of critical load cases and safety considerations from previous sections, the analysis presented three potential approaches for experimental load application: flight testing, wind tunnel testing, and ground-based structural testing. After establishing ground-based testing as the most viable approach, four distinct #gls("lie") methodologies were extensively evaluated: sandbags, profile-conforming collets, air cushions, and hydraulic cylinders with pads.
A comprehensive evaluation framework comprising thirteen criteria was developed and applied to each method, considering factors ranging from economic viability to technical implementation challenges. 
The assessment results were presented through detailed analytical considerations and concise evaluation matrices, enabling clear comparison across methods. 

The evaluation of the innovation criterion demonstrated how different perspectives can lead to opposing yet equally valid conclusions. 
This highlights both the methodical nature and inherent complexity of the assessment process.
The analysis revealed that optimal #gls("lie") selection depends strongly on context-specific factors and some identified critical parameters. 
These critical parameters require rigorous determination through load approximation analysis.
This investigation provides a methodological foundation for #gls("lie") selection and establishes the motivation for the detailed load discretization analysis presented in @chap_4.

// ---------------------------- 0_Discretize_Aero --------------------------- //#
Building upon this, @chap_4_0 establishes the fundamental concepts and methodologies for #gls("ld"), defining it as the systematic approximation of continuous aerodynamic loads through discrete point and area loads.
The investigation presented two primary approaches for determining optimal #glspl("lie") configurations: regression-based methods and k-means++ clustering. 
Initial analysis explored regression techniques, examining their capabilities through the lens of interpolation, extrapolation, and various error metrics including L1 and L2 norms. The mathematical foundations of these approaches were thoroughly investigated to assess their applicability to load approximation tasks.
Subsequently, k-means++ clustering emerged as a particularly promising methodology, offering direct determination of #glspl("lie") positions through centroid calculation and enabling physical interpretation of cluster regions. 
The algorithm's capability to provide both positional information and appropriate force magnitudes through cluster summation demonstrated significant advantages over regression-based approaches. 
Furthermore, the widespread implementation of k-means++ across diverse scientific applications supported its selection as the preferred method.

However, critical limitations were identified in the k-means++ approach, particularly regarding the determination of individual #gls("lie") dimensions and the maintenance of unobstructed viewing areas necessary for inspection and measurement. 
These limitations, while significant, do not diminish the method's value as an initial parameter determination tool. 
Rather, they highlight the necessity for further optimization to address practical constraints in structural testing applications. 
The integration of k-means++ outputs with a comprehensive optimization framework, as examined in @chap_4_5_0 to @chap_4_5_3, provides a pathway for addressing these remaining challenges while maintaining the advantages of the clustering approach.

// ------------------------------- 1_Get_Aero ------------------------------- //
To implement this optimization framework effectively, @chap_4_1 introduces a sophisticated methodology for transforming complex three-dimensional aerodynamic loads into manageable one-dimensional resulting point loads.
The investigation began with explaining the derivation of aerodynamic loads and their structural relevance, followed by an examination of the data format requirements for k-means++ clustering in relation to APAME's output characteristics.
To bridge the identified gaps between APAME's outputs and k-means++ requirements, a systematic transformation procedure was developed. 
The procedure addressed some key challenges. 
First, it enabled the conversion of distributed loads to point loads while maintaining their physical significance. 
Second, it resolved mesh density variations that could potentially bias k-means++ clustering results.
The implementation of a reference-length-based force discretization method proved instrumental in resolving these challenges. 
The development process was supported by numerous visual illustrations and mathematical equations to ensure clear understanding.

The reduction of the three-dimensional load distributions to one-dimensional representations enables the use of computationally efficient beam models as alternatives to #gls("fem") analysis. 
This simplified modeling approach proves particularly advantageous within optimization frameworks, where computational efficiency becomes crucial due to iterative model evaluations.
The findings outlined in this section provide the essential foundation for understanding the concepts elaborated in @chap_4_2 to @chap_4_4 and their practical implementations highlighted in @chap_4_5_0 to @chap_4_5_3.

// ------------------------------ 2_Beam_Model ------------------------------ //

Building upon these computational efficiency considerations, @chap_4_2 delves into the essential mathematical foundations of beam modeling theory. 
While analytical solutions for individual beam models using traditional pen-and-paper methods are feasible, this approach is impractical for integration within numerical optimization frameworks. 
To address this limitation, the Python programming language was selected as the computational environment, with a detailed justification provided for this choice. 
The investigation examined two beam solvers, which were first validated against established textbook solutions and subsequently integrated into an optimization framework. 
The transformation of three-dimensional support conditions in #glspl("swith") to two-dimensional representations can introduce additional complexity, as it can yield statically indeterminate beam models. 
Consequently, the IndeterminateBeam @interdetbeam_tool solver emerged as the most appropriate solution.

// ----------------------------- 3_Optim_Basics ----------------------------- //
With the beam modeling approach established, @chap_4_3 transitioned to the fundamental principles of optimization. 
It introduced essential optimization terminology, including objective functions, design variables, constraints, and boundaries.
The iterative nature of formulating complete optimization problems was demonstrated through a practical example, emphasizing the intricate relationships of integrating these components into a coherent problem definition. 
The elaboration established the practical relevance of local optima in real-world applications and examined the distinctions between gradient-based and gradient-free optimization.
Optimization is a very large field that finds application in various industries. For interested readers, several helpful book resources were listed: @Gritzmann2013 @Papageorgiou2015 @Stein2018 @Stein2018a @Koop2018 @Grimme2018 @Scholz2018 @Jarre2019 @Dietz2019 @Schumacher2020. Additionally, for multidisciplinary optimization, reference was made to the textbook @mdobook.

// ------------------------------- 4_Beam_Opti ------------------------------ //
Having established the fundamentals of beam modeling in @chap_4_2 and the principles of optimization in @chap_4_3, @chap_4_4 critically assessed beam modeling and detailed #gls("fem") analysis for their potential integration into an optimization framework.
Considering computational efficiency, implementation requirements, educational benefits, open-source availability, and particularly the early developmental stage of #glspl("swith"), beam modeling emerged as the appropriate choice. 
Subsequently, it was demonstrated how the beam model solver could be integrated within an optimization framework to answer questions relevant for #gls("ld") through #glspl("lie") for experimental structural testing.



// --------------------------- optimiaztion cases --------------------------- //
// great, now i need a proper tranistion into these secitons: @chap_4_5_0 to @chap_4_5_3 
This investigation presents a systematic optimization approach for #gls("ld"), establishing methodologies for determining optimal #gls("lie") configurations in structural testing applications. 
The strategic selection and placement of #glspl("lie") can significantly influence both testing quality and economic efficiency in static structural evaluation procedures.
The progression of optimization cases reflects increasingly sophisticated engineering demands. Case A introduces the foundational framework with a single clamped support configuration, establishing the baseline approach for load discretization. Case B adapts to specific structural requirements by implementing a dual-support system, incorporating proprietary data to better represent #gls("swith") characteristics. While maintaining the core optimization framework, Case C addresses practical installation requirements by incorporating spatial restrictions for essential components such as landing gear and propulsion systems. Case D extends these practical considerations by implementing visibility requirements, ensuring sufficient unobstructed areas for measurement and monitoring equipment while preserving the fundamental optimization approach.