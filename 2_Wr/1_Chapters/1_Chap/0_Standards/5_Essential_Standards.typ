/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


=== II.7 Filtering Essential Standards

In the previous section, an overview of standards from various areas using compressed hydrogen as fuel was provided. This segment aims to summarize the overarching categories of hydrogen applications that exist and how the application in K2H2 is to be classified. Following this, criteria for filtering the essential standards from the many possible standards will be named and applied. The results will be used for subsequent steps. Furthermore, general important aspects of the chosen standards will be examined. Finally, safety factors for the burst test and maximum possible nominal pressures will be recorded.

The three overarching categories in Table 16 allow for a quick initial assessment of their applicability when experienced in handling standards. Within Table 16, various combinations can be chosen. For example, it would be possible to choose mobile, Type I and air, just as mobile, Type I and ground. Due to the numerous combination possibilities, the standard must be carefully selected to cover the requirement profile as precisely as possible.

[Table 16: Overarching tank application requirements for finding standards]

Storage | Tank Type | Locality
--------|-----------|----------
Stationary | I | Underwater
Mobile | II | Underground
 | III | Ground
 | IV | Air
 | V |

The choice for K2H2 is mobile, Type IV and air. It is expected that this selection should also hold true for larger aircraft. Mobile and air are to be considered constants. Type IV is significantly lighter than Types I, II and III. Arguments against tank type V are its price on the one hand and limited availability on the other. If these factors do not change, Type IV tanks can also be used for large aircraft. It follows that the results from K2H2 could also be of value to large aircraft manufacturers.

The criteria by which the essential standards are to be determined are given in Table 17. The order of the listing does not follow any weighting. The timeliness stems from the idea that the more recent the publication, the higher the probability that more knowledge from expert teams could be integrated. Standards are often revised precisely for this reason. When new insights become available, these can be seen as potential new requirements. The aim of standard issuers is always to ensure safety and functionality for people and the environment and to minimize existing gaps. It is also conceivable that existing requirements must be removed or adapted.

[Table 17: Criteria for selection of essential standards]

1) Timeliness
2) Actively developed
3) Accessibility and availability
4) Use in research and industry
5) International recognition
6) Europe-wide recognition
7) Costs for acquisition
8) Coverage of K2H2 requirements

The third point, accessibility from Table 17, is an extremely important criterion, as even excellent standards have no value for research and industry if they cannot be obtained. Points 4-6 indicate experience and successful implementation. The more frequently a standard is used and functional vehicles can be constructed and approved, the more trustworthy this standard becomes. If a standard enjoys a trustworthy reputation, it can generally be assumed that the standard is internationally recognized. Europe-wide recognition becomes important if no standards can be found that have been able to acquire high international esteem. In this case, outside of Germany, the European area would be the next possible larger target group. Costs are particularly important for start-ups, small and medium-sized research and industry institutes. The last point is to ensure that the standard meets the requirements of K2H2 to a certain extent. Understandably, any standard that does not consider the mentioned point would be completely excluded.

In K2H2, three standards could be found that meet all criteria and complement each other. These are listed in Table 18. Mandatory and optional tests from ISO 11119-3:2020 are given as an example in Table 19 and Table 20.

[Table 18: Selection of the 3 essential standards for K2H2]

1) EC 406/2010
2) ISO 19881:2018
3) ISO 11119-3:2020

[Table 19: Mandatory tests from ISO 11119-3:2020]

1) hydraulic proof pressure test (8.5.1), or hydraulic elastic expansion test (8.5.2)
2) cylinder burst test (8.5.3)
3) ambient temperature cycle test (8.5.4)
4) environmental cycle test (8.5.6)
5) flaw test (8.5.8)
6) drop/impact test (8.5.9)
7) high-velocity impact (gunfire) test (8.5.10)
8) torque test on cylinder neck boss (8.5.13)
9) leak test (8.5.15)
10) pneumatic cycle test (8.5.16)
11) resin shear strength (8.5.18)
12) glass transition test (8.5.14)

[Table 20: Optional tests from ISO 11119-3:2020, if boundary conditions allow]

1) vacuum test (8.5.5) (mandatory if a cylinder is to be exposed to a vacuum in service)
2) environmentally assisted stress rupture test (8.5.7) (mandatory for cylinders with load-sharing glass or aramid fiber)
3) permeability test (8.5.12) if cylinders are manufactured with non-metallic liners or without liners
4) fire resistance test (8.5.11)
5) salt water immersion test (8.5.14) (mandatory for cylinders used in underwater applications)

Next, important points of selected standards should be addressed. EC 406/2010 and ISO 19881:2018 are established regulations for the automotive industry. EC 406/2010 is available in several languages and valid for 50 geopolitical regions (islands and countries). Nevertheless, there are some objections to direct application to aviation. Firstly, the full title in English reads COMMISSION REGULATION (EU) No 406/2010 of 26 April 2010 implementing Regulation (EC) No 79/2009 of the European Parliament and of the Council on type-approval of hydrogen-powered motor vehicles. A vehicle is a vehicle. By definition, an airplane is also a vehicle. However, if the German translation of EC 406/2010 is read, the word vehicle is translated as "Kraftfahrzeug" (motor vehicle). This limits the applications to road vehicles. In other words, from the title definition in the English version itself, it is not clear whether aviation use would be legally permissible. In the title of ISO 19881:2018, the restriction to road-bound vehicles is unambiguously underlined: Gaseous hydrogen - Land vehicle fuel containers.

Secondly, ISO 19881:2018 is limited to tanks that are permanently attached to the vehicle. Thirdly, some tests require more than one test object. For example, ISO-11119-3, paragraph 8.2.1 states: "A minimum of 30 cylinders of the new design shall be made available for prototype testing". For K2H2, due to the innovation, only a single wing is available for experimental investigations. Fourthly, some prescribed requirements in EC 406/2010 and ISO 19881:2018, which are identical, could be too high for practical application. As an example, the criteria for the burst ratio with gaseous hydrogen from Table IV.3.6. (EC 406/2010) and 7.3.2 (ISO 19881:2018) are mentioned. The burst ratio is given in Equation (3). The variables pburst, factor and pwnp are referred to as the minimum burst pressure, a factor dependent on the fiber material, and as nominal operating pressure.

pburst ≥ factor · pwnp (3)

For glass, aramid and carbon, the factors are 3.5, 3.0 and 2.25. It follows that when using glass as fiber material, the hydrogen tank must be able to withstand three times the nominal pressure. If the nominal pressure for the K2H2 tank were set at 300 bar, the tank would have to withstand at least 900 bar. The high safety factors defined in EC 406/2010 and ISO 19881:2018 are technically very demanding. The higher the safety factors, the more material is needed to meet these requirements. More material means more mass and thus more weight. This is highly undesirable in aviation. Furthermore, the high-pressure gas tank testing facility of the European (GasTeF) in @Cebolla2019 states that it can test with a maximum internal pressure of 1050 bar. Depending on the fiber material, maximum working nominal pressures pmwnp between 300 and 465 bar can be achieved. However, if the factors of ISO 11119-3:2020 are considered, maximum working nominal pressures pmwnp between 437.5 and 525 bar are to be expected. The complete list of fiber material-dependent safety factors of both standards can be found in the denominator of the fractions in Table 21. The maximum possible operating pressures, with a maximum test pressure of 1050 bar @Cebolla2019, depending on fiber material and standard, are also given in Table 21.

[Table 21: Fiber material dependent safety factors (in the denominator of the fractions) and associated maximum allowable operating nominal pressure pwnp, when the maximum allowable test pressure of 1050 bar @Cebolla2019 is chosen]

Fiber material | pwnp EC 406/2010 ISO 19881:2018 | pwnp ISO 11119-3:2020
---------------|-----------------------------------|-------------------------
Glass | 1050/3.5 = 300 bar | 1050/2.4 = 437.5 bar
Aramid | 1050/3.0 = 350 bar | 1050/2.1 = 500 bar
Carbon | 1050/2.25 = 465 bar | 1050/2.0 = 525 bar

In summary, it can be said that three essential standards could be selected for K2H2. The three filtered standards cannot be directly applied to aviation, but provide important indications for K2H2. It was also explained that the working nominal pressure, depending on the standard considered, can be chosen up to a maximum of 525 bar. This limitation is justified by the fact that existing test facilities cannot generate arbitrarily high pressures for experimental verification.