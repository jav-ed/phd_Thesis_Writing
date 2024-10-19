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

The initial investigation focuses on pressure shocks @Sigloch2022 @McLean2014 @Vos2015 @Liu2022a. These phenomena occur when supersonic velocities arise locally at a single point. Pressure shocks are complex phenomena and will be explained here only to the extent necessary for understanding the results. The effects of pressure shocks manifest in three primary ways. Firstly, they generate very high pressures. Secondly, the temperatures can reach extreme levels, up to several thousand Kelvin ($3000 "K "$ @Xu2009 and more @Goroshin2006). Lastly, rapid and significant pressure changes produce airborne noise, necessitating the use of hearing protection.
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
  caption: [Speed of sound in various substances. Gases are measured at $20 " " degree.c$ and $1 "bar"$ @Sigloch2022.],
) <tab_26>

Each medium possesses a characteristic speed of sound, which represents how pressure changes or sound waves propagate through it. The mathematical description is given in @eq_8, where $a$, $p$, and $rho$ denote the speed of sound, pressure, and density, respectively @Sigloch2022.

$ a = sqrt((d p)/(d rho)) $<eq_8>

A high speed of sound in a substance corresponds to a high information transmission speed. For instance, when one end of a steel rod is struck, the sound travels to the other end at $5170 "m/s"$, making it quickly audible. The speed of sound in hydrogen at $20 " " degree.c$ and $1 "bar"$ is $1300 "m/s"$, significantly higher than in air ($343 "m/s"$). Consequently, information exchange within hydrogen occurs more rapidly than in air.
This characteristic is crucial for understanding the behavior of pressurized hydrogen released into the atmosphere. Air experiences a pressure shock at $343 "m/s"$, resulting in a substantial temperature increase. In contrast, hydrogen can reach nearly four times this speed before a pressure shock occurs.
A proposed simplified explanation for the high temperature increase during pressure shocks is as follows: When air molecules lack sufficient time to adapt to pressure changes due to slow information transport, they are forced to change abruptly. This phenomenon is analogous to a supersonic aircraft encountering air molecules before they can "receive information" about its approach. The resulting rapid compression and numerous, hard, impulsive collisions lead to a significant conversion of kinetic energy into thermal energy, causing a substantial temperature increase. It's worth noting that this process occurs primarily in compressible media such as gases, which is why shock waves are prominent in air and hydrogen.
The temperature contours associated with @fig_22 are presented in @fig_23. Notably, temperatures exceeding $1000 "K "$ are typically associated with explosions @Frost2021 @Lebel2013 @Cashdollar2007 @Goroshin2006.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/2_Experiment/1_H2_T_Venting.png", 
  width: 87%),
  caption: [Simulative investigation of hydrogen release into the free environment from a pressure vessel standing under $250 "bar"$. Temperature contours can be seen at 6 different time points @Xu2009],
) <fig_23>

The derived model, when applied to the results, shows that as hydrogen flows out into the free environment, its outflow velocity is already higher than the speed of sound of the surrounding air. This means that the air would already experience a shock wave and develop very high temperatures due to rapid compression. The hydrogen itself, however, would not have reached its own speed of sound and would therefore not generate its own shock wave initially. 
The high temperatures in the vicinity of the hydrogen, caused by the air shock wave, may not lead to immediate detonation of the hydrogen. However, as hydrogen moves in the air and diffusion processes take place, an ignitable concentration in the oxygen-hydrogen mixture is eventually reached. At this point, the surrounding high temperature becomes sufficient to cause ignition, which under certain conditions can escalate to detonation.

It's important to note that this explanation is a simplified model designed to illustrate the core concepts. The actual physics of shock wave formation and the resulting temperature increase involve more complex thermodynamic processes. For a more comprehensive treatment, readers are directed to advanced non-linear compressible fluid dynamics texts @Sasoh2020.

// -------------------------------------------------------------------------- //

Ignitions that occur without external ignition sources are referred to as self-ignitions or spontaneous ignitions @Stauffer2008. Various theoretical models for self-ignition have been proposed, including the reverse Joule-Thomson effect, electrostatic ignition, brush discharges, corona discharges, diffusion ignition, sudden adiabatic compression, hot surface ignition, and mechanical friction and impact ignition @astbury2007spontaneous @Zhou2022 @Qiu2024 @Yang2021. However, compression ignition, Joule-Thomson expansion, diffusion ignition, and ignition by hot surfaces are considered unlikely mechanisms for most unintentional releases of hydrogen at ambient temperature @astbury2007spontaneous. 

// TODO you need to add a few informairon here regarding diffusion ignition
// explain diffusion ignition and see that
Diffusion ignition [19,21,22,27], as proposed by Wolanski and Wojcicki, describes a phenomenon where pressurized hydrogen is released into a chamber containing either pure oxygen or air.

The proocess of difufsion ingnition

Despite this, diffusion ignition theory remains a widely accepted mechanism for spontaneous combustion induced by pressurized hydrogen leakage.

It is noteworthy that several of these mechanisms may collectively contribute to a self-ignition event @astbury2007spontaneous.
Intensive experimental investigations on the outflow of pressurized hydrogen into the free environment have been conducted by @dryer2007spontaneous. Additional studies using shock cylindrical tubes have been carried out by various researchers @Mogi2008 @Golub2008 @Mogi2009 @Lee2011 @Kim2013 @Kitabayashi2013 @Grune2014 @Gong2016 @Duan2016 @Jiang2019 @Wang2019. Comprehensive reviews and summaries on the spontaneous ignition mechanisms of pressurized hydrogen released through tubes can be found in @Qiu2024 and @Yang2021.
The findings from these studies are not only valuable for conducting experimental investigations with hydrogen but also have significant implications for the design of #gl_("swith", pl:true). These findings will be presented in detail, followed by explanations of their importance in the context of #gl_("swith") design and experimental procedures.




When pressurized hydrogen is released from its vessel, certain geometrical aspects have a significant impact on the subsequent spontaneous ignition. One crucial factor is the tube length. Both numerical simulations and experimental studies on releasing pressurized hydrogen indicate that the longer the pipe, the greater the chance of spontaneous ignition occurring @Qiu2024 @Zhou2022 @Yang2021 @Jin2021. However, when the length of the tube exceeds a certain threshold, the tendency for self-ignition of high-pressure hydrogen becomes weaker @Zhou2022. According to @Wang2019, this weakening of the self-ignition tendency occurs only after the tube length exceeds $1700 "mm"$.
For this thesis, the shape of the tubes containing the #gl_("cgh2", long:true) was defined as cylindrical. Regarding tube length, it was previously noted that high ranges are desired for economic reasons. However, if longer tubes could increase the risk of self-ignition, the determination of optimal tube length becomes more complex.

For designing #gl_("swith", pl:true), in addition to the available literature on experimental self-ignition tests, it may be necessary to conduct similar tests with significantly longer tubes. The need for much longer tubes, in the range of $~ 5"m to" ~70 "m"$, is driven by the economic desire to increase flight range and the fact that tanks integrated inside the wings of commercial aircraft are much longer than the tubes commonly used in experimental tests.
The preference for shorter tubes (less than $5 "m"$) in current experiments is primarily due to cost and time constraints faced by researchers. According to reviews by @Qiu2024 @Zhou2022 @Yang2021 @Wang2019, experimental tests are generally conducted with tubes of length $ <= 4200 "mm"$. Notably, tubes with lengths $<= 1000 "mm"$ are more common than the comparatively long tubes of $4200 "mm"$ used in @Kitabayashi2013.
A comprehensive list of experimental parameters, including tube lengths used in various studies, is provided in @tab_27, as compiled by @Yang2021. This table highlights the current limitations in experimental setups and underscores the need for tests more closely aligned with the actual dimensions of #gl_("swith", pl:true) applications.

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    align: (col, row) => (center, center, center, center, center).at(col),
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,
    [*Experiment*], [*Burst pressure [MPa]*], [*Tube length [mm]*], [*Diameter [mm]*], [*Cross-section of tube*],
    [Dryer 2007 @dryer2007spontaneous], [1.4-11.3], [38.1-3000], [4/12.7], [cylinder],
    [Mogi 2008 @Mogi2008], [4-30], [3-300], [5/10], [cylinder], 
    [Golub 2008 @Golub2008], [2-13], [65-185], [10], [cylinder/rectangle], 
    [Mogi 2009 @Mogi2009 ], [2-20], [3-500], [5/10], [cylinder],
    [Lee 2011 @Lee2011], [10.8-23.5], [50/100/200/300], [10.9], [cylinder],
    [Kim 2013 @Kim2013a], [6.5-11.3], [300], [10], [rectangle (visual)],
    [Kim 2013 @Kim2013], [8-30], [10-200], [3], [cylinder],
    [Kitabayashi 2013 @Kitabayashi2013], [1-8], [100-4200], [10], [cylinder],
    [Grune 2014 @Grune2014], [2.4-24], [210-1145], [4/5/10], [cylinder/rectangle (visual)],
    [Duan 2016 @Duan2016], [2-11], [80-360], [15], [cylinder],
    [Gong 2016 @Gong2016], [2-9], [360], [15], [cylinder],
    [Jiang 2019 @Jiang2019], [5-7], [2200], [10/15], [cylinder],
    [Wang 2019 @Wang2019], [2-12], [300-3000], [10], [cylinder],
  ),
  kind: table,
  caption: [Experimental parameters and setups for various studies on hydrogen diffusion ignition @Yang2021.],
) <tab_27>


// ----------------------------- dimated impact ----------------------------- //
Depending on the outcome of self-ignition experiments for aircraft-relevant tube lengths, more advanced methods like optimization might be required to determine the optimal tube lengths. Besides length, tube diameter is another crucial geometrical variable. Studies have shown that tubes with smaller diameters are more prone to spontaneous ignition @Qiu2024 @Zhou2022 @Kim2013a. Consequently, based on the current state of the art, a larger diameter is generally recommended to mitigate the risk of self-ignition.

Cross-sectional area is another important geometrical parameter investigated in relation to spontaneous ignition @Xu2012 @Xu2014. Decreasing (contraction) or increasing the local cross-section demonstrates a lower minimum release pressure required for ignition compared to constant cross-section tubes @Qiu2024 @Xu2012 @Xu2014. 
The general shape of the tube does not significantly affect the minimum burst pressure required for spontaneous ignition @Qiu2024. However, in non-circular cross-section tubes, potential turbulent flow in the corners can promote the mixing of hydrogen and air. This enhanced mixing can result in the production of a larger amount of the hydrogen/air mixture @Li2019.
Both diameter and cross-section are critical parameters for designing the tubes of #gl_("swith", pl:true). Together with tube length, these factors govern the maximum volume of the tubes for #gl_("swith", pl:true) or general cylindrical pressure vessels. For ease of reference, a concise summary of these findings is presented in @tab_28.


#figure(
  table(
    columns: (auto, auto),
    align: (col, row) => (left, left).at(col),
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,
    // ------------------------------- header ------------------------------- //
    [*Parameter*], [*Operation*], 
    // ---------------------------------------------------------------------- //
    [length ], [short],
    [diameter,], [big ],
    [compression pressure in the container],  [low],

    table.cell(colspan: 2, align: center, fill: table_cl_header, [*Other influencing factors*]),

    table.cell(colspan: 2, [Geometry of the exit area]),
    table.cell(colspan: 2, [Size of the outer surface into which H#sub[2] flows out (can accumulations of the gas arise?)]),
    table.cell(colspan: 2, [Gas or medium in the external environment]),
    table.cell(colspan: 2, [External pressure]),
    table.cell(colspan: 2, [External temperature]),

  ),
  kind: table,
  caption: [Key parameters influencing hydrogen self-ignition risk and additional factors potentially affecting ignition dynamics.],
) <tab_28>


// ---------------------------------- here ---------------------------------- //
The risk of self-ignition has been shown to be not only theoretically based but also observed in real-world applications. For experimental validation tests of #gl_("swith", pl:true), practical hydrogen handling is crucial, necessitating further investigations to establish safe working methods.
To elucidate why @tab_28 recommends low pressure inside the container, the work of @jallais2017effects warrants detailed examination. Their experiment investigated the effect of various oxidizing agents on the spontaneous ignition of hydrogen, including air, pure oxygen (O#sub[2]), nitrous oxide (N#sub[2]O), and acetylene (C#sub[2]H#sub[2]). These oxidizing agents flowed perpendicular to the hydrogen jet.
Similar to previously mentioned studies, hydrogen was released from a high-pressure vessel through a nozzle into the atmosphere. 
However, this setup differed significantly from earlier investigations with a free atmosphere, as the surrounding environment now consisted of a constant flow of various oxidizing agents.
The experiments utilized a straight expansion tube with a diameter of $4 "mm"$ and a length of $10 "cm"$. Spontaneous ignition was observed using a high-speed camera, while external overpressures were measured.
The results of these experiments, presented in @fig_24, illustrate the influence of both the pressure in the hydrogen container and the ambient gas composition on the likelihood of self-ignition.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/2_Experiment/2_H2_Experiments.png", 
  width: 100%),
  caption: [Influence of pressure in the hydrogen container and surrounding gas atmosphere on the self-ignition of a hydrogen jet @jallais2017effects.],
) <fig_24>


The results presented in @fig_24 reveal several key insights. Firstly, there is a clear correlation between increasing pressure in the hydrogen container and a higher probability of self-ignition. Conversely, at low pressure values, self-ignition could be avoided across all investigated gas environments. This finding is particularly significant, as preventing unwanted hydrogen ignitions is considered a paramount safety requirement for practical hydrogen applications.
When evaluating the results based solely on the criterion of preventing self-ignition, a hierarchy of safety emerges among the tested ambient gases. Oxygen (O#sub[2]) as the ambient gas presents the most hazardous working conditions for hydrogen applications. While pure air and nitrous oxide (N#sub[2]O) show more favorable results compared to oxygen, they are still deemed unsafe by the author of this thesis. Among the tested gases, only acetylene (C#sub[2]H#sub[2]), a combustible gas itself, demonstrated the ability to meet safety requirements for pressures below $230 "bar"$.

Revisiting key points from @chap_2_0_1 and this subsection confirms that hydrogen possesses both safety-concerning and beneficial properties. Despite potential hazards, hydrogen could be considered a viable option for practical applications when handled responsibly and with a comprehensive understanding of its unique characteristics @Landucci2010 @jallais2017effects @Klell2018 @Rosen2018 @Thomas1997. Notably, @Landucci2010 concludes that the risks associated with compressed hydrogen are comparable to those of liquefied petroleum gas and natural gas.
It is important to recognize that the referenced studies primarily originate from specialized testing environments or the automotive industry. 
While their results offer valuable insights for #gl_("swith",pl: true), significant differences exist between these contexts and the specific requirements of aircraft applications. 
To fully appreciate these nuances and their implications for #gl_("swith",pl: true), it is necessary to revisit some of the specificities of #gl_("swith",pl: true).


// ---------------------------------- here ---------------------------------- //
In #gl_("swith", pl:true), hydrogen tanks are integrated into the aircraft wings. These tanks require high internal pressure and volume to ensure high volumetric energy densities. Moreover, they bear the dual burden of holding internal pressure while withstanding external loads.
The aviation industry's quest for minimal weight coupled with high safety demands suggests the use of Type IV tanks, as explained in @chap_1_0_3. However, this design choice introduces additional safety considerations. In the event of a rupture, the high-speed dispersion of #gl_("cfrp", long:true) tank fragments could pose severe risks to both personnel and measurement devices. Furthermore, if #gl_("cfrp") composites break down, they may release microscopic particles or fibers into the air. Inhalation of these particles can lead to respiratory problems, a risk that is particularly acute in confined, poorly ventilated spaces.
The goal of maximizing hydrogen load during flight necessitates the optimization of tank pressure and volume. This requirement highlights a key distinction between #gl_("swith", pl:true) and most other applications of compressed hydrogen cylinders: the size of the tanks.
For instance, the APUS i-2 @APUS_1 has a wingspan of $13.2 "m"$, with approximately $gt.approx 50%$ of its length occupied by four cylindrical high-pressure tubes. In comparison, the Airbus A350-1000 has a wingspan of about $64 "m"$ and a flight range of $16,482 "km"$ @link_Airbus_350. Assuming that 50% of this wingspan could accommodate tubes, this would equate to a total tube length of $64 "m" times 0.5 = 32 "m"$.
However, it is important to note that the goals of maximizing tank size and internal pressure can inadvertently enhance the risk of self-ignition, as highlighted earlier in this subsection.


Another key distinguishing factor for #gl_("swith",pl:true), particularly in comparison to land vehicles, is their operation across a range of altitudes. This variability in operational environment introduces several intricate considerations. At higher altitudes, the reduced ambient pressure results in a greater pressure differential between the hydrogen tanks and the surrounding environment. This increased differential potentially leads to higher velocities of hydrogen release in the event of a leak. It is important to note that if the release velocity does not exceed the speed of sound in hydrogen, a hydrogen shock wave is not anticipated.
However, the situation is complicated by the fact that the speed of sound in air decreases with altitude. This reduction raises the probability of an air shock wave forming, even at lower hydrogen release velocities. When diffusion processes between the released hydrogen and the surrounding air result in an ignitable concentration, a range of phenomena from ignition to detonation becomes possible.
Conversely, the decrease in air density at higher altitudes introduces a counteracting effect. The reduced density could potentially slow or complicate the process of achieving ignitable concentrations through the diffusion of air and hydrogen. This factor adds another layer of intricacy to the safety considerations for #gl_("swith",pl:true) operating at various altitudes.

// -------------------------------------------------------------------------- //
Furthermore, when considering the increased pressure difference and reduced air density in tandem, the behavior of released hydrogen becomes more nuanced. The speed at which hydrogen is released is not only enhanced due to the decreased ambient pressure but also due to an increased mean free path for gas particles. In other words, hydrogen molecules can traverse longer distances before colliding with air molecules, leading to a delayed reduction in speed. This delay is due to the reduced frequency of collisions that would otherwise convert kinetic energy into thermal energy. Consequently, the reduced air density at higher altitudes allows hydrogen molecules to maintain their high velocity over greater distances, potentially resulting in more rapid dispersion and coverage of larger areas compared to releases at lower altitudes.

The impact of decreased temperature at higher altitudes further complicates this scenario. The interplay between temperature, pressure, and density affects various aspects of hydrogen behavior, including its diffusion rate, the formation of ignitable mixtures, and the potential for ignition or detonation.
To introduce another level of complexity to this thought experiment, the impact of decreased temperature at higher altitudes also warrants consideration. As a result, we can ascertain that the impact of increasing altitude, leading to the consequent alteration of the mentioned parameters and their influence on the probability of causing an ignition to detonation, is a subject that demands further research.
In light of these multifaceted considerations, it becomes evident that the impact of increasing altitude on hydrogen release dynamics and safety is a subject that demands further research. The complex interplay between pressure differentials, gas densities, temperatures, and molecular behaviors at varying altitudes significantly influences the potential for ignition or detonation events. Comprehensive studies are needed to fully understand these altitude-dependent phenomena and their implications for the safe design and operation of #gl_("swith",pl:true) across their full operational altitude range.

// ---------------------------------- here ---------------------------------- //

To facilitate the use of hydrogen in #gl_("swith",pl:true) an experimental structural validation test method must be developed. To conduct these experimental tests, safe working conditions must be guaranteed for both the involved personnel, the instrumentation and the #gl_("swith") itself. Attempting to meet this requirement immediately for large #gl_("swith",pl:true), such as those on the scale of the Airbus A350-1000, may not be feasible. Instead, smaller, gradual steps towards the larger goal should be taken. This incremental approach offers several advantages: it allows for better risk management, facilitates the accumulation of knowledge and experience, provides opportunities to identify and address issues at smaller scales before moving to larger, more complex systems, and enables a more cost-effective development process.


The outcome of @jallais2017effects depicted in @fig_24 suggests  that it should be theoretically possible to eliminate one of the critical safety concerns. To prevent self-ignition or detonation from occurring, the working environment would have to be placed under protective gas. While Acetylene was found to enhance safety in this regard, Helium could be a more suitable choice due to its high speed of sound (according to @tab_26  1005 m/s) 
and noble gas properties.
Noble gases have their outer shells completely filled with valence electrons and are therefore difficult to get to react.
Other noble gases such as Neon, Argon, Krypton, Xenon, Radon and Oganesson could also be considered.
Initial small-scale experiments ought to be performed, systematically increasing either the internal pressure or the volume of the cylinders based on the derived results. 
If the proposed inert gases do not prove successful as surrounding gas, alternatives should be examined. 
After examining combinations of maximum internal pressure, maximum volume and the surrounding gas
where no ignition is observed, the progression of testing should include the addition of external loads. 
This phase should be initiated with a reduced internal pressure, volume or concurrently decrease of both the volume and internal pressure. Throughout this critical stage, it's of paramount importance to rigorously investigate an array of combinations of internal pressure, internal volume, the type (whether static or dynamic) of load and distribution of the external loads, maintain-
ing meticulous records of combinations that can be executed without any ignition. This stringent testing strategy is instrumental in gaining an all-encompassing understanding of the variables at
play and in establishing the safest operational conditions for hydrogen within #gl_("swith",pl:true). Simultaneously, efforts to encapsulate the observed physical behavior in simulations should be undertaken.
The ultimate goal is to understand precisely how to conduct experimental tests for #gl_("swith",pl:true) up to
the scale of the Airbus A350-1000 and to develop simulation tools which can be relied upon to a certain extent, reducing the need for very cost-intensive experiments. Following the success ful completion of such experimental studies, it is critical to also explore whether the surrounding
medium affects the measurement equipment in any way.



#summary_([
In summary it can be said that the potential of self-ignition can be found in real world applications. For that the main geometrical aspects that can cause an ignition were mentioned. Furthermore it was explained, in which these parameter should be modifed in order to reduce the risk of self-ifnition.  Besides the acknowledges threat of hydrogen self-ignition, literature review suppotrs the gollowing view. If hydrogen properties are known, secure hydrogen applicaiton is feasible.

nevertheless, directly transposing
applications from the automotive industry to SWITH on the scale of, for instance, the Airbus A350-1000, should be approached with caution.  A more judicious strategy involves conducting a series
of smaller-scale experimental and numerical studies incrementally approaching the scale of a large
aircraft. A promising path towards achieving this goal has been outlined in this section.

])

