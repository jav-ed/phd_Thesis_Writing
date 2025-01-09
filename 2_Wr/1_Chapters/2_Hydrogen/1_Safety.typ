/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Word rep ins. done

// Title was tested and is inshallah fine
== Theoretical Foundations of Hydrogen Safety Properties<chap_2_1>

The previous @chap_2_0 provided a comprehensive overview of hydrogen's properties, elucidating its attractiveness as an energy carrier. However, when considering experimental structural validation tests of #gls("swith", long:true) for a potential final certification, it is crucial to understand the potential hazards associated with hydrogen.
This investigation can be divided into two complementary approaches: a theoretical foundation and a practical approach supported by numerical simulations and experimental elaboration. The current section focuses on the theoretical knowledge, while the subsequent @chap_2_2 complements it with practical insights derived from simulations and experiments.
To achieve this understanding, an in-depth study has been undertaken. The primary objective is to highlight the key findings, particularly emphasizing the aspects of hydrogen that require special attention from a safety perspective.
By thoroughly examining these safety-relevant properties, this study establishes a critical theoretical foundation. This foundation, when combined with insights from upcoming sections on simulations and experiments, can enable the identification of challenges and development of mitigation strategies for #glspl("swith") validation and certification.


The identification of standards potentially relevant to #gls("swith") was conducted systematically in @chap_1.
These standards were further refined in @chap_1_5 to determine the most essential ones. Although not specifically developed for #gls("swith") certification, these standards provide insights into potential tests that scientists can anticipate. The mandatory and optional structural tests, as per ISO 11119-3:2020 @11119_3_ISO, are listed in @tab_12 and @tab_13 respectively. These tests must be demonstrated for high-pressure cylinder certification.
ISO 11119-3 states in paragraph 8.5.1.1: #emp_[When carrying out the pressure test, a suitable fluid shall be used as the test medium. This can include liquids such as water or oil and gases such as air or nitrogen]. This stipulation allows for various filling media in pressure approval tests. In the context of #gls("swith"), the filling medium refers to the substance stored and pressurized within the wing tanks.
The standard permits additional variations in testing media. For instance, natural gas is allowed in the permeability test (5.5.12.2). However, the pneumatic cycle test (5.5.16.1) specifically requires hydrogen as the filling medium. These findings indicate that only certain experimental tests permit the use of filling media other than hydrogen.
The significance of the chosen filling medium for experimental tests becomes apparent when considering the factors listed in @tab_20. These factors highlight the diverse implications of different media on structural properties, human health, measurement accuracy, test bench safety, availability, environmental impact, and economic efficiency.


#figure(
  table(
    columns: (1fr),
    align: (col, row) => { left + horizon },
    fill: (_, row) => if calc.even(row) { table_cl_header } else { table_cl_0 },
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    table.cell(fill:table_cl_header,[*Influence on Structural Properties*]),
      table.cell(fill:table_cl_0,[- Maximum tolerable bending moment]),
      table.cell(fill:table_cl_1,[- Maximum elongation]),
      table.cell(fill:table_cl_0,[- Tensile strength]),
      table.cell(fill:table_cl_1,[- Torsional stiffness]),
      table.cell(fill:table_cl_0,[- Young's modulus]),
      table.cell(fill:table_cl_1,[- Impact strength]),
    
    table.cell(fill:table_cl_header,[*Impact on Human Health*]),
      table.cell(fill:table_cl_0,[- Carcinogenicity]),
      table.cell(fill:table_cl_1,[- Flammability]),
      table.cell(fill:table_cl_0,[- Explosiveness]),
      table.cell(fill:table_cl_1,[- Olfactory effects (impact on nasal mucosa)]),
      table.cell(fill:table_cl_0,[- Radioactivity]),
    
    table.cell(fill:table_cl_header,[*Measurement and Detection Characteristics*]),
      table.cell(fill:table_cl_0,[- Visibility]),
      table.cell(fill:table_cl_1,[- Olfactory detectability]),
      table.cell(fill:table_cl_0,[- Tactile properties]),
      table.cell(fill:table_cl_1,[- Responsiveness to electromagnetic fields]),
      table.cell(fill:table_cl_0,[- Alternative sensory detection methods]),
    
    table.cell(fill:table_cl_header,[*Test Bench Safety Considerations*]),
    table.cell(fill:table_cl_0,[- Material compatibility (absence of chemical reactions with test bench components)]),
    
    table.cell(fill:table_cl_header,[*Practical Considerations*]),
    table.cell(fill:table_cl_0,[- Availability]),
    table.cell(fill:table_cl_1,[- Environmental impact]),
    table.cell(fill:table_cl_0,[- Economic efficiency]),
  ),
  kind: table,
  caption: [Factors influencing the selection of filling medium in experimental and simulative structural tests for #glspl("swith").],
) <tab_20>

The factors outlined in @tab_20 underscore the necessity for a comprehensive understanding of the medium used in #gls("swith") applications. For hydrogen specifically, the properties elaborated in @chap_1_5 are essential for conducting in-depth investigations into its unique characteristics.
When evaluating various filling agents for #gls("swith") applications from a safety perspective, a crucial question emerges: does the medium merely emit an unpleasant odor, or does it possess the potential for detonation under certain conditions? 
This stark contrast in safety implications underscores the critical nature of medium selection in #gls("swith") design and operation.
To elucidate the potential complications arising from hydrogen use, it is imperative to establish some fundamental knowledge and definitions. Sigloch @Sigloch2022 provides the following key concepts:

1. *Deflagration*: A combustion process where the flame front propagates at a speed less than that of sound.

2. *Explosion*: The rapid, nearly instantaneous combustion of combustible materials or explosives, resulting in a large volume of combustion gas that violently displaces the surrounding air.

3. *Detonation*: A combustion process occurring at supersonic speeds, accompanied by a strong pressure increase and anticipated pressure shocks. Due to the intensity of this process, hearing protection is mandatory in proximity to such events.

The combustion speeds and associated pressure increases that are to be expected for the different combustion processes are listed in @tab_21. The magnitude of the destructive power for the given pressure increases can be estimate through @tab_22.

// ------------------------------- definitions ------------------------------ //
#figure(
  table(
    columns: (1fr, 1fr, 1fr),
    align: (col, row) => if row == 0 { center + horizon } else { center + horizon },
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
      inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    [*Combustion Process*], [*Combustion Rate*], [*Pressure Rise [bar]*],
    [Combustion], [$0.1 - 50 "m/s"$], [up to $approx 0$],
    [Deflagration], [$gt.approx 0.01 "km/s"$], [up to $approx 10$],
    [Explosion], [$gt.approx 0.1 "km/s"$], [up to $approx 10^3$],
    [Detonation], [$gt.approx 1 "km/s"$], [up to over $approx 10^5$],
  ),
  kind: table,
  caption: [Combustion types with guide values @Sigloch2022.],
) <tab_21>

// -------------------------- pressure destruction -------------------------- //
#figure(
  table(
    columns: (0.7fr, 1fr),
    align: (col, row) => if row == 0 { center + horizon } else { center + horizon },
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
      inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    [*Pressure Rise [bar]*], [*Destruction*],
    [$gt.approx 0.05$], [window panes],
    [$gt.approx 0.1$], [half-timbered buildings],
    [$gt.approx 0.3 - 0.8$], [concrete walls, thickness $12 "to" 24 "cm"$],
  ),
  kind: table,
  caption: [Estimated pressure thresholds for structural damage @Sigloch2022.],
) <tab_22>

A vital consideration in experimental investigations involving hydrogen is its potential for various combustion processes, including burning, deflagration, explosion, and detonation. It is important to note that hydrogen, in isolation, is not inherently flammable @Klell2018 @Cheikhravat2012 @Crowl2007 @Sanchez2014 @Zhang2022. However, hydrogen can become flammable or even detonable when combined with specific factors. These crucial factors, as outlined in @tab_23, create the conditions necessary for hydrogen's combustibility.

#figure(
  table(
    columns: (1fr),
    align: (col, row) => left + horizon,
    fill: (col, row) =>  {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    [1. Presence of sufficient ignition energy or attainment of ignition temperature @Bane2013 @Dimitriou2017 @FernandezTarrazo2023],
    [2. Formation of a flammable or detonable gas mixture @Cheikhravat2012 @Crowl2007 @Yang2021 @Gao2016 @Zhang2016],
    [3. Special reactive cases: presence of chlorine or fluorine @Klell2018 @Klell2023 @Sullivan1975 @Gustin2005],
  ),
  kind: table,
  caption: [Essential conditions for hydrogen to become ignitable to detonable.],
) <tab_23>

  
The minimum ignition energy for hydrogen is highly dependent on the air content in the gas mixture. In principle, a small spark or static discharge is sufficient to ignite hydrogen when the gas mixture is within the flammable range. For instance, a static discharge resulting from walking on a carpet and subsequently touching a doorknob, which typically generates $20 "to" 30 "mJ"$ of energy, is capable of igniting a flammable hydrogen-air mixture @Klell2018. 
The minimum ignition energies for hydrogen, methane, and propane across various air content levels in the gas mixture, illustrated in @fig_19, provide a comparative perspective on the ignition sensitivity of these gases.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/1_Safety/0_Ingition_Energy.png", 
  width: 87%),
  caption: [Comparison of minimum ignition energies for hydrogen, methane, and propane in air under standard conditions @Klell2018.],
) <fig_19>


An analysis of @fig_19 reveals that the aforementioned $20 "mJ"$ energy from a static discharge exceeds the minimum ignition energy threshold for an appropriate hydrogen-air composition. Comparing hydrogen to methane and propane, two key observations emerge: hydrogen not only exhibits lower ignition energy levels than methane but also demonstrates flammability across a substantially wider range of air-fuel mixtures.
To promote deeper understanding, it is essential to define two critical technical terms:

1. *Flash point*: For a flammable liquid, this refers to the lowest temperature at which, under specified conditions, sufficient vapors are produced to form an ignitable vapor/air mixture above the liquid surface upon external ignition. Notably, if the ignition source is removed, the flames extinguish @Klell2018 @Klell2023.

2. *Ignition temperature*: This denotes the lowest temperature at which spontaneous ignition of the fuel occurs in an open vessel @Klell2018 @Klell2023.

It is important to note that in both cases, ignition can only occur if an appropriate proportion of air is present. Comprehensive data on the ignition and explosion characteristics of hydrogen and other fuels are provided in @tab_24.

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto),
    align: (col, row) => if row == 0 or row == 1 { center + horizon } else { center + horizon },
    fill: (col, row) => if row <= 1 {table_cl_header} else {(table_cl_0, table_cl_1).at(calc.rem(row, 2))},
    inset: (
    x: 1em,
    y: 0.7em,
    ),
    stroke: none,
    /* --- header --- */
    [*Substance *], [*Lower explosion limit*], [*Upper explosion limit*], [*Flash point*], [*Ignition temperature*], [*Minimum ignition energy*],
    [], [*[Vol% in air]*], [*[Vol% in air]*], [*[°C]*], [*[°C]*], [*[mJ]*],
    /* -------------- */

    [Acetylene], [1.5], [82], [-136], [305], [0.019],
    [Ammonia (l)], [15], [34], [132], [651], [14],
    [Gasoline (l)], [0.6], [8], [> -20], [240-500], [0.8],
    [Natural gas], [4.5], [13.5], [> -188], [600], [0.3],
    [Carbon monoxide], [12.5], [75], [-191], [605], [> 0.3],
    [Methane], [5], [15], [-188], [595], [0.3],
    [Petroleum (l)], [0.7], [5], [55], [280], [0.25],
    [Propane (l)], [2.1], [9.5], [-104], [470], [0.25],
    [Hydrogen], [4], [75.6], [-270.8], [585], [0.017],

    ),
    kind: table,
    caption: [Comparison of ignition-relevant properties for hydrogen and various other fuels @Klell2023. Note: (l) denotes liquid state; all others are in gaseous state.],
)<tab_24>

An analysis of @tab_24 reveals that hydrogen exhibits a relatively high ignition temperature compared to other gases. Nevertheless, it is crucial to note that hydrogen-air mixtures remain flammable across a comparatively wide range of concentrations. While this broad flammability range might be manageable through appropriate safety measures, hydrogen presents a unique challenge due to its exceptionally low minimum ignition energy—the lowest among the fuels listed in @tab_24. This characteristic poses a significant safety concern, as it increases the risk of unwanted and accidental ignitions.
Further complicating safety considerations is the fact that hydrogen is invisible to the naked eye. However, experimental investigations conducted by @schefer2009visible have successfully recorded hydrogen flames under specific conditions. A visual representation of these flames is provided in @fig_20, offering insights into the observable features of hydrogen combustion.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/1_Safety/1_H2_Flame.png", 
  // keep the 10% here. seems to be a very high dimensional image
  width: 10%),
  caption: [Visibility of a hydrogen flame under specific conditions: laminar jet velocity of 47 m/s, Reynolds number of 837. Image captured using a Sony DSC D700 camera (aperture f/2.4, no filter) @schefer2009visible.],
) <fig_20>


The image presented in @fig_20 was captured under specific experimental conditions: a laminar jet velocity of 47 m/s, a Reynolds number of 837, using a Sony DSC D700 camera (1344 × 1024 pixels) with an f/2.4 aperture and no filter. Contrary to the common misconception that hydrogen flames are invisible, @fig_20 clearly demonstrates their visibility @schefer2009visible. It is important to note, however, that while hydrogen flames are indeed visible, they exhibit lower luminosity compared to the flames of ignited hydrocarbons @schefer2009visible. This difference in visibility has significant implications for safety and detection methods in hydrogen applications.
The visibility of hydrogen flames is further influenced by the oxygen content in the oxygen-hydrogen mixture, as illustrated in @fig_21. 
The correlation between flame visibility and mixture composition offers valuable findings for safety considerations in hydrogen applications. 

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/1_Safety/2_H2_Multi_Flame.png", 
  width: 57%),
  caption: [Effect of oxygen content on hydrogen flame visibility. Images show flames at different equivalence ratios $phi$: (a) $phi = 1.0$, (b) $phi = 0.8$, (c) $phi = 0.7$, (d) $phi = 0.62$. Higher $phi$ values indicate closer approximation to stoichiometric combustion. Experimental conditions: jet velocity $33 "m/s"$, Reynolds number 580, turbulent flow, camera aperture f/2.4 @schefer2009visible.],
) <fig_21>


In inspecting hydrogen flame visibility, the equivalence ratio, denoted as $phi$, plays a crucial role. $phi$ is defined as the ratio of the actual air-fuel ratio to the stoichiometric air-fuel ratio for combustion @Salaudeen2019. An equivalence ratio of $phi = 1$ represents optimal combustibility, while lower values of $phi$ indicate suboptimal combustion conditions. 
The experimental results reveal a direct relationship between $phi$ and flame visibility: as $phi$ increases, the flame becomes more visible.
The specific experimental conditions for these observations are detailed in the description of @fig_21. Notably, @schefer2009visible concludes that low ambient lighting conditions are conducive to better flame visibility, an important concern for practical hydrogen flame detection.
Comprehensive information on hydrogen-air mixing limits for various ignition types and other relevant parameters are provided in @tab_25. It is critical to emphasize that under standard conditions ($0 " " degree.c$ and $1.01325 "bar"$), hydrogen exhibits a wide flammability range, being flammable at air concentrations of $4% "to" 75.6%$. 
Moreover, hydrogen becomes detonable within a narrower but still significant range of $18% "to" 58.9%$ air content.

#figure(
  table(
    columns: (auto, auto),
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    // stroke: tab_Frame(0.05em),
    stroke: none,
    
    /* --- header --- */
    table.cell(colspan:2, [*Hydrogen-Air Mixture Properties*]),
    /* -------------- */
    [Lower explosion limit (ignition limit)], [4 Vol% H#sub[2]],
    [Lower detonation limit], [18 Vol% H#sub[2]],
    [Stoichiometric mixture], [29.6 Vol% H#sub[2]],
    [Upper detonation limit], [58.9 Vol% H#sub[2]],
    [Upper explosion limit (ignition limit)], [75.6 Vol% H#sub[2]],
    [Ignition temperature], [$585 " " degree.c  =^hat 858 "K "$],
    [Minimum ignition energy], [$0.017 "mJ"$],
    [Maximum laminar flame velocity], [$approx 3 "m/s"$],
    [Maximum adiabatic combustion temperature], [$approx 2200 " " degree.c =^hat 2473.15 "K "$],
  ),
  kind: table,
  caption: [Combustion characteristics and critical values for hydrogen-air mixtures @Klell2018 @Klell2023.],
)<tab_25>



Beyond the air content hurdles outlined in @tab_25, @tab_23 highlights two exceptional cases of hydrogen reactivity. Firstly, hydrogen and chlorine can initiate a reaction solely through light irradiation, resulting in a loud, explosive bang known as the chlorine oxyhydrogen reaction @Klell2018 @Klell2023. 
Secondly, hydrogen exhibits similarly explosive reactions with fluorine @Klell2018 @Klell2023. 
These cases underscore the diverse and potentially hazardous reactive properties of hydrogen.
The reactive nature of hydrogen not only manifests in gaseous interactions but also in its interactions with solid materials. 
Hydrogen-material compatibility emerges as another substantial consideration in hydrogen handling. Metals, in particular, can accumulate hydrogen within their lattices, potentially leading to embrittlement. For a more detailed examination of hydrogen embrittlement, the reader is directed to @chap_1_2.
The process of hydrogen incorporation into metal lattices begins with the dissociation of hydrogen molecules into atoms at the metal surface @Klell2023 @Usman2022. 
Certain pure metals, including palladium, magnesium, lanthanum, and aluminum, as well as specific alloys such as TiNi-Ti#sub[2]Ni and Mg-Mg#sub[2]Ni, demonstrate the ability to store hydrogen @Klell2023.
This property of hydrogen storage in metal lattices has an additional beneficial application: it enables the production of highly pure hydrogen (99.99%) @Usman2022 @Du2021 @Nashchekin2020. Hence, metal lattices can serve as effective hydrogen purification filters, illustrating how a potential challenge can be leveraged for practical benefits in hydrogen processing and purification.


In contrast to metals, plastics generally exhibit lower density. While plastics do not suffer from hydrogen embrittlement, they present significant obstacles in containing hydrogen @Su2021. The primary concern is the potential for rapid hydrogen permeation through plastic containers, which could lead to swift depletion of a filled tank. This permeation poses a serious safety risk, particularly in enclosed spaces. For instance, if a hydrogen-containing plastic vessel were stored in a car garage, the gradual accumulation of escaped hydrogen could create a hazardous environment, potentially resulting in severe burns or explosions if ignited. Consequently, when assessing hydrogen storage and handling, especially in the context of experimental structural validation tests for #glspl("swith"), two properties demand special attention: flammability and diffusion behavior.
The preceding analysis has primarily focused on the theoretical characteristics of hydrogen's safety-related properties, revealing two primary aspects. Firstly, in light of this section in conjunction with the previous @chap_2_0 and forthcoming sections, it becomes evident that hydrogen possesses numerous unique properties warranting thorough examination. 
Secondly, specifically in light of the transition from theoretical to practical applications of hydrogen, the necessity for specialized protocols and expertise has been clearly demonstrated.
While the theoretical foundation and measured data are essential for initial #gls("swith") certification steps, the ultimate objective is to apply this knowledge to real-world scenarios. To bridge the gap between theory and practice, it is crucial to synthesize information from both theoretical models and empirical measurements of hydrogen behavior. The subsequent @chap_2_2 addresses this need by exploring numerical simulations and hydrogen experiments, offering valuable insights into the obstacles and considerations of working with hydrogen in practical settings.


#summary_([
In conclusion, hydrogen's significant potential for ignition, explosion, and detonation is contingent upon specific air-hydrogen mixtures. Two factors amplify safety concerns: the wide range of ignitable mixture ratios and the sufficiency of small static discharges to trigger ignition to detonation. Additionally, hydrogen's diffusion behavior and material compatibility are critical for safe containment. While metals offer superior retention compared to plastics, they risk hydrogen embrittlement.
The theoretical knowledge presented underscores the need for heightened attention to hydrogen safety in real-world applications. It also emphasizes the importance of gathering data from numerical simulations and experimental tests to bridge gaps between theoretical understanding and practical behavior. This synthesis of theory and practice is crucial for the experimental structural validation tests of #glspl("swith"), where accurate prediction and management of hydrogen behavior are essential for both safety and performance.
])


