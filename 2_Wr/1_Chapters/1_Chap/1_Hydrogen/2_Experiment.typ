/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */





// -------------------------------------------------------------------------- //
// TODO 
// title
=== Experiments and Simulation of and with Hydrogen<chap_2_0_2>
In @chap_2_0_0 essential properties of hydrogen were introduced, followed by an elaboration of the safety-relevant properties of hydrogen from a theoretical perspective in @chap_2_0_1. The analysis conducted in @chap_2_0_1 came to the conclusion that theoretical knowledge for hydrogen application is of paramount importance. Yet, for the final goal of conducting structural validation tests for #gl_("swith", long:true), additional information from experimental investigations and numerical simulations is required. This serves as a method to close the gap between theoretical knowledge and models and observed physical phenomena. Through this, important information could be obtained, such as whether there are known methods to suppress hydrogen ignition and reduce explosion damage.
The synergy of theoretical knowledge, numerical simulation, and empirical data from physical experiments is essential for drawing comprehensive conclusions regarding the progress of experimental structural validation tests for #gl_("swith", pl:true). 
This section aims to expand upon the previously established theoretical framework of hydrogen properties by incorporating insights from experimental and simulative investigations, with a focus on practical applications. 
The content will commence with a detailed exposition of the rationale behind investing additional resources in gathering information from numerical simulations and experimental studies. 
Subsequently, the findings will be presented. The subsection will conclude by synthesizing the findings from these investigations and drawing relevant conclusions for experimental structural validation tests for #gl_("swith", pl:true). 

The understanding of hydrogen's safety-critical properties, as elaborated in the preceding sections, provides a crucial framework for assessing the potential risks and challenges associated with hydrogen use in #gl_("swith", pl:true). This knowledge base comprises three interconnected components: theoretical data, theoretical models (including numerical simulations), and experimental investigations.
Theoretical data forms the foundation of our understanding, offering fundamental principles and measured properties of hydrogen. Theoretical models, including numerical simulations, build upon this data to predict hydrogen behavior in complex systems. 
It is important to note that numerical models, while often more sophisticated, are still a form of theoretical knowledge as they represent attempts to model reality mathematically.
While these theoretical approaches offer valuable insights, they often simplify complex physical phenomena and may not fully capture the nuanced interactions that occur in practical scenarios. Factors such as material interactions, environmental variables, and unforeseen system dynamics can lead to discrepancies between theoretical expectations and real-world outcomes. This limitation becomes particularly significant when dealing with a substance as volatile and potentially hazardous as hydrogen.

Experimental investigations bridge the gap between theory and practice, offering tangible evidence of hydrogen behavior under various conditions. This empirical approach is essential for several reasons. Firstly, experiments can validate theoretical predictions and simulation results, confirming where they align with reality and highlighting areas where further investigation is needed. Secondly, the safety-critical nature of #gl_("swith", pl:true) demands a level of certainty that theoretical approaches alone cannot provide. Experimental data is crucial for identifying potential safety issues that may not be apparent from theoretical considerations. Moreover, regulatory bodies and certification processes for #gl_("swith") technologies will likely require experimental validation of safety measures, in addition to theoretical justifications. Lastly, experiments provide direct observations of physical phenomena, offering insights into intricate properties and behaviors that may not be fully captured by theoretical approaches.
However, it is important to note the contrasting risk profiles between theoretical/numerical approaches and experimental/practical applications. While theoretical and numerical work shields researchers from direct physical dangers, experimental work involves tangible hazards, including the risk of explosions, which pose real threats to life and safety.

A comprehensive understanding of hydrogen behavior necessitates the integration of all three knowledge types. This holistic approach not only enhances the collective knowledge base but also informs the development of robust safety protocols and design considerations for practical applications of #gl_("swith") technology.
By synthesizing insights from theoretical data, advanced numerical models, and carefully conducted experiments, the chances of bridging the gap between theoretical understanding and practical implementation increase. 
// -------------------------------------------------------------------------- //

The initial investigation focuses on pressure shocks @Sigloch2022 @McLean2014 @Vos2015 @Liu2022a. These phenomena occur when supersonic velocities arise locally at a single point. Pressure shocks are complex phenomena and will be explained here only to the extent necessary for understanding the results. The effects of pressure shocks manifest in three primary ways. Firstly, they generate very high pressures. Secondly, the temperatures can reach extreme levels, up to several thousand Kelvin ($3000 "K"$ @Xu2009 and more @Goroshin2006). Lastly, rapid and significant pressure changes produce airborne noise, necessitating the use of hearing protection.
An attempt to simulate the effect of pressure shocks was conducted by @Xu2009. In their study, hydrogen was initially compressed to $250 "bar"$ in a pressure vessel and allowed to flow into the free atmosphere through a nozzle. The simulation results, shown in @fig_22, depict the system at different times after the hydrogen exits the nozzle.


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/2_Experiment/0_H2_Pressure_Venting.png", 
  width: 87%),
  caption: [Simulative investigation of hydrogen release into the ambient environment from a pressure vessel at $250 "bar"$. Mach number contours are displayed at six distinct time points @Xu2009.],
) <fig_22>


The Mach number, indicating the multiple of the speed of sound, is used to represent the flow velocity. Its mathematically description is provided in @eq_9,where $v$ and $a$ denote the current speed of the medium and its speed of sound, respectively. 

$ "Ma" = v/a $<eq_9>

For instance, a Mach number of 5 indicates that the local velocity is five times the speed of sound. Based on the results of @Xu2009, @fig_22 illustrates that the Mach scale extends to a maximum value of 7. Pressure shocks, with their aforementioned consequences, occur at Mach 1. At higher Mach numbers, it is expected that the effects—high temperatures, high pressures, and increased volume—are significantly amplified. For a more comprehensive interpretation of these results, @tab_26 should be examined.


// -------------------------- speed of sound table -------------------------- //
#figure(
  table(
    columns: (auto, auto, 2em, auto, auto ),
    align: (col, row) => (left, center, center, left, center).at(col),
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,
      
    [*Medium*], [*Speed of sound [m/s]*],[],[*Medium*], [*Speed of sound [m/s]*],
    [Steel], [$5170$],[],
    [Cast Iron], [$3210$], 

    [Concrete], [$3730$],[],
    [Polymer: PVC], [$1462$],

    [Polymer: PE], [$973$], [],
    [Wood], [$4500$],

    [Glass], [$5300$],[],
    [Water], [$1437$],

    [Diesel], [$1206$],[],
    [Gasoline], [$1062$],

    [Air (dry)], [$343$],[],
    [Helium], [$1005$],

    [Hydrogen], [$1300$],[],
    [Argon], [$318$],

    [Nitrogen], [$349$],[],
    [Methane], [$446$],
  ),
  kind: table,
  caption: [Speed of sound in various substances. Gases are measured at $20 degree.c$ and $1 "bar"$ @Sigloch2022.],
) <tab_26>

Each medium possesses a characteristic speed of sound, which represents how pressure changes or sound waves propagate through it. The mathematical description is given in @eq_8, where $a$, $p$, and $rho$ denote the speed of sound, pressure, and density, respectively @Sigloch2022.

$ a = sqrt((d p)/(d rho)) $<eq_8>

A high speed of sound in a substance corresponds to a high information transmission speed. For instance, when one end of a steel rod is struck, the sound travels to the other end at $5170 "m/s"$, making it quickly audible. The speed of sound in hydrogen at $20 degree.c$ and $1 "bar"$ is $1300 "m/s"$, significantly higher than in air ($343 "m/s"$). Consequently, information exchange within hydrogen occurs more rapidly than in air.
This characteristic is crucial for understanding the behavior of pressurized hydrogen released into the atmosphere. Air experiences a pressure shock at $343 "m/s"$, resulting in a substantial temperature increase. In contrast, hydrogen can reach nearly four times this speed before a pressure shock occurs.
A proposed simplified explanation for the high temperature increase during pressure shocks is as follows: When air molecules lack sufficient time to adapt to pressure changes due to slow information transport, they are forced to change abruptly. This phenomenon is analogous to a supersonic aircraft encountering air molecules before they can "receive information" about its approach. The resulting rapid compression and numerous, hard, impulsive collisions lead to a significant conversion of kinetic energy into thermal energy, causing a substantial temperature increase. It's worth noting that this process occurs primarily in compressible media such as gases, which is why shock waves are prominent in air and hydrogen.
The temperature contours associated with @fig_22 are presented in @fig_23. Notably, temperatures exceeding $1000 "K"$ are typically associated with explosions @Frost2021 @Lebel2013 @Cashdollar2007 @Goroshin2006.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/2_Experiment/1_H2_T_Venting.png", 
  width: 87%),
  caption: [Simulative investigation of hydrogen release into the free environment from a pressure vessel standing under $250 "bar"$. Temperature contours can be seen at 6 different time points @Xu2009],
) <fig_23>

The derived model, when applied to the results, shows that as hydrogen flows out into the free environment, its outflow velocity is already higher than the speed of sound of the surrounding air. This means that the air would already experience a shock wave and develop very high temperatures due to rapid compression. The hydrogen itself, however, would not have reached its own speed of sound and would therefore not generate its own shock wave initially. 
The high temperatures in the vicinity of the hydrogen, caused by the air shock wave, may not lead to immediate detonation of the hydrogen. However, as hydrogen moves in the air and diffusion processes take place, an ignitable concentration in the oxygen-hydrogen mixture is eventually reached. At this point, the surrounding high temperature becomes sufficient to cause ignition, which under certain conditions can escalate to detonation.

It's important to note that this explanation is a simplified model designed to illustrate the core concepts. The actual physics of shock wave formation and the resulting temperature increase involve more complex thermodynamic processes. For a more comprehensive treatment, readers are directed to advanced non-linear compressible fluid dynamics texts @Sasoh2020.

// -------------------------------------------------------------------------- //


Ignitions in which no external ignition sources are used are referred to as self-ignitions or spontaneous ignitions @Stauffer2008. 
There are various theoretical models (reverse Joule-Thomson effect, electrostatic ignition, brush discharges, corona discharges, diffusion ignition, sudden adiabatic compression, hot surface ignition, mechanical friction and impact ignition) for self-ignition are mentioned @astbury2007spontaneous @Zhou2022 @Qiu2024 @Yang2021. 
Compression ignition, Joule-Thomson expansion, diffusion ignition, and ignition by hot surfaces are said to be unlikely ignition mechanisms for most unintentional releases of hydrogen at ambient temperature. 
Moreover, it is also quite possible that several of the mentioned mechanisms together would produce a self-ignition @astbury2007spontaneous. 
Intensive experimental investigations on the outflow of pressurized hydrogen into the free environment are carried out in @dryer2007spontaneous. Furthermore, it was noted here that simple 1-D shock calculations would suggest the following. The sudden release of compressed methane and natural gas can also cause spontaneous ignitions. This, however, at considerably higher compression pressures than with hydrogen.
Other work doing invesigations with shock cylinderical tubes are 
@Mogi2008 @Golub2008 @Mogi2009 @Lee2011 @Jiang2019. Reviews on the topic of spontaneous ignition mechanism of pressurized hydrogen released through tubes can be found in @Qiu2024 and @Qiu2024.

// ---------------------------------- here ---------------------------------- //
The next work to be discussed in detail is @jallais2017effects. In the experiment presented therein, the effect of oxidizing agents, such as air, pure oxygen O₂, nitrous oxide N₂O, and acetylene C₂H₂, on the spontaneous ignition of hydrogen was investigated. The various oxidizing agents flow perpendicular to the hydrogen jet. Similar to the investigations already discussed, the hydrogen is also released here from a high-pressure vessel through a nozzle into the atmosphere. However, this atmosphere is now flowed through by various oxidizing agents, which represents a significant difference from earlier investigations with a free atmosphere. For the experiments, a straight expansion tube with a diameter of 4 mm and a length of 10 cm was used. The spontaneous ignition was observed with a high-speed camera and the external overpressures were measured.

The results of the experiments in @jallais2017effects are shown in Figure 18. These illustrate the influence of the pressure in the hydrogen container and the ambient gas on causing a possible self-ignition.

[Figure 18: Influence of pressure in the hydrogen container and surrounding gas atmosphere on the self-ignition of a hydrogen jet @jallais2017effects]

First, it can be seen from the results in Figure 18 that increasing pressure in the hydrogen container increases the probability of self-ignition. Furthermore, it can be noted that at low pressure values, self-ignition could be avoided in all investigated gas environments. Preventing unwanted hydrogen ignitions is considered one of the most important safety requirements for the application of hydrogen in practice. If focusing exclusively on this criterion, the following conclusions can be drawn. Oxygen O₂ as the ambient gas leads to the most unsafe working conditions for working with hydrogen. Pure air and nitrous oxide N₂O, which according to the results are preferable, are nevertheless classified as unsafe by the author of this report. Only acetylene C₂H₂, which represents a combustible gas, could meet the safety requirements for p < 230 bar.

Various literature sources, some of which are mentioned in @Rosen2018, can be used to derive recurring essential parameters to minimize the probability of occurrence of self-ignition. These are found in Table 25.


// TODO 
// check that with 
// 1. Research progress on the self-ignition of high-pressure hydrogen discharge: A review 
// 	1. https://www.sciencedirect.com/science/article/pii/S036031992200060X 
// 	2. tube geomtry
// 	3. used
// 2. A review on spontaneous ignition mechanism of pressurized hydrogen released through tubes
// 	1. https://www.sciencedirect.com/science/article/pii/S0360319924036231#sec3 
// 	2. a lot of pipe paremter, length, diameter, cross section
// 	3. used
[Table 25: Choice of influence parameters to avoid the probability of occurrence of hydrogen self-ignition and other known influence parameters.]

1) Keep pipe length short <<
2) Keep container diameter small <<
3) Keep compression pressure in the container low <<

Other influencing factors:
4) Geometry of the exit area
5) Size of the outer surface into which H₂ flows out (can accumulations of the gas arise?)
6) Gas or medium in the external environment
7) External pressure
8) External temperature

To apply the collected knowledge to the project in K2H2, some points should be reconsidered. The hydrogen is to be used in an experimental investigation and it is under very high pressure. Assuming a working nominal pressure of 300 bar and a burst factor of 2.25, at least 675 bar must be applied for a burst test. It involves 4 structurally integral CFRP tanks with a length of 9.2 m. The experimental investigation requires the attachment of various measuring devices, lines to get the hydrogen into the tanks on the one hand and to generate the pressure on the other hand. In addition, a method is needed to apply the aerodynamic loads. The listed points show considerable safety concerns. While handling hydrogen is already dangerous at comparatively low pressures, the K2H2 wing represents an innovative technology. At the time of writing this report, there are no publicly accessible or known comparable investigations for this.

Nevertheless, to achieve the best possible results with the available resources, extensive investigations were carried out to define a suitable alternative filling medium.

The results from Figure 18 show that it should be theoretically possible to eliminate one of the critical safety concerns. To prevent self-ignition or detonation from occurring, the working environment would have to be placed under protective gas. In the work @jallais2017effects, it was shown that acetylene exhibits particularly positive safety-enhancing properties. But helium, for example, has a fairly high speed of sound (according to @tab_26 16: 1005 m/s) and on the other hand is a noble gas. Therefore, helium may be more suitable as an ambient gas than acetylene. Noble gases have their outer shells completely filled with valence electrons and are therefore difficult to get to react. Other possibilities would be the remaining noble gases (Ne, Ar, Kr, Xe, Rn, Og). To make a decision, further experimental investigations would have to be carried out first. The goal should be to answer the question of whether helium, other noble gases, and other desired gases can prevent self-ignition of hydrogen. For this, the gases must form the free atmosphere as in the experiment of @jallais2017effects. If the results are positive and ordinary mouth-nose masks can offer sufficient health safety to the personnel, the next step of evaluation can be initiated. In this, an optimal gas must be selected according to cost and availability. But even if the safe application of hydrogen were now realized, other questions arise that concern the measurement technology. What influences do the respective gases have on surrounding hardware, especially on measurement accuracy? This question requires intensive research, possibly simulations, and with high probability experiments.

In summary, it can be said that hydrogen has, as the author of this report finds, highly appealing and positive properties. But on the other hand, both simulative and experimental investigations have shown that working with hydrogen can be associated with considerable safety concerns. Due to the high safety requirements, there is a possibility that for the experimental structural test, the state of the art is not sufficient to fill the tanks with hydrogen.


