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

// adapt language to come more close to phd
Optimization is primarily a mathematical method used to obtain #emp_[optimal] result. Understanding the definition of #emp_[optimal] is particularly important. When optimizers speak of an optimized result, they usually refer to a local minimum rather than a global minimum. There are three important technical terms that should be explained in the following.

The difference between local and global can be understood through the first and second derivatives of an analytical mathematical function. 
// adapt language according to a phd
From school days, curves with many ups and downs might still be familiar. If the present graph of the analytical function shows many fluctuations in its course it is called multimodal. Here many occasions can be found where the sign of the first derivative changes from positive to negative, vice versa or goes to zero and then back to the orginal sing.
An illustative depiction of of a multimodal funciton is povided in @fig_72

// proper caption required
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics/0_Multi_Modal.svg", 
  width: 100%),
  caption: [illustrative multimodal function shwoing local min, max and global min and max],
)<fig_72>

// ---------------------------- global and local ---------------------------- //
// use it form
Besides mulitmodality of functions, @fig_72 can be used to explain other important necessities for optimiazton, namely the difference between local and gloabl extreme points. The function depicted in @fig_72 clearly lets identify points of abaolsute heighest or lowest values. The function with the heihgest value inside the entire considered function space is refered to as global maxium and the with the lowest value as the global minimum. 
NExt the focus is set on inflection points that can be observed.
Before and after these, the first derivatives, which indicate the slope of the function, usually change their sign. 
Exactly at the points where the first derivative has a value of zero, the local minima and maxima are located. 
Thus, the difference between global and local is that generally there is only one global maximum and one global minimum value, while there can be multiple local maxima and minima values. 
It is also possible that fucntions do not have one single unique global maximum or minium value and it aligns with the local extreme values.
A concrete example can be given thorug  trigonometric functions, such as sine or cosine functions. While they are non-linear, due to their periodicty the global extreme values are the same as the local values.
This can be verified through @fig_73.

// proper caption required
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics/1_Sin_Opti.svg", 
  width: 100%),
  caption: [Original funcion sin(x), global and local min and max, first derivative and second derivative],
)<fig_73>

Another example for no unique gloabl values besides periodic functions are symmetric functions. 
Furthermore, it was mentioned that the sign of the slope before and after a extreme point (first derivative equals zero) usally changes. 
// should be stated more clearer
However, it could be the case that after finding an local extreme value (derivatives is zero) the sign of the derivative does not change, but instead goes back to the original sign.
Such kind of observations are denoted as saddle points. Saddle points occur less frequently than a sign change, espeisally in 1d functions, but with complex functions, the probability of their occurrence increases. 
A concrete example for a saddle point is given in @fig_74

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics/2_Saddle_Point.svg", 
  width: 100%),
  caption: [illustrative example of a saddle point using one variable],
)<fig_74>

// --------------------------- multivariate optim --------------------------- //
Using two varaibles imoprtant extreme occurences are visualized in @fig_75.


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics/3_2D_Extremes.svg", 
  width: 100%),
  caption: [illustrative example of important extreme situations, positive defnite (minimum), Positive Semidefinite (Weak Minima Line),Indefinite (Saddle Point), Negative Definite (Maximum) @mdobook ],
)<fig_75>

The 
// is this really called definiteheit of the hessian matrix?
definiteheit mentioned in the subfigure titles of @fig_75 refers to definiteheit of the symetric hessian matrix @mdobook. The hessian matrix can be stated mathematicaly as @eq_103 or as @eq_104 in index notation.
For an in depth review on the hessian matrix, how its eigenvalues are calculated and which meaning it has readers are referred to literature such as @mdobook @Papageorgiou2015 @Stein2018a.

#set math.mat(gap: 1.1em)
$ bold(H)_(f)(x) = mat(
  display(frac(diff^2 f, diff x_1 diff x_1)), display(frac(diff^2 f, diff x_1 diff x_2)), ..., display(frac(diff^2 f, diff x_1 diff x_n));
  display(frac(diff^2 f, diff x_2 diff x_1)), display(frac(diff^2 f, diff x_2 diff x_2)), ..., display(frac(diff^2 f, diff x_2 diff x_n));
  dots.v, dots.v, dots.down, dots.v;
  display(frac(diff^2 f, diff x_n diff x_1)), display(frac(diff^2 f, diff x_n diff x_2)), ..., display(frac(diff^2 f, diff x_n diff x_n))
) $ <eq_103>

$ bold(H)_f_(i j) =  (diff^2 f)/(diff x_i diff x_j ) $ <eq_104>

// ---------------------------------- here ---------------------------------- //
// -------------------------- general optimization -------------------------- //
Having explained the difference between local and global extreme points, generally, it could be assumed that the ideal goal of the optimizer is to find a global minimum. However, depending on which optimizer is used, this is only conditionally feasible. An optimizer is a combination of mathematics and logic, typically implemented through computer code. 
Logic in this context means that if this happens, then that should be given as an answer. There are numerous optimizers and numerous review articles comparing different optimizers @Zhang2015 @Cheng2016 @Gharehchopogh2019 @Li2021a @Gad2022. 
The aim of this work is not to explain the individual optimization algorithms in detail. However, where further explanations are deemed necessary for understanding, these will be provided.

It was stated that the goal is to find a global minimum and not maximum. Searching for a global maximum is feasible both mathematically and programmatically. However, in science and industry, the search is usually for the minimum. This has evolved over time and could potentially be described as an unwritten, internationally recognized norm. If the function $f(x)$ is to be minimized, this could also be defined as a maximization problem, as shown in equation @eq_105. 

$ min f(x) = - max -f(x) $ <eq_105>

In @eq_105 $-f(x)$ would mirror the function in two dimensions about the horizontal axis as shown. This is demonstrated in @fig_76 and supports in understnading the additional following reasoning.
After this function $-f(x)$ has been maximized, the optimization result can be reversed in sign again to obtain the same result as minimizing $f(x)$.

// adapt figure caption
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics/4_Min_Max_Sym.svg", 
  width: 100%),
  caption: [illustrative example of a function f(x) and its -f(x) to visually understand the concept of @eq_105. ],
)<fig_76>


Coming back to the econimocal reasonign why global minima are not always the best choice. Depending on the optimization problem, the available hardware, and the optimizer, this is not always possible. There are two major classes of optimization methods. The first works with gradient information, while the other type is gradient-free. Both have their justification and exhibit different advantages and disadvantages. A gradient-based optimizer needs both the gradients of the objective function with respect to the design variables and with respect to the constraints. A gradient can be physically and intuitively imagined through the following question: What happens to one quantity when another quantity is changed? In this case, our quantity would be the function $f(x)$ and the quantity to be changed x. In other words, what happens to the output $f(x)$ when the input x is changed? Should the change in x cause a large change in the output $f("x")$, then x is an important variable. To understand the significance of this statement, the following explanation is provided: The function $f(x)$ could also depend on a vector or multiple variables.

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
This has been a brief summary of essential aspects of optimization. Optimization is a very large field that finds application in various industries. For interested readers, several helpful book resources can be listed: @Gritzmann2013 @Papageorgiou2015 @Stein2018 @Stein2018a @Koop2018 @Grimme2018 @Scholz2018 @Jarre2019 @Dietz2019 @Schumacher2020. Finally, for multidisciplinary optimization, reference is made to the textbook @mdobook.