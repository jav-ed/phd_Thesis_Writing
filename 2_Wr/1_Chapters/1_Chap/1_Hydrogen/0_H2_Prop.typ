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
The study of fundamental hydrogen properties will be initially motivated, followed by a detailed analysis in @chap_2_0_0. Subsequently, special attention is given to the safety-relevant characteristics of #gl_("cgh2",long:true) in @chap_2_0_1. Following this, @chap_2_0_2 addresses experiments and simulations involving hydrogen. Finally, given that #gl_("swith",pl:true)  involves tanks bearing external loads @chap_2_0_3 highlights important findings regarding external dynamic loads on pressure vessels.



=== Introductory Properties of Hydrogen <chap_2_0_0>
The goal of performing structural validation tests gerared towards #gl_("swith") certifcaiton is a novel desire due to multiple reasons as outlines in many places in this thesis. 
However, within this subsection the focus shall be put espeically on the hydorgen aspect.
Desiring to conduct structral tests with compressed hydrogen initally requires both basic knowledge and in-depth invesitgaiton on some special security related properties about hydorgen.
This subsection deals with some of the basic properties of hydrogen, making it evident why hydrogen is such an attractive alternative to current fossil fuels.
The potential hazards that can be encountered with hydrogen in practical application are highlighted in @chap_2_0_1.
Initally, a clear motivation for needing to understand the basic properties of hydrogen needs to be extended.
Having done so, the fundamental properties shall be given in a clear and structred manner.

The integration of compressed hydrogen in #gl_("swith", pl:true) represents a pioneering approach in aircraft design, directly addressing at least two of the major challenges in sustainable aviation: fuel storage and structural efficiency. 
However, due to the nature of innovative concepts, there is a scarcity of work around their topics.
While less available work on the one hand can pose challenges, it also underscores the need for putting effort in its research.
The necessity to properly understand  hydrogen's properties can be backed by the following.
First, such understanding is essential for comprehending why hydrogen exhibits remarkable properties, making it a promising alternative fuel option.
Next it also guides for the successful design, manufacturing, and final commercial certification of #gl_("swith", pl:true). 
More concretely, this knowledge is pivotal when designing and performing both experimental structural tests and simulations of #gl_("swith", pl:true). Experiments as well as simulation are not only important for potential future certification but also for general science-related desires to enhance the understanding of #gl_("swith", pl:true).
For the sake of convenience, all principal and safety-wise harmless information of this subsection is compiled and presented in @tab_18.

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
    [Smallest known atom (H, diameter of 0.07 nm) @Klell2018 @Klell2023],

    [Molecular Form], 
    [- Occurs as H#sub[2] molecule @Klell2018 @Klell2023 
    - The H atom itself is highly reactive @Liu2022 @Tarkowski2022 @Li2021b
    - Generally, if people mention hydrogen, they mean the molecule H#sub[2] and not the atom H],
  
    [Chemical Properties], 
    [- The atom H forms stable bond with another H atom, such that H#sub[2] is created. A stable bond means that both valence electrons are filled and thus a H#sub[2] bond has low reactivity @Kubas2007
- The H atom has a low electronegativity of 2.2 @Klell2018 @Klell2023. The electronegativity described the ability to pull electrons to create a connection.],
    
    [Sensory Properties], 
    [- Odorless @Hwang2023 @MadadiAvargani2022 @Pal2022
- Tasteless @MadadiAvargani2022
- Invisible @Hwang2023 @MadadiAvargani2022 @Pal2022],
    
    [Safety Properties], [
        - Non-toxic @Tang2023 @MadadiAvargani2022 @Jokar2023
        - Non-carcinogenic @Klell2018 @Klell2023
        - Not radioactive @Klell2023
        - Not caustic @Klell2018 @Klell2023],
    
    [Production], [Regenerative production possible through water, wind or solar power plants @Rosen2018],
    
    [Thermodynamic Properties], 
    [- Negative Joule-Thompson coefficient @Li2023a @Zhang2024b @Li2023b at high pressures.
    This means that a positive pressure change produces a negative temperature change and vice versa. If the pressure is increased, this is reflected in a decrease in temperature. This relaiton can be described mathemtically with @eq_4, where T stands for the temperature, p for the pressure, and $delta$ shall signalize a derivative or change of the Temperature when the pressure is changed.

    $ mu_upright("JT") = (delta T) / (delta p) $<eq_4>

- Deviates from ideal gas behavior],
    
    [Physical Properties], 
    [- Lowest density element (about 14 times lighter than air) @Klell2018 @Klell2023)
- Mainly available in liquid, and gaseous states. 
- However, there is much research on other forms as well @Usman2022 @Yang2023 @Panigrahi2024: physical and chemical adsorption @Drawer2024 @Nivedhitha2024 @Boateng2023, supercritical or cryo-compressed storage @Yan2024 @Aceves2010 @Jaramillo2024 and some others as depicted in @fig_15.
- At $0 degree.c$ and $1.01325 upright("bar")$ hydrogen has a high speed of sound $a_upright("H2") = 1261.1 upright("m/s")$  @Klell2018, where air only has $a_upright("air") = 331.5 upright("m/s")$ @Sigloch2022.],
    
    [Abundance], 
    [- Plentiful, including in air @Pal2022 @Faye2022 @Klopcic2023 @MadadiAvargani2022 @Jokar2023 @Hassan2023
- Component of many fossil fuels: Methan CH#sub[4], Methanol CH#sub[3]OH, Ethen C#sub[2]H#sub[4], Propan C#sub[3]H#sub[8], Benzene C#sub[6]H#sub[6] @Klell2018],
    
    [Regulations], 
    [Safe handling and storage standards available, comparable to natural gas @Klell2018 @Klell2023 @Rosen2018 @dryer2007spontaneous @Thomas1997],
  ),

  kind: table,
  caption: [Basic and harmless properties of hydrogen.],
)<tab_18>



#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/0_Intro/0_Types.jpg", 
  width: 77%),
  caption: [Illustrative example of different methods to store hydrogen @Usman2022.],
) <fig_15>




In point 14 in @tab_18, it is merely stated that hydrogen does not behave like an ideal gas. To discuss this in more detail, the real gas factor Z should first be introduced. It is also called the compressibility factor and is given in equation (4). Here, the variable m describes the mass of the respective gas. The real gas factor describes the deviation of a gas from the ideal gas.

Z = mideal / mreal (4)

If the value Z = 1, then there is no difference between real and ideal gas. If Z > 1, this means that the ideal gas equation would assume too large a mass and vice versa for Z < 1. The real gas factors are usually determined empirically and made available as analytical equations or terms obtained through regression. An example of this for hydrogen is given in @lemmon2006standardized by equation (5) and the associated constants in Figure 5. The equation shows that the first expression is the known ideal gas equation. Only the terms that are added to the ideal gas equation represent the regression and the modification by the real gas factor. Furthermore, it is apparent that the real gas factor depends on pressure and temperature.

Z(p,T) = p / (ρ R T) = 1 + Σ ai (100 K / T)^bi (p / 1 MPa)^ci  (5)
                                i=1

[Figure 5: Constants for approximating the real gas behavior of hydrogen @lemmon2006standardized]

Figure 6 shows the difference between ideal and real gas for selected different temperatures, over a pressure range of 0-700 bar compressed hydrogen and over the real gas factors. It is clearly recognizable that predominantly with increasing pressure, the deviation between ideal and real gas becomes larger. Furthermore, it can be noted that the temperature influence between 50 K and 100 K exhibits strongly nonlinear behavior.

[Figure 6: Comparison of hydrogen behavior to the ideal gas over the real gas factor]

For K2H2, a separate tool was written to obtain statements on the real gas factor and real density for desired pressure and temperature spectra. The density is important insofar as the fuel mass is applied as a weight load in the simulation model. Since the tool offers an interactive 3D view, desired temperature-pressure combinations can be viewed in detail. The latter generally helps to gain a better basic understanding of the influence of pressure and temperature on the density of hydrogen. An exemplary screenshot of the mentioned tool is given in Figure 7.

[Figure 7: Excerpt shows a screenshot of an interactive tool specifically developed for considering density and real gas factors of the ideal and real gas for hydrogen]

In summary, it can be said that initial important properties of hydrogen could be cited. The safety aspects have not yet been addressed, therefore hydrogen exhibits predominantly highly positive properties up to the current state of knowledge. One point of criticism would be that hydrogen, due to its small size, is on the one hand not visible to the human eye. On the other hand, it can be difficult to measure hydrogen metrologically. Furthermore, analytical functions were discussed with which the hydrogen mass can be calculated from the density and given volume for various pressure and temperature ranges.