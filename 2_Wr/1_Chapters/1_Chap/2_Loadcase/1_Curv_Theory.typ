/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


// TODO
// Title Check
=== Theoretical Background of Impact Filling Agent<chap_3_0_1>

// TODO get proper intro
In the previous sections, the properties of hydrogen were first listed. These were then evaluated with regard to safe experimental feasibility. The results revealed significant safety concerns regarding the use of hydrogen in physical tests. Subsequently, the influence of dynamic external loads on pressurized cylinders was investigated. The evaluations were well received by the industry partner (IMA), and the question of the fill medium's influence on structural behavior under external static loading was deemed particularly important. The following section presents initial findings on this matter.

// -------------------------------------------------------------------------- //
Initial investigations regarding external loads on pressure cylinders were presented in @chap_2_0_3. The rationale for studying external dynamic loads on pressure vessels stems from the essential standards detailed in @chap_1_0_6. Additional justification for considering dynamic loads in aircraft applications was established in @chap_3_0_0. Given that #glspl("swith") integrate both pressure vessel and aircraft characteristics, the significance of dynamic loading extends naturally to #gls("swith") applications.

Furthermore, these investigations could potentially yield insights relevant to both dynamic and static testing scenarios.
This consideration is particularly noteworthy given that the literature predominantly focuses on external dynamic loading of pressure vessels rather than external static loading.
After examining the dynamic loading aspects, the analysis conducted in @chap_3_0_0 established the vertical gust load as the critical static test load for this thesis. 

This choice reflects the universal applicability of vertical gust loads, which can be derived for all commercial aircraft through the V-n diagram. This characteristic enhances the generalizability of this research. Additionally, the experimental setup can accommodate all four required static tests with minimal or no modifications.
The preference for static testing over dynamic load cases is further supported by the pioneering nature of #glspl("swith") technology. Given the limited knowledge about #glspl("swith") structural testing, static testing could potentially offer better control over safety parameters during this early development phase.
To gather relevant information about static external loading for #glspl("swith"), an examination of pressure vessel behavior under static external loads is warranted. The validity of this approach was established in @chap_2_0_3. The necessity of referring to pressure vessel research, rather than direct #gls("swith") studies, stems from the limited availability of #gls("swith") research, as previously elaborated in @chap_0_7.

// -------------------------------------------------------------------------- //
Diving cylinders represent a prime example of pressure vessels subjected to external static pressure during their structural verification process. In this process, a diving cylinder is positioned at a specific water depth where it experiences a uniform external pressure load. The approval procedure involves several steps: first, the cylinder is filled with water and placed within a larger water-filled vessel. This larger container is sealed from above to prevent water escape. An initial internal pressure of $3000 "psig" approx 208 "bar"$ is applied to the diving cylinder. Subsequently, this pressure is increased by a factor of (5/3 = 1.6), resulting in pressure values up to $5000 "psig" approx 345 "bar"$. Detailed specifications of this procedure are documented in regulations 49 CFR Part 180 @reg_water_cylinder.

The applicability of diving cylinder test methods to #glspl("swith") is limited by two fundamental differences. First, the dimensional disparity is significant, as the tank cylinder dimensions are substantially smaller than those of wing-integrated tanks in aircraft applications. Second, #glspl("swith") require a variable external load distribution across the wingspan, in contrast to the uniform surface pressure load used in diving cylinder tests.
The measurement methodology for diving cylinder tests is primarily constrained to monitoring water displacement from the surrounding vessel. During pressurization of the diving cylinder, the expelled water is typically channeled through a hose into a measurement vessel on a scale. This approach proves inadequate for #glspl("swith") applications due to two key factors: the requirement for more sophisticated measurement technology and the necessity to accommodate variable load application across the wingspan.

Relevant insights for #glspl("swith") can be derived from a study conducted by @Liu2019, which investigated the behavior of pipes under bending loads with various fill media and pressure conditions. The experimental setup utilized three distinct fill media (air, water, and sand) across multiple pressure levels [0, 50, 100, 150] bar. As illustrated in @fig_29, the test configuration positioned the pipe centrally between two supports. A notable feature of this test equipment lies in its design to mitigate partial collapse caused by large local plastic deformations, distinguishing it from conventional three- and four-point bending devices. This design characteristic enabled the measurement of global bending failure without interference from localized deformation effects @Liu2019.

// --------------------------- testing environment -------------------------- //
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/1_Curve_Theory/0_Bending.jpeg", 
  width: 100%),
  caption: [Experimental setup for bending tests on pressurized pipes according to @Liu2019.],
) <fig_29>


@fig_30 illustrates the relationship between bending moment M and curvature $kappa$ under conditions without additional internal pressure. The influence of different fill media on the pipe's behavior is distinct. While sand demonstrates the highest maximum curvature, its maximum bending moment approximates that of the water-filled pipe. A comparison between water and air as fill media reveals that water-filled pipes exhibit superior performance in both maximum moment capacity and maximum curvature tolerance.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/2_Loadcases/1_Curve_Theory/1_Bending_Curves.png", 
  width: 67%),
  caption: [Relationship between bending moment M and curvature $kappa$ for pipes filled with different media without additional internal pressure @Liu2019.],
) <fig_30>


For #glspl("swith") applications, the interrelation between fill medium, internal pressure, and external loads merits careful consideration. @fig_31 and @fig_32 present the internal pressure effects for water and air respectively across multiple pressure levels [0, 50, 100, 150] bar. Each medium is examined in isolation and includes a crucial baseline condition without added internal pressure. 
This baseline reference point, not present in @fig_33, enables quantification of the structural behavior changes induced by initial pressurization. 
The progression from the unpressurized state through various pressure levels can be traced independently for each medium.
A clear correlation emerges between increased pressure and enhanced capacity for maximum moments and curvatures. This pressure-dependent behavior is consistent across both fill media.
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
$400 "Nm"$ and $3.2 space upright("m")^(-1)$ respectively.
These comparative results demonstrate that under constant internal pressure conditions, water-filled pipes consistently achieve higher maximum curvature and maximum bending moment values compared to their air-filled counterparts.
This pattern indicates that the choice of fill medium significantly influences the pipe's bending behavior. 

// ---------------------------------- here ---------------------------------- //
The impact of pressure in terms of qunaitifcale numbers is given in @eq_new1 @eq_new4

$ Delta M_"air"(150-50) &= M("air",p=150) - M("air",p=50)  \ 
&= (343 - 277) "Nm"   \
&= 66 "Nm" $<eq_new1>

$ Delta M_"water"(150-50) &= M("water",p=150) - M("water",p=50)  \ 
&= (400 - 336) "Nm"   \
&= 64 "Nm" $<eq_new2>

$ Delta kappa_"air"(150-50) &= kappa("air",p=150) - kappa("air",p=50) \ 
&= (2.7 - 1.65) space upright("m")^(-1)\
&= 1.05 space upright("m")^(-1) $<eq_new3>

$ Delta kappa_"water"(150-50) &= kappa("water",p=150) - kappa("water",p=50) \ 
&= (3.2 - 2.9) space upright("m")^(-1)\
&= 0.3 space upright("m")^(-1) $<eq_new4>

The quantitative differences between air- and water-filled pipes at varying internal pressures are presented in @eq_14 through @eq_17. For maximum bending moment, a difference of $59 "Nm"$ is observed at $50 "bar"$ pressure (@eq_14), which slightly decreases to $57 "Nm"$ at $150 "bar"$ (@eq_16). The maximum curvature shows more pronounced changes, with a difference of $1.25 space upright("m")^(-1)$ at $50 "bar"$ (@eq_15) that reduces substantially to $0.5 space upright("m")^(-1)$ at $150 "bar"$ (@eq_17).


$ Delta M(p=50) &= M("water",p=50) - M("air",p=50)  \ 
&= (336 - 277) "Nm"   \
&= 59 "Nm" $<eq_14>

$ Delta kappa(p=50) &= kappa("water",p=50) - kappa("air",p=50) \ 
&= (2.9 - 1.65) space upright("m")^(-1)\
&= 1.25 space upright("m")^(-1) $<eq_15>

$ Delta M(p=150) &= M("water",p=150) - M("air",p=150) \
&= (400 - 343) "Nm" \
&= 57 "Nm" $<eq_16>

$ Delta kappa(p=150) &= kappa("water",p=150) - kappa("air",p=150)\
&= (3.2 - 2.7) space upright("m")^(-1)\
&= 0.5 space upright("m")^(-1) $<eq_17>


The subsequent investigation examines whether the ratio of deviations in maximum bending moments and curvatures between air- and water-filled pipes remains constant across varying pressure levels. 
To provide an initial estimate of the deviations in maximum bending moments between air- and water-filled pipes at different pressure levels, @eq_18 warrants examination.

$ (Delta M(p=150) - Delta M(p=50))/ (Delta M(p=50)) = \
(57 - 59)/59 = -0.0338 approx -3.4% $<eq_18> 

It can be noted that the deviation of maximum bending moments between air- and water-filled pipes is reduced by only about 3.4%. This suggests that the existing difference in maximum bearable bending moments between air- and water-filled pipes has low pressure sensitivity. Thus, a change in pressure would have little influence on the existing difference in maximum possible bending moment between air- and water-filled pipes.


To clarify what the result means, it should be rephrased in different words. 
It answers the question of whether the ratio of deviations in maximum bending moments and curvatures between air- and water-filled pipes remains constant when pressure values are changed. 
It can be viewed as pressure sensitivity in relation to bending moment and curvature with different fill materials. A typical engineering question might be: Can it always be claimed that water-filled pipes, regardless of pressure level, always show 3 times more [Nm] or [$upright("m"^(-1))$] than air-filled pipes? The interpreation of the value of 3.4%, is that for a selected fill medium, it can be assumed that the approximate maximum bending moment of one fill medium can be inferred from the known maximum bending moment of the other fill medium.


For the pressure sensitivity regarding the deviation of maximum curvature between air- and water-filled pipes, @eq_19 is given. The equation in words: The deviation of maximum curvature between air- and water-filled pipes at $50 "bar"$ and $150 "bar"$ is reduced by about 60%. Consequently, it can be determined that, in contrast to the observation of bending moment, the pressure sensitivity regarding the deviation of maximum curvatures for air- and water-filled tanks is high.

$ (Delta kappa(p=150) - Delta kappa(p=50))/(Delta kappa(p=50)) = \
(0.5 - 1.25)/1.25 = -0.6 ≈ -60% $<eq_19> 

With the aim of relating the findings through the use of different fill materials to #glspl("swith"), the following can be worked out. 
First, the pipes used in @Liu2019 are made of steel and have a diameter of $25 "mm"$ and a length of $750 "mm"$. The pipes assumed for #glspl("swith") are Type IV tanks, which are composite constructions. 
Moreover, diameter and lengths differ significantly from @Liu2019. Additionally, #glspl("swith") require higher pressure levels. Nevertheless, there is an obvious motivation to conduct similar tests with adjusted settings using Type IV tanks. 
If the same or similar effects as described above are observed, the selection of the fill medium for the certification process could be decisive. 

// TODO
// represented data to consider with cauton, not enough data

Standards such as #gls("iso")11119-3:2020 @11119_3_ISO are globally recognized. Section 8.5.1.1 of ISO 11119-3:2020 explains the procedure for pressure testing verification. It explicitly states that water can be used as a fill medium. Depending on the result of the proposed test, the International Organization for Standardization should be informed about the results.

Another example: In @Cebolla2019, it is stated that helium and nitrogen are used as fill media in the European Union's high-pressure gas tank testing facility in the Netherlands (GasTeF). While both are gases, they do not have the same material properties as gaseous hydrogen. Using water or gases other than hydrogen as fill media for the certification and approval process, and the application of gaseous hydrogen in actual operation, could lead to extremely negative and unexpected phenomena. Because if water as a fill medium allows higher bending moments and curvatures without failure than the hydrogen used in operation, then the aircraft would be approved for inadmissibly high structural loads.

The reason why air-filled pipes can withstand lower maximum bending moments than water-filled pipes is not known to the author of this work. However, there is a conceptual model that could explain this phenomenon. Gas is modeled with particles that vibrate and move. They move without collision until the mean free path is exceeded. Due to this mean free path, there is a free space that is filled when a pressure load is applied. In other words: gases can be highly compressed, while liquids can barely be compressed. The following should be imagined: a pipe is filled until no space remains for the liquid to slosh. Now the water should be subjected to a pressure load. If the water has no space to escape, then the water could become part of the actual structure, according to this conceptual model.


The internal pressure pushes the water against the entire inner surface of the tank. As a result, loads acting externally on the tank can be absorbed on the tank's surface by the pressurized water and transferred to other parts of the tank surface. The pressurized water would serve as a load transfer element. The higher the internal pressure, the closer the fluid particles are to each other. Consequently, it is assumed that load transfer should be more effective in compressed liquids than in uncompressed gases.

The same model can also explain why gas as a fill material exhibits lower maximum bending moments. Gas provides particles more space to escape. Thus, higher pressures are required to bring the particles as close together as in liquids. Consequently, the effect of load transfer in gas is less than in liquids. Although further investigations could be considered important, this thesis lacks financial resources, personnel, and planned time for conducting additional experimental investigations. However, further simulative results can be conducted within a reasonable timeframe. These will be elaboroted in next @chap_3_0_2 section.

// --------------------------------- summary -------------------------------- //
In summary, it can be said that under static external loading, the internal pressure and the choice of medium can have an important, non-negligible influence on the maximum bearable bending moment and curvature behavior.



// -------------------------------------------------------------------------- //

The analysis reveals that the deviation of maximum bending moments between air- and water-filled pipes is reduced by approximately 3.4%. This low reduction indicates low pressure sensitivity in the difference between maximum bending moments of the two fill media. Consequently, pressure variations have limited influence on the relative difference in maximum bending moment between air- and water-filled pipes.

This finding addresses a fundamental engineering consideration regarding the predictability of fill media behavior: whether a consistent ratio exists between the maximum bending moments of water-filled and air-filled pipes across different pressure levels. The observed 3.4% variation suggests a highly stable relationship between the two fill media. In practical terms, if the maximum bending moment is known for one fill medium at a specific pressure, the corresponding value for the other medium can be reasonably approximated with minimal pressure-dependent variation. This relationship provides a reliable basis for predicting maximum bending moments [Nm] and curvatures [$upright("m"^(-1))$] across different pressure conditions.


---
Yes, I understand what this equation represents. It's calculating the relative change in the moment differences between water and air-filled pipes when comparing two pressure levels. Specifically:

$Delta M(p=50)$ = 59 Nm is the difference between water and air at 50 bar
$Delta M(p=150)$ = 57 Nm is the difference between water and air at 150 bar
The equation structure $(Delta M(p=150) - Delta M(p=50))/ (Delta M(p=50))$ is calculating:

How much the water-air difference changes between pressure levels
Normalized by the initial difference at 50 bar
Expressed as a percentage

The -3.4% result indicates that the difference in maximum bearable moment between water and air-filled pipes decreases only slightly (by 3.4%) when increasing pressure from 50 to 150 bar. This suggests that the advantage water has over air in terms of maximum bearable moment remains relatively constant across different pressure levels.
This is an important finding because it suggests that the fill medium's effect on maximum bearable moment is relatively pressure-independent - the superiority of water over air remains nearly constant regardless of the pressure level.

---
When analyzing the pressure effect on each medium, the following equations can be added after your existing text:

$ Delta M_"air"(150-50) &= M("air",p=150) - M("air",p=50)  \ 
&= (343 - 277) "Nm"   \
&= 66 "Nm" $<eq_new1>

$ Delta M_"water"(150-50) &= M("water",p=150) - M("water",p=50)  \ 
&= (400 - 336) "Nm"   \
&= 64 "Nm" $<eq_new2>

$ Delta kappa_"air"(150-50) &= kappa("air",p=150) - kappa("air",p=50) \ 
&= (2.7 - 1.65) space upright("m")^(-1)\
&= 1.05 space upright("m")^(-1) $<eq_new3>

$ Delta kappa_"water"(150-50) &= kappa("water",p=150) - kappa("water",p=50) \ 
&= (3.2 - 2.9) space upright("m")^(-1)\
&= 0.3 space upright("m")^(-1) $<eq_new4>

These equations show that:
1. The air-filled pipe's moment capacity increases by 66 Nm when pressure increases from 50 to 150 bar
2. The water-filled pipe's moment capacity increases by 64 Nm over the same pressure range
3. The air-filled pipe's maximum curvature increases by 1.05 m⁻¹
4. The water-filled pipe's maximum curvature increases by only 0.3 m⁻¹

This analysis reveals that while both media show increased capacity with higher pressure, the magnitude of improvement differs between air and water, particularly for curvature.