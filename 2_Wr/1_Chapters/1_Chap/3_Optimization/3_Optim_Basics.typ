/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */

// INFO
// all refs
// all figs - the image data was not copied
// all eqs

== Fundamentals of Optimization

In the previous section, important basics of the beam model were explained, particularly the internal force distributions relevant for optimization. However, before explaining in detail how optimization can work together with a beam model, it is important to have a fundamental understanding of optimization. This section is intended to meet this requirement.

Optimization is primarily a mathematical method used to obtain a so-called optimal result. Understanding the definition of "optimal" is particularly important. When optimizers speak of an optimized result, they usually refer to a local minimum rather than a global minimum. There are three important technical terms that should be explained in the following.

The difference between local and global can be understood through the first and second derivatives of an analytical mathematical function. From school days, curves with many ups and downs might still be familiar. If the present graph of the analytical function shows many fluctuations in its course, then the first derivative changes from positive to negative or vice versa. If this type of variation is recognizable in many places, the function can be described as multi-modal or highly nonlinear. It is important to initially not consider simple trigonometric periodic functions, such as sine or cosine functions, which are also non-linear. The periodic sine or cosine function is a trigonometric non-linear function and exhibits many changes in first derivatives (positive to negative) when enough cycles are displayed. However, this does not help in understanding local and global minima.

To illustrate the difference between local and global behavior, we consider functions where one point can clearly be identified as absolutely lowest or highest. When such a function is considered, it can be noted that the lowest point in the entire function course is referred to as the global minimum. Correspondingly, the point that results in the highest in the entire function space would be considered the global maximum. Between the global minima and maxima, so-called inflection points can be observed. Before and after these, the first derivatives, which indicate the slope of the function, usually change their sign. Exactly at the points where the first derivative has a value of zero, the local minima and maxima are located. Thus, the difference between global and local is as follows: For non-periodic and symmetric functions, there is exactly one global value for maxima and minima. If the function is highly nonlinear or even periodic, correspondingly many local minima and maxima will be found.

Furthermore, it should be explained why the sign of the slope does not always have to change before and after a local extreme point (first derivative equals zero). In some cases, the function course comes to rest. Here, it could be that the course only briefly has a slope of zero and then continues without changing signs. If the sign is not changed after a local extreme point, it is called a saddle point. Saddle points occur less frequently than a sign change, but with complex functions, the probability of their occurrence increases. Moreover, it is also possible that after a local extreme point, the slope remains zero. In this case, a constant value would be observed for a corresponding argument interval. By argument interval, we mean an interval that has input values arranged in a sequential order. The input values are those values that the function would receive as input.

Generally, it could be assumed that the ideal goal of the optimizer is to find a global minimum. However, depending on which optimizer is used, this is only conditionally feasible. An optimizer is a combination of mathematics and logic, typically implemented through computer code. Logic in this context means that if this happens, then that should be given as an answer. There are numerous optimizers and numerous review articles comparing different optimizers @Zhang2015 @Cheng2016 @Gharehchopogh2019 @Li2021a @Gad2022. The aim of this work is not to explain the individual optimization algorithms in detail. However, where further explanations are deemed necessary for understanding, these will be provided.

It was stated that the goal is to find a global minimum. Searching for a global maximum is feasible both mathematically and programmatically. However, in science and industry, the search is usually for the minimum. This has evolved over time and could potentially be described as an unwritten, internationally recognized norm. If the function $f(x)$ is to be minimized, this could also be defined as a maximization problem, as shown in equation \eqref{eq_31}. Here, $-f(x)$ would mirror the function in two dimensions about the horizontal axis. After this function $-f(x)$ has been maximized, the optimization result can be reversed in sign again to obtain the same result as minimizing $f(x)$.

$ min f(x) = - max -f(x) $ <eq_31>

So far, we had assumed that we want to find a global minimum. Depending on the optimization problem, the available hardware, and the optimizer, this is not always possible. There are two major classes of optimization methods. The first works with gradient information, while the other type is gradient-free. Both have their justification and exhibit different advantages and disadvantages. A gradient-based optimizer needs both the gradients of the objective function with respect to the design variables and with respect to the constraints. A gradient can be physically and intuitively imagined through the following question: What happens to one quantity when another quantity is changed? In this case, our quantity would be the function $f(x)$ and the quantity to be changed $op("x")$. In other words, what happens to the output $f(x)$ when the input $op("x")$ is changed? Should the change in $op("x")$ cause a large change in the output $f("x")$, then $op("x")$ is an important variable. To understand the significance of this statement, the following explanation is provided: The function $f(x)$ could also depend on a vector or multiple variables.

In a real case, engineers want to have as few design variables as possible. These design variables are the quantities that the optimizer can use and adjust to find a minimum. The higher the number of design variables, the more possibilities the optimizer has to perform combinations of the individual design variables. It may be that changing one design variable minimizes the objective function, while another makes the same change increase the objective function. Therefore, the optimizer must find a suitable value for each individual design variable so that finding the minimum is as accurate as possible. On one hand, as mentioned earlier, design variables usually do not behave similarly or even identically to each other. On the other hand, depending on the definition of the objective function, they may also depend on or contradict each other. The objective function is the mathematical description of a function. To maintain readability, we are currently still considering a simple function $f(x)$, which receives either $op("x")$ as a scaled and simple input or as a vector with multiple inputs.

With this explanation, it can be understood that a high number of design variables is rather undesirable. A high number of design variables is desirable only when sufficiently high computing resources are available and there is a high requirement for accuracy. However, according to the definition of the gradient given earlier, a so-called sensitivity analysis can be performed. As a reminder, if the gradient is high, it means that the considered design variable has a high influence on the objective function or output. A gradient of zero would mean that the design variable has no influence on the objective function. A particularly negative gradient is high in absolute value, and the consideration should be carried out similarly. A high negative value thus also has a significant influence on the objective function. The negative value merely indicates the direction of change. For example, the negative gradient of temperature with respect to pressure could indicate the following: If pressure increases, temperature decreases, and vice versa. Since the absolute value is high, this would mean that with a small pressure change, a significant loss of heat or temperature drop would already be measurable.

Another word for sensitivity is gradient. This can be derived from the fact that the gradient indicates what influence one considered quantity has on another. The latter can also be expressed as follows: The gradient indicates the sensitivity of one quantity to another. When the sensitivity is high, the influence of the considered quantities on each other is large, and thus the sensitivity is also high. This naturally applies analogously in reverse for a small gradient and low sensitivity, as well as no sensitivity with a gradient of zero. With this knowledge, the sensitivity analysis can be conducted. If a high number of design variables is present, a so-called sensitivity analysis can be performed. Its output provides the sensitivity or influence coefficients of the design variables to the objective function. The sensitivity analysis can also be obtained as a quadratic matrix form. In this case, the influence of the design variables on each other would be considered.

With sensitivity analysis, particularly important design variables could be identified and others removed from the objective function. Several reasons have already been mentioned why it is desirable to describe the optimization problem as simply as possible. Further reasons become apparent when the two major different types of optimization are examined in detail. It was stated that many design variables can potentially increase the accuracy with which an optimization problem can be described. Indeed, this can be true. For example, if the optimization is designed to be multidisciplinary and the individual disciplines are not too closely related, different considerations arise. One discipline could be economics, another the environment, others could be mechanical structure, delivery times, aerodynamics, engine design, and control engineering. The disciplines could be mathematically describable through differential equations, as in the case of structural mechanics or aerodynamics. However, they could also be only conditionally mathematically describable. In the latter case, efforts must be made to obtain suitable digital representability.

The example with the many different disciplines was merely intended to show that optimization can become particularly complex. That example was derived from the aircraft design field. However, the aircraft design field has significantly more disciplines than mentioned here. The curious reader can independently think about other possible disciplines to understand the possible complexity of multidisciplinary optimization. In such cases, it can be assumed that a high number of design variables might be needed. Each individual discipline could have its own design variables. However, overlaps could also occur. In cases of overlap, we speak of coupled design variables @Li2016. In such cases, it could be that one and the same design variable wants to be set particularly high in one discipline and exactly the opposite in another. Furthermore, dealing with coupled design variables would need to be covered with special methods. Much research has already been conducted on the latter @Martins2013 @Song2023 @Sarojini2023 @Yuan2023.

If many design variables are now considered desirable because this is necessary to meet accuracy requirements, sensitivity analysis can be performed. This allows the most important design variables to be identified and potentially redundant or less important design variables to be removed. The removal of additional design variables leads, on one hand, to a simplification of the optimization problem. This results in less performant hardware being needed. Furthermore, this usually leads to savings in computation time, which brings various advantages. Faster optimizations can, among other things, lead to faster production. Both the savings in computation time and the savings in cost-intensive hardware have a positive effect on project costs. The rental of high-performance computers means, besides financial resources, also having an influence on the environment. With significantly reduced computation times and less powerful hardware, a positive influence can be taken on the environment.

Furthermore, sensitivity analysis can allow for additional important simplifications regarding coupled design variables. The sensitivity analysis could show that a coupled design variable is particularly important in one discipline while it is hardly significant in another. In such cases, the design variable could be removed from the discipline in which it has less significance. The result would be the removal of a coupling, which would positively affect computation time, hardware, and complexity of the optimizer and code.

At this point, the perspective of an optimizer should be explained. The optimizer's task is, once again, the minimization of an objective function. The objective function is a mathematical construct that can also implement logic through programming aids. Since the optimization must have a purpose, we assume that the objective function has a physical and cost-saving background. The objective function for an aircraft could, for example, be: "Reduce fuel consumption." In order to mathematically model fuel consumption, the Navier-Stokes equations from fluid mechanics @Sigloch2022 could be used. To obtain information about mass, equations from structural mechanics could be taken. After that, a relation between lift, drag, mass, flight speed, and other desired quantities would need to be established and defined as a clear objective function. If the standard Navier-Stokes equations are used, it will usually be difficult to avoid using a high-quality CFD solver. One conceivable possibility would be to have a surrogate model for required quantities and save both computation time and expensive hardware. However, in this thought experiment, we assume that we have a suitable solver for all disciplines and were also able to clearly define the objective function.
// -------------------------------------------------------------------------- //


Depending on whether gradient-free or gradient-based methods are used, there will be significant differences in solving the optimization task. However, there are also similarities which will be discussed in the following.
If no boundaries are given to the optimizer, it would generate a physically inadmissible result. It might strive to achieve negative fuel consumption. Since we can already assess through our physical understanding that no new fuel can be generated during a flight, we would reformulate the objective function so that its minimum approaches zero. Now it might optimize the fuel consumption to zero by setting the flight speed to zero. Since we explicitly want to fly, we provide so-called boundaries. These boundaries can be specified for all design variables. They restrict the choice of design variables in their values. Specifically, this means we specify clear maximum and minimum permissible speeds.

After this optimization, the flight altitude might be so high that we're in space where friction is principally negligible. If flight resistance is minimal, fuel consumption decreases accordingly. The goal of this exemplary representation in defining an optimization problem is that the definition of the optimization problem is not always immediately clear. Now all boundaries for the design variables have been set reasonably, and again unphysical behavior is observed. At this point, the attentive reader may have already realized that after the optimization problem was changed once, the entire optimization had to be restarted. If it were a very time- and computation-intensive optimization, repeating this optimization would be extremely unfavorable. Another reason, supported by practical experience, speaks for the following: An optimization should be defined as simply as possible and as complex as necessary.

Since the optimization still delivers unreliable results, the concept of constraints should be addressed. Constraints are another form of boundaries, but these can be expressed in the form of equations. Through these, it is possible to incorporate complex physical knowledge or surrogate models based on empirical knowledge. Thus, it can be noted that the definition of an objective function consists of several components. The first would be the design variables, which the optimizer can change to minimize the objective function. The others would be the constraints in the form of equations and the previously described boundaries. Besides this generally valid procedure, the exemplary representation of finding a suitable objective function indicated that defining a unique optimization problem can be an iterative process.

Once the optimization problem has been satisfactorily defined, the optimization can be started. The process can be imagined pictorially as follows. Depending on the number of design variables, various parameter combinations can be checked. The optimizer feels its way into an unknown area by initially entering with a starting choice of parameter combinations. These results give the optimizer further hints on how the next parameter combinations should be chosen. Thus, the optimizer tries to find a path to a local or global minimum. The path can be very short because the optimizer had a good starting value. However, it can also be very long if either the starting value wasn't good or it's a difficult problem to solve. It could also be that the optimization algorithm was unsuitable for the present task. Another option would be that the path repeats itself. In this case, the optimizer would have problems converging or finding a unique solution. The latter could have various causes. Among other things, it could be that the step size for a gradient-based optimization algorithm was chosen too high.

// TODO incomplete in the original text?
Eine alternative Analogie zum bildlichen Verstädnis, wie ien optimierer arbeitet könnte wie folgt lauten.

As mentioned before, there are two major categories of optimizers: gradient-free and gradient-based. When gradients are available, gradient-based optimizers are known to find a solution much faster than gradient-free optimizers. However, gradient-based optimizers usually provide a local minimum. A local minimum could already be an improvement over an initial state that meets the requirements. Therefore, the solution of the local minimum should not be directly rejected.
It's not uncommon to have different types of design variables. For instance, one design variable might represent temperature. Temperature is a continuous quantity that can be refined between two discrete values through decimal numbers. Another type of design variable could be discrete. Here, only whole numbers can be chosen, and decimal places are thus not available. Another form of design variables could be binary variables. Here, there would be exactly two possibilities, either yes or no. For discrete and binary design variables, it is often quite difficult to obtain reliable gradients. With a gradient-based optimizer, the gradients significantly determine the optimization path. If these are unreliable or even wrong, either unreasonable results will be obtained, or no convergence can be achieved. Furthermore, it may also be impossible to calculate gradients. In this case, gradient-based optimizers cannot be used.

Gradient-free optimizers have the advantage that they tend to find a global optimum. Additionally, they can work with all forms of design variables since no gradient information is needed. Their disadvantage is that they become significantly slower with an increasing number of design variables. Since multidisciplinary optimization was mentioned, the following should be said in a brief aside: It can also happen that the customer has wishes that are only conditionally physically related. For example, it could be that on one hand, the costs in building an aircraft should be kept as low as possible. On the other hand, the aircraft should have a high flight speed. In such a case, it could be assumed that two different objective functions can be found. If two or more objective functions are to be used, a so-called multi-objective optimization can be performed. There is sufficient literature on this topic, so reference is made to @Sengupta2016 @Cui2017 @Blank2020.

This has been a brief summary of essential aspects of optimization. Optimization is a very large field that finds application in various industries. For interested readers, several helpful book resources can be listed: @Gritzmann2013 @Papageorgiou2015 @Stein2018 @Stein2018a @Koop2018 @Grimme2018 @Scholz2018 @Jarre2019 @Dietz2019 @Schumacher2020. Finally, for multidisciplinary optimization, reference is made to the textbook @mdobook.