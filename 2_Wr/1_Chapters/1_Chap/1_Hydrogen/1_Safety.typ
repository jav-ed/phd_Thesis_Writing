/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


=== Safety-Relevant Properties of Hydrogen<chap_2_0_1>

In previous @chap_2_0_0 a high number of hydrogens properties were provided.
Among others it was explained in detail why hydrogen is so attracive as energy carreier.
Yet, when targeting the experimental structral validation tests of #gl_("swith", pl:true) towrds final certifaciton the hazard properties of hydrogen are improtant to know.
Thus the aim for this subseciton is to explain potential dangerous properties of hydrogen.
They shall be mentioned and explained whether they can be safely navigated in epxeirmtnal applicaiton or not.


In @chap_1_0 much work was carried out to find systematically the standrds that might have a #gl_("swith") relationship.
These standrds were furhter filtered to find the essential standrds in @chap_1_0_6.
The essential standrds, while not being developed for #gl_("swith")-cerrifcation, they, still provide some possible tests, scinetists can expect. In @tab_12 the mandatory and in @tab_13 the optional structral tests according to the 11119-3:2020 @11119_3_ISO are listed.
These must be demonstrated if high-pressure cylinders are to be certified for approval. ISO 11119-3 states in paragraph 8.5.1.1: #emp_[When carrying out the pressure test, a suitable fluid shall be used as the test medium. This can include liquids such as water or oil and gases such as air or nitrogen]. 
Consequently, different filling media are allowed for the pressure approval test.
In the context of #gl_("swith"), filling medium refers to the medium that is stored in the wing tanks and pressurized. 
For the permeability test (5.5.12.2), natural gas is also allowed. 
However, for the pneumatic cycle test (5.5.16.1), only hydrogen is allowed as the filling medium. Summarizing these findings, it can be said that only certain experimental tests allow filling media other than hydrogen. 
The importance of the  medium with which the tanks are filled and pressurized in the experimental test  becomes evident when the keywords from @tab_20 are viewed.


#figure(
  table(
    columns: (1fr),
    align: (col, row) => if calc.even(row) { center + horizon } else { left + horizon },
    fill: (_, row) => if calc.even(row) { table_cl_header } else { table_cl_0  },
    inset: (
      x: 1em,
      y: 0.7em,
    ),
    stroke: none,
    
    [*Influence on Structural Properties*],
    [
      - Maximum tolerable bending moment
      - Maximum elongation
      - Tensile strength
      - Torsional stiffness
      - Young's modulus
      - Impact strength
    ],
    
    [*Influence on Human Health*],
    [
      - Carcinogenic 
      - Flammable
      - Explosive
      - Odor (affects nasal mucosa)
      - Radioactive
    ],
    
    [*Influence on Measurement*],
    [
      - Visible
      - Detectable by smell
      - Tangible
      - Responsive to electric and magnetic fields
      - Other sensory detection methods
    ],
    
    [*Safety for Test Bench*],
    [
      - Material compatibility (absence of chemical reactions with test bench structure)
    ],
    
    [*Availability, Environmental Impact, Economic Efficiency*],
  ),
  kind: table,
  caption: [Examples of factors influencing the choice of filling medium in an experimental and simulative structure test for #gl_("swith", pl:true)],
) <tab_20>

The points provided in @tab_20 further  strngthen the demand of deeply understanding the medium that is used. For hydrogen the properties mentioned in @chap_1_0_6  are requied to conduct in-depth investigations on special aspects.
Gnereally when working with different filling agent, for the safety asecpt the following can be said in a striking manner: It makes a difference whether a medium merely smells bad under certain conditions or shows detonable capabilities. 
In the following, the complications that can arise through hydrogen should be derived. For this, some knowledge and definitions are important @Sigloch2022:

• Deflagration: Flame front propagates at a speed less than the speed of sound.
• Explosion: Rapid, almost immediate combustion of combustibles, or more specifically, ex-
plosives. The resulting large volume of combustion gas intensely displaces the surrounding
air.
• Detonation: Combustion process taking place at supersonic speed under strong pressure
increase and pressure shocks are anticipated. Hearing protection is mandatory in such prox-
imity.

@tab_21 shows what combustion speeds and associated pressure increases are to be expected for the different combustion processes. @tab_22 can now be used to estimate how high the destructive power is at the given pressure increases.


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
  caption: [Pressure effects (guide values) @Sigloch2022.],
) <tab_22>


The essential question that arises regarding hydrogen is whether hydrogen can burn, deflagrate, explode, or even detonate? 
Hydrogen alone is not inherently flammable @Klell2018 @Cheikhravat2012 @Crowl2007 @Sanchez2014 @Zhang2022. 
Only in combination with the two other important factors given in Table 24 can hydrogen become flammable to detonable. 

// ---------------------------------- here ---------------------------------- //
[Table 24: Requirements for hydrogen to become flammable to detonable]

1) Sufficiently high ignition energy or ignition temperature
2) Combustible/detonable gas mixture
3) Special cases chlorine and fluorine
  

The minimum ignition energy depends on the air content. But in principle, a small spark or static discharge is sufficient to ignite hydrogen in the right gas mixture. A static discharge, such as that caused by friction with a carpet and subsequent touching of a doorknob, is sufficient (20-30 mJ) to ignite the ignitable gas composition. Figure 10 shows the minimum required ignition energy for hydrogen and methane at different air contents of the gas mixture. It can be noted that the mentioned 20 mJ, which result from a static discharge, are more than sufficient to start ignition with the appropriate hydrogen-air composition. When comparing the behavior of hydrogen and methane, the following also becomes clear. Hydrogen not only requires smaller amounts of ignition energies than methane, but is also highly flammable in a significantly larger range.



[Figure 10: Simplified representation of the ignition energies under normal conditions of hydrogen and methane in air @Rosen2018]

For further important considerations, two technical terms should be defined:

1) The flash point of a flammable liquid is the lowest liquid temperature at which, under specified conditions, vapors develop in such quantity that an ignitable vapor/air mixture is formed above the liquid surface by external ignition. If the ignition source is removed, the flames extinguish @Klell2018 @Klell2023.

2) The ignition temperature is the lowest temperature at which spontaneous ignition of the fuel occurs in an open vessel @Klell2018 @Klell2023.

In both cases, ignition can only occur if a certain proportion of air is present. Figure 11 provides important information on the ignition or explosion behavior of hydrogen and other fuels. The ignition temperature of hydrogen is quite high compared to other gases. However, the large spectrum in which a hydrogen-air mixture is flammable is also comparatively large. This might be acceptable through various safety measures. However, hydrogen has the lowest minimum ignition energy, which poses the greatest safety challenge for preventing unwanted and accidental ignitions.

[Figure 11: Ignition-relevant properties of hydrogen and various other fuels @Klell2018 @Klell2023]

Hydrogen itself is not visible to the naked eye. Experimental investigations in @schefer2009visible show recordings of hydrogen flames. A copy is given in Figure 12. The recording was made for a laminar jet velocity of 47 m/s, a Reynolds number of 837, with the Sony DSC D700 (1344 × 1024 pixels), with an f/2.4 aperture and without filter. Often it is thought that hydrogen flames are also not visible. However, Figure 12 shows that this is not the case. The flame is visible, although not as strongly visible as hydrocarbons when ignited. The influence of the oxygen content in the oxygen-hydrogen mixture is shown in Figure 13. Here, the equivalence ratio φ is the ratio between the oxygen content in the supplied oxidizing agent and the oxygen content required for complete stoichiometric combustion. In other words, φ = 1 means best combustibility and values smaller stand for poorer ignitability. The results show that the higher φ is, the better the visibility of the flame becomes. The boundary conditions that led to this recording can be found in the figure description. In @schefer2009visible it is concluded that for good visibility, low lighting should be provided.

[Figure 12: Recording of a hydrogen flame at a laminar jet velocity of 47 m/s, a Reynolds number of 837. The image was taken without filter, with the Sony DSC D700 with an aperture of f/2.4.]

[Figure 13: Influence of oxygen content. The higher φ becomes, the better the approximation to stoichiometric combustion properties (a) φ = 1.0, (b) φ = 0.8, (c) φ = 0.7, (d) φ = 0.62, jet velocity of 33 m/s, Reynolds number of 580, aperture f/2.4, turbulent]

Figure 14 provides detailed information on hydrogen-air mixing limits for different types of ignition and names other important parameters in this context. However, it should be explicitly noted that under normal conditions (0 °C, 1.01325 bar) hydrogen is flammable at an air content of [4; 75.6]% and detonable at an air content of [18; 58.9]%. Apart from the air content, two special cases were mentioned in Table 24 @Klell2018 @Klell2023.

1) Hydrogen and chlorine can already carry out a reaction just by light irradiation. This is perceived as a loud and explosive bang (chlorine-oxyhydrogen reaction).
2) Hydrogen reacts similarly explosively with fluorine.

Another important point that is relevant when handling hydrogen is hydrogen-material compatibility. Hydrogen can accumulate in metal lattices and cause embrittlement. This behavior is not observed in plastics. On the other hand, this effect can be used to obtain highly pure hydrogen with metals. Here, the metal lattice is used as a filter. The hydrogen molecules are so small that they can easily diffuse through less dense materials. Plastics are an example of materials with lower density. While there is no danger of metal embrittlement with plastics, holding hydrogen in a plastic container is significantly more difficult. In the worst case, this would mean that a filled tank would empty in a very short time because the hydrogen cannot be held in the pressure vessel. If this container were surrounded by another closed space, the hydrogen would now be present in this space. Specifically, a car garage should be mentioned. If the hydrogen could accumulate in it and the residents don't know about it, it could possibly lead to life-threatening burns. It follows that the two properties that should be given the highest attention are the flammability and the diffusion behavior of hydrogen.

[Figure 14: Hydrogen-air mixing limits for different types of ignition, as well as other important values in this context @Klell2018 @Klell2023]

In summary, it can be said that hydrogen is not flammable without the addition of air. However, on the one hand, there is a large air-hydrogen mixture range in which ignition is possible. On the other hand, the smallest static discharges are sufficient to transfer this gas mixture to ignition up to detonation. Apart from the risk of explosion, the diffusion behavior of hydrogen is of central importance. Hydrogen can be better held in the container with metals than with plastic enclosures. But with metals, there is a danger of hydrogen embrittlement.



// -------------------------------------------------------------------------- //
// The latter represents the motivation to use the possibilities offered by the standards, instead of wanting to test exclusively with hydrogen. 