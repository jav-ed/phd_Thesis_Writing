/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */
=== II.10 Safety-Relevant Properties of Hydrogen

This section will explain why the choice of filling medium for the experimental project in K2H2 is of great importance. To this end, the safety-relevant properties of hydrogen will be particularly addressed.

Tables 19 and 20 list mandatory and possibly optional tests. These must be demonstrated if high-pressure cylinders are to be certified for approval. ISO 11119-3 states in paragraph 8.5.1.1: "When carrying out the pressure test, a suitable fluid shall be used as the test medium. This can include liquids such as water or oil and gases such as air or nitrogen)". Consequently, different filling media are allowed for the pressure approval test. For the permeability test (5.5.12.2), natural gas is also allowed. However, for the pneumatic cycle test (5.5.16.1), only hydrogen is allowed as the filling medium. Summarizing these findings, it can be said that only certain experimental tests allow filling media other than hydrogen. In the context of K2H2, filling medium refers to the medium that is stored in the wing tanks and pressurized. Why the medium with which the tanks are filled and pressurized in the experimental test is of essential importance for the entire testing project becomes understandable when the keywords from Table 23 are discussed.

[Table 23: Example influencing factors in the choice of filling medium for an experimental structural test]

Influence on structural properties, such as:
1) Maximum bearable bending moment
2) Maximum strain
3) Tensile strength
4) Torsional stiffness
5) E-modulus
6) Impact strength

Influence on human health:
1) Carcinogenic
2) Flammable
3) Explosive
4) Odor → attacks nasal mucosa
5) Radioactive

Manageability in measurement technology:
1) Visible
2) Smellable
3) Tangible
4) Electric and magnetic fields
5) Other methods for detecting the medium

Safety for test stand:
1) Material compatibility (no chemical reactions with test stand structure)

Availability

Environmental compatibility

Economic efficiency

To answer the question of whether the filling medium has an influence on the experimental structural verification in a striking manner: It makes a difference whether a medium merely smells bad under certain conditions or shows detonable capabilities. The latter represents the motivation to use the possibilities offered by the standards, instead of wanting to test exclusively with hydrogen. In the following, the complications that can arise through hydrogen should be derived. For this, some knowledge and definitions are important [17]:

• Deflagration: Flame front propagates at a speed less than the speed of sound.
• Detonation: With further acceleration of the flame front, supersonic speed is reached and pressure surges are to be expected. In the vicinity of such, hearing protection is absolutely necessary.
• Explosion: Rapid, almost sudden combustion of combustibles, better explosives. The large volume of combustion gas produced displaces the surrounding air with great intensity.

Figure 8 shows what combustion speeds and associated pressure increases are to be expected for the different combustion processes. Figure 9 can now be used to estimate how high the destructive power is at the given pressure increases.

[Figure 8: Types of combustion with guideline values [17]]

[Figure 9: Pressure effects (guideline values) [17]]

The essential question that arises regarding hydrogen is whether hydrogen can burn, deflagrate, explode, or even detonate? Hydrogen alone is not inherently flammable. Only in combination with the two other important factors given in Table 24 can hydrogen become flammable to detonable. The minimum ignition energy depends on the air content. But in principle, a small spark or static discharge is sufficient to ignite hydrogen in the right gas mixture. A static discharge, such as that caused by friction with a carpet and subsequent touching of a doorknob, is sufficient (20-30 mJ) to ignite the ignitable gas composition. Figure 10 shows the minimum required ignition energy for hydrogen and methane at different air contents of the gas mixture. It can be noted that the mentioned 20 mJ, which result from a static discharge, are more than sufficient to start ignition with the appropriate hydrogen-air composition. When comparing the behavior of hydrogen and methane, the following also becomes clear. Hydrogen not only requires smaller amounts of ignition energies than methane, but is also highly flammable in a significantly larger range.

[Table 24: Requirements for hydrogen to become flammable to detonable]

1) Sufficiently high ignition energy or ignition temperature
2) Combustible/detonable gas mixture
3) Special cases chlorine and fluorine

[Figure 10: Simplified representation of the ignition energies under normal conditions of hydrogen and methane in air [13]]

For further important considerations, two technical terms should be defined:

1) The flash point of a flammable liquid is the lowest liquid temperature at which, under specified conditions, vapors develop in such quantity that an ignitable vapor/air mixture is formed above the liquid surface by external ignition. If the ignition source is removed, the flames extinguish [12].

2) The ignition temperature is the lowest temperature at which spontaneous ignition of the fuel occurs in an open vessel [12].

In both cases, ignition can only occur if a certain proportion of air is present. Figure 11 provides important information on the ignition or explosion behavior of hydrogen and other fuels. The ignition temperature of hydrogen is quite high compared to other gases. However, the large spectrum in which a hydrogen-air mixture is flammable is also comparatively large. This might be acceptable through various safety measures. However, hydrogen has the lowest minimum ignition energy, which poses the greatest safety challenge for preventing unwanted and accidental ignitions.

[Figure 11: Ignition-relevant properties of hydrogen and various other fuels [12]]

Hydrogen itself is not visible to the naked eye. Experimental investigations in [18] show recordings of hydrogen flames. A copy is given in Figure 12. The recording was made for a laminar jet velocity of 47 m/s, a Reynolds number of 837, with the Sony DSC D700 (1344 × 1024 pixels), with an f/2.4 aperture and without filter. Often it is thought that hydrogen flames are also not visible. However, Figure 12 shows that this is not the case. The flame is visible, although not as strongly visible as hydrocarbons when ignited. The influence of the oxygen content in the oxygen-hydrogen mixture is shown in Figure 13. Here, the equivalence ratio φ is the ratio between the oxygen content in the supplied oxidizing agent and the oxygen content required for complete stoichiometric combustion. In other words, φ = 1 means best combustibility and values smaller stand for poorer ignitability. The results show that the higher φ is, the better the visibility of the flame becomes. The boundary conditions that led to this recording can be found in the figure description. In [18] it is concluded that for good visibility, low lighting should be provided.

[Figure 12: Recording of a hydrogen flame at a laminar jet velocity of 47 m/s, a Reynolds number of 837. The image was taken without filter, with the Sony DSC D700 with an aperture of f/2.4.]

[Figure 13: Influence of oxygen content. The higher φ becomes, the better the approximation to stoichiometric combustion properties (a) φ = 1.0, (b) φ = 0.8, (c) φ = 0.7, (d) φ = 0.62, jet velocity of 33 m/s, Reynolds number of 580, aperture f/2.4, turbulent]

Figure 14 provides detailed information on hydrogen-air mixing limits for different types of ignition and names other important parameters in this context. However, it should be explicitly noted that under normal conditions (0 °C, 1.01325 bar) hydrogen is flammable at an air content of [4; 75.6]% and detonable at an air content of [18; 58.9]%. Apart from the air content, two special cases were mentioned in Table 24 [12].

1) Hydrogen and chlorine can already carry out a reaction just by light irradiation. This is perceived as a loud and explosive bang (chlorine-oxyhydrogen reaction).
2) Hydrogen reacts similarly explosively with fluorine.

Another important point that is relevant when handling hydrogen is hydrogen-material compatibility. Hydrogen can accumulate in metal lattices and cause embrittlement. This behavior is not observed in plastics. On the other hand, this effect can be used to obtain highly pure hydrogen with metals. Here, the metal lattice is used as a filter. The hydrogen molecules are so small that they can easily diffuse through less dense materials. Plastics are an example of materials with lower density. While there is no danger of metal embrittlement with plastics, holding hydrogen in a plastic container is significantly more difficult. In the worst case, this would mean that a filled tank would empty in a very short time because the hydrogen cannot be held in the pressure vessel. If this container were surrounded by another closed space, the hydrogen would now be present in this space. Specifically, a car garage should be mentioned. If the hydrogen could accumulate in it and the residents don't know about it, it could possibly lead to life-threatening burns. It follows that the two properties that should be given the highest attention are the flammability and the diffusion behavior of hydrogen.

[Figure 14: Hydrogen-air mixing limits for different types of ignition, as well as other important values in this context [12]]

In summary, it can be said that hydrogen is not flammable without the addition of air. However, on the one hand, there is a large air-hydrogen mixture range in which ignition is possible. On the other hand, the smallest static discharges are sufficient to transfer this gas mixture to ignition up to detonation. Apart from the risk of explosion, the diffusion behavior of hydrogen is of central importance. Hydrogen can be better held in the container with metals than with plastic enclosures. But with metals, there is a danger of hydrogen embrittlement.