/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// INFO
// all refs
// all figs - the image data was not copied
// all eqs
// compared with true german text


=== Beam Model Fundamentals<chap_4_0_2>
In the previous @chap_3, we explained how aerodynamic loads are obtained and what additional steps are required to convert them into the desired input format. 
The beam model and optimization were also briefly mentioned there.
However, these topics were only covered superficially without in-depth information. 
Therefore, this chapter aims to provide a detailed description of the beam model and optimization process.
Key questions to be addressed include: what a beam model is, how it is used, its advantages and disadvantages, what numerical optimization means, its objectives, what theoretical possibilities exist, and how the process was specifically implemented.


In many engineering programs, working with beam models is taught under the course name technical mechanics @Spura2019 @Gross2019 @Gross2021b @Gross2017 @Gross2021 @Rossow_2014.
This represents a simple method that combines physics and mathematics.
The geometry of a physical object is drawn, and then the forces acting at their respective positions are plotted.
Next, equilibrium conditions are established. 
Initially, all forces are divided into horizontal and vertical force components.
Horizontal and vertical components form a rectangular coordinate system in two dimensions.
It would be possible to rotate the coordinate system and divide the force components according to the rotated coordinate system, which can be helpful in some analyses.
For the further explanation of equilibrium conditions, however, we will assume a conventional non-rotated (horizontal, vertical) coordinate system.

Once the force components in the two directions are known, they can be set equal to zero according to static analysis.
However, if dynamic loading is considered, this cannot be set equal to zero
@Gross2021a @Gross2023 @Gross2019a.
Static means that loads are at rest; they are applied once and remain constant in their load.
Dynamic loads are loads that change over time.
In addition to the force equilibrium condition, there is another equilibrium condition in two dimensions for the moment balance.
Here, all moments about a chosen point are calculated and then set to zero.
This can be represented as @eq_79[Equations], @eq_80[] and @eq_81[] @Gross2021b.
Here, the index $i$ stands for the individual force, $x$ and $y$ for the force components in the respective direction, $M$ for the bending moment, the index $z$ for the imagined rotation axis pointing into the page plane, and $A$ is the local point about which the moment balance is formed.

$ sum F_(i,x) = 0 $ <eq_79> 
$ sum F_(i,y) = 0 $ <eq_80>

// rotation about z
$ sum M_(i,z)^(A) = 0 $ <eq_81>

The mathematical description can be extended to any number of dimensions, though more than three dimensions rarely makes sense in most cases.
For a calculation in three dimensions, @eq_82[Equations] - @eq_87[] can be used.
Here, the force balance in the third dimension is added through @eq_84 and the moment balances in the two remaining rotation axes in @eq_85 and @eq_86.

$ sum F_(i,x) = 0 $     <eq_82> 
$ sum F_(i,y) = 0 $     <eq_83>
$ sum F_(i,z) = 0 $     <eq_84>
$ sum M_(i,x)^(A) = 0 $  <eq_85>
$ sum M_(i,y)^(A) = 0 $ <eq_86>
$ sum M_(i,z)^(A) = 0 $ <eq_87>

The beam model can therefore be considered a simple physics-based method that can be applied analytically by students without numerical assistance.
One partial goal of the beam model is to determine support forces.
These are the forces acting at the selected support points.
Once the support forces are known, the internal forces can be calculated in the next step.
The process of cutting beam models will not be explained here; for this, please refer to literature such as @Spura2019 @Gross2019 @Gross2021b @Gross2017 @Gross2021 @Rossow_2014.
However, the output of these internal forces includes the distributions of normal force, shear force, and moment.
Important relationships in calculating section force distributions are given by @eq_88[Equations], @eq_89[] and @eq_90[] @Gross2021b.
Here, @eq_88 states that the derivative of the shear force $Q space.thin[#unit("N")]$ with respect to the spatial coordinate $x$ equals the negative distributed load $q space.thin [op("N/mm")]$.
@eq_89 states that the derivative of the bending moment $M space.thin [op("N mm")]$ with respect to the spatial coordinate $x$ equals the shear force $Q space.thin[#unit("N")]$.
Furthermore, @eq_90 shows the relationship between @eq_88 and @eq_89.

$ (dif Q) / (dif x) = -q  $    <eq_88>
$ (dif M )/ (dif x) = Q  $     <eq_89>
$ (dif² M) / (dif² x) = -q  $   <eq_90>

When @eq_88[Equations] - @eq_90[] are inverted, equations @eq_91[], @eq_92[] and @eq_93[] are obtained.

$ Q = - integral q dif x   $    <eq_91>
$ M = integral Q   dif x $     <eq_92>
$ M   = - integral integral q dif x  $   <eq_93>

All equations from @eq_79[] to @eq_93[] can be used to calculate and plot normal force and shear force distributions, as well as bending moment distributions, analytically and by hand.
// TODO not in the original german version - possible because the following is not suitable for a phd
To the inexperienced reader, these equations may seem overwhelming, but from experience, the author of this report can say that by the first semester, these equations and their handling are very solidly embedded in students' minds.
It can also be confirmed that once the method of internal forces is learned, it can largely be viewed as a recipe-following task.
// found again in orig german version
For this very reason, this process can be automated and accelerated through programming support.
However, before moving on to this application, an exemplary example of a beam model and the resulting section force distributions should first be given.
In @fig_67, the upper subplot shows the support, the distribution, direction, and position of the applied loads. The lower subplot shows the resulting support reaction forces.
@fig_68 shows the resulting internal force distributions visually.

// --------------------------------- figures -------------------------------- //
#figure(

  image("../../1_Data/2_Figures/1_Ch_Figs/1_Ch/8.svg", 
  width: 100%),
  caption: [Exemplary representation of a bending beam model. The upper subplot shows the support and the applied loads. The lower subplot shows the resulting support forces],

)<fig_67>

#figure(

  image("../../1_Data/2_Figures/1_Ch_Figs/1_Ch/9.svg", 
  width: 100%),
  caption: [Exemplary representation of the internal force distributions from @fig_67],

)<fig_68>

Let's summarize our knowledge about the beam model. They help obtain internal force distributions of important parameters such as normal forces, shear forces, and moment distribution.
The internal force calculation is an established method that can be performed analytically even without computer support.
Due to the latter, it can be considered a relatively simple procedure.
Furthermore, it is possible to calculate analytical equations with computer support.
In the Python programming language @van1995python, there is a rather well-known library called SymPy @meurer2017sympy, which makes it possible to work analytically on the computer.

// ------------------------- python implementations ------------------------- //
At this point, it would be appropriate to explain the advantages of Python.
Python is a programming language used in various fields
@AliAkbari2024 @Trost2023 @Ries2024 @Barneschi2024 @Gardner2024 @Kuo2024 @Lewthwaite2024.
This includes both scientific and non-scientific areas.
Python attracts its users with three main factors.
First is the simple language syntax and the small number of lines of code required for a task.
Secondly, Python is a quite advanced programming language that comes with various functions.
Finally, it is particularly popular in scientific circles due to the large number of freely available and high-quality libraries.
The Python community usually uploads their tools to Github.
Here, users can communicate with each other, report problems, conduct plausibility investigations, discuss desired new features, and jointly test and develop.

Documentation can also be uploaded to Github.
Often, other scientists from different fields have similar problems, so partial solutions can be found on Github.
Particularly popular libraries in the Python world are libraries for machine learning, deep learning, and scientific numerical mathematics.
A comprehensive description would not be justified within the scope of this work, so the following should be noted.
Besides Github, there are various forums, blogs, online tutorials, scientific papers, and books that explain how to work with Python, specifically with a library or in a scientific branch.


Furthermore, it should be mentioned that the freely available libraries help modern scientists work faster.
If these libraries were not available, much would have to be made from scratch, which could take months or, in the case of very high-quality differential equation solvers like Fenics
@alnaes2015fenics @Boyko2024 @Burman2024 @Burman2024a @Yang2024a @Zhang2024a,
possibly years.

// TODO not in original german verison but fine
Very high-quality libraries are dissertation results or code written and verified by an entire department in a company.
An example of an open-source library that, among other things, brought out OpenAI's ChatGPT and is used and developed by various companies and scientific institutions is PyTorch
@Paszke2019 @Wei2024 @Buehler2024 @Huang2023 @Hu2024 @Chen2024a.

Using SymPy @meurer2017sympy @Virtanen2020a, which represents a Python library, is applied in various scientific works
@NEURIPS2023_4a47dd69 @Wang2024a @Yamamoto2024 @Liu2024 @Grohs2024.
With it, it is possible to perform computer-aided analytical mathematics.
Examples include the calculation of integrals, differentials, solving systems of equations, and other important Linear Algebra operations.
If, among other things, the described equations are used and transferred into a SymPy representation, beam models can be calculated with computer support.
Since SymPy can work analytically, the section force distributions can also be obtained as analytical equations.
This idea was implemented in the open-source library SymBeam @symbeam_tool.
Among other alternatives that try to do the same thing, SymBeam was initially chosen.
The reasons for this were mainly the proper documentation on one hand and the easy handling on the other.

This tool was initially thoroughly investigated. Various beam models were set up and compared with the sample solution, among others from @Gross2021b.
Unexpected issues were encountered. The source code was examined in detail and corrected accordingly.
After the correction, we were able to calculate beam models on the computer.
However, there was the limitation that currently only statically determinate calculations could be performed.


The goal pursued with the beam model will become more evident in detail later.
However, for current understanding, the following brief explanation is given.
To be able to transfer the actual support from the three-dimensional model into a one-dimensional beam model in a two-dimensional coordinate system, it might not be sufficient in practice to calculate only statically determinate systems.
When transforming the support conditions from three dimensions to 2 dimensions, the physical behavior must be understood in detail and assumptions must be made.
Both together could ensure that the dimension transformation leads to a statically indeterminate support.

Therefore, the initial path was to search again for existing tools.
The found library is called IndeterminateBeam @interdetbeam_tool and is also freely available.
Similar to SymBeam, IndeterminateBeam was calculated with more than 20 beam models.
The results were compared with sample solutions from textbooks, and it could be determined that the implementation of IndeterminateBeam is correct.
// TODO Appendix presentation not yet as desired, also not in original german verison
Three examples are shown in @chap_Apendix