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
For #glspl("swith") applications, the interrelation between fill medium, internal pressure, and external loads merits careful consideration. @fig_31 and @fig_32 present the internal pressure effects for water and air respectively across multiple pressure levels [0, 50, 100, 150] bar. 
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
$400 "Nm"$ and $3.2 space upright("m")^(-1)$ respectively.
These comparative results demonstrate that under constant internal pressure conditions, water-filled pipes consistently achieve higher maximum curvature and maximum bending moment values compared to their air-filled counterparts.
This pattern indicates that the choice of fill medium significantly influences the pipe's bending behavior. 

// ----------------------------- pressure impact ---------------------------- //
The impact of pressure with respect to the maximal bearable bending moment is given in terms of qunaitifcale numbers is given in @eq_20 and @eq_21.
For air-filled pipes, following @eq_20 the maximum bending moment increases from $50 "bar"$ to $150 "bar"$ by $66 "Nm"$, and according to @eq_21 water-filled pipes, show a similar increase of $64 "Nm"$. 

$ Delta M_"air"(150-50) &= M("air",p=150) - M("air",p=50)  \ 
&= (343 - 277) "Nm"   \
&= 66 "Nm" $<eq_20>

$ Delta M_"water"(150-50) &= M("water",p=150) - M("water",p=50)  \ 
&= (400 - 336) "Nm"   \
&= 64 "Nm" $<eq_21>

This comparable increase in moment capacity as highlgihted in @eq_22 suggests that the pressure effect on maximum bending moment from $50 "bar"$ to $150 "bar"$ is relatively consistent across both media. 

$ Delta M_"air"(150-50) -  Delta M_"water"(150-50) &= (66 - 64) "Nm"   \
&= 2 "Nm" $<eq_22>

However, the curvature behavior forn increasing the internal pressure from $50 "bar"$ to $150 "bar"$ exhibits markedly different characteristics. 
Air-filled pipes, following @eq_23, demonstrate a substantial increase in maximum curvature of $1.05 space upright("m")^(-1)$, while according to @eq_24, water-filled pipes show a more modest increase of $0.3  space upright("m")^(-1)$ 

$ Delta kappa_"air"(150-50) &= kappa("air",p=150) - kappa("air",p=50) \ 
&= (2.7 - 1.65) space upright("m")^(-1)\
&= 1.05 space upright("m")^(-1) $<eq_23>

$ Delta kappa_"water"(150-50) &= kappa("water",p=150) - kappa("water",p=50) \ 
&= (3.2 - 2.9) space upright("m")^(-1)\
&= 0.3 space upright("m")^(-1) $<eq_24>

This significant difference in curvature response to pressure increase, as shown in @eq_25, indicates that the pressure effect on maximum curvate from $50 "bar"$ to $150 "bar"$ is not consistent across both media

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



It is essential to note that the proivded equations and their inrepreatiosn, while being correct, need to be viewed under the given constraint of limited data.
In order to obtain more reliable results, more data is required. 
This includes, conducitng the same tests multiple time, but also have a finer pressure change resultion, instead of just four pressure values ([0,50,100,150] bar).
Next, for #glspl("swith") higher pressure values, bigger diamter, higher lenghts and Type IV tanks are required.
The pipes used in @Liu2019 are made of steel and have a diameter of $25 "mm"$ and a length of $750 "mm"$.
Nevertheless, there is an obvious motivation to conduct similar tests with adjusted settings using Type IV tanks.
If sufficent data would be available, statics could be used to provide valueable insights.
One example is wheter it is possible to tell the maximal bending moment or maximal curvate of filling agent A when infromation about filloing agent B are available.
This would be possible by first caluclating a vector of difference following @eq_18.
With it the mean difference across all pressure levels can be computed according to @eq_19.
The variables are denoted as the number of maxmimal bending moment mesaurements $n$, pressure $p_i$, and the filling agents A and B.

$ Delta M_i = M("A",p_i) - M("B",p_i) $<eq_18> 
$ overline(Delta M) = 1/n sum_(i=1)^n Delta M_i $<eq_19> 

The standard deviation of these differences would then be calculated using @eq_26 @Papula2016. 

$ sigma = sqrt(1/(n-1) sum_(i=1)^n (Delta M_i - overline(Delta M))^2) $<eq_26>

If the standard deviation is small relative to the mean difference, indicated by a coefficient of variation ($sigma/overline(Delta M)$) less than 0.1 or 10%, this would demonstrate a rather consistent relationship between the two media across pressure levels. 
Such consistency would enable the prediction of the maximal bending moment of meidum B, if the maximal bending moment of meidum A is known. 
Such infromation are hihgly helpful when deciding wheter a igniteable gas could be replaced with a fluid.
It could also answer typical engineering question like: Can it always be claimed that water-filled pipes, regardless of pressure level, always show 3 times more [Nm] or [$upright("m"^(-1))$] than air-filled pipes.


// TODO - harsh transition
Standards such as #gls("iso") 11119-3:2020 @11119_3_ISO are globally recognized. Section 8.5.1.1 of #gls("iso") 11119-3:2020 explains the procedure for pressure testing verification. It explicitly states that water can be used as a fill medium. Depending on the result of the proposed test, the International Organization for Standardization should be informed about the results.

// TODO - harsh transition
Another example: In @Cebolla2019, it is stated that helium and nitrogen are used as fill media in the European Union's high-pressure gas tank testing facility in the Netherlands (GasTeF). While both are gases, they do not have the same material properties as gaseous hydrogen. Using water or gases other than hydrogen as fill media for the certification and approval process, and the application of gaseous hydrogen in actual operation, could lead to extremely negative and unexpected phenomena. Because if water as a fill medium allows higher bending moments and curvatures without failure than the hydrogen used in operation, then the aircraft would be approved for inadmissibly high structural loads.

The reason why air-filled pipes can withstand lower maximum bending moments than water-filled pipes is not known to the author of this work. However, there is a conceptual model that could explain this phenomenon. Gas is modeled with particles that vibrate and move. They move without collision until the mean free path is exceeded. Due to this mean free path, there is a free space that is filled when a pressure load is applied. In other words: gases can be highly compressed, while liquids can barely be compressed. The following should be imagined: a pipe is filled until no space remains for the liquid to slosh. Now the water should be subjected to a pressure load. If the water has no space to escape, then the water could become part of the actual structure, according to this conceptual model.

The internal pressure pushes the water against the entire inner surface of the tank. As a result, loads acting externally on the tank can be absorbed on the tank's surface by the pressurized water and transferred to other parts of the tank surface. The pressurized water would serve as a load transfer element. The higher the internal pressure, the closer the fluid particles are to each other. Consequently, it is assumed that load transfer should be more effective in compressed liquids than in uncompressed gases.

The same model can also explain why gas as a fill material exhibits lower maximum bending moments. Gas provides particles more space to escape. Thus, higher pressures are required to bring the particles as close together as in liquids. Consequently, the effect of load transfer in gas is less than in liquids. Although further investigations could be considered important, this thesis lacks financial resources, personnel, and planned time for conducting additional experimental investigations. However, further simulative results can be conducted within a reasonable timeframe. These will be elaboroted in next @chap_3_0_2 section.

// --------------------------------- summary -------------------------------- //
In summary, it can be said that under static external loading, the internal pressure and the choice of medium can have an important, non-negligible influence on the maximum bearable bending moment and curvature behavior.

