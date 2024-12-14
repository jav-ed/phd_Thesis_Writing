/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


/* ------------------------- Structure of This Work ------------------------- */

// TODO Title
== Structure of This Work <chap_0_4>

This work consists of chapters, sections, and, where necessary, subsections. Each chapter and section begins with its own introduction to the topic, providing a high-level overview of the content to be covered. From @chap_1_0 onward, each section concludes with a concise summary that reiterates the primary findings. 
As an exception to this structure, @chap_4_5_0 to @chap_4_5_3 are collectively summarized in @chap_4_5_3, owing to their closely interconnected content.


// -------------------------------------------------------------------------- //
This thesis deviates from the conventional structure of distinct introduction, methodology, and results chapters. This approach is necessitated by the diverse range of topics addressed within the research scope. The breadth of content stems from the primary objective: to contribute to the experimental structural validation tests of #glspl("swith", long:true).
The experimental structural validation of such an innovative endeavor spans multiple distinct areas of study. 
Although each topic represents its own specialized field, their findings build upon each other in a consecutive manner, with results from initial chapters informing subsequent 
investigations.
Within each topic, careful attention is given to providing essential fundamental knowledge, ensuring that assumptions and their progression are clearly evident. 

To the best knowledge of the author, effort has been made throughout this work to identify situations where assumptions might not be immediately evident to readers. When such instances were recognized, the author attempted to provide appropriate justification to support scientific transparency and enhance reader comprehension.
These documented assumptions serve as the foundation upon which results are derived, presented, and interpreted within their respective chapters.

The decision to provide background information for each topic stems from the broad scope of the research. Given the diversity of subjects covered, readers cannot reasonably be expected to possess comprehensive knowledge of all fundamental aspects. 
Readers with expertise in structural engineering will likely find the beam modeling background provided in @chap_4_2 familiar from their prior education and experience. Similarly, those well-versed in numerical optimization will recognize the fundamental principles presented in @chap_4_3 from their existing knowledge base.
Conversely, readers from other disciplines might require additional theoretical foundations beyond what these chapters provide.
The research encompasses various interconnected subjects, including:

+ Standards and certification regulations
+ Pressure vessel types, properties, and applications
+ Hydrogen tank applications in mobility sectors, spanning aviation and automotive industries
+ Fundamental hydrogen properties and characteristics
+ Safety considerations for hydrogen systems, supported by experimental investigations and numerical simulations
+ Critical load case analysis for aircraft certification
+ Impact of filling agents on structural behavior
+ Feasibility assessment of hydrogen substitution in structural testing
+ Methodologies for physical load introduction and discretization
+ Beam modeling and optimization 

// -------------------------------------------------------------------------- //
A brief introduction to #glspl("swith") is presented in @chap_0_1, providing sufficient foundational knowledge for readers to comprehend the subsequent non-technical sections. The research motivation follows in @chap_0_2. Although the novelty and significance of this work are woven throughout the content, @chap_0_5 formally addresses these aspects. Given that research outcomes can be influenced by funding sources, @chap_0_6 transparently presents the financial contributors to this research.
A detailed review of the state of the art regarding #glspl("swith") is provided in @chap_0_7.

@chap_1 provides a comprehensive overview of the standards relevant to #glspl("swith"). It begins by explaining the importance of standards in @chap_1_0. 
The @chap_1 then proceeds to analyze potentially applicable aerospace standards, highlighting their relevance and limitations in @chap_1_1.
The fundamentals of pressure vessels are explored, laying the groundwork for understanding the unique challenges posed by #glspl("swith") in @chap_1_2. 
Subsequently, it delves into the preliminary development of structural integral tanks in the automotive industry, offering insights into parallel innovations in @chap_1_3, including a review of relevant patents.
An examination of specific standards from various sectors follows, along with an analysis of overarching norms applicable to high-pressure hydrogen systems in @chap_1_4. 
@chap_1 concludes by identifying and evaluating the most pertinent standards for #glspl("swith") in @chap_1_5.
Throughout, the text emphasizes the current standardization challenges and the need for new or adapted standards. 
The safety considerations, particularly those arising from the application of hydrogen, that must be addressed in the experimental structural validation testing of #glspl("swith") geared towards final certification are detailed in @chap_2.

// -------------------------------- hydrogen -------------------------------- //
For that findings from these regulatory frameworks serve as crucial guideposts for the methodological approach undertaken in @chap_2.
@chap_2 explores the multifaceted challenges of integrating hydrogen tanks as load-carrying components within aircraft wing structures. The investigation follows a systematic progression through four interconnected areas: First, @chap_2_0 establishes the fundamental properties of hydrogen, examining its basic characteristics and, among others, its gravimetric energy density and its behavior under varying pressure and temperature conditions.
Following this, @chap_2_1 conducts an in-depth examination of the safety-relevant characteristics of #gls("cgh2", long:true), addressing both theoretical considerations and practical implications for structural design.
The theoretical foundation then transitions to practical applications in @chap_2_2, where experimental investigations and numerical simulations provide crucial insights into hydrogen behavior under conditions relevant to aircraft operations. These studies illuminate the complex interplay between hydrogen properties, structural requirements, and safety considerations. 
Finally, acknowledging that #glspl("swith") must withstand both internal pressure and external aerodynamic loads, @chap_2_3 analyzes critical findings regarding the behavior of pressure vessels under external dynamic loading conditions.


// -------------------------------- loadcase -------------------------------- //
The primary objective of this @chap_3 is to determine whether hydrogen can be substituted with an alternative filling agent without substantially altering the structural properties that would invalidate test results. 
To address this question, the most critical load cases will be examined in @chap_3_0. 
@chap_3_1 presents experimental studies comparing the behavior of liquid and gas-filled pressure vessels. Based on these findings, critical curvature is introduced as a key metric for assessing filling media impact.
The investigation of filling media begins with three-dimensional modeling in @chap_3_2. 
To make the complex structural responses more interpretable, @chap_3_3 introduces a simplified two-dimensional representation.
Through systematic averaging procedures, this approach transforms intricate structural behaviors into clear, meaningful results.
Finally, @chap_3_4 examines the implementation of physical loads during experimental tests using defined criteria. These findings lay the groundwork for the aerodynamic load discretization and optimization framework presented in @chap_4.

// ------------------------------ optimization ------------------------------ //
Initially, @chap_4_0 describes how force distributions can be discretized.
@chap_4_1 then explains how aerodynamic forces can be obtained and incorporated into the method selected in @chap_4_0.
Since the optimization framework needs to work with structural information, essential beam model background is provided in @chap_4_2.
Similarly, fundamental knowledge about optimization is presented in @chap_4_3.
As optimization is a vast topic, only selected information relevant to understanding the optimization framework is included.
The integration of beam modeling within the optimization framework is presented in @chap_4_4.
The latter section also provides justification for choosing beam modeling over the well-established #gls("fem") approach for structural calculations.
The optimization framework is then applied to obtain multiple solutions.
These solutions reflect real-world efforts undertaken for static experimental structural validation testing.
The modeling rationale and results are presented in @chap_4_5_0 to @chap_4_5_3.

// ---------------------------------- final --------------------------------- //

@chap_6 gives a detailed dicussion with mostly repeating the summaries of the sections. @chap_7 gives the conclusion and outlook.
Furthermore, @chap_Append_A_0 is part of the appendix and gives some of the exmaples that were used to validate the slected beam solver.
Finally, the glossary gives short defintions and page number of occurence of some of the relevant and frequently used abbreviations. 
