/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// INFO
// all refs
// all figs - the image data was not copied
// all eqs
// compared with true german text

// TODO proper justification why used and not why fem is used
// firt explain some basics aout beam model, then about optimiaztion, then the reasoining provided why beam model can be used with optimization over FEm and optimiaztion are more clear to understand in 4_Beam_Opti

=== Beam Model Fundamentals<chap_4_0_2>
// use it form not we form
In the previous @chap_4_0_1, we explained how aerodynamic loads are obtained and what additional steps are required to convert them into an desired input format for kmeans++ for the inital step of #gls("ld", long:true). 
Furthermore, it was mentioned that the 1d form of the resulting partial forces $F_(a,i,j)$ allow the incorporation of 1d beam models within optimization frameworks. 
This subsection aims to provide a detailed description of the beam model.
Key questions to be addressed include: what a beam model is, how it is used, its

// TODO is this actually true - or is it coveed in 4_Beam Opti part
advantages and disadvantages, what numerical optimization means, its objectives, what theoretical possibilities exist, and how the process was specifically implemented.


In many engineering programs, working with beam models is taught under the course name technical mechanics @Spura2019 @Gross2019 @Gross2021b @Gross2017 @Gross2021 @Rossow_2014.
This represents an efficient method that combines physics and mathematics.
Simplified geometry of a physical object are used to put forces acting at their respective positions.
Next, equilibrium conditions are established. 
Generally, the used coordinate system consists of a horizontal and vertical axis. Following that all forces are divided into horizontal and vertical force components.
It would be possible to rotate the coordinate system and divide the force components according to the rotated coordinate system, which can be helpful in some analyses.
For the further explanation of equilibrium conditions, a conventional non-rotated (horizontal, vertical) coordinate system is assumed.

Once the force components in the two directions are known, they can be set equal to zero according to static analysis.
However, if dynamic loading is considered, this cannot be set equal to zero and additional considerations are required @Gross2021a @Gross2023 @Gross2019a.
Static means that loads are at rest; they are applied once and remain constant in their load.
Dynamic loads are loads that change over time.
For the task of #gls("ld") only static forces with the beam model are elucidated.
In two dimensions, in addition to the force equilibrium condition, the moment balance is required.
Here, all moments about a chosen point are calculated and then set to zero.
This can be represented as @eq_88 to @eq_90 @Gross2021b.
Here, the index $i$ stands for the individual force, $x$ and $y$ for the force components in the respective direction, $M$ for the bending moment, the index $z$ for the imagined rotation axis pointing into the page plane, and $A$ is the local point about which the moment balance is formed.

$ sum F_(i,x) = 0 $ <eq_88> 
$ sum F_(i,y) = 0 $ <eq_89>

// rotation about z
$ sum M_(i,z)^(A) = 0 $ <eq_90>

The mathematical description can be extended to any number of dimensions, though more than three dimensions rarely makes sense in most engineering cases.
For a calculation in three dimensions, @eq_91 to @eq_96 can be used.
Here, the force balance in the third dimension is added through @eq_93 and the moment balances in the two remaining rotation axes in @eq_94 and @eq_95.

$ sum F_(i,x) = 0 $     <eq_91> 
$ sum F_(i,y) = 0 $     <eq_92>
$ sum F_(i,z) = 0 $     <eq_93>
$ sum M_(i,x)^(A) = 0 $  <eq_94>
$ sum M_(i,y)^(A) = 0 $ <eq_95>
$ sum M_(i,z)^(A) = 0 $ <eq_96>

The beam model can therefore be considered a simple physics-based method that can be applied analytically by engineers without numerical computational assistance.
One partial goal of the beam model is to determine support forces.
These are the forces acting at the selected support points.
Once the support forces are known, the internal forces can be calculated in the next step.
// maybe cutting beam model is not the best way to describe it?
The detailed process of cutting beam models will not be explained here; for this, refer to literature such as @Spura2019 @Gross2019 @Gross2021b @Gross2017 @Gross2021 @Rossow_2014.
However, the output of these internal forces includes the distributions of normal force, shear force, and moment.
Important relationships for calculating internal force distributions are given by @eq_97 to @eq_99 @Gross2021b.
Here, @eq_97 states that the derivative of the shear force $Q space.thin[#unit("N")]$ with respect to the spatial coordinate $x$ equals the negative distributed load $q space.thin [op("N/mm")]$.
@eq_98 states that the derivative of the bending moment $M space.thin [op("N mm")]$ with respect to the spatial coordinate $x$ equals the shear force $Q space.thin[#unit("N")]$.
Furthermore, @eq_99 shows the relationship between @eq_97 and @eq_98.
// it should be understood that the given units are mandated to always be in that form, you could also use N m or KN  and so on
The units are given to further help in understanding the differences between shear force, distributed load and bending moment.

$ (dif Q) / (dif x) = -q  $    <eq_97>
$ (dif M )/ (dif x) = Q  $     <eq_98>
$ (dif^2 M) / (dif^2 x) =  (dif Q) / (dif x) -q  $   <eq_99>

When @eq_97 to @eq_99 are inverted, @eq_100 to @eq_102 are obtained.

$ Q = - integral q dif x   $    <eq_100>
$ M = integral Q   dif x $     <eq_101>
$ M   = - integral integral q dif x dif x  $   <eq_102>

All equations from @eq_88 to @eq_102 can be used to calculate normal force and shear force distributions, as well as bending moment distributions, symbolic using computatioanl resources @Valipour2021 @Elham2021 @Kulyabov2021 @butt2021development as well analytically by hand.
The process can be automated and accelerated through programming support.
However, before moving on to this application, an illustrative example of a beam model and the resulting internal force distributions should first be given.
In @fig_70, the upper subplot shows the type of support, its posistion, the applied force distribution with its direction. In other words it provides all relevant infromation in order to solve the beam model problem through the mentioned equations. The lower subplot shows the resulting support reaction forces.


// --------------------------------- figures -------------------------------- //
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/2_Beam_Model/0_Beam_Example.svg", 
  width: 100%),
  caption: [Exemplary representation of a bending beam model. The upper subplot shows the support and the applied loads. The lower subplot shows the resulting support forces],
)<fig_70>


@fig_71 shows the resulting internal force distributions, where the first plot shows the normal forces, the second the shear forces and the final subplot that bending moment distribution.
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/2_Beam_Model/1_Beam_Example.svg", 
  width: 100%),
  caption: [Exemplary representation of the internal force distributions from @fig_70],
)<fig_71>

// use it form and adapt fore phd writing
Having provided some initral basics about beam modeling and depicted the obtained results, the focus shall be set on the computaitonal implementaiton.
While, as mentioned it is possible to solve beam models anayltically on paper, it is not a suitable approach for integrating it into numeircal optimiaztion.
In order to leverage optimiaztion procedure the beam model solver needs to be available as an execute numerical code. 
// the word following is repeated in the upcoming sentces - too close. rephrase it
The choice of the programming language is of pivotal importance for applied science. Thus, special attention to it shall be given in the following.
In the Python programming language @van1995python, there open-source implementaitons available, which makes it possible to work analytically on the computer, that is symbolically.
The latter is one reason why Python can be considered as a proper choice for developing the beam solver in this language.
Besides this crucial point, more reasoning on the choice of Python as the numerical computational language are given in the following.
// ------------------------- python implementations ------------------------- //
Python is a programming language used in various fields
@AliAkbari2024 @Trost2023 @Ries2024 @Barneschi2024 @Gardner2024 @Kuo2024 @Lewthwaite2024.
This includes both scientific and non-scientific areas.
Python attracts its users with three main factors.
First is the simple language syntax and the small number of lines of code required for a task.
Secondly, Python is a quite advanced programming language that comes with various functions.
Finally, it is particularly popular in scientific circles due to the large number of freely available and high-quality libraries.
The Python community usually uploads their tools to #gls("github").
Here, users can communicate with each other, report problems, conduct plausibility investigations, discuss desired new features, and jointly test and develop.

// repeated word "often"
Documentations to the tools is often also made available on #gls("github").
Often, other scientists from different fields have similar problems, so partial solutions can be found on #gls("github").
Particularly popular libraries in the Python world are libraries for machine learning, deep learning, and scientific numerical mathematics.
A comprehensive description would not be justified within the scope of this work, so the following should be noted.
Besides #gls("github"), there are various forums, blogs, online tutorials, scientific papers, and books that explain how to work with Python in general, focusing specifically on a library or on scientific branches.
Furthermore, it should be mentioned that the freely available libraries help modern scientists work faster.
If these libraries were not available, much would have to be made from scratch, which could take months or, in the case of very high-quality differential equation solvers like Fenics
@alnaes2015fenics @Boyko2024 @Burman2024 @Burman2024a @Yang2024a @Zhang2024a,
possibly years.
Very high-quality libraries are dissertation results or code written and verified by an entire department in a company.
An example of an open-source library that, among other things, brought out OpenAI's ChatGPT and is used and developed by various companies and scientific institutions is PyTorch
@Paszke2019 @Wei2024 @Buehler2024 @Huang2023 @Hu2024 @Chen2024a.

Having provided some background on why Python was chosen for the beam model solver, the library SymPy @meurer2017sympy @Virtanen2020a should be considered. It allows to perform computer-aided analytical mathematics and is applied in various scientific works @NEURIPS2023_4a47dd69 @Wang2024a @Yamamoto2024 @Liu2024 @Grohs2024.
Examples for computer-aided analytical mathematics include the calculation of integrals, differentials, solving systems of equations, and other important Linear Algebra operations. 
If the described equations are used and transferred into a SymPy representation,
the internal force distributions can also be obtained as analytical equations.
With it the beam modeling is accelerated through computational power.
Furthermore this allows to incorporate the beam model solver into numerical optimization frameworks.
The idea of a computational beam model solver was implemented for instance in the open-source library SymBeam @symbeam_tool.
While there are other alternatives SymBeam was initially chosen due to the comprehensive documentation and easy handling on the other hand.
While there are advantages of openly available solvers, for proper scientific ethics funcantily checks are required. Thus. before integrating the beam solver based on SymBeam @symbeam_tool, it was compared against various beam models for which the solution was available through text books, such as @Gross2021b.
Since, unexpected issues were encountered, the source code was examined in detail and corrected accordingly.
With these corrections a computational beam solver could be integrated into an optimization framework.

However, focusing on #glspl("swith") and real world application, the support will be defined in 3d. 
To be able to transfer the actual support from the three-dimensional model into a one-dimensional beam model in a two-dimensional coordinate system, it might not be sufficient in practice to calculate only statically determinate systems.
When transforming the support conditions from three dimensions to 2 dimensions, the physical behavior must be understood in detail and to make assumptions that would allow the 2d support mapping.
This could leads to a statically indeterminate support.
Since SymBeam is limited to solving statical determined beam models, the opensource alternative #emp_[IndeterminateBeam] @interdetbeam_tool was chosen.
The availabiliy of another implementation for a computational beam solver strenthen the choice of Python. 
Similar to SymBeam, more than 20 beam models were created with IndeterminateBeam.
Their results were compared with sample solutions from textbooks, and it could be determined that the implementation of IndeterminateBeam is already correct and no modication is required.
Results of five statically determindes and five indeterminated beam models are depicted in @fig_Ap_0 to @fig_Ap_6 and @fig_Ap_7 to @fig_Ap_11 in @chap_Append_0, respectively.



Finally it can be said that IndeterminateBeam @interdetbeam_tool was chosen as the computaitonal beam model solver, it was valitaed with known solutions of beam models and it can be incorporated into existing numerical optimiaztion frameworks.


// --------------------------------- summary -------------------------------- //
// summary based on the provided text above is missing
// #summary_([


// ])