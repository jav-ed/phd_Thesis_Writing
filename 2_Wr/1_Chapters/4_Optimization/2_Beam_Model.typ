/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Word rep ins. done
// proofread ins. done

// Title was tested and is inshallah fine
== Beam Modeling Fundamentals <chap_4_2>

The previous @chap_4_1 explained how aerodynamic loads are obtained and what steps are required to convert them into a suitable input format for k-means++ during the initial step of #gls("ld", long:true). 
It was also mentioned that the one-dimensional representation of the resulting partial forces $F_(a,i,j)$ enables the integration of one-dimensional beam models within an optimization framework. 
This section provides a mathematical description of beam modeling. It addresses fundamental questions about its definition, application, and computational implementation.
The examination of optimization fundamentals follows in @chap_4_3. 
Subsequently, @chap_4_4 analyzes the incorporation of beam models within an optimization framework and assesses their advantages and limitations compared to alternative approaches.

// -------------------------------------------------------------------------- //
In many engineering programs, beam model analysis is taught within the framework of technical mechanics @Spura2019 @Gross2019 @Gross2021b @Gross2017 @Gross2021 @Rossow_2014. The approach represents an efficient method that integrates fundamental principles of physics and mathematics. The analysis begins with a simplified geometric representation of physical objects, where forces are applied at their respective positions. Following this simplification, equilibrium conditions are determined.
The standard coordinate system employed consists of horizontal and vertical axes, with forces decomposed into their respective directional components.
While it is possible to utilize a rotated coordinate system and decompose forces accordingly for specific analyses, the subsequent explanation of equilibrium conditions assumes a conventional non-rotated (horizontal, vertical) coordinate system.
In static analysis, force components along both directions are set to zero. However, dynamic loading scenarios require additional considerations, as these components cannot be zeroed @Gross2021a @Gross2023 @Gross2019a. 
Static loading refers to conditions where forces remain constant after initial application, while dynamic loads exhibit temporal variations. For the purpose of #gls("ld"), the beam model analysis focuses exclusively on static forces.

The two-dimensional analysis necessitates both force equilibrium and moment balance conditions. The latter involves calculating moments about a selected point and setting their sum to zero. These conditions are mathematically expressed in @eq_88 to @eq_90 @Gross2021b. In these equations, the index $i$ denotes individual forces, while $x$ and $y$ represent force components in their respective directions. The symbol $M$ indicates the bending moment, with index $z$ specifying the rotation axis perpendicular to the page plane, and $A$ describing the local point about which the moment balance is calculated.

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

The beam model represents a core physics-based methodology that engineers can apply through analytical means without computational assistance. 
A primary objective of beam model analysis is the derivation of support forces, which act at designated support points. 
The calculation of internal forces enables the determination of these support forces.
The method of sections, while not detailed here, forms the theoretical foundation for internal force analysis. For comprehensive treatment of this method, readers are directed to @Spura2019 @Gross2019 @Gross2021b @Gross2017 @Gross2021 @Rossow_2014. The analysis yields distributions of normal force, shear force, and bending moment throughout the beam structure.

The main relationships governing internal force distributions are expressed in @eq_97 to @eq_99 @Gross2021b. 
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

The equations from @eq_88 to @eq_102 enable the calculation of normal force, shear force, and bending moment distributions through both symbolic computation @Valipour2021 @Elham2021 @Kulyabov2021 @butt2021development and traditional analytical methods. While computational tools can automate and accelerate this process, it is beneficial to first examine an illustrative example of a beam model and its resulting internal force distributions.
The upper subplot in @fig_70 depicts the support configuration, including support type and position, along with the applied force distribution and its direction. 
This information constitutes the complete set of parameters required to solve the beam model problem using the aforementioned equations. The lower subplot displays the resulting support reaction forces.


// --------------------------------- figures -------------------------------- //
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/2_Beam_Model/0_Beam_Example.svg", 
  width: 100%),
  caption: [Illustrative representation of a beam model: applied loads and support configuration (upper), resulting support reaction forces (lower).],
)<fig_70>


@fig_71 presents the resulting internal force distributions: normal forces in the first subplot, shear forces in the second, and the bending moment distribution in the final subplot.
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/2_Beam_Model/1_Beam_Example.svg", 
  width: 100%),
  caption: [Internal force and moment distributions corresponding to the beam model in @fig_70.],
)<fig_71>


The investigation advances from beam modeling fundamentals to its computational implementation.
While analytical solutions on paper are feasible, this approach becomes impractical when integrating beam models into numerical optimization frameworks. Effective implementation of optimization procedures requires the beam model solver to be available as executable numerical code.
The selection of an appropriate programming language represents a pivotal choice in applied scientific computing.
Python @van1995python grants access to open-source libraries that enable symbolic computation. The availability of this symbolic computation capability constitutes a primary factor in selecting Python for beam solver development.
Additional justification for choosing Python as the computational platform is outlined in subsequent elaboration.
// ------------------------- python implementations ------------------------- //

Python has established itself as a versatile programming language with widespread adoption across diverse fields @AliAkbari2024 @Trost2023 @Ries2024 @Barneschi2024 @Gardner2024 @Kuo2024 @Lewthwaite2024. 
Its application domain encompasses both scientific research and general-purpose programming tasks, with several key characteristics contributing to its widespread adoption. 
The language's inherent design philosophy emphasizes code readability through simplified syntax and concise implementation demands. 
This design approach reduces the number of code lines required for implementing complex algorithms compared to other programming languages. 
Python complements this simplicity with sophisticated programming capabilities provided by its built-in functions and modules. These modules, collectively known as the standard library, offer pre-implemented utilities for common programming tasks such as file operations, data structures, and mathematical computations.
Of particular significance to the scientific community is Python's extensive ecosystem of high-quality, open-source libraries that facilitate complex computational tasks.
The collaborative nature of Python's development ecosystem is exemplified through  #gls("github"), which serves as a centralized environment for version control, issue tracking, code review, and collaborative development processes. This infrastructure enables developers and researchers to engage in systematic code validation, feature enhancement reviews, and collaborative testing procedures. 
The platform's documentation repository system serves as a knowledge base, providing detailed technical resources and specifications. This system facilitates knowledge exchange across scientific domains, allowing researchers to discover and adapt proven solutions for their specific technical challenges.

The Python ecosystem has become instrumental in several key domains, notably machine learning, deep learning, and scientific numerical mathematics. 
While an exhaustive analysis of these fields lies beyond the scope of this work, the ecosystem's continuing development merits attention. It benefits from a robust network of supporting resources. These include academic publications, comprehensive technical documentation, and community-maintained tutorials.
The availability of these open-source libraries significantly accelerates scientific research by eliminating the need to develop code entirely from scratch. 
This advantage is particularly evident in the case of sophisticated numerical tools such as the Fenics differential equation solver @alnaes2015fenics @Boyko2024 @Burman2024 @Burman2024a @Yang2024a @Zhang2024a, whose independent development would require investments spanning multiple years.
Many of these high-quality libraries represent the culmination of doctoral research or collaborative efforts within corporate research departments. PyTorch @Paszke2019 @Wei2024 @Buehler2024 @Huang2023 @Hu2024 @Chen2024a serves as a notable example of such collaboration. This open-source machine learning framework has enabled substantial developments in artificial intelligence. It has contributed to various applications, including OpenAI's #gls("llm", long:true) ChatGPT. The framework continues to evolve through active collaboration between academic institutions and industry partners.

// -------------------------------------------------------------------------- //

Having established the rationale for selecting Python as the beam model solver platform, attention should be directed to SymPy @meurer2017sympy @Virtanen2020a @RalfGommers2024. This library facilitates computer-aided analytical mathematics and has demonstrated its utility across numerous scientific applications @NEURIPS2023_4a47dd69 @Wang2024a @Yamamoto2024 @Liu2024 @Grohs2024. The computational capabilities encompass essential mathematical operations including integral calculus, differential equations, systems of equations, and advanced linear algebra computations.
By translating the previously described equations into SymPy representation, it becomes possible to derive analytical expressions for internal force distributions. This approach leverages computational power to accelerate beam modeling calculations and enables seamless integration of the beam model solver into numerical optimization frameworks.

One implementation of this computational approach is found in the open-source library SymBeam @symbeam_tool. Despite the existence of alternative solutions, SymBeam was selected initially for its well-structured documentation and accessibility. 
However, adherence to scientific rigor necessitated thorough functional validation of the openly available solver. Consequently, the SymBeam implementation @symbeam_tool underwent extensive verification against established beam model references from authoritative sources such as @Gross2021b. During this validation process, a few discrepancies were identified, leading to a detailed source code review and subsequent modifications. Following these refinements, the computational beam solver was successfully integrated into the optimization framework.

// -------------------------------------------------------------------------- //
In the context of #gls("swith", long:true) and practical applications, support conditions are inherently three-dimensional. The transformation of these three-dimensional support conditions into a one-dimensional beam model within a two-dimensional coordinate system poses challenges beyond those encountered in statically determinate systems. This transformation demands deep understanding of the physical behavior and careful consideration of assumptions required for two-dimensional support mapping. Such transformations frequently result in statically indeterminate support conditions.

Given SymBeam's limitation to statically determinate beam models, the open-source alternative #emp_[IndeterminateBeam] @interdetbeam_tool was selected. The availability of this additional computational beam solver implementation further validates the selection of Python as the development platform. 
Following the validation approach used with SymBeam, more than 20 beam models were constructed using IndeterminateBeam. 
Comparison of these results with textbook reference solutions confirmed the accuracy of IndeterminateBeam's implementation, requiring no additional modifications. 
The validation results for five statically determinate and five indeterminate beam models are presented in @fig_Ap_0 to @fig_Ap_6 and @fig_Ap_7 to @fig_Ap_11 in @chap_Append_A_0, respectively.


Finally, IndeterminateBeam @interdetbeam_tool was selected as the computational beam model solver after being thoroughly validated against known solutions for both statically determinate and indeterminate beam models. Its seamless integration into existing numerical optimization frameworks further solidified its selection.

// --------------------------------- summary -------------------------------- //
#summary_([
In summary, essential mathematical foundations of beam modeling theory were laid out. While analytical solutions for individual beam models using traditional pen-and-paper methods are feasible, this approach proves impractical for integration within numerical optimization frameworks. 
To address this limitation, the Python programming language was adopted as the computational environment, with a detailed justification provided for this choice. 
The investigation examined two beam solvers, which were first validated against established textbook references and subsequently integrated into an optimization framework. 
The transformation of three-dimensional support conditions of #glspl("swith") to two-dimensional representations can introduce additional complexity, as it can yield statically indeterminate beam models. Consequently, the IndeterminateBeam @interdetbeam_tool solver emerged as the most appropriate option.

])

