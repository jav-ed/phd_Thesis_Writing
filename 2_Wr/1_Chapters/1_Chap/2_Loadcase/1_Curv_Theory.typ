/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */


// TODO
// Title Check
=== Theoretical Background of Impact Filling Agent<chap_3_0_1>

In the previous sections, the properties of hydrogen were first listed. These were then evaluated with regard to safe experimental feasibility. The results revealed significant safety concerns regarding the use of hydrogen in physical tests. Subsequently, the influence of dynamic external loads on pressurized cylinders was investigated. The evaluations were well received by the industry partner (IMA), and the question of the fill medium's influence on structural behavior under external static loading was deemed particularly important. The following section presents initial findings on this matter.

First, let's consider an area that might show similarities with K2H2: the testing of diving cylinders. Of particular interest for K2H2 is how the diving cylinder is loaded externally. Assuming the diving cylinder rests statically at a certain water depth, a static all-encompassing external pressure load can be assumed. During the approval process, the cylinder is first filled with water and then placed in a larger vessel, which is also filled with water. The larger container is sealed from above so that no water can escape. Subsequently, an initial internal pressure of 3000 psig ≈ 208 bar is generated in the diving cylinder. After that, the pressure is increased by a factor of 5, reaching pressure values up to 5000 psig ≈ 345 bar. Further information about the procedure can be found in regulations 49 CFR Part 180. However, no helpful conclusions can be drawn for K2H2 for the following two reasons. First, the tank cylinder is significantly smaller than the wing tanks used in K2H2. Second, an external load distribution that varies across the wingspan must be applied. This differs significantly from a uniform surface pressure load. In the described test for the diving cylinder, the measurement technology was mainly limited to measuring the water escaping from the large vessel. When the diving cylinder is pressurized, some water escapes from the surrounding vessel. This is usually directed through a hose into a glass on a scale. For K2H2, on the one hand, the measurement technology is significantly more demanding, and on the other hand, there must be the possibility to apply loads that vary across the wingspan.

A study from which new insights for K2H2 can be derived is [28]. Here, a pipe was filled with different media at various pressures and bent. The investigated media were air, water, and sand, and the pressure levels were [0, 10, 50, 100, 150] bar. The setup of the bending test is shown in Figure 21, where the pipe is located in the middle and held by two supports. It should be noted that the test equipment shown here was designed to prevent partial collapse through large local plastic deformations, in contrast to the commonly used three- and four-point bending devices. Thus, it could be used to determine global bending failure without errors due to high local deformations.

Figure 21 shows the setup of the bending test in [28].

In Figure 22, the bending moment M versus curvature κ is shown without additional internal pressure. The influence of the chosen fill medium of the pipe is clearly visible. Sand exhibits the highest maximum curvature. However, its maximum bending moment is similar to that of the water-filled pipe. When comparing water as a fill medium with air, it can be observed that water-filled pipes can withstand both a higher maximum moment and a larger maximum curvature.

Figure 22: Moment M and curvature κ of a pipe with different media and without internal pressure [28]

In relation to K2H2, information about the fill medium, internal pressure, and external loads is important. In Figure 23 for water and in Figure 24 for air, only the internal pressure values with a single medium are given. The influence of pressure is evident in the increasing maximum moments and curvatures that can be sustained.
This influence is found for both air and water as filling media. A direct comparison between the influence of different fill media and pressure changes is given in Figure 25. At a constant pressure of 50 bar for water and air, it shows that the water-filled pipe can withstand higher bending moments and curvatures than the air-filled pipe. The same behavior is observed with varying pressure.


Figure 23: Behavior of moment M and curvature κ for a water-filled pipe at different pressure levels [28]
Figure 24: Behavior of moment M and curvature κ for an air-filled pipe at different pressure ratios [28]


The maximum bending moment and maximum curvature of an air-filled pipe at a pressure of 50 bar are 277 Nm and 1.65 m-1. In contrast, the maximum bending moment and curvature of a water-filled pipe at a pressure of 50 bar are 336 Nm and 2.9 m-1. Increasing the pressure to 150 bar leads to bending moments and curvatures for air and water of 343 Nm and 2.7 m-1, and 400 Nm and 3.2 m-1 respectively. The comparisons show that at constant internal pressure, the maximum curvature and maximum bending moment are higher in the water-filled pipe than in the air-filled pipe. This leads to the conclusion that the fill medium of the pipe is an important factor influencing bending behavior. The deviation between the air- and water-filled pipe in terms of maximum bending moment and curvature at an internal pressure of 50 bar is given in equations (6) and (7) respectively. The same is given for 150 bar in equations (8) and (9).

[Figure 25: Comparison of moment M and curvature κ for air and water as fill medium for different pressure levels [28]]

ΔM(p=50) = M(water,p=50) - M(air,p=50) = 336 - 277 = 59 [Nm] (6)

Δκ(p=50) = κ(water,p=50) - κ(air,p=50) = 2.9 - 1.65 = 1.25 [m-1] (7)

ΔM(p=150) = M(water,p=150) - M(air,p=150) = 400 - 343 = 57 [Nm] (8)

Δκ(p=150) = κ(water,p=150) - κ(air,p=150) = 3.2 - 2.7 = 0.5 [m-1] (9)

The next subject of investigation is whether the ratio of deviations in maximum bending moments and curvatures between air- and water-filled pipes remains constant when pressure levels are changed. To make an initial rough estimate of whether a deviation in maximum bending moments between air- and water-filled pipes is detectable at different pressure levels, equation (10) should be considered. It can be noted that the deviation of maximum bending moments between air- and water-filled pipes is reduced by only about 3.4%. This initially suggests that the existing difference in maximum sustainable bending moments between air- and water-filled pipes has low pressure sensitivity. Thus, a change in pressure would have little influence on the existing difference in maximum possible bending moment between air- and water-filled pipes.
To clarify what the result means, it should be rephrased in different words. It answers the question of whether the ratio of deviations in maximum bending moments and curvatures between air- and water-filled pipes remains constant when pressure values are changed. It can be viewed as pressure sensitivity in relation to bending moment and curvature with different fill materials. A typical engineering question might be: Can it always be claimed that water-filled pipes, regardless of pressure level, always show 3 times more [Nm] or [1/m] than air-filled pipes? With a value of 3.4%, for a selected fill medium, it can be assumed that the approximate maximum bending moment of one fill medium can be inferred from the known maximum bending moment of the other fill medium.

(ΔM(p=150) - ΔM(p=50))/ΔM(p=50) = (57 - 59)/59 = -0.0338 ≈ -3.4% (10)

For the pressure sensitivity regarding the deviation of maximum curvature between air- and water-filled pipes, equation (11) is given. The equation in words: The deviation of maximum curvature between air- and water-filled pipes at 50 bar and 150 bar is reduced by about 60%. Consequently, it can be determined that, in contrast to the observation of bending moment, the pressure sensitivity regarding the deviation of maximum curvatures for air- and water-filled tanks is high.

(Δκ(p=150) - Δκ(p=50))/Δκ(p=50) = (0.5 - 1.25)/1.25 = -0.6 ≈ -60% (11)

With the aim of relating the findings through the use of different fill materials to the K2H2 project, the following can be worked out. First, the pipes used in [28] are made of steel and have a diameter of 25 mm and a length of 750 mm. The pipes used in K2H2 are Type IV tanks, which are composite constructions. Moreover, diameter and lengths differ significantly from [28]. Additionally, K2H2 requires higher pressure levels. Nevertheless, there is an obvious motivation to conduct similar tests with adjusted settings using Type IV tanks. If the same or similar effects as described above are observed, the selection of the fill medium for the certification process could be decisive. Standards such as ISO 11119-3:2020 are globally recognized. Section 8.5.1.1 of ISO 11119-3:2020 explains the procedure for pressure testing verification. It explicitly states that water can be used as a fill medium. Depending on the result of the proposed test, the International Organization for Standardization should be informed about the results.

Another example: In [9], it is stated that helium and nitrogen are used as fill media in the European Union's high-pressure gas tank testing facility in the Netherlands (GasTeF). While both are gases, they do not have the same material properties as gaseous hydrogen. Using water or gases other than hydrogen as fill media for the certification and approval process, and the application of gaseous hydrogen in actual operation, could lead to extremely negative and unexpected phenomena. Because if water as a fill medium allows higher bending moments and curvatures without failure than the hydrogen used in operation, then the aircraft would be approved for inadmissibly high structural loads.

The reason why air-filled pipes can withstand lower maximum bending moments than water-filled pipes is not known to the author of this work. However, there is a conceptual model that could explain this phenomenon. Gas is modeled with particles that vibrate and move. They move without collision until the mean free path is exceeded. Due to this mean free path, there is a free space that is filled when a pressure load is applied. In other words: gases can be highly compressed, while liquids can barely be compressed. The following should be imagined: a pipe is filled until no space remains for the liquid to slosh. Now the water should be subjected to a pressure load. If the water has no space to escape, then the water could become part of the actual structure, according to this conceptual model.


The internal pressure pushes the water against the entire inner surface of the tank. As a result, loads acting externally on the tank can be absorbed on the tank's surface by the pressurized water and transferred to other parts of the tank surface. The pressurized water would serve as a load transfer element. The higher the internal pressure, the closer the fluid particles are to each other. Consequently, it is assumed that load transfer should be more effective in compressed liquids than in uncompressed gases.

The same model can also explain why gas as a fill material exhibits lower maximum bending moments. Gas provides particles more space to escape. Thus, higher pressures are required to bring the particles as close together as in liquids. Consequently, the effect of load transfer in gas is less than in liquids. Although further investigations could be considered important, K2H2 lacks financial resources, personnel, and planned time for conducting additional experimental investigations. However, further simulative results can be conducted within a reasonable timeframe. These will be discussed in the next section.

In summary, it can be said that under static external loading, the internal pressure and the choice of medium can have an important, non-negligible influence on the maximum sustainable bending moment and curvature behavior.

