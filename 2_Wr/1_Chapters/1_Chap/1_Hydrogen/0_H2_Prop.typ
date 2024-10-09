/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

//TODO
// the intro for the section needs to be checked again
== Introductory Properties of Hydrogen <chap_2_0>

The testing of wings with hydrogen tanks is a significant novelty aspect in K2H2, which is why the basic properties of hydrogen should be discussed. Safety-relevant hydrogen properties will be addressed in a separate following section and evaluated for K2H2.

Table 22 lists the first important and safety-wise harmless properties of hydrogen.

[Table 22: Basic and harmless properties of hydrogen]

1) The smallest known atom is the hydrogen atom (H, diameter of 0.07 nm @Klell2018 @Klell2023).
2) Only occurs as an H2 molecule, as the H atom itself is highly reactive. A lot of energy is needed to obtain a pure, unpaired H atom.
3) When hydrogen is mentioned, usually the H2 molecule is meant.
4) H2 forms a stable bond, which means that both valence electrons are filled and thus show low reactivity.
   In general, the ability to attract electrons from other elements and thus initiate a chemical bond is described by electronegativity. This is lower for H2 than for most other elements (electronegativity of H2 = 2.2 @Klell2018 @Klell2023).
5) Odorless
6) Tasteless
7) Invisible
8) Non-toxic
9) Non-carcinogenic
10) Not radioactive
11) Not corrosive
12) Regenerative hydrogen production possible through water, wind or solar power plants. Regenerative production is feasible without competing with food production (occupation of cultivation area) as is known from plant-based biofuels @Rosen2018.
13) Joule-Thompson coefficient negative at high pressures. This means a positive pressure change produces a negative temperature change and vice versa. When the pressure is increased, this is shown in the form of temperature decrease. The values are only a few Kelvin (about 5-15 Kelvin) even at high pressure changes.
    μJT = δT/δp
    For ideal gases, the Joule-Thompson coefficient = 0 @Klell2018 @Klell2023.
14) Apart from the Joule-Thompson coefficient, it also does not behave like an ideal gas in other aspects (further elaboration follows below).
15) Hydrogen is the element with the lowest density and is about 14 times lighter than air, although pressure and temperature influence this statement. @Klell2018 @Klell2023.
16) The regulations and standards for handling are available and storage is just as safe as that of natural gas (CNG) [13, 14, 15]
17) More than plentiful, also in air.
18) Most fossil fuels consist of carbon and hydrogen: Methane CH4, Methanol CH3OH, Ethene C2H, Propane C3H8, Benzene C6H6 @Klell2018 @Klell2023.
19) Available in three possible states: solid, liquid and gaseous.
20) A very high speed of sound under normal conditions 0 °C and 1.01325 bar
    aH2 = 1261.1 m/s, cf. aAir = 331.5 m/s

In point 14 in Table 22, it is merely stated that hydrogen does not behave like an ideal gas. To discuss this in more detail, the real gas factor Z should first be introduced. It is also called the compressibility factor and is given in equation (4). Here, the variable m describes the mass of the respective gas. The real gas factor describes the deviation of a gas from the ideal gas.

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