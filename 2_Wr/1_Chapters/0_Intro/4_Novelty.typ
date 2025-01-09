/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


// Word rep ins. done

== Novelty and Significance of This Work <chap_0_5>
In this section, the significance of this work is examined through two distinct categories: immediately apparent benefits and potential long-term impacts. The directly observable outcomes of the research are presented in @chap_0_5_0, encompassing tangible contributions to the field. The broader implications that may emerge over time are mentioned in @chap_0_5_1, addressing potential impacts across scientific, economic, and societal domains. This structured approach enables a focused assessment of both the immediate research contributions and their prospective influence on future developments.


/* --------------------------------- direct --------------------------------- */
=== Direct Points of Significance <chap_0_5_0>

This subsection explores the direct, demonstrable contributions of this research work. It begins by reiterating the primary objective driving the development of #glspl("swith"). Subsequently, it details other concrete advantages that this thesis offers. 
Finally, it underscores the specific benefits that industry stakeholders can realize through the proposed optimization framework.

The central issue that #glspl("swith") aim to mitigate is the substantial impact of aviation on climate change. 
As #glspl("swith") utilize hydrogen as power source, they offer a pathway to maintain air travel in this high-demand while significantly reducing environmental impact. To appreciate the critical role of aviation, readers are directed to @chap_0_2 for a review of its vital importance.

/* ---------------------------------- norms --------------------------------- */
In @chap_1 this work examines the applicability of existing standards from various sectors, including aerospace and automotive, to #gls("swith") for future certification processes. It clearly outlines the associated challenges and uncertainties, acknowledging the current lack of a comprehensive standard for #gls("swith").
In response to this gap, the research identifies alternative solutions and explicitly incorporates their limitations. 
These findings offer valuable insights to certification bodies as they work towards developing the necessary standards for #glspl("swith").
Thus, this research contributes to the potential certification of #glspl("swith") and their commercial availability.


/* --------------------------------- 525 bar -------------------------------- */
Next, in @chap_1_5 the thesis explains the procedure for determining the maximum nominal working pressure for high-pressure tanks intended for burst tests. The insights reveal a current upper threshold of $525 "bar"$, a constraint imposed by the capabilities of existing test facilities. This study emphasizes that these standards should function as flexible guiding principles rather than rigid protocols, thereby encouraging the progressive development of #glspl("swith").

/* --------------------------- hydrogen detonation -------------------------- */
Subsequently, in @chap_2_0 the reader is introduced to the general properties of hydrogen, followed by a thorough exploration of potential hazards associated with its use in @chap_2_1 and @chap_2_2. This exploration is substantiated by both experimental and simulation results. 
The dissertation identifies substantial factors that can trigger risks, such as ignition and detonation, and includes methods to mitigate these situations.
The benefit of this exploration becomes especially evident when designing and conducting an experimental structural verification test, which can be assumed to become mandatory for the commercial certification of a #gls("swith").
//
/* --------------------------------- roadmap -------------------------------- */
Furthermore, @chap_2_2 proposes a detailed roadmap with two primary objectives:

1. To enable the conduct of experimental tests on hydrogen #glspl("swith") at scales equivalent to large aircraft for their certification.
2. To advance simulation techniques to a point where they might be able to replace most costly experimental tests while offering sufficient accuracy for #gls("swith") certification.

This roadmap encompasses a series of smaller-scale experimental and numerical studies. The findings affirm that hydrogen can be safely used in aviation when responsibly managed. 
However, the research advises against direct large-scale experimental testing on #glspl("swith") due to current technological constraints and knowledge gaps in the field.

/* -------------------------------- curvature ------------------------------- */
@chap_3_0 presents critical load cases that have relevance not only for experimental structural tests of #glspl("swith"), but also for conventional aircraft.
Continuing in @chap_3_1 to @chap_3_3 another significant question for the experimental structural testing of #glspl("swith") is addressed.
This question is of high importance for real-world certification: Can an alternative medium be used if the testing institution lacks the experience, financial resources, or safety equipment for experimental testing with hydrogen? To answer this question, a curvature study was introduced, thoroughly explained, conducted, and its results interpreted, enabling others to replicate and build upon this work.


/* ----------------------------- optimization 0 ----------------------------- */
Building upon this, @chap_4_5 demonstrates the application of optimization techniques to resolve key challenges in the structural testing of #gls("swith"). The study tackles substantial questions such as determining the optimal number of #glspl("lie"), their ideal placement, dimensions, and the necessary applied forces. A major focus of this research lies in developing methods that do not require access to high-performance computers, making the calculations feasible on standard laptops.
@chap_4 provides in-depth explanations of the theoretical foundations underlying these methods and their integration into the optimization process. The implementation relies entirely on free and open-source tools, offering several advantages for the research community. The choice of programming language and selected tools facilitates cost-effective replication of the presented progress. 
Furthermore, these widely-used and well-documented tools benefit from extensive online community support, enhancing their accessibility and ease of use.
/* -------------------------------------------------------------------------- */

While these aspects are crucial from a simulation perspective, there are additional points to consider from the experimental viewpoint. 
The availability of such an optimization framework can significantly reduce time and costs associated with developing a concept to apply physical loads on a #gls("swith").
In reality, aircraft wings experience continuous aerodynamic forces during flight. These forces must be accurately replicated in ground-based experiments. Without optimization, an operator might resort to randomly testing different configurations for the number of #gls("lie"), their positions, dimensions, and applied forces. Although this approach could potentially lead to a configuration that replicates continuous aerodynamics to a satisfactory degree, the probability of success is likely to be very low.
A more efficient option involves systematically evaluating multiple configurations. 
However, the process of determining the appropriate number of #gls("lie") to procure, their dimensions, and optimal placement can be extremely costly in terms of financial resources, time, and personnel.

The practical value of this research is evidenced by its implementation at IMA Materialforschung und Anwendungstechnik GmbH Dresden. 
Despite their extensive experience in structural testing, IMA incorporated the findings, analyses, and optimization framework presented here into their testing expertise for a #gls("swith"). 
This adoption by one of the few institutions capable of conducting such specialized structural tests demonstrates the practical utility of this research. The successful execution of these tests using the proposed methods provides additional validation of this thesis's effectiveness in real-world applications.

In conclusion, attempting to determine the optimal #gls("lie") configuration through purely experimental means would likely incur costs orders of magnitude higher than utilizing a free optimization framework. This comparison underscores the significant value that the proposed optimization approach brings to the field of #gls("swith") research and development.



/* -------------------------------- indirect -------------------------------- */
=== Indirect Points of Significance <chap_0_5_1>
This subsection outlines the anticipated broader, long-term impacts arising from the continued development and implementation of #glspl("swith"). While this dissertation contributes to this development, its full implications extend beyond immediate technological advances to influence various sectors of society, economy, and global dynamics. These indirect benefits may surpass the technological advancements and environmental impacts elaborated in @chap_0_5_0, encompassing scientific innovation, economic growth, geopolitical influence, and public perception.
An examination of these indirect points of significance can reveal how continued research into #glspl("swith") might shape future developments across multiple domains.
It is crucial to recognize that this thesis represents one component of the remaining extensive research and development necessary to fully realize these potential benefits. The actualization of these outcomes depends on continued efforts across multiple disciplines and sectors.

The research and development of #glspl("swith") generates value that transcends pure technological advancement. 
One key aspect is the enhancement of a nation's position in scientific innovation. By fostering groundbreaking research, a country can establish itself as a leader in the field, potentially attracting talented scientists and researchers from around the world. This influx of intellectual capital could create a virtuous cycle of knowledge creation and accumulation, further solidifying the nation's scientific standing.
The economic implications of such advanced research are equally noteworthy. The development of #glspl("swith") has the potential to lead to patentable innovations and spawn new spin-off industries. 
These developments could generate substantial economic returns, creating new job opportunities and contributing to economic growth. Moreover, the expertise gained in hydrogen technologies and innovative aircraft design could open doors to lucrative contracts and partnerships with aerospace companies and other nations, further boosting the economic benefits.

/* ------------------------------ geopolitical ------------------------------ */
From a geopolitical perspective, demonstrating technological prowess in critical areas like sustainable aviation could enhance a nation's soft power and diplomatic leverage on the global stage. 
Leadership in green technologies, exemplified by advancements in #gls("swith") research, may contribute significantly to improving a country's global image. This enhanced reputation could translate into increased influence in international climate negotiations and other global forums, positioning the nation as a key player in shaping future environmental policies and technological standards.
The development of #glspl("swith") also has the potential to impact environmental stewardship, education, and international collaboration. In terms of environmental impact, nations actively pursuing solutions to reduce aviation's carbon footprint can demonstrate their commitment to addressing climate change. This approach may boost public support both domestically and internationally, as citizens increasingly prioritize environmental concerns.

/* -------------------------------- education ------------------------------- */
From an educational perspective, research programs focused on #glspl("swith") have the potential to stimulate interest in STEM fields among students. This could help cultivate the next generation of scientists and engineers, fostering a skilled workforce prepared to tackle future technological challenges. Moreover, the skills and knowledge developed through such research could have spillover effects, potentially benefiting other sectors of the economy and driving innovation across various industries.
//
/* ----------------- international scientific collaboration ----------------- */
The pioneering nature of #glspl("swith") research may also create opportunities for international scientific collaboration. Such collaborations could foster diplomatic ties and facilitate knowledge exchange between nations. By pooling resources and expertise, countries could potentially reduce costs and accelerate progress in confronting global barriers related to sustainable aviation and beyond. 

These collaborative efforts might lead to shared resources, more efficient research processes, and faster advancements in addressing complex technological and environmental issues on a global scale.

/* ---------------------------- national security --------------------------- */
Advancements in #glspl("swith"), particularly in the realm of hydrogen utilization, have potential implications for national security and energy independence. The development of hydrogen-based technologies could contribute significantly to energy diversification efforts, potentially reducing dependence on fossil fuels. This shift towards more sustainable and locally producible energy sources might enhance national security by decreasing reliance on foreign energy supplies.
//
/* ---------------------------- public perception --------------------------- */
The pursuit of high-profile scientific achievements, such as the development of #glspl("swith"), can have a profound impact on public perception and national pride. Successful advancements in this field have the potential to boost national morale and foster a sense of collective achievement among citizens. 
This increased public engagement with scientific progress could translate into broader support for science funding and evidence-based policymaking. 
As the public becomes more aware of and invested in such cutting-edge research, it may lead to a more scientifically literate society, better equipped to navigate complex global challenges.

In conclusion, while the primary objective of this dissertation is to advance specific aspects of #gls("swith") research, it is part of a broader scientific endeavor with potentially far-reaching implications. 
It is crucial to consider that the realization of these indirect benefits requires continued investment, further research, and successful implementation beyond the scope of this work. As subsequent chapters delve deeper into the technical facets of #glspl("swith"), readers should view these potential broader impacts as aspirational goals that may guide future research directions rather than guaranteed outcomes of this specific thesis.
