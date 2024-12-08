/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// INFO
// all refs
// all figs - the image data was not copied
// all eqs
// compared with true german text



=== Beam Model Fundamentals<chap_4_0_2>

The previous @chap_4_0_1 explained how aerodynamic loads are obtained and what steps are required to convert them into a suitable input format for k-means++ during the initial step of #gls("ld", long:true). 
It was also mentioned that the one-dimensional representation of the resulting partial forces $F_(a,i,j)$ enables the integration of one-dimensional beam models within optimization frameworks. 
This subsection provides a mathematical description of beam modelling. It addresses fundamental questions about its definition, application, and computational implementation
The examination of optimization fundamentals follows in @chap_4_0_3. Subsequently, @chap_4_0_4 analyzes the incorporation of beam models within optimization frameworks and assesses their advantages and limitations compared to alternative approaches.

// -------------------------------------------------------------------------- //
In many engineering programs, beam model analysis is taught within the framework of technical mechanics @Spura2019 @Gross2019 @Gross2021b @Gross2017 @Gross2021 @Rossow_2014. The approach represents an efficient method that integrates fundamental principles of physics and mathematics. The analysis begins with a simplified geometric representation of physical objects, where forces are applied at their respective positions. Following this simplification, equilibrium conditions are determined.
The standard coordinate system employed consists of horizontal and vertical axes, with forces decomposed into their respective directional components.
While it is possible to utilize a rotated coordinate system and decompose forces accordingly for specific analyses, the subsequent explanation of equilibrium conditions assumes a conventional non-rotated (horizontal, vertical) coordinate system.
In static analysis, force components along both directions are set to zero. However, dynamic loading scenarios require additional considerations, as these components cannot be zeroed @Gross2021a @Gross2023 @Gross2019a. 
Static loading refers to conditions where forces remain constant after initial application, while dynamic loads exhibit temporal variations. For the purpose of #gls("ld"), the analysis focuses exclusively on static forces within the beam model framework.

The two-dimensional analysis necessitates both force equilibrium and moment balance conditions. The latter involves calculating moments about a selected point and setting their sum to zero. These conditions are mathematically expressed in @eq_88 to @eq_90 @Gross2021b. In these equations, the index $i$ denotes individual forces, while $x$ and $y$ represent force components in their respective directions. The symbol $M$ indicates the bending moment, with index $z$ representing the rotation axis perpendicular to the page plane, and $A$ denoting the local point about which the moment balance is calculated.

// -------------------------------------------------------------------------- //
$ sum F_(i,x) = 0 $ <eq_88> 
$ sum F_(i,y) = 0 $ <eq_89>

// rotation about z
$ sum M_(i,z)^(A) = 0 $ <eq_90>

The mathematical formulation can be generalized to n-dimensional space, although practical engineering applications typically limit consideration to three dimensions. The three-dimensional analysis utilizes equations @eq_91 to @eq_96. The system incorporates force balance in the third spatial dimension through @eq_93, while @eq_94 and @eq_95 address moment balances about the remaining rotational axes.

$ sum F_(i,x) = 0 $     <eq_91> 
$ sum F_(i,y) = 0 $     <eq_92>
$ sum F_(i,z) = 0 $     <eq_93>
$ sum M_(i,x)^(A) = 0 $  <eq_94>
$ sum M_(i,y)^(A) = 0 $ <eq_95>
$ sum M_(i,z)^(A) = 0 $ <eq_96>

The beam model represents a fundamental physics-based methodology that engineers can apply through analytical means without computational assistance. A primary objective of beam model analysis is the determination of support forces, which act at designated support points. The calculation of internal forces follows the determination of these support forces.
The method of sections, while not detailed here, provides the theoretical foundation for internal force analysis. For comprehensive treatment of this method, readers are directed to @Spura2019 @Gross2019 @Gross2021b @Gross2017 @Gross2021 @Rossow_2014. The analysis yields distributions of normal force, shear force, and bending moment throughout the beam structure.
The fundamental relationships governing internal force distributions are expressed in @eq_97 to @eq_99 @Gross2021b. 
@eq_97 establishes that the spatial derivative of the shear force $Q space.thin[#unit("N")]$ with respect to coordinate $x$ equals the negative distributed load $q space.thin [op("N/mm")]$. 
Similarly, @eq_98 defines the spatial derivative of the bending moment $M space.thin [op("N mm")]$ with respect to coordinate $x$ as equal to the shear force $Q space.thin[#unit("N")]$. 
The relationship between these derivatives is further captured in @eq_99. 
The units were provided as an auxiliary means to distinguish between shear force, distributed load, and bending moment quantities.

$ (dif Q) / (dif x) = -q  $    <eq_97>
$ (dif M )/ (dif x) = Q  $     <eq_98>
$ (dif^2 M) / (dif^2 x) =  (dif Q) / (dif x) -q  $   <eq_99>

Through integration of @eq_97 to @eq_99, the corresponding expressions in @eq_100 to @eq_102 are obtained.

$ Q = - integral q dif x   $    <eq_100>
$ M = integral Q   dif x $     <eq_101>
$ M   = - integral integral q dif x dif x  $   <eq_102>

// ---------------------------------- here ---------------------------------- //
All equations from @eq_88 to @eq_102 can be used to calculate normal force and shear force distributions, as well as bending moment distributions, symbolic using computatioanl resources @Valipour2021 @Elham2021 @Kulyabov2021 @butt2021development as well analytically by hand.
The process can be automated and accelerated through programming support.
However, before moving on to this application, an illustrative example of a beam model and the resulting internal force distributions should first be given.
In @fig_70, the upper subplot shows the type of support, its posistion, the applied force distribution with its direction. In other words it provides all relevant infromation in order to solve the beam model problem through the mentioned equations. The lower subplot shows the resulting support reaction forces.


// --------------------------------- figures -------------------------------- //
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/2_Beam_Model/0_Beam_Example.svg", 
  width: 100%),
  caption: [Illustrative representation of a bending beam model. The upper subplot shows the support and the applied loads. The lower subplot shows the resulting support forces],
)<fig_70>


@fig_71 shows the resulting internal force distributions, where the first plot shows the normal forces, the second the shear forces and the final subplot that bending moment distribution.
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/2_Beam_Model/1_Beam_Example.svg", 
  width: 100%),
  caption: [Illustrative representation of the internal force distributions from @fig_70],
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
Here, users can communicate with each other, report problems, conduct plausibility investigations, 
// discuss word disliked
discuss desired new features, and jointly test and develop.

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