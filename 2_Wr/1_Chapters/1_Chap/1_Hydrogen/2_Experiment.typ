/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// TODO 
// title
=== Experiments and Simulation of and with Hydrogen<chap_2_0_2>

In this section, the previously theoretically conveyed knowledge about hydrogen will be expanded through insights from experimental and simulative investigations with hydrogen for practical application. Based on this, relevant statements for K2H2 will be made.

The first investigation is dedicated to pressure shocks. These occur when supersonic velocities arise locally at one point. Pressure shocks are complex phenomena and shall only be explained here to the extent necessary for understanding the results. The effects of pressure shocks cause the following three central points:

1) Very high pressures arise.
2) The temperatures can be extreme and reach several thousand Kelvin
   (3000 K in @Xu2009).
3) High and rapid pressure changes lead to air sound, which necessitates hearing protection

In @Xu2009, an attempt was made to simulate the effect of pressure shocks. The hydrogen is initially compressed at 250 bar in a pressure vessel. This is supposed to flow out into the free atmosphere through a nozzle. The results of the simulation are shown for different times after exiting the nozzle in Figure 15. The Mach number indicates the multiple of the speed of sound. A Mach number of 5 means that locally five times the speed of sound prevails.

[Figure 15: Simulative investigation of hydrogen release into the free environment from a pressure vessel standing under 250 bar. Mach number contours can be seen at 6 different time points @Xu2009]

In Figure 15, it can be seen that the Mach scale goes up to a maximum value of 7. Already at a value of 1, pressure shocks result with the already mentioned consequences. But at such high Mach numbers, it is to be expected that high temperatures, high pressures, and high volume are multiplied many times over. To better interpret these results, Figure 16 should be considered. Each medium has its own specific speed of sound, which in simple words reproduces how pressure changes or sound propagate in a medium. If the speed of sound of a substance is high, then the information transmission speed is correspondingly high. For example, if one end of a steel rod is struck, the sound is transmitted to the other end of the rod at a speed of 7850 m/s and thus audible there. The speed of sound of hydrogen at 20°C and 1 bar is 1300 m/s, which is significantly higher than that of air (343 m/s). This results in the exchange of information within hydrogen occurring faster than in air. This is one of the important considerations to understand what to expect when pressurized hydrogen is released into the free atmosphere.

[Figure 16: Speed of sound of various substances. Gases at 20°C; 1 bar @Sigloch2022]

As soon as air reaches a speed of 343 m/s, the first pressure shock occurs, which leads to, among other things, a high temperature increase. Hydrogen, on the other hand, can increase its speed by almost 4 times before a pressure shock occurs. A possible explanation for why pressure shocks generate such high temperature increases could be the following. When the air atoms do not have enough time to adapt to a pressure change because the information transport is too slow, the atoms are abruptly forced to change. An airplane flying at supersonic speed hits the air atoms without the air atoms having received the information about the approaching airplane beforehand. As a result, the air particles cannot avoid the airplane and many hard impulsive collisions occur. This results in a lot of friction, which in turn manifests itself through the conversion of kinetic energy into heat energy (increase in temperature). The temperature contours associated with Figure 15 are given in Figure 17. The high temperatures up to 2900 K are as high as would be expected in explosions.

The derived model should be applied to the results. The hydrogen flows out into the free environment. The outflow velocity of the hydrogen is already higher than the speed of sound of the surrounding air. This means that the air would already suffer a pressure shock and develop very high temperatures. The hydrogen itself, however, would not have reached its own speed of sound and would therefore not generate its own pressure shock. The high temperatures in the vicinity of the hydrogen, caused by the air pressure shock, may not lead to immediate detonation by hydrogen. But hydrogen moves in the air and diffusion processes take place. As soon as an ignitable concentration in the oxygen-hydrogen mixture is reached, the surrounding temperature is sufficient and ignition up to detonation occurs.

[Figure 17: Simulative investigation of hydrogen release into the free environment from a pressure vessel standing under 250 bar. Temperature contours can be seen at 6 different time points @Xu2009]


// TODO see:
// https://www.sciencedirect.com/topics/physics-and-astronomy/spontaneous-combustion
// self/auto/spontaneous -  ignition/cumbustion
Ignitions in which no obvious external ignition sources are used are referred to as self-ignitions or spontaneous ignitions. 

A work in which various theoretical models (reverse Joule-Thomson effect, electrostatic ignition, brush discharges, corona discharges, diffusion ignition, sudden adiabatic compression, hot surface ignition) for self-ignition are mentioned is @astbury2007spontaneous. 
Compression ignition, Joule-Thomson expansion, diffusion ignition, and ignition by hot surfaces are said to be unlikely ignition mechanisms for most unintentional releases of hydrogen at ambient temperature. Moreover, it is also quite possible that several of the mentioned mechanisms together would produce a self-ignition. In @dryer2007spontaneous, intensive experimental investigations on the outflow of pressurized hydrogen into the free environment are carried out. Furthermore, it was noted here that simple 1-D shock calculations would suggest the following. The sudden release of compressed methane and natural gas can also cause spontaneous ignitions. This, however, at considerably higher compression pressures than with hydrogen.

The next work to be discussed in detail is @jallais2017effects. In the experiment presented therein, the effect of oxidizing agents, such as air, pure oxygen O₂, nitrous oxide N₂O, and acetylene C₂H₂, on the spontaneous ignition of hydrogen was investigated. The various oxidizing agents flow perpendicular to the hydrogen jet. Similar to the investigations already discussed, the hydrogen is also released here from a high-pressure vessel through a nozzle into the atmosphere. However, this atmosphere is now flowed through by various oxidizing agents, which represents a significant difference from earlier investigations with a free atmosphere. For the experiments, a straight expansion tube with a diameter of 4 mm and a length of 10 cm was used. The spontaneous ignition was observed with a high-speed camera and the external overpressures were measured.

The results of the experiments in @jallais2017effects are shown in Figure 18. These illustrate the influence of the pressure in the hydrogen container and the ambient gas on causing a possible self-ignition.

[Figure 18: Influence of pressure in the hydrogen container and surrounding gas atmosphere on the self-ignition of a hydrogen jet @jallais2017effects]

First, it can be seen from the results in Figure 18 that increasing pressure in the hydrogen container increases the probability of self-ignition. Furthermore, it can be noted that at low pressure values, self-ignition could be avoided in all investigated gas environments. Preventing unwanted hydrogen ignitions is considered one of the most important safety requirements for the application of hydrogen in practice. If focusing exclusively on this criterion, the following conclusions can be drawn. Oxygen O₂ as the ambient gas leads to the most unsafe working conditions for working with hydrogen. Pure air and nitrous oxide N₂O, which according to the results are preferable, are nevertheless classified as unsafe by the author of this report. Only acetylene C₂H₂, which represents a combustible gas, could meet the safety requirements for p < 230 bar.

Various literature sources, some of which are mentioned in @Rosen2018, can be used to derive recurring essential parameters to minimize the probability of occurrence of self-ignition. These are found in Table 25.

[Table 25: Choice of influence parameters to avoid the probability of occurrence of hydrogen self-ignition and other known influence parameters.]

1) Keep pipe length short <<
2) Keep container diameter small <<
3) Keep compression pressure in the container low <<

Other influencing factors:
4) Geometry of the exit area
5) Size of the outer surface into which H₂ flows out (can accumulations of the gas arise?)
6) Gas or medium in the external environment
7) External pressure
8) External temperature

To apply the collected knowledge to the project in K2H2, some points should be reconsidered. The hydrogen is to be used in an experimental investigation and it is under very high pressure. Assuming a working nominal pressure of 300 bar and a burst factor of 2.25, at least 675 bar must be applied for a burst test. It involves 4 structurally integral CFRP tanks with a length of 9.2 m. The experimental investigation requires the attachment of various measuring devices, lines to get the hydrogen into the tanks on the one hand and to generate the pressure on the other hand. In addition, a method is needed to apply the aerodynamic loads. The listed points show considerable safety concerns. While handling hydrogen is already dangerous at comparatively low pressures, the K2H2 wing represents an innovative technology. At the time of writing this report, there are no publicly accessible or known comparable investigations for this.

Nevertheless, to achieve the best possible results with the available resources, extensive investigations were carried out to define a suitable alternative filling medium.

The results from Figure 18 show that it should be theoretically possible to eliminate one of the critical safety concerns. To prevent self-ignition or detonation from occurring, the working environment would have to be placed under protective gas. In the work @jallais2017effects, it was shown that acetylene exhibits particularly positive safety-enhancing properties. But helium, for example, has a fairly high speed of sound (according to Figure 16: 1005 m/s) and on the other hand is a noble gas. Therefore, helium may be more suitable as an ambient gas than acetylene. Noble gases have their outer shells completely filled with valence electrons and are therefore difficult to get to react. Other possibilities would be the remaining noble gases (Ne, Ar, Kr, Xe, Rn, Og). To make a decision, further experimental investigations would have to be carried out first. The goal should be to answer the question of whether helium, other noble gases, and other desired gases can prevent self-ignition of hydrogen. For this, the gases must form the free atmosphere as in the experiment of @jallais2017effects. If the results are positive and ordinary mouth-nose masks can offer sufficient health safety to the personnel, the next step of evaluation can be initiated. In this, an optimal gas must be selected according to cost and availability. But even if the safe application of hydrogen were now realized, other questions arise that concern the measurement technology. What influences do the respective gases have on surrounding hardware, especially on measurement accuracy? This question requires intensive research, possibly simulations, and with high probability experiments.

In summary, it can be said that hydrogen has, as the author of this report finds, highly appealing and positive properties. But on the other hand, both simulative and experimental investigations have shown that working with hydrogen can be associated with considerable safety concerns. Due to the high safety requirements, there is a possibility that for the experimental structural test, the state of the art is not sufficient to fill the tanks with hydrogen.


