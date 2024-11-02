/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


// Title was tested and is inshallah fine
// word repetition task inshallah completed
===  Initial Background Studies on Fill Medium Impact<chap_3_0_1>

The safety concerns regarding experimental structural testing with hydrogen, as identified in @chap_2_0_1 and @chap_2_0_2, necessitate investigation of alternative fill media for structural validation tests. While @chap_3_0_0 established the critical load cases and testing methodology, this subsection examines publicly available research on the implications of using different fill media in pressurized structures under static external loading conditions.
The investigation analyzes experimental findings from pipe bending tests with various fill media, providing quantitative insights into the relationships between fill medium choice, internal pressure, and structural response. The analysis encompasses comparisons of maximum bending moments and curvature behavior between water-filled and air-filled specimens across different pressure ranges. Additionally, a simplified conceptual model is proposed to explain the observed differences in structural behavior based on fundamental molecular properties of liquids and gases. These findings establish the foundation for the examination of the impact of the filling agent for #glspl("swith") in @chap_3_0_2.


// -------------------------------------------------------------------------- //
Initial investigations regarding external loads on pressure cylinders were presented in @chap_2_0_3. The rationale for studying external dynamic loads on pressure vessels stems from the essential standards detailed in @chap_1_0_6. Additional justification for considering dynamic loads in aircraft applications was established in @chap_3_0_0. Given that #glspl("swith") integrate both pressure vessel and aircraft characteristics, the significance of dynamic loading extends naturally to #gls("swith") applications.

Furthermore, these investigations could potentially yield insights relevant to both dynamic and static testing scenarios.
This consideration is particularly noteworthy given that the literature predominantly focuses on external dynamic loading of pressure vessels rather than external static loading.
After examining the dynamic loading aspects, the analysis conducted in @chap_3_0_0 established the vertical gust load as the critical static test load for this thesis. 

This choice reflects the universal applicability of vertical gust loads, which can be derived for all commercial aircraft through the V-n diagram. This characteristic enhances the generalizability of this research. Additionally, the experimental setup can accommodate all four required static tests with minimal or no modifications.
The preference for static testing over dynamic load cases is further supported by the pioneering nature of #glspl("swith") technology. Given the limited knowledge about #glspl("swith") structural testing, static testing could potentially offer better control over safety parameters during this early development phase.
To gather relevant information about static external loading for #glspl("swith"), an examination of pressure vessel behavior under static external loads is warranted. The validity of this approach was established in @chap_2_0_3. The necessity of referring to pressure vessel research, rather than direct #gls("swith") studies, stems from the limited availability of #gls("swith") research, as previously elaborated in @chap_0_7.

// ----------------------------- diving cylinder ---------------------------- //
Diving cylinders represent a prime example of pressure vessels subjected to external static pressure during their structural verification process. In this process, a diving cylinder is positioned at a specific water depth where it experiences a uniform external pressure load. The approval procedure involves several steps: first, the cylinder is filled with water and placed within a larger water-filled vessel. This larger container is sealed from above to prevent water escape. An initial internal pressure of $3000 "psig" approx 208 "bar"$ is applied to the diving cylinder. Subsequently, this pressure is increased by a factor of (5/3 = 1.6), resulting in pressure values up to $5000 "psig" approx 345 "bar"$. Detailed specifications of this procedure are documented in regulations 49 CFR Part 180 @reg_water_cylinder.

The applicability of diving cylinder test methods to #glspl("swith") is limited by two fundamental differences. First, the dimensional disparity is significant, as the tank cylinder dimensions are substantially smaller than those of wing-integrated tanks in aircraft applications. Second, #glspl("swith") require a variable external load distribution across the wingspan, in contrast to the uniform surface pressure load used in diving cylinder tests.
The measurement methodology for diving cylinder tests is primarily constrained to monitoring water displacement from the surrounding vessel. During pressurization of the diving cylinder, the expelled water is typically channeled through a hose into a measurement vessel on a scale. This approach proves inadequate for #glspl("swith") applications due to two key factors: the requirement for more sophisticated measurement technology and the necessity to accommodate variable load application across the wingspan.

// ---------------------------- first curv paper ---------------------------- //
Relevant insights for #glspl("swith") can be derived from a study conducted by @Liu2019, which investigated the behavior of pipes under bending loads with various fill media and pressure conditions. The experimental setup utilized three distinct fill media (air, water, and sand) across multiple pressure levels [0, 50, 100, 150] bar. As illustrated in @fig_29, the test configuration positioned the pipe centrally between two supports. A notable feature of this test equipment lies in its design to mitigate partial collapse caused by large local plastic deformations, distinguishing it from conventional three- and four-point bending devices. This design characteristic enabled the measurement of global bending failure without interference from localized deformation effects @Liu2019.

// --------------------------- testing environment -------------------------- //
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/1_Curve_Theory/0_Bending.jpeg", 
  width: 100%),
  caption: [Experimental setup for bending tests on pressurized pipes according to @Liu2019.],
) <fig_29>

// ---------------------- impact soley of filling agent --------------------- //
@fig_30 illustrates the relationship between bending moment M and curvature $kappa$ under conditions without additional internal pressure. The influence of different fill media on the pipe's behavior is distinct. While sand demonstrates the highest maximum curvature, its maximum bending moment approximates that of the water-filled pipe. A comparison between water and air as fill media reveals that water-filled pipes exhibit superior performance in both maximum moment capacity and maximum curvature tolerance.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/1_Curve_Theory/1_Bending_Curves.png", 
  width: 67%),
  caption: [Relationship between bending moment M and curvature $kappa$ for pipes filled with different media without additional internal pressure @Liu2019.],
) <fig_30>

// --------------------------- pressure variation --------------------------- //
For #glspl("swith") applications, the interrelation between fill medium, internal pressure, and external loads merits careful consideration. @fig_31 and @fig_32 present the internal pressure effects for water and air, respectively across multiple pressure levels [0, 50, 100, 150] bar. 
Each medium is examined in isolation and includes a crucial baseline condition without added internal pressure. 
This baseline reference point, not present in @fig_33, enables quantification of the structural behavior changes induced by initial pressurization. 
The progression from the unpressurized state through various pressure levels can be traced independently for each medium.
A clear correlation emerges between increased pressure and enhanced capacity for maximum moments and curvatures. 
This pressure-dependent behavior is consistent across both fill media.
@fig_33 provides a direct comparative analysis of fill media influence under varying pressure conditions. At a constant pressure of $50 "bar"$, water-filled pipes demonstrate superior performance in both bending moment capacity and curvature tolerance compared to air-filled pipes. This characteristic performance difference persists across varying pressure levels.

// ---------------------------------- water --------------------------------- //
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/1_Curve_Theory/2_Bending_Medium_Water.png", 
  width: 67%),
  caption: [Relationship between bending moment M and curvature $kappa$ for water-filled pipes at different internal pressures @Liu2019.],
) <fig_31>

// ----------------------------------- air ---------------------------------- //
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/1_Curve_Theory/3_Bending_Medium_Air.png", 
  width: 67%),
  caption: [Relationship between bending moment M and curvature $kappa$ for air-filled pipes at different internal pressures @Liu2019.],
) <fig_32>

// ------------------------------ air and water ----------------------------- //
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/1_Curve_Theory/4_Water_Air.png", 
  width: 67%),
  caption: [Comparison of bending moment M and curvature $kappa$ relationships between air-filled and water-filled pipes at different internal pressures @Liu2019.],
) <fig_33>

At a pressure of $50 "bar"$, an air-filled pipe exhibits a maximum bending moment of 
$277 "Nm"$ and a maximum curvature of $1.65 space upright("m")^(-1)$. For the same pressure, a water-filled pipe demonstrates higher values, with a maximum bending moment of 
$336 "Nm"$ and maximum curvature of $2.9 space upright("m")^(-1)$. 
When the pressure is increased to 
$150 "bar"$, the air-filled pipe achieves a maximum bending moment of 
$343 "Nm"$ and maximum curvature of $2.7 space upright("m")^(-1)$, while the water-filled pipe reaches 
$400 "Nm"$ and $3.2 space upright("m")^(-1)$, respectively.
These comparative results demonstrate that under constant internal pressure conditions, water-filled pipes consistently achieve higher maximum curvature and maximum bending moment values compared to their air-filled counterparts.
This pattern indicates that the choice of fill medium significantly influences the pipe's bending behavior. 

// ----------------------------- pressure impact ---------------------------- //
The impact of pressure on the maximal bearable bending moment is expressed in quantifiable numbers in @eq_20 and @eq_21.
For air-filled pipes, following @eq_20, the maximum bending moment increases from $50 "bar"$ to $150 "bar"$ by $66 "Nm"$, and according to @eq_21 water-filled pipes show a similar increase of $64 "Nm"$.

$ Delta M_"air"(150-50) &= M("air",p=150) - M("air",p=50)  \ 
&= (343 - 277) "Nm"   \
&= 66 "Nm" $<eq_20>

$ Delta M_"water"(150-50) &= M("water",p=150) - M("water",p=50)  \ 
&= (400 - 336) "Nm"   \
&= 64 "Nm" $<eq_21>

This comparable increase in moment capacity as highlighted in @eq_22 suggests that the pressure effect on maximum bending moment from $50 "bar"$ to $150 "bar"$ is relatively consistent across both media.


$ Delta M_"air"(150-50) -  Delta M_"water"(150-50) &= (66 - 64) "Nm"   \
&= 2 "Nm" $<eq_22>

However, the curvature behavior for increasing the internal pressure from $50 "bar"$ to $150 "bar"$ exhibits markedly different characteristics. 
Air-filled pipes, following @eq_23, demonstrate a substantial increase in maximum curvature of $1.05 space upright("m")^(-1)$, while according to @eq_24, water-filled pipes show a more modest increase of $0.3  space upright("m")^(-1)$.


$ Delta kappa_"air"(150-50) &= kappa("air",p=150) - kappa("air",p=50) \ 
&= (2.7 - 1.65) space upright("m")^(-1)\
&= 1.05 space upright("m")^(-1) $<eq_23>

$ Delta kappa_"water"(150-50) &= kappa("water",p=150) - kappa("water",p=50) \ 
&= (3.2 - 2.9) space upright("m")^(-1)\
&= 0.3 space upright("m")^(-1) $<eq_24>

This significant difference in curvature response to pressure increase, as shown in @eq_25, indicates that the pressure effect on maximum curvature from $50 "bar"$ to $150 "bar"$ is not consistent across both media.

$ Delta kappa_"air"(150-50) - Delta kappa_"water"(150-50) &= (1.05 - 0.3) space upright("m")^(-1)\
&= 0.73 space upright("m")^(-1) $<eq_25>



// ----------------------- same pressure, diff medium ----------------------- //
The quantitative differences between air- and water-filled pipes at constant internal pressures are presented in @eq_14 to @eq_17. For maximum bending moment at $50 "bar"$, a difference of $59 "Nm"$ is observed (@eq_14), which slightly decreases to $57 "Nm"$ at $150 "bar"$ (@eq_15). 
The maximum curvature shows more pronounced changes, with a difference of $1.25 space upright("m")^(-1)$ at $50 "bar"$ (@eq_16) that reduces substantially to $0.5 space upright("m")^(-1)$ at $150 "bar"$ (@eq_17).


$ Delta M(p=50) &= M("water",p=50) - M("air",p=50)  \ 
&= (336 - 277) "Nm"   \
&= 59 "Nm" $<eq_14>

$ Delta M(p=150) &= M("water",p=150) - M("air",p=150) \
&= (400 - 343) "Nm" \
&= 57 "Nm" $<eq_15>

$ Delta kappa(p=50) &= kappa("water",p=50) - kappa("air",p=50) \ 
&= (2.9 - 1.65) space upright("m")^(-1)\
&= 1.25 space upright("m")^(-1) $<eq_16>


$ Delta kappa(p=150) &= kappa("water",p=150) - kappa("air",p=150)\
&= (3.2 - 2.7) space upright("m")^(-1)\
&= 0.5 space upright("m")^(-1) $<eq_17>


// ---------------------------------- here ---------------------------------- //
The interpretations derived from the presented equations need be considered within the context of limited data availability. To establish more robust conclusions, additional experimental data is necessary across multiple dimensions. First, the current pressure resolution, consisting of only four discrete values [0, 50, 100, 150] bar, provides insufficient granularity for comprehensive analysis. A finer pressure resolution would enable more detailed characterization of the relationship between internal pressure and structural response.

Furthermore, the experimental parameters in @Liu2019, utilizing steel pipes with dimensions of $25 "mm"$ diameter and $750 "mm"$ length, differ significantly from #glspl("swith") requirements. Application to #glspl("swith") necessitates investigation of specimens with larger diameters, extended lengths, higher pressure ratings, and Type IV tanks. 
With a more comprehensive dataset, statistical analysis could yield valuable insights into the relationship between different fill media and strucutral behavior. Of particular interest is the potential to predict the maximum bending moment or maximum curvature of one fill medium based on known properties of another. This prediction capability could be achieved through systematic analysis of the differences between fill media, beginning with the calculation of a difference vector as defined in @eq_18. Subsequently, the mean difference across pressure levels could be computed according to @eq_19. The variables are denoted as: the number of maximum bending moment measurements $n$, pressure $p_i$, and the respective fill agents A and B.


$ Delta M_i = M("A",p_i) - M("B",p_i) $<eq_18> 
$ overline(Delta M) = 1/n sum_(i=1)^n Delta M_i $<eq_19> 

The standard deviation of these differences would then be calculated using @eq_26 @Papula2016. 

$ sigma = sqrt(1/(n-1) sum_(i=1)^n (Delta M_i - overline(Delta M))^2) $<eq_26>

If the standard deviation is small relative to the mean difference, indicated by a coefficient of variation $(sigma/overline(Delta M))$ less than 0.1 or 10%, this would indicate a reasonably consistent relationship between the two media across pressure levels. Such consistency would enable the prediction of the maximum bending moment of medium B when the maximum bending moment of medium A is known. This information is particularly valuable when evaluating whether an ignitable gas could be replaced with a fluid for testing purposes. Furthermore, it could address fundamental engineering questions, such as whether water-filled pipes consistently demonstrate triple the bending moment or curvature compared to air-filled pipes, regardless of pressure level.

The implications of fill medium selection extend to current testing standards and certification procedures. Standards such as #gls("iso") 11119-3:2020 @11119_3_ISO, a globally recognized standard, specifically address pressure testing verification procedures in Section 8.5.1.1 and explicitly permits the use of water as a fill medium. The results of the proposed statistical analysis could provide valuable insights for these standardization procedures and could be communicated to the International Organization for Standardization.

This concern is further exemplified by current testing practices at the European Union's high-pressure gas tank testing facility (GasTeF) in the Netherlands. According to @Cebolla2019, helium and nitrogen serve as fill media for testing purposes. Although these gases are used as substitutes for hydrogen, they possess different material properties. 
The disparity between testing and operational conditions could lead to crucial safety implications. 
The certification tests using water or alternative gases might approve structures that can withstand higher bending moments and curvatures than they could when filled with hydrogen during actual operation.
This discrepancy could lead to the certification of structures with inadequate safety margins for their intended operational use with hydrogen.

// this might not be the best place ot mention it, or need proper intro this 
Having presented and analyzed the experimental findings regarding the impact of filling agents on structural behavior, a simplified conceptual model is proposed to explain the underlying physical mechanisms. While the exact mechanism behind the superior bending moment capacity of water-filled pipes compared to air-filled pipes remains uncertain, examination of fundamental differences between gases and liquids at the particle level may provide valuable insights into this phenomenon.

The model considers the distinct molecular characteristics of gases and liquids under confined conditions. Gas particles exhibit significant movement and maintain considerable spacing, defined by their mean free path, until collision occurs. This characteristic allows gases to be highly compressible, as the free space between particles can be reduced under pressure loads. In contrast, liquids demonstrate minimal compressibility, with particles maintaining relatively fixed positions when confined within a closed volume.
Consider a pipe completely filled with water, leaving no space for fluid movement. Under these conditions, when subjected to a pressure load, the confined water could effectively become an integral part of the structural system. The internal pressure forces the water against the entire inner surface of the tank, enabling it to function as a load transfer element. When external loads act on the tank surface, the pressurized water can absorb and redistribute these loads to other areas of the tank surface. This load transfer mechanism's effectiveness likely increases with internal pressure, as higher pressures result in closer particle spacing. Consequently, compressed liquids would theoretically provide more effective load transfer capabilities than gases, which maintain greater particle spacing even under compression.

The same model can also explain the lower maximum bending moments observed in gas-filled specimens. The greater molecular spacing in gases provides particles more freedom of movement, requiring substantially higher pressures to achieve particle proximity comparable to that of liquids. Consequently, the load transfer mechanism in gases is less effective than in liquids due to this fundamental difference in molecular behavior. While this conceptual model offers a plausible explanation for the observed phenomena, further experimental and numerical investigations would be valuable to validate these theoretical considerations. However, such comprehensive experimental studies extend beyond the scope and resources available for the current investigation.

// --------------------------------- summary -------------------------------- //
#summary_([
In summary, the investigation of fill media effects on pressurized structures has revealed several significant findings. Under static external loading, both the internal pressure and the choice of medium demonstrate substantial influence on structural behavior. Water-filled pipes consistently exhibited superior performance compared to air-filled counterparts, achieving higher maximum bending moments and greater curvature tolerance across all tested pressure ranges. 
The relationship between internal pressure and structural response showed distinct patterns: while both media demonstrated similar increases in maximum bending moment with pressure elevation, their curvature responses differed markedly. 
A simplified conceptual model based on molecular behavior was proposed to explain these observations, suggesting that the incompressible nature of liquids enables more effective load transfer in contrast with to gases. The investigation also highlighted important implications for current testing standards, particularly regarding the use of substitute fill media in certification procedures. Statistical methods were proposed for quantifying the relationships between different fill media, which could provide valuable insights for future testing protocols. These findings underscore the importance of considering fill medium effects in structural design and testing, particularly for applications involving pressurized vessels under external loading conditions as it is the case for #glspl("swith").
])