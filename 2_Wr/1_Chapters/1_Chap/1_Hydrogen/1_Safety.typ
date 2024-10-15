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
    align: (col, row) => { left + horizon },
    fill: (_, row) => if calc.even(row) { table_cl_header } else { table_cl_0  },
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
    
    table.cell(fill:table_cl_header,[*Influence on Human Health*]),
      table.cell(fill:table_cl_0,[- Carcinogenic ]),
      table.cell(fill:table_cl_1,[- Flammable]),
      table.cell(fill:table_cl_0,[- Explosive]),
      table.cell(fill:table_cl_1,[- Odor (affects nasal mucosa)]),
      table.cell(fill:table_cl_0,[- Radioactive]),
    
    table.cell(fill:table_cl_header,[*Influence on Measurement*]),
    
       table.cell(fill:table_cl_0,[- Visible]),
       table.cell(fill:table_cl_1,[- Detectable by smell]),
       table.cell(fill:table_cl_0,[- Tangible]),
       table.cell(fill:table_cl_1,[- Responsive to electric and magnetic fields]),
       table.cell(fill:table_cl_0,[- Other sensory detection methods]),
    
    
    table.cell(fill:table_cl_header,[*Safety for Test Bench*]),
    table.cell(fill:table_cl_0,[- Material compatibility (absence of chemical reactions with test bench structure)]),
  
    
    table.cell(fill:table_cl_header,[*Availability, Environmental Impact, Economic Efficiency*]),
  ),
  kind: table,
  caption: [Examples of factors influencing the choice of filling medium in an experimental and simulative structure test for #gl_("swith", pl:true)],
) <tab_20>

The points provided in @tab_20 further  strngthen the demand of deeply understanding the medium that is used. For hydrogen the properties mentioned in @chap_1_0_6  are requied to conduct in-depth investigations on special aspects.
Gnereally when working with different filling agent, for the safety asecpt the following can be said in a striking manner: It makes a difference whether a medium merely smells bad under certain conditions or shows detonable capabilities. 
In the following, the complications that can arise through hydrogen should be derived. For this, some knowledge and definitions are important @Sigloch2022:

1. *Deflagration*: Flame front propagates at a speed less than the speed of sound.
   
2. *Explosion*: Rapid, almost immediate combustion of combustibles, or more specifically, explosives. The resulting large volume of combustion gas intensely displaces the surrounding air.
   
3. *Detonation*: Combustion process taking place at supersonic speed under strong pressure increase and pressure shocks are anticipated. Hearing protection is mandatory in such proximity.

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

// --------------------------- prssure destruction -------------------------- //
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
Only in combination with the two other important factors given in @tab_23 can hydrogen become flammable to detonable. 

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
    
    [1. Adequate ignition energy or ignition temperature @Bane2013 @Dimitriou2017 @FernandezTarrazo2023],
    [ 2. Flammable/detonable gas mixture  @Cheikhravat2012 @Crowl2007 @Yang2021 @Gao2016 @Zhang2016],
    [ 3. Special cases: chlorine and fluorine @Klell2018 @Klell2023 @Sullivan1975 @Gustin2005],
  ),
  kind: table,
  caption: [Conditions for Hydrogen to become ignitable to detonable.],
) <tab_23>

  
The minimum ignition energy depends on the air content. But in principle, a small spark or static discharge is sufficient to ignite hydrogen in the right gas mixture. 
A static discharge, such as that caused by friction with a carpet and subsequent touching of a doorknob, is sufficient ($20 "to" 30 "mJ"$) to ignite the ignitable gas composition @Klell2018. 
Minimum ignition energies for hydrogen, methane and propane at different air contents of the gas mixture are displayed in @fig_19. 

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/1_Safety/0_Ingition_Energy.png", 
  width: 87%),
  caption: [Simplified representation of the ignition energies under norstandardmal conditions of hydrogen, methane and propane in air @Klell2018.],
) <fig_19>

Vieweing @fig_19, ut can be noted that the mentioned $20 "mJ"$, which result from a static discharge, are more than sufficient to start ignition with the appropriate hydrogen-air composition. 
When comparing the behavior of hydrogen with the two other gases, that is, methane and propane, the following also becomes clear. 
Hydrogen not only requires smaller amounts of ignition energies than methane, but is also highly flammable in a significantly larger range.

For further important considerations, two technical terms should be defined:

- *The flash point* of a flammable liquid is the lowest liquid temperature at which, under specified conditions, vapors develop in such quantity that an ignitable vapor/air mixture is formed above the liquid surface by external ignition. If the ignition source is removed, the flames extinguish @Klell2018 @Klell2023.

- *The ignition temperature* is the lowest temperature at which spontaneous ignition of the fuel occurs in an open vessel @Klell2018 @Klell2023.

In both cases, ignition can only occur if a certain proportion of air is present. Important information on the ignition or explosion behavior of hydrogen and other fuels are listed in @tab_24. 

#figure(
table(
columns: (auto, auto, auto, auto, auto, auto),
align: (col, row) => if row == 0 or row == 1 { center + horizon } else { center + horizon },
fill: (col, row) => if row <= 1 {table_cl_header} else {(table_cl_1, table_cl_0).at(calc.rem(row, 2))},
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
caption: [ Ignition-relevant properties of hydrogen and various other fuels @Klell2023. Notation: (l) stands for liquid, otherwise gaseous ],
)<tab_24>

Considering @tab_24 it can be observed that the  ignition temperature of hydrogen is quite high compared to other gases. 
However, the large spectrum in which a hydrogen-air mixture is flammable is also comparatively large. 
This might be acceptable through various safety measures. 
However, hydrogen has the lowest minimum ignition energy from the shown other fuels in @tab_24. This poses the greatest safety challenge for preventing unwanted and accidental ignitions.
Moreover, hydrogen itself is not visible to the naked eye. Experimental investigations in @schefer2009visible show recordings of hydrogen flames. 
A copy of the visual depiciton is given in @fig_20. 

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/1_Safety/1_H2_Flame.png", 
  // keep the 10% here. seems to be a very high dimensional image
  width: 10%),
  caption: [Recording of a hydrogen flame at a laminar jet velocity of 47 m/s, a Reynolds number of 837. The image was taken without filter, with the Sony DSC D700 with an aperture of f/2.4 @schefer2009visible.],
) <fig_20>


The recording in @fig_20 was made for a laminar jet velocity of 47 m/s, a Reynolds number of 837, with the Sony DSC D700 (1344 × 1024 pixels), with an f/2.4 aperture and without filter. 
Often it is thought that hydrogen flames are also not visible. 
However, @fig_20 shows that this is not the case @schefer2009visible. 
The flame is visible, although not as strongly visible as hydrocarbons when ignited @schefer2009visible. 
The influence of the oxygen content in the oxygen-hydrogen mixture is shown in @fig_21. 

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/1_Hydro/1_Safety/2_H2_Multi_Flame.png", 
  width: 57%),
  caption: [Influence of oxygen content. The higher $phi$ becomes, the better the approximation to stoichiometric combustion properties (a) $phi = 1.0$, (b) $phi = 0.8$, (c)$phi = 0.7$, (d) $phi = 0.62$, jet velocity of $33 "m/s"$, Reynolds number of 580, aperture f/2.4, turbulent @schefer2009visible.],
) <fig_21>


In this context, the equivalence ratio, denoted as $phi$, is defined as the actual air–fuel ratio to the stoichiometric air–fuel ratio for combustion @Salaudeen2019.  
Consequently, $phi = 1$ means best combustibility and values smaller stand for $phi$ suggest suboptimal conditions for combustion. The results show that the higher $phi$ is, the better the visibility of the flame becomes. 
The conditions that led to this recording can be found in the figure description. 
In @schefer2009visible it is concluded that for good visibility, low lighting should be provided.
Detailed information on hydrogen-air mixing limits for different types of ignition and names other important parameters in this context are provided in @tab_25. 
However, it should be explicitly noted that under normal conditions ($0 degree.c$, $1.01325 "bar"$) hydrogen is flammable at an air content of $4% "to" 75.6%$ and detonable at an air content of $18 "to" 58.9%$. 

#figure(
  table(
    columns: (auto, auto),
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    fill: (col, row) => if row == 0 { rgb("#7FFF7F") } 
                        else if calc.odd(row) { rgb("#D3D3D3") }
                        else { white },
    inset: (x: 1em, y: 0.7em),
    stroke: none,
    
    /* --- header --- */
    table.cell(colspan:2, [*Mixtures with air*]),
    /* -------------- */
    [Lower explosion limit (ignition limit)], [$4$ Vol% H#sub[2]],
    [Lower detonation limit], [$18$ Vol% H#sub[2]],
    [Stoichiometric mixture], [$29.6$ Vol% H#sub[2]],
    [Upper detonation limit], [$58.9$ Vol% H#sub[2]],
    [Upper explosion limit (ignition limit)], [$75.6$ Vol% H#sub[2]],
    [Ignition temperature], [$585 " " degree.c  =^hat 858 "K "$],
    [Minimum ignition energy], [$0.017 "mJ"$],
    [Maximum laminar flame velocity], [$approx 3 "m/s"$],
    [Maximum adiabatic combustion temperature], [$approx 2200 " " degree.c =^hat 2473.15 "K "$],
  ),
  kind: table,
  caption: [Hydrogen-air mixture limits for different types of combustions, as well as other important values in this context @Klell2018 ],
)<tab_25>


Apart from the air content mentioned in @tab_25, two special cases were mentioned in @tab_23. These are, first hydrogen and chlorine can already carry out a reaction just by light irradiation. This is perceived as a loud and explosive bang (chlorine oxyhydrogen reaction) @Klell2018 @Klell2023.
Seconds, hydrogen reacts similarly explosively with fluorine @Klell2018 @Klell2023.
Another important point that is relevant when handling hydrogen is hydrogen-material compatibility. 
Hydrogen can accumulate in metal lattices and cause embrittlement, which is not observed in plastics. 
The embrittlement aspect was already covered in @chap_1_0_3, thus the reader is refered to it. 
On the other hand, because hydrogen can be stored insde the lattice of the metal as metal hydride, hydrogen in a very pure form (99.99%) can be obtained @Usman2022 @Du2021 @Nashchekin2020. 
Here, the metal lattice is used as a filter. 

// ---------------------------------- here ---------------------------------- //
For metal hydride, the hydrogen molecules dissociate into atomic hydrogen at the surface and then diffuses into  that they can easily diffuse through less dense materials. Plastics are an example of materials with lower density. 
While there is no danger of metal embrittlement with plastics, holding hydrogen in a plastic container is significantly more difficult. 
In the worst case, this would mean that a filled tank would empty in a very short time because the hydrogen cannot be held in the pressure vessel. 
If this container were surrounded by another closed space, the hydrogen would now be present in this space. 
Specifically, a car garage should be mentioned. If the hydrogen could accumulate in it and the residents don't know about it, it could possibly lead to life-threatening burns. It follows that the two properties that should be given the highest attention are the flammability and the diffusion behavior of hydrogen.


// TODO
explain why you need the other part that is inshallah about to come
real world applicaiton is required to see what was done to get explosions. what to do to prevent it.


In summary, it can be said that hydrogen is not flammable without the addition of air. However, on the one hand, there is a large air-hydrogen mixture range in which ignition is possible. On the other hand, the smallest static discharges are sufficient to transfer this gas mixture to ignition up to detonation. Apart from the risk of explosion, the diffusion behavior of hydrogen is of central importance. Hydrogen can be better held in the container with metals than with plastic enclosures. But with metals, there is a danger of hydrogen embrittlement.



// -------------------------------------------------------------------------- //
// The latter represents the motivation to use the possibilities offered by the standards, instead of wanting to test exclusively with hydrogen. 