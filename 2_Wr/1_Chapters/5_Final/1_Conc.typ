/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Word rep ins. done


= Conclusion and Outlook <chap_7>

Aviation's pivotal role in the global economy brings with it an increasing responsibility to address environmental impacts. 
This thesis investigated #gls("swith", long:true) as an innovative approach to sustainable aviation. 
The concept represents a significant departure from conventional aircraft design by integrating hydrogen fuel storage directly into the wing structure, where tanks not only store the fuel but actively participate in load sharing. 
This dual functionality aims to optimize space usage while potentially enhancing wing stiffness, tackling both storage efficiency and structural performance challenges simultaneously.

// -------------------------------------------------------------------------- //
The research was driven by the pressing need for environmental sustainability in aviation alongside the promise of hydrogen as an alternative fuel. At the time of writing, no operational #glspl("swith") existed in commercial aviation. The field lacked established standards or regulatory frameworks that could be leveraged for development and certification. While standards existed for various aspects of hydrogen storage and aircraft structures independently, none adequately addressed the unique obstacles of integrating pressurized hydrogen tanks into aircraft wing structures.
Scientific literature concerning #glspl("swith") remained notably scarce, with no comprehensive studies available on their design or structural testing methodologies. These knowledge gaps emphasized both the novelty and necessity of this research.

This research established foundational steps toward certification of #glspl("swith") by developing methodologies for static testing, a critical component of experimental structural validation testing.
// -------------------------------------------------------------------------- //
The investigation revealed numerous existing standards and regulations in the field. However, none of these adequately addresses the unique properties associated with #glspl("swith"). Based on specific assessment criteria, four essential standards were identified as particularly relevant. These standards represent the current state of the art and provide valuable insights not only for the development of #glspl("swith") but also for understanding potential certification testing requirements.
A significant finding from this investigation concerns practical constraints related to testing capabilities. 
Current test facility limitations impose maximum allowable nominal pressure ranges between $437.5 "bar"$ and $525 "bar"$.
The investigation conducted an extensive analysis of pressure vessel technology. The study examined hydrogen pressure vessel applications across various mobility sectors. 

Based on this investigation, Type IV vessels emerged as the currently most suitable configuration for #glspl("swith").
The integration of pressure vessels as load-bearing structural components proved to be a concept of interest not only in aviation but also across other mobility sectors.
Since hydrogen stands as one of the main novelties in #glspl("swith"), understanding its properties was essential to this research. The investigation explored hydrogen's highly positive properties while acknowledging its associated challenges. Due to the risk of ignition and potential detonation, the security-related features of hydrogen were investigated extensively. The research identified key factors for preventing hydrogen ignition. For practical applications of #glspl("swith") at the scale of large aircraft, a detailed pathway was proposed, incorporating both experimental tests and numerical simulations.

The investigation revealed that current state-of-the-art technology for experimental testing of #glspl("swith") lacks the necessary advancement to ensure safe conditions for both the test article and surrounding hardware, as well as personnel. Consequently, substantial effort was devoted to examining whether hydrogen could be substituted with an alternative filling agent during experimental testing. 
To address this question, a curvature study approach was developed. Given the complexity of aircraft structures, the research provided examples for interpreting the results of this developed method.
To apply physical loads to the wing of a #gls("swith"), #glspl("lie", long:true) were thoroughly explained and assessed. An optimization framework was developed to discretize the aerodynamic loads through #glspl("lie"). 
This framework can offer critical insights regarding the #glspl("lie") configuration, including their quantity, dimensions, and the magnitude of forces to be applied.


// --------------------------------- outlook -------------------------------- //
Research on #glspl("swith") remains notably sparse, with this thesis representing, to the best of the author's knowledge, the first doctoral dissertation dedicated to this topic. This scarcity of research underscores the need to motivate broader academic participation in both numerical simulations and experimental testing. Such expanded research efforts would contribute significantly to advancing the understanding and development of #glspl("swith").
Building upon this foundation, several important areas for future research have emerged from this investigation. Substantial work remains necessary to develop comprehensive standards and certification rules for #glspl("swith"). 
To support this development, the establishment of an open-source #gls("fem", long:true)-based model for #gls("swith") could facilitate collaborative research efforts in this field.

A fundamental question that requires investigation is whether #glspl("swith") demonstrate superior performance compared to conventional aircraft designs where hydrogen tanks are simply incorporated into the existing structure.
Further technical advancement could be achieved through a comparative analysis between beam optimization and #gls("fem") optimization approaches. 
The optimization cases presented in @chap_4_5 could be extended to include additional test cases, enhancing its robustness and applicability. 
Future work should also focus on developing computational methods to investigate the #gls("lie")-generated constraining forces elaborated in @chap_3_4, followed by research into methods for reducing or eliminating these constraint forces. 
Moreover, the pathway for conducting structural tests with hydrogen, as suggested in @chap_2_2, warrants practical implementation through carefully designed experiments.