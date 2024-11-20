/* -------------------------------------------------------------------------- */
#import "../../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */
#pagebreak(weak:true)


// TODO section required
// subsection required 
// proper intro for section and subseciton required

// INFO
// all refs
// all figs - the image data was copied
// all eqs
// compared with true german text


// TODO Title
== Fundamentals for Optimization <chap_4_0>

// needs to be filled 



// TODO Title
=== Discretization of Aerodynamic Loads <chap_4_0_0>
// get proper pre intro for this subsection based on the text that follows inshallah
In the previous @chap_3_0_4, #gls("lie", long:true) was introduced. 
Through further examination of the physical load application, it was revealed that optimal #gls("lie") selection depends strongly on context-specific factors and some identified critical parameters. Among these critical parameters are how many #glspl("lie") should be used, what dimensions they should have, and what load magnitudes can be expected.
These critical parameters require systematic determination through load approximation analysis.
This subsection will explain what is meant by the discretization of continuous aerodynamic loads, why optimization is necessary for an ideal outcome, and how this answers the questions of the critcal praemters previously mentioend.
Furthermore, we will explore multiple methods that could potentially be used for #gls("ld", long:true) and 
// a word that is used to describe that the decision was made based on rationale arugments
vindicate to one favorite approach.
// depending on the content comig, this preintro maybe was not complete and needs some adjustments

// -------------------------------------------------------------------------- //
According to current physical understanding, an aircraft in flight experiences load at every infinitesimally small point. 
Thus, this load is considered continuous. In other words, if the load starts at point A and ends at point B, it should be impossible to find an infinitesimally small point between A and B where no force acts.
Unless explicitly stated otherwise, the load always refers to the aerodynamic load.
In the previous @chap_3_0_4,
// do not use the we form and never use the word discuss
we discussed which methods are available to us for replicating these aerodynamic loads in an experimental setup. 
// k2h2 can be replaced with swith
It was also explained why the K2H2 project opted for a ground-based experimental setup without a wind tunnel.
Consequently, #glspl("lie") are now needed, which must be locally attached to the wing skin.
The #glspl("lie") serve as physical objects through which loads can be applied.
The goal is to apply and load the #glspl("lie") in such a way that the resulting load distribution closely matches the original aerodynamic loading.
A concrete definition for #gls("ld") could be: Approximating a continuous force distribution through individual point and area loads.

The requirement to apply #glspl("lie") in a way that can reproduce the continuous aerodynamic loading can be defined as an optimization problem.

// these questions were already mentioned in @chap_3_0_4 - thus its mentioning needs to be integrated proplery
Specifically, the engineer faces the following questions:

1. How many #glspl("lie") should be used?
2. At which locations should the #glspl("lie") be attached?
3. What dimensions should the #glspl("lie") have?
4. What load magnitudes must the #glspl("lie") have?
5. What minimum and maximum spacing between #glspl("lie") should be maintained?

The listed questions could all be answered through optimization.
Beyond providing important answers, optimization also supports economic and environmental consciousness. 
As a supporting example: for an imagined $60 #unit("m")$ long wing, we should try to use the minimum number of #glspl("lie") possible. 
To expand on this example, let's consider electrically driven cylinders.
// it should be clear that this is just a made up example for demonstraiton pruposes
If, say, through optimization 23 cylinders show a similar acceptable accuracy as 46 cylinders in the non-optimized state, significant costs can be saved in terms of electricity, personnel, procurement costs, other operating costs and delivery routes.
Through proper #gls("ld") paired with subsequent optimization, the number of required #glspl("lie") can likely be reduced considerably.
The latter would have a positive effect on aspects such as costs, safety concept, and control effort.
Additionally, optimization would ensure that an appropriate accuracy of the #gls("ld") is achieved.
In summary, a reasonable #gls("ld") combined with optimization is motivated by the fact that it can 
// maybe include cost effective, systematic approach, engineering approach based on math and established methods
achieve sufficient quality of #gls("ld") with a lower number of #glspl("lie").

Up to this point, we have explained what discretization is and mentioned some advantage optimization would bring.
Next, we will focus on concrete discretization methods. 
For #gls("ld"), the goal is to achieve the closest match to the original aerodynamic load distribution with as few #glspl("lie") as possible. 
Pure discretization is known as curve-fitting or regression 
@Kaptanoglu2022 @Silva2020 @Tibshirani1996 @Brunton2016 @Frochte2020 @Brunton2022 @Bishop2006 @Arlinghaus2023 @Zielesny2016 @James2023 @Richter2019 @prince2023understanding @Zheng2018.
Here, function values are assigned at discrete support points. 

// maybe there is a better way to epxress that we are getting the pure theoretically defintition to more engineering based and real world perspective - which we need now 
Translated to loads, discrete support points mean #glspl("lie") and the function values are force magnitudes.
There are various methods through which regression can be performed.
The simplest would be linear regression. 
However, non-linearities can also be used to reproduce prescribed behavior.
The latter corresponds to the definition of Machine Learning. 
Machine Learning is, simply put, a method to generate a surrogate model using existing data and optimization @Brunton2022.
This surrogate model is in many cases a regression model.
Thus, the technique of regression is a subset of Machine Learning, which is why there is much literature available on this topic.

// --------------------------------- brunton -------------------------------- //
According to Professor Steve Brunton, who works at the University of Washington and specializes in physics-based simulations and Machine Learning, systems that represent reality are parsimonious.
In the context of modeling surrogate models, parsimonious means that the number of free parameters should be chosen as low as possible and as high as necessary.
To understand this, we should first 
// the word discuss is disliked also within the upcoming description a link to the figure @fig_59 needs to be made
discuss the difference between interpolation and extrapolation.
For this, a concrete example should be presented. 
// it should be clear that this is just a made up example for explanation pruposes
Let's assume we have 100 data points in a two-dimensional space. One dimension could represent shoe size and the other dimension could represent height.
These 100 shoe sizes and heights span a known space. 
If a new shoe size is given that falls within the known space, the corresponding height can be determined through interpolation.
For a simplified understanding of extrapolation, let's further assume that the minimum shoe size was 36 and the maximum shoe size was 46 in our dataset.
If now a shoe size of 47 is given to determine a height based on it, this is called extrapolation.
Extrapolation is the calculation of outputs where the input lies outside the training dataset.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/10_Interpolation.svg", 
  width: 100%),
  caption: [Illustraitve depiction of Inteprolation and Extrapolation]
) <fig_59>



Now that the difference between extrapolation and interpolation is known, let's assume we have two models that both equally well cover the observed training behavior.
Let's assume that our actual system underlies a linear function. In other words, the training dataset was generated by an underlying linear function. 
However, this is not known to us in advance.
In principle, a linear regression should be able to perfectly reproduce the known training behavior.
But non-linear regressions can also learn the linear training behavior.
In one case we have a linear regression model and in the other we assume a non-linear model of fourth degree.
The linear model is less complex than the non-linear model of fourth degree.
This also means that the linear model shows lower performance in learning complex or fluctuating behavior.
It can only capture a single trend, either an increase with a certain gradient or a decrease with a certain gradient. 
Further differences could not be captured with a linear model.
The non-linear model of fourth degree can not only reproduce the linear model but can also learn certain fluctuations (locally changing gradients). 
Thus, the non-linear model can do everything the linear model can plus more.
Consequently, one might assume that the non-linear model is always superior to the linear model.
Whether this is actually the case can be answered, among other things, by considering the difference between interpolation and extrpolation and how models are trained through optimization.

In order to determine the perforamnce of the fitting through optimization error metrics are used. 
These error metrics are often based either on the L2 or L1 norm.
While the L2-norm was previusly provided as @eq_33, yet it was specific to the task of calculating the magnitude of the curvature consisting of three components.
The more general version of the L2-norm or Euclidean distance that is required for universial optimiaztion and for higher multidimeniosnality is given as @eq_70.
The sqaured L2-norm or squared Euclidean distance in its general form is given as @eq_71 and  the L1-norm or Manhattan distance is given as @eq_72.

$ norm(x)_2 = sqrt(sum_i^n x_i^2) $ <eq_70>
$ norm(x)_2^2 = (sqrt(sum_i^n x_i^2))^2 = sum_i^n x_i^2 $ <eq_71>
$ norm(x)_1 = sum_i^n space.thin abs(x_i) $ <eq_72>

Note there are moe norms, however, their mention has no relevance for this work, thus if readers are interested to know wbaout these, they are refered to @Brunton2022.
From the L2-norm the least-sqaured error metric @Brunton2022 as provided in @eq_73 can be obtained.
// need to add n, number of data points
Here, $f(x_k)$ represents the data value from the training dataset or the output of a function value, and $x_k$ is the estimate that the regression model reproduces.

$ E_2(f) = sqrt(1/n sum_(k=1) ^n [x_k- f(x_k)]^2) $<eq_73>

The L2-norm tends to assign non-zero values to all available model parameters. 
This means it tries to attribute a certain importance to all available parameters.
However, for this, the importance or magnitude of all the model parameters must be reduced accordingly.
In summary, this means that the L2-norm tries to use as many available parameters as possible to learn an underlying system.
The mean absolute error @Brunton2022 that can be obtained through the L1-norm is given as @eq_74. It gives less weight to outliers, contrary to the behavior of the L2-norm.

$ E_1(f) = 1/n sum_(k=1) ^n space.thin abs( x_k - f(x_k) ) $<eq_74>

// --------------------------------- l1 norm -------------------------------- //
The consequence is that the L1-norm favors sparse weight matrices.
Sparse means that in the matrix containing the individual coefficients or weights for a regression model, the majority of entries are assigned a 0.
A 0 in the weight matrix means that the coefficients are not used.
The result is an attempt to learn the underlying system behavior, which should be recognized from the training behavior, with as few parameters as possible.
// word discuss is dilsked
Applying what has been discussed so far to the linear and non-linear model of fourth order, the following can be noted.
By optimizing the non-linear model of fourth degree with the L2-norm, all five available parameters are assigned some importance. 
In interpolation, this should not pose a problem since the optimization has minimized the error specifically for this single task.
However, highly unreliable output values are to be expected in extrapolation.
The linear regression model should also be trained with the L2-norm. 
Since the underlying system is a linear function, in this case both interpolation and extrapolation would be correct.
The example presented should show that more complex models do not always provide better accuracy.
More complex models allow more flexibility in learning. 
However, this flexibility might exceed the behavior that should be extracted from the training data.
The provided explanation is visually depicted in @fig_60.
On the left it can be seen that the lienar model as well as the fourth order polynomnimal function are fine for interpolation.
Yet, on the right hand where extrpolation is demonstrated, it can be obsevered that the fourth order model has too much flexibility, deviates highly from the linearly tending structre and thus performance worse than the linear model.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/11_Lin_Poly.svg", 
  width: 100%),
  caption: [On the left side a focused view on within the training range is depicted for the linear and the 4th order polynomnimal fcn. On the right side the extrpolation is hihglighted to see what happens when the funciton has too much of freedom.]
) <fig_60>


Besides accuracy, computation time also plays a major role. 
Whether a model has 2 or 100 parameters would lead to very large differences in accuracy in extrapolation.
However, for computation time, such parameter numbers would not play a role with today's available hardware.
Today, large models are no longer calculated on the #gls("cpu"), but on the #gls("gpu").
This has many reasons, but the main one is the parallelizability of the #gls("gpu") as mentioned in @chap_3_0.
According to current standards, models with $7 times 10^9$ 
@Li2023 @Jiang2023 @Touvron2023a @Touvron2023
parameters are quite common and are seen in certain circles in the field of #gls("llm", long:true) as entry-level model size.
Larger models can easily have $7 times 10^10$ 
@Chowdhery2022 @Team2023 @Almazrouei2023 @link_Mixtral_8_7
model parameters.
// This is not the best way to express the intention - needs reformulation 
Since there is a lot of rapid progress in the world of #gls("llm"), there exists more than just one overview paper.
A fairly current overview paper on the number of model parameters can be found in @Minaee2024. 
For interested readers, so-called tiny language models have a model count of about $1 times 10^9$ @Zhang2024

The reference to #gls("llm") should show that the number of model parameters can be neglected for our approximation. The first reason for that is that load approximation does not require flexibility of $1 times 10^9$ model parameter, in fact it is even much less than $1 times 10^3$ parameters. 
Secondly the concrete numbers provided for the #gls("llm") should have made it clear which computational power exists as of writing this thesis.
Therefore, only the accuracy requirement is significant for the objective of load approximation.
// Use the it form not we form
The L2-norm can be more favorable for more flexible models for interpolation when faster convergernce beahviour during optimization is desired.
The L1-norm on the other hand generally ensures within the optimization that superfluous model parameters are switched off (set to 0), making it more suitable for extrapolation.
If a model is to reproduce reality, it must be able to both interpolate and extrapolate.
As a reminder, parsimonious states, as simple or uncomplicated as possible and as complex as necessary.
Translated to regression models, this means as few model parameters as possible and only as many as necessary.  
If reality behaves parsimoniously, it particularly agrees well with the L1-norm.


// --------------------- relationship ML and regression --------------------- //
// maybe better way to explain what we have done and what we can now use this background knowledge for now
So far, we have explained the relationship between Machine Learning techniques and regression models.
Subsequently, important basic knowledge about model size and model accuracy influencing factors was provided.
Next, this knowledge should be applied to the concrete problem of #gls("ld").
As mentioned before, #gls("ld") is mathematically nothing other than a regression or interpolation task.
The difference between regression and interpolation is that in interpolation, each individual support point must be hit, whereas this is optional in regression.
This can be imagined as follows: in interpolation models, it is particularly important that the support points, which represent the data points from the training dataset, reproduce the known output as accurately as possible. 
In other words, the known output must be hit exactly.
In regression, this is not necessarily the case. 
Here, other factors might have greater importance.
A possible example for the latter would be that the course between two data points can be represented as a continuous curve with tangent continuity.
The aerodynamic load distribution provides both local spatial coordinates and the magnitude of the force acting there.
For the #gls("ld"), specific support points are sought at which the #glspl("lie") are applied with a force magnitude. 
Due to the previously made justifications, the first method with which one would usually start would be the linear surrogate model.
However, it is already known that the aerodynamic distribution load is not linear.
Therefore, it would be possible to go higher with the order of the method.

A potential method by which the search for the right order could be accelerated that is baed on regression and optimization is PySINDY @Kaptanoglu2022 @Silva2020 @Brunton2016.
It is a Python @VanRossum2009 code that takes desired mathematical terms as input and generates a sparse output through optimization.
This means the user would specify a list of candidates. 
The candidates would be, for example, linear, quadratic, cubic, cos, sin, log, exp, and whatever terms the user considers relevant to descirbe the load distribution or regression task.
The optimization would try to keep only the relevant candidates and remove all others.
The output is either the list of sparse candidates or the analytically applicable equation from the candidates.
Since an analytical equation would be available that describes the course of the continuous aerodynamics, further analytical work could be done.
The difference between numerical and analytical approaches is that even when we speak of continuous aerodynamics, numerically this distribution cannot be represented truely continuous.
In numerics or on the computer, lists of discrete entries are taken. 
Therefore, the calculated aerodynamic force is not a continuous force, but since it was obtained numerically, it is strictly speaking a discrete representation of the continuous aerodynamic force distribution in reality. 
The reader should not be confused here, the aerodynamic force distribution that comes from an aerosolver is usually resolved so finely that we can call it continuous with acceptable deviation.
However, if the analytical replacement function is calculated with PySINDY, an analytical function is present, as known from school mathematics.
This function can be analytically derived, integrated, or otherwise used.

// ---------------------------------- anly ---------------------------------- //
If an analytical function is available that actually generates an output at any desired location within a meaningful input range a curve simplification method could be applied.
Curve simplification methods are techniques used to reduce the number of points or support points in a curve without significantly changing the essential form or characteristic properties of the curve @Kerkhof2018 @Shen2018a @Ai2016 @Ratschek2001. 
These methods are particularly useful in areas such as cartography, computer graphics, signal processing, and data compression, where data simplification is necessary to save storage space, reduce computation time, or improve visual clarity @CHUON2011 @Shen2018a @wu2003non @Barkowsky2000 @Boucheham2005 @Boucheham2006. 
There are various procedures for this, a few are mentioned in the following:
Douglas-Peucker algorithm @wu2003non, 
Visvalingam-Whyatt algorithm @Visvalingam1993 @Visvalingam2016, 
Lang's algorithm @Shi2006.
The main goal of these methods is to remove insignificant support points.
For some of the mentioned methods, freely available code implementations exist. 
There are also procedures, such as the Chaikin algorithm @Chaikin1974 @Bityukov2016, whose main goal is curve smoothing.
Through the latter, the focus would be on adding new points.
Therefore, the method according to Chaikin is eliminated for our purposes.

// ------------------------ curve simplfication concl ----------------------- //
Whichever curve simplification method may be chosen, in the end, there would be a similar curve with significantly fewer support points.
These support points could be seen as position specifications on the wing for the #glspl("lie").
The magnitudes of the forces and the dimensions of the #glspl("lie") could be obtained through subsequent optimization. 
An alternative to curve fitting or regression models is provided by unsupervised methods alongside supervised methods
@Fukami2023 
// supervised
@Pruneski2022 @Das2024 @Nafea2024 @Sun2024
// unsupervised
@Luong2020 @Zhang2022a @Naeem2023 @Eckhardt2022.
In unsupervised learning, no comparison data is provided against which the input could compare the output.  
Only inputs are given, and the corresponding outputs or patterns must be determined independently by the model.
To illustrate this, a concrete example should be discussed using @fig_61 to @fig_63.

// -------------------------------------------------------------------------- //
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0.svg", 
  width: 89%),
  caption: [Trajektorie, x-, y- und z-Koordinaten über einen zeitlichen Verlauf @link_Javed_Master.]
) <fig_61>


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/1.svg", 
  width: 89%),
  caption: [Centroids, Zentrum der gefundenen characktersitischen Größen @link_Javed_Master.]
) <fig_62>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/2.svg", 
  width: 89%),
  caption: [Wirkfläche der einzelnen centroids @link_Javed_Master.]
) <fig_63>
// -------------------------------------------------------------------------- //


// ------------------------------ kmeans intro ------------------------------ //
In @fig_61, the solution of a chaotic system @Strogatz2019 @Argyris2017 @SPROTT2020 @Datseris2022 is visible.
For understanding the presented unsupervised method, it is sufficient to understand that a chaotic system is described by differential equations.
The solution of the differential equation is given in @fig_61. 
This is the trajectory of the well-known Lorenz Attractor @Lorenz1963.
The trajectory provides x-, y-, and z-coordinates in a three-dimensional space over a temporal course.
For each time point, there is exactly one combination of x-, y-, and z-coordinates, which are shown in @fig_61.
When the three-dimensional trajectory is subjected to an unsupervised procedure, such as kmeans++ that is about to be covered in detail, centroids are obtained.
The centroids are characteristic quantities that the procedure has found in the dataset consisting of the trajectory.
Visually, the centroids can also be represented by three-dimensional points, as shown in  @fig_62.
In the latter, it can be observed that the procedure was allowed to determine 10 characteristic quantities.
@fig_63 shows which region each centroid covers. 
As an example, centroid 3 describes the entire corresponding green region in  @fig_63.
Depending on how high the number of characteristic quantities, the centroids, is chosen, finer details can be captured.
In the case of kmeans++ @Arthur2006, it would therefore also be possible to generate a smaller and simpler substitute model. 
Thus, with a low number of centroids kmeans++ can be viewed as reduced order modeling technique.
The idea behind kmeans++ is to create groups based on local or mertric based similarities.
It attempts to find coordinates for the centroids so that the sum of distances of the centroids and their group members is reduced.
The group members are all the entries that belong to a centroid. 
Visual depcitions of the centroids are given as crosses in  @fig_63. 
// this part might be a duplicate. there might be a more efficent way to express that
// see  centroid 3 describes the entire co..
Let's again consider centroid 3 and its corresponding green area.
All coordinates that lie within this green area are group members of centroid 3.
// the goal was already mentioned once above, maybe a better way to express that or link it, or highlgiht the difference between this sentce and the one before
The goal is to place the centroid within an effective area so that the distance to all group members is reduced.

// -------------------------- kmeans init differece ------------------------- //
After explaining the basic idea behind kmeans++, more in depth details about the procedure should be given.
For that, it is important to understand how standard k-means initializes its centroids. The standard k-means algorithm selects k points uniformly at random from the dataset as initial centroids.
This uniform random selection does not account for the spatial distribution of data points or the relative distances between centroids.
As a consequence, it can result in suboptimal initial centroid configurations where multiple centroids are concentrated in proximate regions while leaving other regions of the feature space without representative centroids.
Such configurations can lead to suboptimal local minima and slower convergence of the algorithm.
K-means++ addresses these limitations through a more sophisticated initialization strategy.
A visual explanation by the author of kmeans++ for the initial positions for the centroids can be found at @kmeans_Visual_Explanation.
The first centroid is selected uniformly at random from the dataset.
For each subsequent initialization step, the algorithm computes the minimum distance from each data point to its nearest previously selected centroid.
The distance metric employed is typically the Euclidean or L2-norm distance.
The selection probability for each point is then defined as proportional to the squared distance to its nearest previously selected centroid.
This probability distribution ensures that points further from existing centroids have a higher probability of selection as subsequent centroids.
Specifically, this weighted probabilistic selection mechanism favors points in regions of the feature space that are currently underrepresented by existing centroids.
K-means++ differs from standard k-means solely in this initialization procedure.
The improved initialization leads to several theoretical and practical advantages: faster convergence to local optima, improved statistical consistency of results, and empirically superior cluster assignments with respect to the k-means objective function

// -------------------------- kmeans objective fcn -------------------------- //
The problem that kmeans++ tries to solve can be formulated as an mathematical optimization problem and can be solved thorugh heuristic algorithms @Brunton2022.
Since, the kmeans++ optimization problem usally is solved iteratively and the final solution depends on the inital starting point @Brunton2022, there is no gurantee that the converegnce ends at the global optima.
The optimization problem of the kmeans++ is given as @eq_75. Its notation is taken from @Frochte2020 and states the distance funciton $d$, the data point $x_j$ and the mean $mu_i$ from the cluster $i$.
In this case, $k$ centroids would be available.
$ J = sum_(i=1)^k sum_(x_j in C_i) d(x_j, mu_i) $ <eq_75>

Furthermore, $x_j in C_i$ specifically means that only data points $x_j$ are considered that are assigned to one unique cluster or group $C_i$. 
Note, when deploying computational numerics, in order to know which data points belong to which cluster, the difference between each available data point and each of the k clsuters needs to calculated.
After its known which data points belongs to which cluster or group, the geometric center of gravity can be determined.
The centers of gravity are the new starting positions for each of the centroids, so that the group membership of each individual data point thorugh distance calculation can be determined again.
This iterative process and can be visually understood with @fig_64.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3.png", 
  width: 100%),
  caption: [Visual representation of the individual steps of unsupervised kmeans++ @Arthur2006  @link_Kmeans_Img_Proc],
)<fig_64>

Inserting the squared L2-norm as the distance metric in @eq_75 and writing the objective of kmeans as an optimization problem, @eq_76 is obtained.
The variable $Phi(C_i)$ denotes the sum of the distances between the centroid of one cluster and all its cluster members.

$ op("argmin",limits: #true)_(mu_i) 
sum_(i=1)^k underbrace(sum_(x_j in C_i) norm(x_j - mu_i)_2^2, Phi(C_i))  = sum_(i=1)^k Phi(C_i) $ <eq_76>

// ---------------------------------- here ---------------------------------- //
Up to this point, we have explained the difference between regression and unsupervised learning. 
We have named concrete methods for both previously mentioned machine learning techniques. 
For unsupervised learning, kmeans++ was elaborated in detail.
// can be said more eloquently
For further proceedings, specific areas should be named in which kmeans++ is already being used, both as justification for why this method is being considered and to show the reader how powerful this procedure is.
Subsequently, it should be explained in detail how kmeans++ could be used for #gls("ld").
Kmeans is used, among others, in image recognition @Alam2018 @Omari2024, image processing @Nanda2018 @Eqtedaei2023, image segmentation @Zhai2024, market analysis @Siregar2024, medicine @Xiang2024, health @Sim2024, pandemics @GarciaVidal2024, voice cloning @Wang2024, modeling of chaotic systems @link_Javed_Master and many others.
A list of methods similar to kmeans with calculated results can be found in @fig_65.
A detailed description of the shown methods is outside the scope of this work.
Interested readers are encouraged to either follow the given link @link_Cluster_Meth and/or read @Ikotun2023 among others.
In @Ikotun2023, further developments of kmeans and additional areas in which kmeans finds application are mentioned.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/4.png", 
  width: 100%),
  caption: [List of other clustering methods that are similar to kmeans @link_Cluster_Meth]
)<fig_65>

After having showed that kmeans++ is a method that finds application in various areas in industry and science, the focus is set to #gls("ld"). 
The input for kmeans++ would be the numerically calculated aerodynamic load distribution. 
This is two-dimensional and includes on one hand the local position where the force acts and on the other hand the magnitude of the force. 
However, the aerodynamic load distribution can also contain six dimensions if the load distribution is to be considered as a 3D force distribution.
In this case, the locality of the force would already be three-dimensional, as the 3D space must be described by exactly three coordinates.
The force could act at an angle in 3D space, thus force components would exist in each spatial direction.
The resulting force would be divided into three force components in the three spatial directions. 
kmeans++ is a mathematical procedure that can theoretically scale to arbitrarily high dimensions without restrictions.
The limitation would arise through available computing power. 
Here, both the number of points and the number of dimensions play a role.
However, from experience, the author of this report can say that even with very high data points and dimensions, the procedure is remarkably fast @link_Javed_Master.

// -------------------------- applying kmeans to ld ------------------------- //
When kmeans++ is applied to #gls("ld"), the input would be a load distribution. 
The output would be the centroids, which have a physically relevant meaning.
First, it should be noted that the number of input dimensions determines the number of dimensions of the output.
It is a direct 1:1 relationship. If the input is two-dimensional, then the output is also two-dimensional.
In a two-dimensional input, as mentioned before, the first dimension would be the locality of the load and the other would represent the magnitude of the force.
The first dimension of the two-dimensional centroid matrix $bold(C[:,0])$ would give the respective position of the #gls("lie"). 
The second column in the centroid matrix $bold(C[:,1])$ would give a representative force magnitude.
This explanation can be expressed mathematically through the matrix provided in @eq_77. 
The variables $L_i$ denotes the coordinate infromation, $F_i$ the force magnitude, the index $i in {0, ... , n}$ and the number of centroids is given as n.

$  bold(C) = mat(
  L_0, F_0;
  L_1, F_1;
  L_2, F_2;
  dots.v, dots.v;
  L_n, F_n;
) $ <eq_77>

For a more general and thus non 2d centroid matrix @eq_78 shall be considered. 
First, for the general case the dimension of the centroid matrix $bold(C)$ can be given as $bold(C)^(n times m)$, where n denotes the number of centroids and m the number of the features.
The latter is used as justification to call $bold(C)$ as centroid matrix. 
Second, the feature vectors are given as $Y_(i,j)$, where $i in {0, ... , n}$ and $j in {0, ... , m}$.

$  bold(C) = mat(
  Y_(0,0), Y_(0,1), ... , Y_(0,m);
  Y_(1,0), Y_(1,1), ... , Y_(1,m);
  Y_(2,0), Y_(2,1), ... , Y_(2,m);
  dots.v, dots.v, dots.down, dots.v;
  Y_(n,0),  Y_(n,1), ..., Y_(n,m);
) $ <eq_78>

The term feature vector comes from the machine leanring environment. Since kmeans++ is a machine learning technique, for general purposes explanations, it considered to be more apropriate to use the machine-learning specific term feature vector.
In general the feature vector could contain any measurable data that can be represted through numericla numbers.
However, when adding physical meaning to the feature vector in the 2d #gls("ld") case, the features vectores becomes the positional vector $L$ and the force magnitude vector $F$ as expressed in @eq_77.
Moreover, the defintion of @eq_78 explains that while thre are n centroids, each centroid has the dimension m, which is  the dimension of the feture vector.
Consequently, in order to describe one centroid fully, all feature attributes needs to be known.

// ---------------------------- resulting forces ---------------------------- //
Focusing on the physical relevant interpretation of the centroid matix, it was said that the second column $bold(C[:,1])$ would indicate a representative force magnitude that should act on the corresponding #glspl("lie").
However, this interpretation is not complete, which should be explained in the following.
In order to obtain the centroids, one step is to apply geometric averaging. 
While this averaging can be used to obtain one representiative entity for an group, these averaged values cannot be used as representation for the resulting loads for the #glspl("ld").
If an averaged force were to be applied, other partial loads that are part of the same cluster would be ignored.
The goal is to combine all partial loads through addition to get a resulting force.
This means instead of using the value that kmeans++ would indicate in the second dimension $bold(C[:,1])$ of the matrix as a load value for the #glspl("lie"), all partial forces within each cluster should be added up to one resulting force.


// equational explanation 
$  bold(C[:,1]) = mat(
   F_0;
   F_1;
   F_2;
  dots.v;
   F_n;
) 
$ <eq_79>


The numerical application of kmeans++ on a computer is possible through the free and open-source library Scikit-learn @Pedregosa2011, for example.
The implementation in Scikit-learn is already optimized and runs on multiple cores. 
Another reason that speaks for Scikit-learn is that it is a widespread and widely used library @Volk2024 @Chen2024a @Wang2023 @Mehdi2024 @Yu2024.
Additionally, the library is easily accessible, installable, and easy to use.
Accordingly, the summation of individual partial forces within a cluster to a resulting cluster force can be achieved without much effort.

Another possibility for physically motivated interpretation is offered by the clusters themselves. 
The area of the clusters could be viewed as the dimension of individual #glspl("lie").
However, this would be counterproductive since the clusters extend over all individual data points.
Applied to the #gls("ld"), it would mean that the entire wing skin would be covered because one cluster directly joins the next.
If the clusters are so close together, the #glspl("lie") would accordingly also be close together and there would no longer be sufficient free viewing area for any visual measurement technology.
After both the procedure via regression and kmeans++ have been explained and interpreted, a decision should be made between the two possible paths.
Since kmeans++ can provide a good starting value for two important quantities in addition to specifying the positions for the #glspl("lie") through summation of the partial forces, kmeans++ is preferred over the regression path.

At this point, the following should be clearly stated. While kmeans++ has various advantages and allows physical interpretations, it does not answer all questions that would be required for the experimental execution of the structural test. 
Through kmeans++ a good starting value for the positions of the #glspl("lie") and the resulting force magnitudes that should act on the respective #gls("lie") can be obtained. 
However, this can only limitedly indicate what the dimensions of the individual #gls("lie") should look like.
The latter is of particular importance when there is a requirement for free viewing area. 
While it would be possible to cover the entire wing with #glspl("lie"), this is not common practice.
Furthermore, blocking the view would have other undesired disadvantages.
Besides the impossibility of optical measurement technology, it would no longer be possible for engineers to apply loads with visual judgment.
A concrete example could be that the internal pressure should be increased from $10 #unit("MPa")$ to $60 #unit("MPa")$.
While the pressure is being increased, damage could occur that would be visually perceptible. 
If the view were blocked, this would only be limitedly possible or not possible at all.
Therefore, the output of kmeans++ can be used as a starting value for further optimization.

// --------------------------------- summary -------------------------------- //
In this section, it was first explained what is meant by #gls("ld"), why it is required, and which two major paths would be possible to discretize the load.
Furthermore, important fundamentals of Machine Learning were provided and concrete regression methods were listed. 
Subsequently, the alternative path via kmeans++ was shown, compared with the regression path, and justified in settling on the favorite kmeans++.
The essential progress achieved in this section was finding, evaluating, and deciding on a method that enables #gls("ld").
Finally, it was explained which questions are still open and that subsequent optimization would be recommended.
