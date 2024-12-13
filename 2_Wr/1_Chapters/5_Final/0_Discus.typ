/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// TODO remove redundancies
= Discussion <chap_6>

// ------------------------------- motivation ------------------------------- //
*@chap_0_2 -* 
Aviation has become an indispensable part of the global economy, serving both personal and business sectors with fast, reliable transportation. However, its negative environmental impact necessitates research into alternative, more environmentally friendly fuels. Hydrogen emerges as a promising candidate, not only for aviation but across various sectors, making research in this area broadly valuable. In this context, #glspl("swith", long:true) represent a novel approach. 
The hydrogen tanks not only store the fuel, but also are an active part of the wing such that loads across wing and hydrogen tanks are shared.
This innovative design aims to optimize space usage and potentially increase wing stiffness, showcasing how scientific ingenuity could address multiple challenges simultaneously.

// ------------------------------ state of art ------------------------------ //
*@chap_0_7 -*
In summary, all hydrogen-powered aircraft concepts share the same primary objective: the reduction of negative environmental impact. The structural integration of hydrogen tanks offers a dual advantage. These tanks not only store hydrogen but also share the load with the attached structural components. At the time of writing, two distinct approaches to structural integration have been identified: fuselage-integrated and wing-integrated.
The field of #glspl("swith") is characterized by a scarcity of scientific literature. This paucity of research presents both advantages and challenges. On one hand, it enhances the value and supports the novelty aspect of the #gls("swith") research. Hence, this situation underscores the need for further investigation into #glspl("swith"), potentially encouraging more researchers to explore this topic.
Conversely, the limited availability of prior work means that scientists have a reduced foundation of existing research upon which to build. As a result, it could pose initial challenges that need to be overcome in the pursuit of sustainable aviation.

// ------------------------------- 0_Standards ------------------------------ //
*@chap_1_0 -*
In conclusion, the role of standards in #gls("swith") development is multifaceted and still in its infancy. 
While the innovative nature of #glspl("swith") presents challenges in terms of standard application, these challenges also offer opportunities for advancing both the technology and the regulatory framework surrounding it.
At the moment of writing this thesis, there are no known standards or regulations that could be applied for obtaining certification for #glspl("swith"). This lack of an available certification procedure severely limits the industrial and scientific employment of #glspl("swith"). 
Consequently, there is a clear demand for proper standards on which industry and scientific institutions can build upon.
This proactive approach to standardization could be crucial in overcoming the current limitations and facilitating the wider adoption of #glspl("swith").
By carefully adapting existing standards and paving the way for #gls("swith")-specific standards in the future, researchers and engineers could ensure that #glspl("swith") are developed and structurally validated in a manner that is safe, efficient, and aligned with industry and regulatory expectations. 

// ---------------------------- 1_Aero_Standards ---------------------------- //
*@chap_1_0_2 -*
In conclusion, there are currently available standards that, in theory, could be applied to #gls("swith")-certification. However, with simple argumentation concerning the high-pressure and much larger scale of the tanks, authorities can deny the application of current available standards for the certification of #glspl("swith").
Driven by this reasoning, two standards for hydrogen-powered general aviation have been announced: @SAE_Liquid and @SAE_Gas. At present, they are not commercially available. However, even upon their release, there is no guarantee that they can be applied to #glspl("swith"). 
Firstly, it is unknown whether these SAE standards will be limited to non-integral, non-external, and thus non-load-carrying hydrogen tanks, or if they will extend to external-load carrying integrated hydrogen tanks. Additionally, they might include provisions for fuselage-integral hydrogen tanks, but possibly not wing-integral tanks. In essence, at the moment, the applicability of the announced SAE standards to the certification of #glspl("swith") remains unclear.
Secondly, these standards, in their current form, might not be accepted in Europe without modifications.

Finally, a connection was made between two events in aerospace standardization. In 2018, ANSI/AIAA S-081B-2018 @ansi_standard_2018 became available for space systems. The following year, in 2019, SAE announced plans to develop SAE AS7373 @SAE_Liquid, a standard for liquid hydrogen in aviation. 
However, as of late 2024, five years after its initiation, this development is still ongoing. This extended timeline suggests that transferring existing space standards to general aviation is not straightforward and requires substantial time and effort.

// --------------------------- 2_Pressure_Vessels --------------------------- //
*@chap_1_0_3 -*
In summary, it can be said that there is a vast field of application for hydrogen pressure vessels.
Most of the application fields are driven by the uniform goal to reduce the negative impact on the environment.
Having shown especially the different areas of mobility, which are a major factor in economic and scientific growth, the undeniable importance of hydrogen pressure vessels could be underlined.
Furthermore, it could be observed that the #gls("swith") development can build upon currently available advances from other mobility sectors.
From the five known tank types, their current fields of applications, advantages, and disadvantages could be extracted. This analysis led to the conclusion that tank Type IV should be considered for #gls("swith") design due to its maturity, commercial availability, and balance between performance and safety concerns.

// ------------------------------ 3_Automotive ------------------------------ //
*@chap_1_0_4 -*
In summary, academic work in the automotive industry reveals common aims with aerospace regarding structural integral hydrogen tanks. It is evident that these tanks are of interest not only for aviation but also for automotive applications. However, the available literature in this field is scarce, mirroring the limited research in aerospace.
The sole academic paper found in the automotive sector @Bleser2012 focused on utilizing hydrogen tanks as torque absorbers. However, the information provided lacked detail, particularly in the experimental section. Consequently, based on the current state of research, no significant added value could be derived from automotive academic literature for certification-oriented experimental structural validation tests of #glspl("swith").
While additional patents aimed at using tanks as load-bearing structural integral parts were identified, their descriptions did not provide substantial additional information for experimental structural validation tests of #glspl("swith"). This further underscores the need for more comprehensive research in this area across both industries.

// ---------------------------- 4_Various_Fields ---------------------------- //
*@chap_1_0_5 -*
It can be summarized that a high number of standards dealing with hydrogen have been identified. While some of these standards are already in use, others are in the process of being updated or have just been announced and are yet to be published for the first time.
Regardless of their current status, it should be highlighted once again that narrowing down such a high number of hydrogen norms to the most promising ones requires a systematic approach. This systematic evaluation will be crucial in identifying the standards most relevant to #gls("swith") certification.

// -------------------------- 5_Essential_Standards ------------------------- //
*@chap_1_0_6 -*
From the numerous available standards, the introduced assessment criteria were used to obtain a few essential standards in a structured manner. This analysis has identified four essential standards pertinent to the development and certification of #glspl("swith"). While these standards collectively do not address all the unique aspects of #glspl("swith"), they represent the current state of the art in relevant regulatory frameworks. They provide valuable insights into potential certification requirements and testing protocols for #glspl("swith").
Two of the selected standards offer critical information regarding working nominal pressure. Depending on the applicable standard, the maximum allowable nominal pressure ranges from 437.5 to $525 "bar"$. This upper limit is constrained by the capabilities of existing test facilities, which cannot generate arbitrarily high pressures for experimental structural verification tests.
These findings underscore the importance of considering both hydrogen containment and aircraft-specific regulations in the development of #glspl("swith"), while also highlighting the current technological limitations in testing high-pressure systems.


// -------------------------------- 0_H2_Prop ------------------------------- //
*@chap_2_0_0 -*
This section has presented an overview of the fundamental properties of hydrogen. While the safety aspects will be addressed in @chap_2_0_1, the properties examined thus far demonstrate hydrogen's predominantly positive characteristics as an energy carrier. However, one notable limitation is hydrogen's invisibility to the human eye due to its small molecular size, which could pose challenges for detection and measurement.
The relationship between hydrogen's high theoretical gravimetric energy density and its practical energy density in real-world storage systems has been elucidated. This comparison highlights the challenges and potential of hydrogen as a fuel source.
Furthermore, analytical functions for calculating hydrogen mass from density and volume across various pressure and temperature ranges have been explored. 
These functions, accounting for real gas behavior, are crucial for accurate modeling and simulation of hydrogen storage and use in applications such as #glspl("swith").
The custom analysis tool presented can provide valuable insights into hydrogen's behavior under various pressure and temperature conditions, supporting ongoing #gls("swith")-related investigations.

// -------------------------------- 1_Safety -------------------------------- //
*@chap_2_0_1 -*
In conclusion, hydrogen's significant potential for ignition, explosion, and detonation is contingent upon specific air-hydrogen mixtures. Two factors amplify safety concerns: the wide range of ignitable mixture ratios and the sufficiency of small static discharges to trigger ignition or detonation. Additionally, hydrogen's diffusion behavior and material compatibility are critical for safe containment. While metals offer superior retention compared to plastics, they risk hydrogen embrittlement.
The theoretical knowledge presented underscores the need for heightened attention to hydrogen safety in real-world applications. It also emphasizes the importance of gathering data from numerical simulations and experimental tests to bridge gaps between theoretical understanding and practical behavior. This synthesis of theory and practice is crucial for the experimental structural validation tests of #glspl("swith"), where accurate prediction and management of hydrogen behavior are essential for both safety and performance.

// ------------------------------ 2_Experiment ------------------------------ //

*@chap_2_0_2 -*
In conclusion, the potential for hydrogen self-ignition has been demonstrated to be a tangible concern in real-world applications. 
This section has elucidated the primary geometrical factors that can precipitate ignition and explained the modifications necessary to mitigate this risk. 
Despite the acknowledged threat of hydrogen self-ignition, literature review supports the premise that secure hydrogen application is feasible, provided that its properties are thoroughly understood and accounted for.
However, it is crucial to exercise caution when considering the direct transposition of hydrogen applications from the automotive industry to #glspl("swith") on the scale of large commercial aircraft, such as the Airbus A350-1000. 
A more judicious strategy involves conducting a series of smaller-scale experimental and numerical studies, incrementally approaching the scale of a large aircraft. 
This approach allows for the systematic accumulation of knowledge and the careful management of risks associated with scaling up hydrogen technologies in aviation.
A potential path towards achieving this goal, emphasizing the importance of a gradual, methodical approach to research and development, was outlined. 

// --------------------------- 3_Pressurized_Body --------------------------- //
*@chap_2_0_3 -*
The literature review reveals substantial research on pressurized vessels under external dynamic loading. Studies demonstrate that internal pressure significantly influences structural behavior, with lateral loads generating higher stresses than axial loads. The documented failure mechanisms progress from initial deformation through local failure to global failure, depending on impact energy levels. While these studies provide valuable insights into pressure vessel behavior for dynamic loading conditions, which are essential for aircraft certification, they do not address quasi-static loading scenarios. Quasi-static testing, such as ultimate load testing, represents another critical requirement for aircraft certification and, consequently, for potential #gls("swith") certification. This identified gap in current research emphasizes the necessity for additional investigations into pressure vessel behavior under external static loads.
// ------------------------------- 0_Loadcase ------------------------------- //
*@chap_3_0_0 -*
In summary, identifying critical load cases for conventional aircraft already presents a highly demanding task. The complexity increases substantially for #glspl("swith"), as they combine characteristics of both aircraft and pressurized vessels, necessitating consideration of load cases from both domains. However, through valuable statistical analysis, a comprehensive list of critical load cases for general aviation was established. From this analysis, a specific crucial load case for #glspl("swith") was derived. The validity of this approach was confirmed by two leading German aerospace companies. Furthermore, analysis of the V-n diagram provided crucial insights into the relationship between the identified critical load case and the flight envelope.


// ------------------------------ 1_Curv_Theory ----------------------------- //
*@chap_3_0_1 -*
In summary, the investigation of fill media effects on pressurized structures has revealed several significant findings. Under static external loading, both the internal pressure and the choice of medium demonstrate substantial influence on structural behavior. Water-filled pipes consistently exhibited superior performance compared to air-filled counterparts, achieving higher maximum bending moments and greater curvature tolerance across all tested pressure ranges. 
The relationship between internal pressure and structural response showed distinct patterns: while both media demonstrated similar increases in maximum bending moment with pressure elevation, their curvature responses differed markedly. 
A simplified conceptual model based on molecular behavior was proposed to explain these observations, suggesting that the incompressible nature of liquids enables more effective load transfer in contrast with to gases. The investigation also highlighted important implications for current testing standards, particularly regarding the use of substitute fill media in certification procedures. Statistical methods were proposed for quantifying the relationships between different fill media, which could provide valuable insights for future testing protocols. These findings underscore the importance of considering fill medium effects in structural design and testing, particularly for applications involving pressurized vessels under external loading conditions as it is the case for #glspl("swith").


// -------------------------------- 2_Curv_3D ------------------------------- //
*@chap_3_0_2 -*
In summary, a methodology for calculating curvature and its interpretation was provided. For this analysis, a #gls("fem") simulation model of a #gls("swith") configuration was utilized. The procedure for obtaining required derivatives was explained in detail. Since the methodology was developed from a displacement-based foundation, it can be applied to both analytical and numerical simulation approaches.
The method's applicability extends beyond simulation, as displacement data could alternatively be obtained from experimental investigations. Through important examples demonstrating critical curvature assessment, the challenges of directly comparing obtained curvature results with critical curvature values for complex structures like aircraft became evident.
The interpretation of results indicated that for experimental investigations, hydrogen could be replaced with an alternative filling agent without significantly impacting the maximum bearable bending moment. Finally, the complexity of assessing critical curvature in three-dimensional space was acknowledged, leading to the introduction of an enhanced approach in @chap_3_0_3.



// -------------------------------- 3_Curv_2D ------------------------------- //
*@chap_3_0_3 -*
This section addressed the challenge of interpreting complex three-dimensional curvature data by developing transformation methods for two-dimensional analysis. The mathematical framework established how to convert six-dimensional matrix representations ($bold(A)^(n times 6)$) into more manageable two-dimensional forms ($bold(A)^(n times 2)$). While three averaging approaches were initially proposed, mathematical analysis demonstrated that only two fundamentally different methods exist.
These methods were systematically evaluated using a range of lift coefficients and internal pressures from $15 "MPa"$ to $110 "MPa"$. The analysis revealed that for the studied simulation model and load cases, the curvatures in the undisturbed region remained substantially below critical thresholds.
This finding led to a practical conclusion potentially specific to the investigated simulation model. 
Under the analyzed load conditions, hydrogen could be substituted with an alternative filling agent in experimental structural validation testing. 
This substitution would not affect the structural behavior, as the material's stiffness characteristics would remain unchanged.
However, while the interpretation needs to be done for each specific simulation configuration, the laid out method is of general nature.



// ----------------------------- 4_Physical_Load ---------------------------- //
// ---------------------------- 5_Physical_Collet --------------------------- //
*@chap_3_0_4 -*
This section established the foundational framework for physical load introduction in aircraft structural testing, with particular focus on #gls("swith") configurations. Following an examination of critical load cases and safety considerations from previous sections, the analysis presented three potential approaches for experimental load application: flight testing, wind tunnel testing, and ground-based structural testing. After establishing ground-based testing as the most viable approach, four distinct #gls("lie") methodologies were extensively evaluated: sandbags, profile-conforming collets, air cushions, and hydraulic cylinders with pads.
A systematic evaluation framework comprising thirteen criteria was developed and applied to each method, considering factors ranging from economic viability to technical implementation challenges. 
The assessment results were presented through detailed analytical considerations and concise evaluation matrices, enabling clear comparison across methods. 

The evaluation of the innovation criterion demonstrated how different perspectives can lead to opposing yet equally valid conclusions. 
This illustrates both the systematic approach and inherent complexity of the assessment process.
The analysis revealed that optimal #gls("lie") selection depends strongly on context-specific factors and some identified critical parameters. These critical parameters require systematic determination through load approximation analysis.
This investigation provides a methodological foundation for #gls("lie") selection and establishes the motivation for the detailed load discretization analysis presented in @chap_4_0.





// ---------------------------- 0_Discretize_Aero --------------------------- //
*@chap_4_0_0 -*
This section established the fundamental concepts and methodologies for #gls("ld"), defining it as the systematic approximation of continuous aerodynamic loads through discrete point and area loads. The investigation presented two primary approaches for determining optimal #glspl("lie") configurations: regression-based methods and k-means++ clustering. Initial analysis explored regression techniques, examining their capabilities through the lens of interpolation, extrapolation, and various error metrics including L1 and L2 norms. The mathematical foundations of these approaches were thoroughly investigated to assess their applicability to load approximation tasks.

Subsequently, k-means++ clustering emerged as a particularly promising methodology, offering direct determination of #glspl("lie") positions through centroid calculation and enabling physical interpretation of cluster regions. The algorithm's capability to provide both positional information and appropriate force magnitudes through cluster summation demonstrated significant advantages over regression-based approaches. Furthermore, the widespread implementation of k-means++ across diverse scientific applications supported its selection as the preferred method.

However, critical limitations were identified in the k-means++ approach, particularly regarding the determination of individual #gls("lie") dimensions and the maintenance of unobstructed viewing areas necessary for inspection and measurement. These limitations, while significant, do not diminish the method's value as an initial parameter determination tool. Rather, they highlight the necessity for further optimization to address practical constraints in structural testing applications. The integration of k-means++ outputs with a comprehensive optimization framework, as examined in @chap_5_0 to @chap_5_3, provides a pathway for addressing these remaining challenges while maintaining the advantages of the clustering approach.


// ------------------------------- 1_Get_Aero ------------------------------- //
*@chap_4_0_1 -*
Building upon @chap_4_0_0, this section presented a methodology for obtaining and transforming three-dimensional aerodynamic loads into one-dimensional resulting point loads. 
The investigation began with explaining the derivation of aerodynamic loads and their structural relevance, followed by an examination of the data format requirements for k-means++ clustering in relation to APAME's output characteristics.
To bridge the identified gaps between APAME's outputs and k-means++ requirements, a systematic transformation procedure was developed. The procedure addressed some key challenges. First, it enabled the conversion of distributed loads to point loads while maintaining their physical significance. Second, it resolved mesh density variations that could potentially bias k-means++ clustering results.
The implementation of a reference-length-based force discretization method proved instrumental in resolving these challenges. The development process was supported by numerous visual illustrations and mathematical equations to ensure clear understanding.

The reduction of the three-dimensional load distributions to one-dimensional representations enables the use of computationally efficient beam models as alternatives to #gls("fem") analysis. 
This simplified modeling approach proves particularly advantageous within optimization frameworks, where computational efficiency becomes crucial due to iterative model evaluations.
The findings outlined in this section provide the essential foundation for understanding the concepts elaborated in @chap_4_0_2 to @chap_4_0_4 and their practical implementations highlighted in @chap_5_0 to @chap_5_3.


// ------------------------------ 2_Beam_Model ------------------------------ //
*@chap_4_0_2 -*
In summary, essential mathematical foundations of beam modeling theory were established. While analytical solutions for individual beam models using traditional pen-and-paper methods are feasible, this approach proves impractical for integration within numerical optimization frameworks. 
To address this limitation, the Python programming language was selected as the computational environment, with a detailed justification provided for this choice. 
The investigation examined two beam solvers, which were first validated against established textbook solutions and subsequently integrated into an optimization framework. 
The transformation of three-dimensional support conditions in #glspl("swith") to two-dimensional representations can introduce additional complexity, as it can yield statically indeterminate beam models. Consequently, the IndeterminateBeam solver emerged as the most appropriate solution.


// ----------------------------- 3_Optim_Basics ----------------------------- //
*@chap_4_0_3 -*
Essential aspects of optimization terminology were introduced, including objective functions, design variables, constraints, and boundaries. 
The iterative nature of formulating complete optimization problems was demonstrated through a practical example, emphasizing the 
intricate relationships of integrating these components into a coherent problem definition. 
The elaboration established the practical relevance of local optima in real-world applications and examined the distinctions between gradient-based and gradient-free optimization.
Optimization is a very large field that finds application in various industries. For interested readers, several helpful book resources can be listed: @Gritzmann2013 @Papageorgiou2015 @Stein2018 @Stein2018a @Koop2018 @Grimme2018 @Scholz2018 @Jarre2019 @Dietz2019 @Schumacher2020. Finally, for multidisciplinary optimization, reference is made to the textbook @mdobook.



// ------------------------------- 4_Beam_Opti ------------------------------ //
*@chap_4_0_4 -*
The analysis of structural methods suitable for optimization framework integration examined beam modeling and detailed #gls("fem") analysis. Considering computational efficiency, implementation requirements, educational benefits, open-source availability, and particularly the early developmental stage of #glspl("swith"), beam modeling emerged as the appropriate choice. Subsequently, it was demonstrated how the beam model solver could be integrated within an optimization framework to answer questions relevant for #gls("ld") through #glspl("lie") for experimental structural testing.



// --------------------------- optimiaztion cases --------------------------- //
*@chap_5_0 to @chap_5_3 -*
This investigation presents a systematic optimization approach for #gls("ld"), establishing methodologies for determining optimal #gls("lie") configurations in structural testing applications. 
The strategic selection and placement of #glspl("lie") can significantly influence both testing quality and economic efficiency in static structural evaluation procedures.
The progression of optimization cases reflects increasingly sophisticated engineering demands. Case A introduces the foundational framework with a single clamped support configuration, establishing the baseline approach for load discretization. Case B adapts to specific structural requirements by implementing a dual-support system, incorporating proprietary data to better represent #gls("swith") characteristics. While maintaining the core optimization framework, Case C addresses practical installation requirements by incorporating spatial restrictions for essential components such as landing gear and propulsion systems. Case D extends these practical considerations by implementing visibility requirements, ensuring sufficient unobstructed areas for measurement and monitoring equipment while preserving the fundamental optimization approach.

Analysis of configurations ranging from four to eight #glspl("lie") showed a generally positive correlation between #gls("lie") quantity and load approximation accuracy. While computational complexity increased across all cases with higher #gls("lie") quantities, Case D exhibited particularly significant computational demands. 
The developed optimization framework successfully answered essential questions for experimental structural testing, including #gls("lie") dimensioning, spatial distribution, force magnitude, and quantity determination.

All optimizations were performed on standard computing hardware (Intel i5-10500 CPU, 3.10GHz, 6 cores/12 threads, 16GB RAM), demonstrating the methodology's accessibility without specialized computational resources. When optimizing all configurations from four to eight #glspl("lie"), solution times ranged from hours to under a day, varying with required iterations.
The results demonstrate the feasibility of achieving satisfactory #gls("ld") using accessible computational resources while meeting practical engineering constraints. The framework's adaptability to diverse requirements indicates its potential value for future #gls("swith") structural testing and certification processes.


