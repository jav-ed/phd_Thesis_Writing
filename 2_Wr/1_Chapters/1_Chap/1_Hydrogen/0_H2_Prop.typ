/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */
#pagebreak(weak:true)

//TODO
// the intro for the section needs to be checked again
// make sure that the given references here actuall work as intented to
// get proper title Hydrogen alone might not suffice, if the curvature study is included here
== Hydrogen <chap_2_0>
A comprehensive definition and state-of-the-art review regarding #gl_("swith", long:true) were provided in @chap_0_7. In @chap_1_0, an in-depth study was conducted to present the current standards and regulations pertaining to the commercial certification of #gl_("swith", long:true). Some of the information presented in @chap_1_0 will be utilized in this section to motivate and justify the undertaken steps.
This section begins by examining the pioneering approach of integrating hydrogen tanks as load-carrying components into an aircraft wing's structure. 
The study of fundamental hydrogen properties will be initially motivated, followed by a detailed analysis in @chap_2_0_0. Subsequently, special attention is given to the safety-relevant characteristics of #gl_("cgh2",long:true) in @chap_2_0_1. Following this, @chap_2_0_2 addresses experiments and simulations involving hydrogen. Finally, given that #gl_("swith",pl:true)  involves tanks bearing external loads 
@chap_2_0_3 highlights important findings regarding external dynamic loads on pressure vessels.

// Title was tested and is inshallah fine
=== Essential Properties of Hydrogen <chap_2_0_0>

The pursuit of structural validation tests for #gl_("swith") certification represents a novel endeavor, motivated by multiple factors examined throughout this thesis. This subsection focuses specifically on the hydrogen aspect of these tests. Conducting structural tests with compressed hydrogen necessitates both a foundational understanding and an in-depth investigation of hydrogen's properties, particularly those related to safety.
This subsection explores the basic properties of hydrogen, elucidating why it stands as an attractive alternative to current fossil fuels. The potential hazards associated with hydrogen in practical applications are addressed in @chap_2_0_1. Initially, a clear rationale for understanding hydrogen's basic properties is presented. Following this, the fundamental properties of hydrogen are outlined in a clear and structured manner.

The integration of compressed hydrogen in #gl_("swith", pl:true) represents a pioneering approach in aircraft design, directly addressing at least two major challenges in sustainable aviation: fuel storage and structural efficiency. The innovative nature of this concept, however, results in a scarcity of research on related topics. While this limited body of work poses challenges, it simultaneously emphasizes the importance of further investigation.
The necessity to thoroughly understand hydrogen's properties is supported by several factors. Such understanding is essential for comprehending hydrogen's remarkable properties, which make it a promising alternative fuel option. This knowledge guides the successful design, manufacturing, and ultimate commercial certification of #gl_("swith", pl:true). Moreover, it is pivotal when designing and conducting both experimental structural tests and simulations of #gl_("swith", pl:true). These experiments and simulations are crucial not only for potential future certification but also for advancing the scientific understanding of #gl_("swith", pl:true).
For convenience, all principal and safety-wise harmless information of this subsection is compiled and presented in @tab_18.

#figure(
  table(
    columns: (1fr, 2fr),
    align: left + horizon,
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    /* --- header --- */
    table.header[*Property*][*Description*],
    /* -------------- */
    [Atomic Structure], 
    [Hydrogen (H) is the smallest known atom, with a diameter of approximately 0.07 nm @Klell2018 @Klell2023.],

    [Molecular Form], 
    [- Exists primarily as H#sub[2] molecule @Klell2018 @Klell2023. 

    - The H atom itself is highly reactive @Liu2022 @Tarkowski2022 @Li2021b. 

    - Generally, references to #emp_[hydrogen] denote the H#sub[2] molecule rather than the H atom.],
  
    [Chemical Properties], 
    [- The H atom forms a stable bond with another H atom to create H#sub[2]. This stable bond results from fully occupied valence electrons, leading to low reactivity of H#sub[2] @Kubas2007. 

    - The H atom has a relatively low electronegativity of 2.2 @Klell2018 @Klell2023, which describes an atom's ability to attract electrons when forming chemical bonds.],
    
    [Sensory Properties], 
    [- Odorless @Hwang2023 @MadadiAvargani2022 @Pal2022

    - Tasteless @MadadiAvargani2022

    - Invisible @Hwang2023 @MadadiAvargani2022 @Pal2022],
    
    [Safety Properties], [
    - Non-toxic @Tang2023 @MadadiAvargani2022 @Jokar2023
    
    - Non-carcinogenic @Klell2018 @Klell2023

    - Not radioactive @Klell2023

    - Not caustic @Klell2018 @Klell2023],
    
    [Production], [Regenerative production is possible through water electrolysis powered by wind, solar, or other renewable energy sources @Rosen2018 @Ishaq2022 @Younas2022 @Dawood2020.],
    
    [Thermodynamic Properties],[Exhibits a negative Joule-Thomson coefficient at high pressures @Li2023a @Zhang2024b @Li2023b. This implies that an increase in pressure results in a decrease in temperature, and vice versa. This relationship can be mathematically expressed as:

    $ mu_upright("JT") = (delta T) / (delta p) $<eq_4>

    where T represents temperature, p represents pressure, and $delta$ denotes the derivative or change in temperature with respect to pressure. Hydrogen also deviates from ideal gas behavior.],
    
    [Physical Properties], 
    [- Hydrogen is the lowest density element (approximately 14 times lighter than air) @Klell2018 @Klell2023. 
    
    - It primarily exists in liquid and gaseous states. 

    - At $0 degree.c$ and $1.01325 upright("bar")$, hydrogen has a high speed of sound ($a_upright("H2") = 1261.1 upright("m/s")$ @Klell2018), compared to air ($a_upright("air") = 331.5 upright("m/s")$ @Sigloch2022). 

    - Extensive research is ongoing into alternative storage forms @Usman2022 @Yang2023 @Panigrahi2024, including physical and chemical adsorption (metallic hydride) @Drawer2024 @Nivedhitha2024 @Boateng2023, supercritical or cryo-compressed storage @Yan2024 @Aceves2010 @Jaramillo2024, and other methods as illustrated in @fig_15.],
    
    [Abundance], 
    [- Hydrogen is plentiful, including in Earth's atmosphere @Pal2022 @Faye2022 @Klopcic2023 @MadadiAvargani2022 @Jokar2023 @Hassan2023. 

    - It is a component of many fossil fuels, including methane (CH#sub[4]), methanol (CH#sub[3]OH), ethene (C#sub[2]H#sub[4]), propane (C#sub[3]H#sub[8]), and benzene (C#sub[6]H#sub[6]) @Klell2018.],
    
    [Regulations], 
    [Safe handling and storage standards are available, comparable to those for natural gas @Klell2018 @Klell2023 @Rosen2018 @dryer2007spontaneous @Thomas1997.],
  ),

  kind: table,
  caption: [Fundamental properties of hydrogen relevant to its use as an alternative fuel.],
)<tab_18>


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/0_Intro/0_Types.jpg", 
  width: 87%),
  caption: [Illustrative example of different methods to store hydrogen @Usman2022.],
) <fig_15>

While @tab_18 provides important information about hydrogen, one special aspect warrants detailed examination. A major reason for hydrogen's attractiveness as an energy carrier is its gravimetric energy density. Gravimetric energy density describes the usable energy per unit mass. A high gravimetric energy density implies that substantial energy can be employed with less weight.
Due to the ongoing environmental crisis, most mobility sectors are eager to find an energy medium that offers both high energy content for economic reasons and low weight for environmental concerns. The lighter the energy carrier, the less mass needs to be transported, thereby reducing power consumption demands. be transported, which reduces power consumption demands.


In its pure form, hydrogen possesses a high gravimetric energy density @Usman2022 @Yao2022 @Prewitz2020 @TashieLewis2021. However, the gravimetric energy densities achieved in practical applications are significantly lower than those of hydrogen in its pure form. This reduction is primarily due to the storage system requirements.
For practical applications, hydrogen must be stored within a tank. In the case of #gl_("cgh2"), pressure is a major factor influencing the gravimetric energy density. There are several considerations regarding pressure and tank design. Firstly, there is a technical limit on how much pressure can be created within a tank. Secondly, higher demanded pressure exerts more stress on the tank, necessitating appropriate tank materials. More details on this can be found in @chap_1_0_3. Furthermore, the mass required for pressure containment reduces the overall gravimetric energy density of the hydrogen-storage system, as the tank's mass does not contribute to the energy content.
Consequently, if the tank is very heavy but does not allow for the storage of much hydrogen mass, the resulting gravimetric energy density is low.
A comparison of gravimetric energy densities between pure forms and practical storage systems for commonly used fuels is presented in @fig_16. In this figure, the suffix #emp_("G") denotes gaseous state, #emp_("L") represents liquid state, and #emp_("NG") stands for natural gas.


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/0_Intro/1_H2_densities.svg", 
  width: 100%),
  caption: [Gravimetric energy densities of storage systems @Klell2023.],
) <fig_16>


$ 1 upright("MJ") =^arrowhead  (upright("kWh")) / 3.6 $ <eq_7>

Considering only the gravimetric energy density of pure hydrogen, the information depicted in @fig_16 clearly demonstrates that hydrogen offers more energy than other commonly used fuel mediums, such as natural gas, gasoline, or diesel.
While @tab_18 briefly mentions that hydrogen does not behave like an ideal gas, this aspect requires further elaboration. To provide more detail, first the real gas factor $Z$ @Mahmoud2013, also known as the compressibility factor, should be introduced. This factor is given in @eq_5, where the variable $m$ describes the mass of the respective gas. The real gas factor $Z$ quantifies the deviation of a gas from ideal gas behavior.

$ Z = m_upright("ideal") / m_upright("real") $<eq_5>

When $Z = 1$, there is no difference between real and ideal gas behavior. 
When $Z$ exceeds 1 ($m_upright("ideal") > m_upright("real") => Z > 1$), the ideal gas equation overestimates the mass. Conversely, when $Z$ is less than 1 ($m_upright("ideal") < m_upright("real") => Z < 1$), the equation underestimates the mass. 
Real gas factors are typically determined empirically and presented as analytical equations or regression-derived terms. An example for hydrogen is given in @Lemmon2008 by @eq_6, where $p,T, rho$, and $R$ denote pressure, temperature, density and the ideal gas constant, respectively, while $a_i$, $b_i$, and $c_i$ represent coefficients specific to the regression model.

$ Z(p,T) = p / (rho R T) = 1 + sum_(i=1)^9  a_i ((100 K) / T)^(b_i) (p / (1 upright("MPa")))^(c_i) $<eq_6>

The associated constants $a_i$, $b_i$, and $c_i$ are presented in @tab_19. Examining @eq_6, it is evident that the first term corresponds to the widely known ideal gas equation, $ p / (rho R T)$ @Stephan2013. The subsequent terms in the equation represent the regression-based modifications that account for the real gas behavior. These additional terms quantify the deviation from ideal gas behavior as a function of temperature and pressure.

#figure(
  table(
    columns: (auto, 1fr, 0.7fr, 0.7fr),
    align: (col, row) => if row == 0 { center + horizon } else { center + horizon },
    fill: (col, row) => if row == 0 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    /* --- header --- */
    [*i*], [*$a_i$*], [*$b_i$*], [*$c_i$*],
    /* -------------- */
    [1], [#num("0.058 884 60")], [1.325], [1.0],
    [2], [#num("- 0.061 361 11")], [1.87], [1.0],
    [3], [#num("- 0.002 650 473")], [2.5], [2.0],
    [4], [#num("0.002 731 125")], [2.8], [2.0],
    [5], [#num("0.001 802 374")], [2.938], [2.42],
    [6], [#num("- 0.001 150 707")], [3.14], [2.63],
    [7], [#num("0.958 852 8 e-4")], [3.37], [3.0],
    [8], [#num("- 0.110 904 0 e-6")], [3.75], [4.0],
    [9], [#num("0.126 440 3 e-9")], [4.0], [5.0],
  ),
  kind: table,
  caption: [Constants $a_i, b_i, c_i$ used in the @eq_6 for approximating the compressibility factor $Z$ of hydrogen as a real gas @Lemmon2008.],
)<tab_19>                         

The difference between ideal and real gas for selected different temperatures, over a pressure range of $ 0 upright("bar") upright("to") 700 upright("bar")$ 
compressed hydrogen and over the real gas factors is depicted in @fig_17. It is clearly evident that the deviation between ideal and real gas behavior becomes more pronounced with increasing pressure. Additionally, the temperature influence between 
$ 50 upright("K ") upright("and") 100 upright("K ")$ exhibits strongly nonlinear behavior. These observations highlight the importance of considering real gas effects when dealing with hydrogen at high pressures and varying temperatures.


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/0_Intro/2_Divergenec_Real_Ideal.png", 
  width: 77%),
  caption: [Deviation of hydrogen's real gas behavior from ideal gas behavior, illustrated through the real gas factor $Z$ across various pressures and temperatures @Klell2018.],
) <fig_17>


For this study, a custom tool was developed to generate insights into the real gas factor and real density over a desired range of pressure and temperature. This tool becomes particularly relevant when incorporating fuel mass into simulation models, such as finite element models. It provides an interactive 3D view that enables detailed examination of specific temperature-pressure combinations, enhancing the understanding of how these variables affect hydrogen density. An example of this tool is showcased in @fig_18. Readers interested in conducting their own analyses can access an interactive view online #footnote[https://jav-ed.github.io/H2O_Plot/]<fn_0>. Additionally, the source code is available on GitHub #footnote[https://github.com/jav-ed/H2O_Plot], allowing users to customize parameters such as the resolution.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/0_Intro/3_H2_Plotly.png", 
  width: 100%),
  caption: [Excerpt shows a screenshot of an interactive tool developed for considering density and real gas factors of the ideal and real gas for hydrogen @fn_0.],
) <fig_18>



#summary_([
This section has presented an overview of the fundamental properties of hydrogen. While the safety aspects will be addressed in @chap_2_0_1, the properties examined thus far demonstrate hydrogen's predominantly positive characteristics as an energy carrier. However, one notable limitation is hydrogen's invisibility to the human eye due to its small molecular size, which could pose challenges for detection and measurement.
The relationship between hydrogen's high theoretical gravimetric energy density and its practical energy density in real-world storage systems has been elucidated. This comparison highlights the challenges and potential of hydrogen as a fuel source.
Furthermore, analytical functions for calculating hydrogen mass from density and volume across various pressure and temperature ranges have been explored. 
These functions, accounting for real gas behavior, are crucial for accurate modeling and simulation of hydrogen storage and use in applications such as #gl_("swith", pl:true).
The custom analysis tool presented can provide valuable insights into hydrogen's behavior under various pressure and temperature conditions, supporting ongoing #gl_("swith")-related investigations.
])