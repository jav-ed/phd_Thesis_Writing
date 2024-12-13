/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


/* ------------------------- Structure of This Work ------------------------- */

// TODO Title
== Structure of This Work <chap_0_4>

This work consists of chapters, sections, and, where necessary, subsections. Each chapter and section begins with its own introduction to the topic, providing a high-level overview of the content to be covered. From @chap_1_0_1 onward, each section concludes with a concise summary that reiterates the primary findings. 
As an exception to this structure, @chap_5_0 to @chap_5_3 are collectively summarized in @chap_5_3, owing to their closely interconnected content.


// -------------------------------------------------------------------------- //
This thesis deviates from the conventional structure of distinct introduction, methodology, and results chapters. This approach is necessitated by the diverse range of topics addressed within the research scope. The breadth of content stems from the primary objective: to contribute to the experimental structural validation tests of #glspl("swith", long:true).
The experimental structural validation of such an innovative endeavor spans multiple distinct areas of study. 
Although each topic represents its own specialized field, their findings build upon each other in a consecutive manner, with results from initial chapters informing subsequent 
investigations.
Within each topic, careful attention is given to providing essential fundamental knowledge, ensuring that assumptions and their progression are clearly evident. 

// ---------------------------------- here ---------------------------------- //
If the assumptions are not obvious, they are justified to the best knowledge of the author. Based on these assumptions, results are obtained, presented, and interpreted within their respective chapters.
The background for each topic is provided due to the broad range of subjects covered. 
It is unlikely that readers will be familiar with all fundamental concepts. 
Therefore, while some readers may find certain fundamentals redundant, others might require even more information to understand the topic.
The topics covered within this thesis include standards, certification regulations, pressure vessel types, their properties, their applications 
// the more refers to the pressure vessel things
and more,

// now more topics,
hydrogen tank applications in mobility industries including aviation and automotive industry, general hydrogen properties, safety relevant properties, experiments and simulations
// more topics are
finding critical load cases for aircraft certification, impact of filling agents, whether filling agents can be replaced for structural experiments, methods to physically introduce loads, load discretization, beam modeling and optimization. 

// if required we can mention again that the things above were mentioned

// -------------------------------------------------------------------------- //
// the idea is to express that initally we provide only a bit of knowledge such that the upcoming secitons that are initally non technical that they can be understood without having to understand the details. 
A brief introduciton into #glspl("swith") is given in @chap_0_1, to ensure that upcoming non tecincal sections can be understood in the light of having enough knowledge.
The  motivation is given in @chap_0_2.
While the novelty and significance of this work should be extractable from the written content, still  @chap_0_5 was dedicated for this purpose to have this task fulfilled formally.
Since research can be biased, the fincial provider for the reserarch is important. The latter is met in @chap_0_6.

// now here begins the detailed state of the art information
Detailed state of the art regarding #glspl("swith") is provided in @chap_0_7


@chap_1_0 provides a comprehensive overview of the standards relevant to #glspl("swith"). It begins by explaining the importance of standards in @chap_1_0_1. 
The @chap_1_0 then proceeds to analyze potentially applicable aerospace standards, highlighting their relevance and limitations in @chap_1_0_2.
The fundamentals of pressure vessels are explored, laying the groundwork for understanding the unique challenges posed by #glspl("swith") in @chap_1_0_3. 
Subsequently, it delves into the preliminary development of structural integral tanks in the automotive industry, offering insights into parallel innovations in @chap_1_0_4, including a review of relevant patents.
An examination of specific standards from various sectors follows, along with an analysis of overarching norms applicable to high-pressure hydrogen systems in @chap_1_0_5. 
@chap_1_0 concludes by identifying and evaluating the most pertinent standards for #glspl("swith") in @chap_1_0_6.
Throughout, the text emphasizes the current standardization challenges and the need for new or adapted standards. 
The safety considerations, particularly those arising from the application of hydrogen, that must be addressed in the experimental structural validation testing of #glspl("swith") geared towards final certification are detailed in @chap_2_0.

// -------------------------------- hydrogen -------------------------------- //
For that findings from these regulatory frameworks serve as crucial guideposts for the methodological approach undertaken in @chap_2_0.
@chap_2_0 explores the multifaceted challenges of integrating hydrogen tanks as load-carrying components within aircraft wing structures. The investigation follows a systematic progression through four interconnected areas: First, @chap_2_0_0 establishes the fundamental properties of hydrogen, examining its basic characteristics and, among others, its gravimetric energy density and its behavior under varying pressure and temperature conditions.
Following this, @chap_2_0_1 conducts an in-depth examination of the safety-relevant characteristics of #gls("cgh2", long:true), addressing both theoretical considerations and practical implications for structural design.
The theoretical foundation then transitions to practical applications in @chap_2_0_2, where experimental investigations and numerical simulations provide crucial insights into hydrogen behavior under conditions relevant to aircraft operations. These studies illuminate the complex interplay between hydrogen properties, structural requirements, and safety considerations. 
Finally, acknowledging that #glspl("swith") must withstand both internal pressure and external aerodynamic loads, @chap_2_0_3 analyzes critical findings regarding the behavior of pressure vessels under external dynamic loading conditions.


// -------------------------------- loadcase -------------------------------- //
The primary objective of this @chap_3_0 is to determine whether hydrogen can be substituted with an alternative filling agent without substantially altering the structural properties that would invalidate test results. 
To address this question, the most critical load cases will be examined in @chap_3_0_0. 
@chap_3_0_1 presents experimental studies comparing the behavior of liquid and gas-filled pressure vessels. Based on these findings, critical curvature is introduced as a key metric for assessing filling media impact.
The investigation of filling media begins with three-dimensional modeling in @chap_3_0_2. 
To make the complex structural responses more interpretable, @chap_3_0_3 introduces a simplified two-dimensional representation.
Through systematic averaging procedures, this approach transforms intricate structural behaviors into clear, meaningful results.
Finally, @chap_3_0_4 examines the implementation of physical loads during experimental tests using defined criteria. These findings lay the groundwork for the aerodynamic load discretization and optimization framework presented in @chap_4_0.

// ------------------------------ optimization ------------------------------ //
Initially, @chap_4_0_0 describes how force distributions can be discretized.
@chap_4_0_1 then explains how aerodynamic forces can be obtained and incorporated into the method selected in @chap_4_0_0.
Since the optimization framework needs to work with structural information, essential beam model background is provided in @chap_4_0_2.
Similarly, fundamental knowledge about optimization is presented in @chap_4_0_3.
As optimization is a vast topic, only selected information relevant to understanding the optimization framework is included.
The integration of beam modeling within the optimization framework is presented in @chap_4_0_4.
The latter section also provides justification for choosing beam modeling over the well-established #gls("fem") approach for structural calculations.
The optimization framework is then applied to obtain multiple solutions.
These solutions reflect real-world efforts undertaken for static experimental structural validation testing.
The modeling rationale and results are presented in @chap_5_0 to @chap_5_3.

// ---------------------------------- final --------------------------------- //

@chap_6 gives a detailed dicussion with mostly repeating the summaries of the sections. @chap_7 gives the conclusion and outlook.
Furthermore, @chap_Append_A_0 is part of the appendix and gives some of the exmaples that were used to validate the slected beam solver.
Finally, the glossary gives short defintions and page number of occurence of some of the relevant and frequently used abbreviations. 
