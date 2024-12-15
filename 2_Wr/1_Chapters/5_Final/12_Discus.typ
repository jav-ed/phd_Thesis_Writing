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
Additionally, hydrogen's diffusion behavior and material compatibility emerge as critical factors for safe containment. While metals provide superior retention compared to plastics, they face the challenge of potential hydrogen embrittlement.
The theoretical knowledge presented emphasizes the need for heightened attention to hydrogen safety in real-world applications. It also highlights the importance of combining data from numerical simulations and experimental tests to bridge gaps between theoretical understanding and practical behavior. This synthesis of theory and practice proves crucial for the experimental structural validation tests of #glspl("swith"), where accurate prediction and management of hydrogen behavior are essential for both safety and performance.

// -------------------------------------------------------------------------- //
In conclusion, hydrogen's significant potential for ignition, explosion, and detonation is contingent upon specific air-hydrogen mixtures. Two factors amplify safety concerns: the wide range of ignitable mixture ratios and the sufficiency of small static discharges to trigger ignition or detonation. Additionally, hydrogen's diffusion behavior and material compatibility are critical for safe containment. While metals offer superior retention compared to plastics, they risk hydrogen embrittlement.
The theoretical knowledge presented underscores the need for heightened attention to hydrogen safety in real-world applications. It also emphasizes the importance of gathering data from numerical simulations and experimental tests to bridge gaps between theoretical understanding and practical behavior. This synthesis of theory and practice is crucial for the experimental structural validation tests of #glspl("swith"), where accurate prediction and management of hydrogen behavior are essential for both safety and performance.