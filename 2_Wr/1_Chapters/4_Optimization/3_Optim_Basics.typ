/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// Word rep ins. done


// Title was tested and is inshallah fine
== Optimization Fundamentals <chap_4_3>
In the previous @chap_4_2, fundamental principles of beam modeling were presented, including elaborations on internal force distributions, which will be relevant for optimization as shown in @chap_4_4 and @chap_4_5_0 to @chap_4_5_3. 
However, before exploring the integration of beam models within an optimization framework, it is essential to establish a thorough understanding of optimization fundamentals.
This section introduces key optimization concepts and terminology, utilizing one concrete practical example to enhance their comprehension beyond purely theoretical definitions and demonstrate their practical implementation.


// -------------------------------------------------------------------------- //

Optimization constitutes a mathematical methodology for obtaining an #emp_[optimal] result within a defined solution space. The interpretation of #emp_[optimal] requires careful consideration, as it fundamentally impacts the understanding of optimization outcomes. 
In the context of optimized results, the term typically refers to a local minimum rather than a global minimum, a distinction that necessitates further examination.
The differentiation between local and global optima can be comprehensively understood through an analysis of the first and second derivatives of an analytical mathematical function. 
In many cases, functions may exhibit multiple local extrema within their domain, a characteristic classified as multimodality.
In such functions, multiple points exist where the first derivative undergoes sign changes from positive to negative or vice versa, or transitions through zero before returning to its original sign. 
These characteristics, including multimodality and the distinction between local and global extrema, are essential for analyzing the nature of optimization problems and are illustrated with the example shown in @fig_72.


#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics/0_Multi_Modal.svg", 
  width: 100%),
  caption: [Visualization of a multimodal function illustrating local and global extrema.],
)<fig_72>

// ---------------------------- global and local ---------------------------- //
The function depicted in @fig_72 features distinct points of absolute maximum and minimum values. 
Within the entire considered function space, the point with the highest value is defined as the global maximum, while the point with the lowest value as the global minimum.

// -------------------------------------------------------------------------- //
// TODO
1. Inflection Points vs. Sign Change in the First Derivative
Text to Check (current):

The analysis can be extended to inflection points observable in the function. Before and after inflection points, the first derivative, which represents the function's slope, usually undergoes a sign change.

Issue:
An inflection point is where the second derivative typically changes sign (the function’s concavity changes). It does not necessarily imply that the first derivative changes sign. Indeed, the slope can remain positive (or negative) through an inflection point. Local minima/maxima occur where the first derivative is zero and changes sign, but inflection points are different.

Suggested Revision:

The analysis can be extended to inflection points, which occur where the second derivative changes sign and the function’s concavity transitions from concave up to concave down or vice versa. Unlike local minima or maxima, the slope (first derivative) at an inflection point need not be zero, nor must it change sign.

// -------------------------------------------------------------------------- //


The analysis can be extended to inflection points observable in the function. 
Before and after inflection points, the first derivative, which represents the function's slope, usually undergoes a sign change.
Local minima and maxima occur precisely at points where the first derivative equals zero. 
This mathematical property establishes a key distinction: although a function typically possesses a singular global maximum and a singular global minimum, it may contain multiple local maxima and minima.

Furthermore, it is noteworthy that certain functions may not display unique global extrema, particularly when local and global extreme values coincide. 
This phenomenon can be observed in trigonometric functions, such as sine or cosine.
Despite these functions being nonlinear, their periodic nature results in local extrema that are equivalent to their global extrema, as demonstrated in @fig_73.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics/1_Sin_Opti.svg", 
  width: 100%),
  caption: [Comparative analysis of $sin(x)$, its first derivative $sin'(x)$ and second derivative $sin''(x)$, illustrating the relationship between extrema and derivatives.],
)<fig_73>

Symmetric functions represent another category of functions that may lack unique global extrema, similar to periodic functions. 
Additionally, while it was previously established that the sign of the slope (first derivative) usually changes before and after an extreme point where the first derivative equals zero, an important exception exists.
In certain cases, when a point is identified where the first derivative equals zero, the derivative's sign may return to its original value rather than changing to the opposite sign. In mathematical analysis, these distinctive points are referred to as saddle points.
While saddle points appear less frequently in one-dimensional functions compared to sign changes at extrema, their occurrence becomes more prevalent in complex, higher-dimensional functions. 
A representative example of a saddle point is illustrated in @fig_74.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics/2_Saddle_Point.svg", 
  width: 100%),
  caption: [Analytical representation of a function exhibiting a saddle point, demonstrating characteristic derivative behavior in one dimension.],
)<fig_74>

// --------------------------- multivariate optim --------------------------- //
In the context of multivariate optimization, essential extrema configurations for functions of two variables are presented in @fig_75.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics/3_2D_Extremes.svg", 
  width: 100%),
  caption: [Visualization of extrema in two-dimensional space: positive definite (minimum), positive semidefinite (weak minima line), indefinite (saddle point), and negative definite (maximum) @mdobook.],
)<fig_75>


The definiteness classifications shown in the subfigure titles of @fig_75 correspond to the definiteness properties of the symmetric Hessian matrix @mdobook. 
The Hessian is stated in matrix form in @eq_103 and in index notation in @eq_104.
For a comprehensive analysis of the Hessian matrix, including its eigenvalue computation and geometric interpretation, readers are directed to the literature @mdobook @Papageorgiou2015 @Stein2018a

#set math.mat(gap: 1.1em)
$ bold(H)_(f)(x) = mat(
  display(frac(diff^2 f, diff x_1 diff x_1)), display(frac(diff^2 f, diff x_1 diff x_2)), ..., display(frac(diff^2 f, diff x_1 diff x_n));
  display(frac(diff^2 f, diff x_2 diff x_1)), display(frac(diff^2 f, diff x_2 diff x_2)), ..., display(frac(diff^2 f, diff x_2 diff x_n));
  dots.v, dots.v, dots.down, dots.v;
  display(frac(diff^2 f, diff x_n diff x_1)), display(frac(diff^2 f, diff x_n diff x_2)), ..., display(frac(diff^2 f, diff x_n diff x_n))
) $ <eq_103>

$ bold(H)_f_(i j) =  (diff^2 f)/(diff x_i diff x_j ) $ <eq_104>

// -------------------------- general optimization -------------------------- //
Following the examination of local and global extreme points, it is important to consider that while finding a global minimum represents the ideal objective of optimization, its attainability depends significantly on the chosen optimization method. An optimizer fundamentally combines mathematical principles with logical operations, implemented through computational algorithms. 
In this context, logical operations refer to conditional programming structures that determine specific routes based on predefined criteria. 

The field encompasses numerous optimization approaches, with extensive comparative analyses available in the literature @Zhang2015 @Cheng2016 @Gharehchopogh2019 @Li2021a @Gad2022. 
As this work does not aim to provide in-depth explanations of individual optimization algorithms, relevant theoretical foundations will be presented where necessary for understanding the broader concepts.
In the context of optimization objectives, it is worth mentioning that both global minima and maxima can be obtained through mathematical and computational methods. Nevertheless, the predominant focus in scientific and industrial applications lies in minimization problems.
This convention has developed through practical application and has become an established standard in the field. It should be noted that any maximization problem can be reformulated as a minimization problem, as expressed in @eq_105.

$ min J(x) = - max -J(x) $ <eq_105>

The operation $-J(x)$ in @eq_105 produces a reflection of the original function about the horizontal axis, as illustrated in @fig_76. 
This geometric transformation provides insight into the relationship between minimization and maximization problems. 
Once the maximum of $-J(x)$ is determined, negating this result yields an equivalent solution to minimizing the original function $J(x)$, thereby demonstrating the mathematical equivalence of these optimization approaches.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics/4_Min_Max_Sym.svg", 
  width: 100%),
  caption: [Geometric representation of $J(x)$ and its reflection $-J(x)$ illustrating the equivalence stated in @eq_105.],
)<fig_76>

From an economic perspective, pursuing global minima may not always represent the most sensible strategy. 
The feasibility of finding such solutions depends on multiple factors, including the nature of the optimization problem, computational resources, and the selected optimization method. Two primary classes of optimization methods exist: gradient-based and gradient-free approaches, each with distinct advantages and limitations.

Gradient-based optimization methods require derivatives of both the objective function and constraints with respect to the design variables. 
The concept of a gradient can be understood through its physical interpretation: it quantifies the rate of change in one quantity relative to changes in another quantity.
In the context of optimization, this relationship exists between the objective function $J(x)$ and the input variable $x$, where the gradient describes how the output $J(x)$ responds to variations in $x$. 
The magnitude of this response indicates the variable's significance in the optimization process. When a small perturbation in $x$ results in a substantial change in $J(x)$, this behavior suggests that $x$ is an important design variable.
This observation becomes especially significant when the objective function $J(x)$ operates on a vector of input variables, extending these concepts to higher-dimensional spaces.

// ------------------------ definition of design vars ----------------------- //
In practical engineering optimization, the selection and management of design variables forms a critical aspect. Design variables are the parameters that an optimizer can manipulate to achieve the desired minimum of the objective function. 
A fundamental principle in optimization is to maintain parsimony in the selection of design variables, as each additional variable can significantly increase the dimensionality of the design space. 
This increased dimensionality typically yields higher computational costs due to a more complex design space.
The relationship between design variables and the minimization of the objective function can exhibit intricate characteristics. Adjusting one design variable might reduce the objective function value, whereas a similar adjustment in another variable could cause it to increase.

Furthermore, the interaction between design variables themselves introduces additional complexity to optimization problems. 
Design variables may demonstrate independent behavior, where changes in one variable have no impact on the effects of others. 
However, in many engineering applications, the selection of one design variable might necessitate specific considerations for other variables, arising from underlying physical relationships.
For instance, in electric motor design, the selection of rotational speed as a design variable introduces important implications for other parameters. A higher rotational speed might require the reduction of the rotor diameter to maintain mechanical integrity, as higher peripheral velocities can induce increased mechanical stress in the rotor structure.
These non-trivial relationships demand sophisticated optimization strategies to determine appropriate values for each design variable, collectively contributing to the minimization of the objective function.
To better understand this process, it is imperative to define the objective function and its role in optimization.

The objective function establishes a mathematical framework that quantifies the optimization goal through fundamental principles of the respective field, incorporating physical laws, empirical relationships, and other measurable criteria. This function transforms a set of design variables into a single scalar value representing the quantity to be optimized. The mathematical formulation facilitates numerical implementation, where computational logic enhances solution efficiency and manages complex constraints. This approach enables systematic design space exploration while maintaining mathematical rigor and computational efficiency.

// -------------------------------------------------------------------------- //
In practical applications, a large number of design variables are only justified when sufficient computing resources are available, and the modeling accuracy necessitates such complexity.
In such cases, sensitivity analysis serves as a structured approach to evaluate the significance of each design variable.
The magnitude and direction of gradients provide crucial information about the relationship between design variables and the objective function. 
A high positive or negative gradient indicates that the design variable substantially influences the objective function, while a gradient approaching zero suggests minimal impact. 
The sign of the gradient merely indicates the direction of this relationship. For instance, a negative temperature gradient with respect to pressure indicates an inverse relationship: as pressure increases, temperature decreases. 
Sensitivity analysis, inherently based on gradient calculations, can be expressed in matrix form to capture not only the influence of design variables on the objective function but also their interactions with each other. This comprehensive analysis enables the identification of critical design variables and supports the potential elimination of less significant variables from the objective function, thereby reducing computational complexity while maintaining model fidelity.

// -------------------------------------------------------------------------- //
Several reasons for describing optimization problems as simply as possible have already been stated.
Additional considerations emerge when examining the two major types of optimization in detail.
As mentioned earlier, a high number of design variables can potentially increase the accuracy of an optimization problem's description. 
However, in multidisciplinary optimization, especially when individual disciplines share limited interdependence, this increased dimensionality poses substantial challenges.
These barriers manifest in multiple aspects: the complexity of maintaining and comprehending the optimization model, the increased effort necessary for numerical modeling, and the heightened computational requirements.
The diversity of disciplines in such optimization problems can span multiple domains, including economics, environmental impact, mechanical structural analysis, logistics, aerodynamics, propulsion systems, and control engineering. 
This diversity extends to their mathematical tractability, which can vary significantly among disciplines.
Some disciplines, such as structural mechanics and aerodynamics, can be comprehensively described through differential equations.
Others, by contrast, may resist complete mathematical formulation due to their inherent qualitative nature. 
In such cases, developing appropriate numerical representations may demand significant effort. 
The obstacle lies in attempting to capture the essential characteristics while maintaining computational feasibility.

The aforementioned disciplines exemplify the complexity inherent in optimization problems, which among others are found in aircraft design. While these disciplines demonstrate key aspects of aircraft development, the field encompasses an even broader range of specialized domains than those enumerated.
Each domain typically requires its own set of design variables, yet these variables often exhibit complex interdependencies. When multiple disciplines share common design variables, these are classified as coupled design variables @Li2016. 
Such coupling can create competing objectives, where optimal values of design parameters for one discipline may directly conflict with those required by another. 
The management of coupled design variables requires specialized methodological approaches, a topic that has generated extensive research interest @Martins2013 @Song2023 @Sarojini2023 @Yuan2023.
// -------------------------------------------------------------------------- //


When beginning with a high number of design variables to meet accuracy requirements, the previously described sensitivity analysis enables the identification and removal of less influential variables.
This reduction in design variables simplifies the optimization problem, leading to decreased computational and hardware requirements. 
The resulting optimization efficiency yields multiple benefits: reduced computation time accelerates development cycles, while lower hardware requirements decrease both operational costs and environmental impact through reduced energy consumption.
Moreover, sensitivity analysis proves particularly valuable for evaluating coupled design variables. 
By quantifying the relative importance of these variables across different disciplines, it becomes possible to identify cases where a coupled variable exhibits strong influence in one discipline but minimal impact in another. 
In such instances, the variable can be decoupled by removing it from the discipline where its influence is negligible, thereby reducing the overall complexity of both the optimization process and its implementation.

// ------------------------------ objective fcn ----------------------------- //
To illustrate the practical aspects of optimization, it is valuable to walk through a concrete example. 
Additionally, this demonstration is helpful for understanding the optimization framework presented in @chap_4_4 and the results outlined in @chap_4_5_0 to @chap_4_5_3. 
For this example, consider an aircraft design optimization with the objective of reducing fuel consumption. 
This seemingly straightforward goal showcases how a real-world engineering objective transforms into a demanding optimization problem. 
The formulation requires integration of multiple physical models. 
Among them, an accurate aerodynamic analysis necessitates the Navier-Stokes equations from fluid mechanics @Sigloch2022, while structural mechanics equations determine mass properties.
These models must be combined to establish relationships between lift, drag, mass, flight speed, and other relevant parameters to create a representative objective function. 

The numerical implementation of this optimization problem calls for careful reflection on computational methods.
For high-fidelity analysis, the computational implementation typically requires a #gls("cfd", long:true) solver, though surrogate models or other numerical methods may provide an acceptable balance between accuracy and computational efficiency @link_Javed_Master.
For solving structurally relevant problems, a #gls("fem", long:true) model @Mittelstedt2021 @Mittelstedt2022 @Werkle2021a @Hahn2018 @Langtangen2016 @Langtangen2019 @Dhondt2004 can be utilized.
Assuming an initial objective function has been defined and appropriate solvers are available across all disciplines,  the next step involves selecting an optimization approach. 
Both gradient-free and gradient-based methods present viable solutions.
Once an approach is selected, the initial formulation reveals potential pitfalls: without proper constraints, the optimization might yield physically impossible solutions, such as negative fuel consumption. 
Physical understanding necessitates reformulating the optimization problem such that zero forms its lower bound.
Yet this refinement alone proves insufficient, as the optimizer could achieve zero fuel consumption simply by setting flight speed to zero. 
This realization necessitates the essential step of introducing boundaries, constraining design variables within physically meaningful ranges, exemplified by the specification of maximum and minimum permissible flight speeds.

// -------------------------------------------------------------------------- //
Following this optimization problem definition, the resulting flight altitude might reach space-like conditions where atmospheric friction becomes negligibly small. 
Under such conditions, minimal flight resistance would lead to correspondingly reduced fuel consumption. This necessitates the adaptation of altitude boundaries to maintain physical relevance.
This exemplary case illustrates a fundamental characteristic of optimization problems: their definitions often emerge through an iterative process rather than being immediately apparent. 
A significant limitation arises from the inability to modify the optimization problem's definition during its solution process. When modifications become necessary, the optimization formulation must be revised and the solver must restart from its initial conditions.
This requirement for complete restarts presents particular challenges in computationally intensive optimizations, where repetition incurs substantial time and resource costs. 
This aspect, supported by practical experience, suggests a guiding principle in optimization: the problem formulation should maintain the minimum necessary complexity while ensuring sufficient accuracy for the intended application.

// -------------------------------------------------------------------------- //
To summarize the preceding elaboration, the definition of a complete optimization problem encompasses several essential components. 
Design variables form the primary element, serving as parameters the optimizer can adjust to minimize the objective function. 
Additional components include constraints, which serve as another form of boundaries.
Yet, constraints are distinctly expressed through mathematical equations. 
This formulation enables the incorporation of complex physical principles and empirical knowledge, either through direct mathematical expressions or surrogate models. 
Although this framework provides a general approach to optimization, the earlier example demonstrated that formulating a precise optimization problem often involves an iterative process.

With some fundamental concepts established and under the assumption of a well-defined optimization formulation, the process for obtaining a solution can be addressed. 
The optimization procedure can be conceptualized as a structured exploration of the design space.
The dimensionality of this space corresponds directly to the number of design variables, with each variable forming an independent dimension where the optimizer can search for optimal values.
The optimization process begins with an initial set of parameter values, from which the algorithm systematically explores the design space. 
Each iteration generates results that inform the selection of subsequent parameter combinations, guiding the algorithm's trajectory toward either a local or global minimum. 
The convergence path length exhibits significant variability depending on several factors. A well-chosen initial value may facilitate rapid convergence, while suboptimal starting conditions or inherently complex problem characteristics may necessitate extended computational paths.
Additionally, several aspects can impede successful convergence. 
For example, the selected optimization algorithm may prove unsuitable for the specific problem characteristics, or the solution path may display oscillatory behavior. In the latter case, the optimizer may encounter difficulties in achieving convergence or identifying a unique solution. Such convergence issues can stem from various sources, including excessive step sizes in gradient-based optimization algorithms.

// -------------------------------------------------------------------------- //

A more detailed examination of the distinctions between gradient-free and gradient-based optimizers provides additional insights into their respective applications. When gradient information is available, gradient-based optimizers demonstrate substantially faster convergence compared to gradient-free approaches. 
While gradient-based optimizers tend to converge to local minima, such solutions often return sufficient improvements over initial conditions. 
Therefore, local minima warrant consideration rather than immediate rejection.
The nature of design variables presents an important factor for the selection of an optimizer.
Design variables can be categorized into distinct types based on their mathematical properties. Temperature exemplifies a continuous variable, which can assume any value within defined bounds, including decimal representations. 
In contrast, discrete variables are constrained to whole numerical values, precluding intermediate states. 
Binary variables constitute a special case, permitting only two possible states. 
The nature of discrete and binary variables poses particular challenges for gradient calculation, often yielding unreliable or computationally intractable derivatives. 
In gradient-based optimization, the accuracy of gradients plays a decisive role in shaping the optimization trajectory. 
Inaccurate gradient information can result in non-convergence or physically unrealistic outcomes.
In cases where gradient calculation proves impossible, gradient-based methods become inapplicable.

Gradient-free optimizers offer notable advantages, especially in their enhanced capability to identify global optima and their compatibility with all variable types, as they operate independently of gradient information.
However, their primary limitation relates to computational efficiency, as their performance tends to decrease in accordance with additional design variables.

// -------------------------------------------------------------------------- //

Finally, having addressed multidisciplinary optimization, it is pertinent to acknowledge the concept of multi-objective optimization. 
While optimization theory encompasses numerous additional concepts and methodologies, this section focuses on selected aspects that provide the necessary foundation for understanding the optimization framework presented in @chap_4_4 and its subsequent results in @chap_4_5_0 to @chap_4_5_3.
Multi-objective optimization tackles scenarios where multiple objectives require simultaneous consideration. 
These objectives can exhibit various relationships: they may be physically correlated, partially aligned, or contradicting. 
In aircraft design, for instance, two distinct objectives might include maximum range and payload capacity, where increasing one inherently reduces the other due to fundamental physical constraints. 
Multi-objective optimization theory is well documented in the literature @Sengupta2016 @Cui2017 @Blank2020.


// --------------------------------- summary -------------------------------- //
#summary_([
Essential aspects of optimization terminology were introduced, including objective functions, design variables, constraints, and boundaries. 
The iterative nature of formulating complete optimization problems was demonstrated through a practical example, emphasizing the 
intricate relationships of integrating these components into a coherent problem definition. 
The elaboration established the practical relevance of local optima in real-world applications and examined the distinctions between gradient-based and gradient-free optimization.
Optimization is a very large field that finds application in various industries. For interested readers, several helpful book resources can be listed: @Gritzmann2013 @Papageorgiou2015 @Stein2018 @Stein2018a @Koop2018 @Grimme2018 @Scholz2018 @Jarre2019 @Dietz2019 @Schumacher2020. Finally, for multidisciplinary optimization, reference is made to the textbook @mdobook.

])