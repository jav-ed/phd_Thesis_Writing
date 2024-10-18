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

Ignitions in which no external ignition sources are used are referred to as self-ignitions or spontaneous ignitions @Stauffer2008. 
There are various theoretical models (reverse Joule-Thomson effect, electrostatic ignition, brush discharges, corona discharges, diffusion ignition, sudden adiabatic compression, hot surface ignition, mechanical friction and impact ignition) for self-ignition are mentioned @astbury2007spontaneous @Zhou2022 @Qiu2024 @Yang2021. 
Compression ignition, Joule-Thomson expansion, diffusion ignition, and ignition by hot surfaces are said to be unlikely ignition mechanisms for most unintentional releases of hydrogen at ambient temperature. 
Moreover, it is also quite possible that several of the mentioned mechanisms together would produce a self-ignition @astbury2007spontaneous. 
Intensive experimental investigations on the outflow of pressurized hydrogen into the free environment are carried out in @dryer2007spontaneous. 
Other work doing invesigations with shock cylinderical tubes are 
@Mogi2008 @Golub2008 @Mogi2009 @Lee2011 @Kim2013 @Kitabayashi2013 @Grune2014 @Gong2016 @Duan2016 @Jiang2019  @Wang2019. 
Reviews and summaries on the topic of spontaneous ignition mechanism of pressurized hydrogen released through tubes can be found in @Qiu2024 and @Yang2021.
Some of tge finding are not only helpful for conducting expmerintal investigations with hydrogen but also for the design of #gl_("swith", pl:true).
These shall be first mentioned folowed by concrete explanations, why these findings are found to be improtant.

When pressuiorzed hydrogen is released from its vessel, some geometrical aspects have an high impact on the subsequent spontaneous ingition.
One of them is the tube length. Both numerical simulations as well as experimental studies on releasing the pressureiized hydrogen indicates that the longer the pipe is, the greater the chance of the occurence of a spontaneous ignition @Qiu2024 @Zhou2022 @Yang2021 @Jin2021.
However, when the length of the tube exceeds a certain threshold, the tendency for self-ignition of high-pressure hydrogen becomes weaker @Zhou2022.
According to @Wang2019 the self-ignition tendency will be weakened only after the length of the tube exceeds $1700 "mm"$.
For this thesis the shape of the tubes that contains the #gl_("cgh2", long:true) was defined to be cylinderical. 
For explaining its length it was emntioned that for economical reasons high ranges are desired.
Yet, if long tubes could increase the risk of a self-ignition, the choice for the tube length becomes more complex.
In this case for desinging #gl_("swith", pl:true) additionally to the available literature of experimental self-igntiions tests  own simmilar tests with potentially much higher lengths could be required first.
The reason for much higher lengths in the order between $~ 5"m and" ~70 "m"$ is due to the economical desire of increasing flight range.
Also, because the tanks integrated inside the wings and the length of the wingts of commerical aircraft is much higher than the length of tubes that are commonly used for experimental tests.
The rationale behind preferring shorter tubes, that is, less than $5 "m "$ are the involved costs and efforts. Scientists generally are constrainted on costs and available time. 
According to the reviews of @Qiu2024 @Zhou2022 @Yang2021 @Wang2019 indicates that generally experimental tests are generally conducated with tubes with a length of $ <= 4200 "mm"$. Noteably, lengths around $<= 1000 "mm"$ are more common than comperatively high tube length of $4200 "mm"$ in @Kitabayashi2013.
A comprehsive list according to @Yang2021 is given in @tab_27.

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
    [*Experiment*], [*Burst pressure (MPa)*], [*Tube length (mm)*], [*Diameter (mm)*], [*Cross-section of tube*],
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
  caption: [Experimental parameters and setups for various studies on diffusion ignition @Yang2021.],
) <tab_27>


// ----------------------------- dimated impact ----------------------------- //
Depedning on the outcome of the self-ignition experiments for aircraft-relevant tube lenghts more advanced mehtos like optimization could be required to find the proper tube lenghts.
Besides the length of the tube length, the tube diamter is also an improtant geometrical variable.
It has been found that tubes with smaller diameters are more prone to spontaneous ignition @Qiu2024 @Zhou2022 @Kim2013a.
Thus, from the curent state of the art, generally a higher diameter is suggested when it comes to preventing the self-ingnition.
Another important gemotrical parameter that is invesigated in regards to spontaneous ignition is the cross-section area @Xu2012 @Xu2014.
Deacreasing (contraction) or increasing the local  emonstrate a lower minimum release pressure required for ignition compared to constant cross-section tubes @Qiu2024 @Xu2012 @Xu2014.
The general shape of the tube does not  affect the minimum burst pressure required for spontaneous ignition @Qiu2024.
Yet, it can be noted that when the spontaneous ignition is induced in a non-circular cross-section tube, the possible turbulent flow in the corner of the tube increases can promote the mixing of hydrogen and air, thus producing more amount of the hydrogen/air mixture @Li2019.
Both, diamter as well as corss section are important parameter for desinging the tubes of #gl_("swith", pl:true).
Tube length, diameter and cross section together are the main parameter that govern the maximal volume the tubes for the #gl_("swith", pl:true) or general cylinderical pressure vessel have.
For the sake of easy accessiblily a concise summary of these findings is presented in @tab_28.


// optimization, cross section that is shape of the tube, 
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
  caption: [Choice of influence parameters to avoid the risk of occurrence of hydrogen self-ignition and other potential influence parameters.],
) <tab_28>


// ---------------------------------- here ---------------------------------- //
Up to now it could be highlighted that the risk of self-ignition not only theory based, but is met in real-world application.
For experimental validation tests for #gl_("swith", pl:true) practical hydrogen is key.
Thus, for providing safe methods to work with hydrogen further investigations are required.
Following that and explaning why @tab_28 mentions that the pressure inside the container should be low, the work @jallais2017effects shall be exmained in detail. 
In the experiment presented therein, the effect of oxidizing agents, such as air, pure oxygen O#sub[2], nitrous oxide N#sub[2]O, and acetylene C#sub[2]H#sub[2], on the spontaneous ignition of hydrogen was investigated. 
The various oxidizing agents flow perpendicular to the hydrogen jet. 
Similar to the previous mentioned investigations, hydrogen is also released here from a high-pressure vessel through a nozzle into the atmosphere. 
However, this atmosphere is now flowed through by various oxidizing agents, which represents a significant difference from earlier investigations with a free atmosphere. 
For the experiments, a straight expansion tube with a diameter of $4 "mm"$ and a length of $10 "cm"$ was used. The spontaneous ignition was observed with a high-speed camera and the external overpressures were measured.
The results of the experiments in @jallais2017effects are shown in @fig_24. 
These illustrate the influence of the pressure in the hydrogen container and the ambient gas on causing a possible self-ignition.


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/2_Experiment/2_H2_Experiments.png", 
  width: 100%),
  caption: [Influence of pressure in the hydrogen container and surrounding gas atmosphere on the self-ignition of a hydrogen jet @jallais2017effects.],
) <fig_24>


First, it can be seen from the results in @fig_24 that increasing pressure in the hydrogen container increases the probability of self-ignition. 
Furthermore, it can be noted that at low pressure values, self-ignition could be avoided in all investigated gas environments. Preventing unwanted hydrogen ignitions is considered one of the most important safety requirements for the application of hydrogen in practice. 
If focusing exclusively on this criterion, the following conclusions can be drawn. Oxygen O#sub[2] as the ambient gas leads to the most unsafe working conditions for working with hydrogen. 
Pure air and nitrous oxide N#sub[2]O, which according to the results are preferable, are nevertheless classified as unsafe by the author of this thesis. Only acetylene C#sub[2]H#sub[2], which represents a combustible gas, could meet the safety requirements for $p < 230 "bar"$.

// -------------------------------------------------------------------------- //
By revisiting key points stated in previous @chap_2_0_1 and this subsection, it can be confirmed that hydorgen offers safety concering propeties. 
Yet, despite potential hazards, hydrogen possesses many beneficial properties and,
therefore, could be considered a potentially safe option for practical applications when handled responsibly and with a comprehensive understanding of its unique characteristics @Landucci2010 @jallais2017effects @Klell2018 @Rosen2018 @Thomas1997.  The outcome of @Landucci2010 is that the risks of compressed hydrogen are comparable with
liquefied petroleum gas and natural gas.
The referenced studies primarily stem from specialized testing environments or the automotive industry. 
Although their results offer useful insights for #gl_("swith",pl: true), significant differences exist between these contexts.
To understand these nuances, some specificities of #gl_("swith",pl: true) shall be revisted.


// ---------------------------------- here ---------------------------------- //
In #gl_("swith", pl:true) the hydrogen tanks are integrated into the wings. 
High internal pressure and volume are required to ensure high volumetric energy densities. Moreover, these tanks bear the dual burden of holding internal pressure while withstanding external loads. 
The quest for minimal weight in aviation design and high safety demands suggests the use of type IVas explained in @chap_1_0_3. 
Yet, the high-speed dispersion of #gl_("cfrp", long:true) tank fragments during a rupture could pose severe risks to both people and measurement devices. If #gl_("cfrp") composites break down, they can potentially release tiny particles or fibers into the air, which, if inhaled, can lead to respiratory problems. 
This risk is amplified if the rupture occurs in a confined, poorly ventilated space. The goal of maximizing the hydrogen load during flight calls for optimizing tank pressure and volume. This leads to one of the key distinctions between #gl_("swith", pl:true) and most other applications of compressed hydrogen cylinders: the size of the tanks. 
The APUS i-2 @APUS_1, for instance, has a wingspan of $13.2 "m "$, with approximately $gt.approx 50%$ of its length occupied by 4 cylindrical high-pressure tubes. 
For an comparison, the Airbus A350-1000 has a wingspan of about $approx 64 "m "$ and a flight range of $16482 "km"$ @link_Airbus_350. If it is assumed that 80% of this wingspan should accommodate tubes, this would equate to a tube length of $64 "m " dot 0.5 = 32 "m "$. 
However, the goals of maximizing tank size and internal pressure can inadvertently enhance the risk of self-ignition as highlighted in this section.

Another distinguishing factor for #gl_("swith",pl:true), particularly from land vehicles, is the range of operational altitudes. #gl_("swith",pl:true) are not confined to a single altitude but operate over a range of altitudes. At high altitudes, the reduced ambient pressure leads to a greater pressure differential, which in turn, increases the speed of hydrogen release. In cases where the speed of sound in hydrogen is not reached, a hydrogen shock wave is not anticipated.

However, at higher altitudes, the speed of sound in air decreases, raising the probability of an air shock wave. When diffusion processes between air and hydrogen reach an ignitable concentration, phenomena ranging from ignition to detonation could be expected. Contrary to this notion, the air density decreases at higher altitudes, which could potentially slow down or complicate the process of reaching ignitable concentrations through the diffusion of air and hydrogen. Moreover, when considering the increased pressure difference and reduced air density in tandem, the speed at which hydrogen is released is not only enhanced due to the decreased ambient pressure but also due to an increased free path length until gas particles collide with each other. In other words, hydrogen can traverse longer paths before it collides with an air molecule, leading to a delayed reduction in speed owing to the conversion of kinetic energy into collision energy, commonly perceived as heat. The reduced air density at higher altitudes allows hydrogen molecules to maintain their high velocity over greater distances. This extended high-velocity travel leads to more rapid dispersion of hydrogen, potentially spreading it over a larger area in less time compared to releases at lower altitudes.
To introduce another level of complexity to this thought experiment, the impact of decreased temperature at higher altitudes also warrants consideration. As a result, we can ascertain that the impact of increasing altitude, leading to the consequent alteration of the mentioned parameters and their influence on the probability of causing an ignition to detonation, is a subject that demands further research.


The concept of #gl_("swith",pl:true) adds an additional unique aspect to potential types of hydrogen releases caused by overloading. In the first scenario, leaks could occur at the connections between the tanks and the wing, resulting in hydrogen being released into the open airflow. Alternatively, a leak could lead to the accumulation of hydrogen inside the wing, where only the tanks are compromised and the wing remains intact without any further leaks. Generally speaking, aircraft designers will strive to utilize the maximum volume of the wing span for tank integration. This approach, however,
means that any released hydrogen might accumulate in potentially small, confined spaces within the wing. Such a scenario has already been identified in literature as highly undesirable due to the risks it poses for ignition and explosion @Klell2018 @Klell2023.
While the insights obtained from experimental tests with small cylinders or in the automotive industry are valuable initial steps, they lack the comprehensiveness needed to fully address the unique requirements of #gl_("swith",pl:true). A more specialized and targeted approach to research is crucial to ensure the safe application of hydrogen in this specific context. 

To facilitate the use of hydrogen in #gl_("swith",pl:true) a experimental structural validation test method must be developed. To conduct these experimental tests, safe working conditions must be guaranteed for both the involved personnel, the instrumentation and the #gl_("swith") itself.
Attempting to meet this requirement immediately for large #gl_("swith",pl:true), such as those on the scale of the Airbus A350-1000, may not be feasible. Instead, smaller, gradual steps towards the larger goal should be taken. 


The outcome of @jallais2017effects depicted in @fig_24 suggests  that it should be theoretically possible to eliminate one of the critical safety concerns. To prevent self-ignition or detonation from occurring, the working environment would have to be placed under protective gas. While Acetylene was found to enhance safety in this regard, Helium could be a more suitable choice due to its high speed of sound (according to @tab_26  1005 m/s) 
and noble gas properties.
Noble gases have their outer shells completely filled with valence electrons and are therefore difficult to get to react.
Other noble gases such as Neon, Argon, Krypton, Xenon, Radon and Oganesson could also be considered.
Initial small-scale experiments ought to be performed, systematically increasing either the internal pressure or the volume of the cylinders based on the derived results. 
If the proposed inert gases do not prove successful as surrounding media, alternatives should be examined. 
After examining combinations of maximum internal pressure, maximum volume and the surrounding gas
where no ignition is observed, the progression of testing should include the addition of external loads. 
This phase should be initiated with a reduced internal pressure, volume or concurrently decrease of both the volume and internal pressure. Throughout this critical stage, it's of paramount
importance to rigorously investigate an array of combinations of internal pressure, internal volume, the type (whether static or dynamic) of load and distribution of the external loads, maintain-
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

