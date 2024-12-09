/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// INFO
// all refs
// all figs - the image data was not copied
// all eqs
// compared with true german text


// TODO Title
// explain things about evolutionary algorithms
=== Fundamentals of Optimization<chap_4_0_3>

// this pre intro of the upcomoing text inside the subsection. you need to adapt and epand the pre-intro a bit
In the previous @chap_4_0_2, important basics of the beam model were explained, particularly the internal force distributions relevant for optimization. However, in order to explain in detail how optimization can utilize a beam model as omne compoent, some fundamentals about optimization are focused in this subsection.

// -------------------------------------------------------------------------- //

Optimization constitutes a mathematical methodology for obtaining an #emp_[optimal] result within a defined solution space. The interpretation of #emp_[optimal] requires careful consideration, as it fundamentally impacts the understanding of optimization results. 
It is important to note that in the context of optimized results, the term typically refers to a local minimum rather than a global minimum, a distinction that necessitates further examination.
The differentiation between local and global optima can be comprehensively understood through an analysis of the first and second derivatives of an analytical mathematical function. 
A function exhibiting multiple local extrema in its domain is classified as multimodal. In such functions, multiple points exist where the first derivative undergoes sign changes from positive to negative or vice versa, or transitions through zero before returning to its original sign. These characteristics are fundamental to understanding the nature of optimization problems, as illustrated in @fig_72.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics/0_Multi_Modal.svg", 
  width: 100%),
  caption: [Visualization of a multimodal function illustrating local and global extrema.],
)<fig_72>

// ---------------------------- global and local ---------------------------- //
In addition to multimodality, @fig_72 serves to illustrate another fundamental concept in optimization: the distinction between local and global extrema. The function depicted in @fig_72 exhibits distinct points of absolute maximum and minimum values. Within the entire considered function space, the point with the highest value is defined as the global maximum, while the point with the lowest value constitutes the global minimum.
The analysis can be extended to inflection points observable in the function. 
Before and after inflection points, the first derivative, which represents the function's slope, usually undergoes a sign change.
Local minima and maxima occur precisely at points where the first derivative equals zero. 
This mathematical property establishes a key distinction: while a function typically possesses singular global maximum and minimum values, it may contain multiple local maxima and minima.
It is noteworthy that certain functions may not exhibit unique global extrema, particularly when local and global extreme values coincide. This phenomenon can be observed in trigonometric functions, such as sine or cosine. Although these functions are nonlinear, their periodic nature results in local extrema that are equivalent to global extrema, as demonstrated in @fig_73.

// proper caption required
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics/1_Sin_Opti.svg", 
  width: 100%),
  caption: [Comparative analysis of $sin(x)$, its first derivative $sin'(x)$ and second derivative $sin''(x)$, illustrating the relationship between extrema and derivatives.],
)<fig_73>

Symmetric functions represent another category of functions that may lack unique global extrema, similar to periodic functions. Additionally, while it was previously established that the sign of the slope (first derivative) usually changes before and after an extreme point where the first derivative equals zero, an important exception exists.
In certain cases, when a point is identified where the first derivative equals zero, the derivative's sign may return to its original value rather than changing to the opposite sign. These distinctive points are classified as saddle points in mathematical analysis. 
While saddle points appear less frequently in one-dimensional functions compared to sign changes at extrema, their occurrence becomes more prevalent in complex, higher-dimensional functions. 
A representative example of a saddle point is illustrated in @fig_74.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics/2_Saddle_Point.svg", 
  width: 100%),
  caption: [Analytical representation of a function exhibiting a saddle point, demonstrating characteristic derivative behavior in one dimension.],
)<fig_74>

// --------------------------- multivariate optim --------------------------- //
In the context of multivariate optimization, essential extrema configurations for functions of two variables are presented in @fig_75.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics/3_2D_Extremes.svg", 
  width: 100%),
  caption: [Visualization of extrema in two-dimensional space: positive definite (minimum), positive semidefinite (weak minima line), indefinite (saddle point), and negative definite (maximum) @mdobook.],
)<fig_75>


The definiteness classifications shown in the subfigure titles of @fig_75 refer to the definiteness properties of the symmetric Hessian matrix @mdobook. 
The Hessianis stated in matrix form in @eq_103 and in index notation in @eq_104.
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
Following the examination of local and global extreme points, it is important to consider that while finding a global minimum represents the ideal objective of optimization, its attainability depends significantly on the chosen optimization method. An optimizer fundamentally combines mathematical principles with logical operations, implemented through computational algorithms. In this context, logical operations refer to conditional programming structures that determine specific outcomes based on predefined criteria. 
The field encompasses numerous optimization approaches, with extensive comparative analyses available in the literature @Zhang2015 @Cheng2016 @Gharehchopogh2019 @Li2021a @Gad2022. While this work does not aim to provide comprehensive explanations of individual optimization algorithms, relevant theoretical foundations will be presented where necessary for understanding the broader concepts.
In the context of optimization objectives, it is noteworthy that while both global minima and maxima can be determined through mathematical and computational methods, the predominant focus in scientific and industrial applications lies in minimization problems. This convention has developed through practical application and has become an established standard in the field. It is important to note that any maximization problem can be reformulated as a minimization problem, as expressed in @eq_105.

$ min J(x) = - max -J(x) $ <eq_105>

The operation $-J(x)$ in @eq_105 represents a reflection of the original function about the horizontal axis, as illustrated in @fig_76. This geometric transformation provides insight into the relationship between minimization and maximization problems. 
Once the maximum of $-J(x)$ is determined, negating this result yields an equivalent solution to minimizing the original function $J(x)$, thereby demonstrating the mathematical equivalence of these optimization approaches.

// adapt figure caption
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics/4_Min_Max_Sym.svg", 
  width: 100%),
  caption: [Geometric representation of $J(x)$ and its reflection $-J(x)$ illustrating the equivalence stated in @eq_105.],
)<fig_76>

// ---------------------------------- here ---------------------------------- //
Coming back to the econimocal reasonign why global minima are not always the best choice. Depending on the optimization problem, the available hardware, and the optimizer, this is not always possible. There are two major classes of optimization methods. The first works with gradient information, while the other type is gradient-free. Both have their justification and exhibit different advantages and disadvantages. A gradient-based optimizer needs both the gradients of the objective function with respect to the design variables and with respect to the constraints. A gradient can be physically and intuitively imagined through the following question: What happens to one quantity when another quantity is changed? In this case, our quantity would be the function $J(x)$ and the quantity to be changed x. In other words, what happens to the output $J(x)$ when the input x is changed? Should the change in x cause a large change in the output $f("x")$, then x is an important variable. To understand the significance of this statement, the following explanation is provided: The function $J(x)$ could also depend on a vector or multiple variables.

// ------------------------ definition of design vars ----------------------- //
In a real case, engineers want to have as few design variables as possible. These design variables are the quantities that the optimizer can use and adjust to find a minimum. The higher the number of design variables, the bigger the space of design choices becomes, since the number of combinations among the individual design variables is increased.
It may be that changing one design variable in one way minimizes the objective function, while another makes the same change increase the objective function. Therefore, the optimizer must find a suitable value for each individual design variable so that finding the minimum is as accurate as possible.

On one hand, design varaibles do not have to behave similarly when changed in a way. On the other hand, depending on the definition of the objective function, they may also depend on or contradict each other. The objective function is the mathematical description of a function.  

A high number of design variables is desirable only when sufficiently high computing resources are available, accuracy modeling requires a high number of design variables. However, according to the definition of the gradient given earlier, a sensitivity analysis can be performed.
If the gradient is high, it means that the considered design variable has a high influence on the objective function or output. A gradient of zero would mean that the design variable has no influence on the objective function. A high negative value has aalso a significant influence on the objective function. The negative value merely indicates the direction of change. For example, the negative gradient of temperature with respect to pressure could indicate the following: If pressure increases, temperature decreases. If the absolute value is high, this would mean that with a small pressure change, a significant loss of heat or temperature drop would already be measurable.
Another word for sensitivity is gradient. 
// somewhat repetative
This can be derived from the fact that the gradient indicates what influence one considered quantity has on another. With this knowledge and if a high number of design variable is given, the sensitivity analysis can be conducted. 
// rephrase that - less repetition
Its output provides the sensitivity or influence coefficients of the design variables to the objective function. The sensitivity analysis can also be obtained as a quadratic matrix form. In this case, the influence of the design variables on each other would be considered.
With sensitivity analysis, particularly important design variables could be identified and others removed from the objective function. 

Several reasons have already been mentioned why it is desirable to describe the optimization problem as simply as possible. Further reasons become apparent when the two major different types of optimization are examined in more detail. It was stated that many design variables can potentially increase the accuracy with which an optimization problem can be described. For example, if the optimization is designed to be multidisciplinary and the individual disciplines are not too closely related, different considerations arise. One discipline could be economics, another the environment, others could be mechanical structure, delivery time, aerodynamics, engine design, and control engineering. The disciplines could be mathematically describable through differential equations, as in the case of structural mechanics or aerodynamics. 
// not best wording, idea is to say that you may not find a mathematical descirption for the underlying issue
However, they could also be only conditionally mathematically describable. In the latter case, efforts must be made to obtain suitable numiercal representability.

// better wording, framing required
The example with the many different disciplines was merely intended to show that optimization can become particularly complex. That example was derived from the aircraft design field. However, the aircraft design field has significantly more disciplines than mentioned here. 
// generally nice, but its a phd
The curious reader can independently think about other possible disciplines to understand the possible complexity of multidisciplinary optimization. In such cases, it can be assumed that a high number of design variables might be needed. Each individual discipline could have its own design variables. However, overlaps could also occur. In cases of overlap, we speak of coupled design variables @Li2016. In such cases, it could be that one and the same design variable wants to be set particularly high in one discipline and exactly the opposite in another. Furthermore, dealing with coupled design variables would need to be covered with special methods. Much research has already been conducted on the latter @Martins2013 @Song2023 @Sarojini2023 @Yuan2023.

// improve writing - not that clear
If many design variables are now considered desirable because this is necessary to meet accuracy requirements, the explained sensitivity analysis can be performed. This allows the most important design variables to be identified and potentially redundant or less important design variables to be removed. The removal of additional design variables leads, on one hand, to a simplification of the optimization problem. This results in less performant hardware being needed. Furthermore, this usually leads to savings in computation time, which brings various advantages. Faster optimizations can, among other things, lead to faster production. Both the savings in computation time and the savings in cost-intensive hardware have a positive effect on project costs. The rental of high-performance computers means, besides financial resources, also having an influence on the environment. With significantly reduced computation times and less powerful hardware, a positive influence can be taken on the environment.

Furthermore, sensitivity analysis can allow for additional important simplifications regarding coupled design variables. The sensitivity analysis could show that a coupled design variable is particularly important in one discipline while it is hardly significant in another. In such cases, the design variable could be removed from the discipline in which it has less significance. The result would be the removal of a coupling, which would positively affect computation time, hardware, and complexity of the optimizer and code.

// ------------------------------ objective fcn ----------------------------- //
// maybe a better way to form that and make sure to use it form - not we form
At this point, some intuition for objective function should be given. The objective function is a mathematical construct that can also implement logic through programming aids. Since the optimization must have a purpose, the objective function for real world application has a physical and econimocal-related background. The objective function for an aircraft could, for example, be: Reduce fuel consumption. In order to mathematically model fuel consumption, the Navier-Stokes equations from fluid mechanics @Sigloch2022 could be used. To obtain information about mass, equations from structural mechanics could be taken. After that, a relation between lift, drag, mass, flight speed, and other desired quantities would need to be established and defined as a clear objective function. If the standard Navier-Stokes equations are used, it will usually be difficult to avoid using a high-quality #gls("cfd") solver. 
One conceivable possibility would be to have a surrogate model for required quantities and save both computation time and expensive hardware @link_Javed_Master. For the continuiation of this thought experiment, it is assumed that we have a suitable solver for all disciplines and were also able to clearly define the objective function.
Depending on whether gradient-free or gradient-based methods are used, there will be significant differences in and some similarities for solving the optimization task. 
If no boundaries are given to the optimizer, it could generate a physically inadmissible result, regardless of gradient-free or gradient-base. It might strive to achieve negative fuel consumption. Since we can already assess through our physical understanding that no new fuel can be generated during a flight, we would reformulate the objective function so that its minimum approaches zero. Now it might optimize the fuel consumption to zero by setting the flight speed to zero. Since we explicitly want to fly, we provide boundaries. These boundaries can be specified for all design variables. They restrict the choice of design variables in their values. Specifically, this means we specify clear maximum and minimum permissible speeds.

After this optimization, the flight altitude might be so high that we're in space where friction is principally negligible. If flight resistance is minimal, fuel consumption decreases accordingly. 
Thus, the boundaries of the height needs to be adapted.
The goal of this exemplary representation in defining an optimization problem is that the definition of the optimization problem is not always immediately clear and sometimes is a iterative process. The drawback of this is that, it is gernreally not possible to change the optimiaztion problems deifntion during the optimization solution process.
Generally, the optimization formulation needs to modified and the optimization solver needs to start again from scratch. 
If it were a very time- and computation-intensive optimization, repeating this optimization would be extremely unfavorable. Another reason, supported by practical experience, speaks for the following: An optimization should be defined as simply as possible and as complex as necessary.

For real world optimiaztion, generally the conept of constraints should be addressed. Constraints are another form of boundaries, but these can be expressed in the form of equations. Through these, it is possible to incorporate complex physical knowledge or empirical knowledge reformulated as math equation or surrogate model. 
// make sure that it is known to the reader that this is now somehwat a recap
Thus, it can be noted that the definition of an objective function consists of several components. The first would be the design variables, which the optimizer can change to minimize the objective function. The others would be the constraints in the form of equations and the previously described boundaries. Besides this generally valid procedure, the exemplary representation of finding a suitable objective function indicated that defining a unique optimization problem can be an iterative process.

Once the optimization problem has been satisfactorily defined, the optimization can be started. The process can be imagined pictorially as follows. Depending on the number of design variables, various parameter combinations can be checked. The optimizer feels its way into an unknown area by initially entering with a starting choice of parameter combinations. These results give the optimizer further hints on how the next parameter combinations should be chosen. Thus, the optimizer tries to find a path to a local or global minimum. The path can be very short because the optimizer had a good starting value. However, it can also be very long if either the starting value wasn't good or it's a difficult problem to solve. It could also be that the optimization algorithm was unsuitable for the present task. Another option would be that the path repeats itself. In this case, the optimizer would have problems converging or finding a unique solution. The latter could have various causes. Among other things, it could be that the step size for a gradient-based optimization algorithm was chosen too high.

// -------------------------------------------------------------------------- //

Next additional infromaiton about the difference between gradient free and gradient based optimizers shall be given.
When gradients are available, gradient-based optimizers are known to find a solution much faster than gradient-free optimizers. However, gradient-based optimizers usually provide a local minimum. A local minimum could already be an improvement over an initial state that meets the requirements. Therefore, the solution of the local minimum should not be directly rejected.
Moreover, it is important to know that there are diferent types of design variables.
For instance, one design variable might represent temperature. Temperature is a continuous quantity that can be refined between two discrete values through decimal numbers. Another type of design variable could be discrete. Here, only whole numbers can be chosen, and decimal places are thus not available. Another form of design variables could be binary variables. Here, there would be exactly two possibilities, either yes or no. For discrete and binary design variables, it is often quite difficult to obtain reliable gradients. With a gradient-based optimizer, the gradients significantly determine the optimization path. If these are unreliable or even wrong, either unreasonable results will be obtained, or no convergence can be achieved. Furthermore, it may also be impossible to calculate gradients. In this case, gradient-based optimizers cannot be used.
Gradient-free optimizers have the advantage that they have higher chances of finding a global optimum. 
Additionally, they can work with all forms of design variables since no gradient information is needed. 
Their disadvantage is that they become significantly slower with an increasing number of design variables. 

Finally, since the concept pf multidisciplinary optimization was mentioned, it is also important th mention the concept of muliobjective optimization. 
// adapt that also make sure the have clearly mentioned that there is much more that can be said about optimiaztion. howver because optimiaztion is only one part of this phd only some important aspects of optimiaztion were covered - those who are thought would be required to follow along the upcoming optimiaztion framework preswented in @chap_4_0_4 and the optimization result sin @chap_5
Concrete example, It can also happen that the customer has wishes that are only conditionally physically related. For example, it could be that on one hand, the costs in building an aircraft should be kept as low as possible. On the other hand, the aircraft should have a high flight speed. In such a case, it could be assumed that two different objective functions can be found. If two or more objective functions are to be used, multi-objective optimization can be performed. There is sufficient literature on this topic, so reference is made to @Sengupta2016 @Cui2017 @Blank2020.

// --------------------------------- summary -------------------------------- //
// summary based on the provided text above is missing
#summary_([

This has been a brief summary of essential aspects of optimization. Optimization is a very large field that finds application in various industries. For interested readers, several helpful book resources can be listed: @Gritzmann2013 @Papageorgiou2015 @Stein2018 @Stein2018a @Koop2018 @Grimme2018 @Scholz2018 @Jarre2019 @Dietz2019 @Schumacher2020. Finally, for multidisciplinary optimization, reference is made to the textbook @mdobook.

])