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

== Discretization of Aerodynamic Loads <chap_4_0>
In the previous @chap_1, #gls("lie") was introduced. 
Through further examination of the physical load application, it was revealed that the choice of #gls("lie") depends significantly on how many #gls("lie") should be used, what dimensions they should have, and what load magnitudes can be expected.
This chapter will explain what is meant by the discretization of continuous aerodynamic loads, why optimization is necessary, and how this answers our previously posed questions.
Furthermore, we will explore which methods were investigated to perform the discretization.

According to current physical understanding, an aircraft in flight experiences load at every infinitesimally small point. 
Thus, this load is considered continuous. In other words, if the load starts at point A and ends at point B, it should be impossible to find an infinitesimally small point between A and B where no force acts.
Unless explicitly stated otherwise, the load always refers to the aerodynamic load.
In the previous @chap_1, we discussed which methods are available to us for replicating these aerodynamic loads in an experimental setup. 
It was also explained why the K2H2 project opted for a ground-based experimental setup without a wind tunnel.
Consequently, #gls("lie") are now needed, which must be locally attached to the wing skin.
The #gls("lie") serve as physical objects through which loads can be applied.
The goal is to apply and load the #gls("lie") in such a way that the resulting load distribution closely matches the original aerodynamic loading.
A concrete definition for #gls("ld") could be: Approximating a continuous force distribution through individual point and area loads.

The requirement to apply #gls("lie") in a way that can reproduce the continuous aerodynamic loading can be defined as an optimization problem.
Specifically, the engineer faces the following questions:

1. How many #gls("lie") should be used?
2. At which locations should the #gls("lie") be attached?
3. What dimensions should the #gls("lie") have?
4. What load magnitudes must the #gls("lie") have?
5. What minimum and maximum spacing between #gls("lie") should be maintained?

The listed questions could all be answered through optimization.
Beyond providing important answers, optimization also supports economic and environmental consciousness. 
As a supporting example: for an imagined $60 #unit("m")$ long wing, we should try to use the minimum number of #gls("lie") possible. 
To expand on this example, let's consider electrically driven cylinders.
If, say, through optimization 23 cylinders show a similar acceptable accuracy as 46 cylinders in the non-optimized state, significant costs can be saved in terms of electricity, personnel, procurement costs, other operating costs and delivery routes.
Through proper #gls("ld") paired with subsequent optimization, the number of required #gls("lie") can likely be reduced considerably.
The latter would have a positive effect on aspects such as costs, safety concept, and control effort.
Additionally, optimization would ensure that an appropriate accuracy of the #gls("ld") is achieved.
In summary, a reasonable #gls("ld") combined with optimization is motivated by the fact that it can achieve sufficient quality of #gls("ld") with a lower number of #gls("lie").

Up to this point, we have explained what discretization is and what advantage optimization would bring.
Next, we will focus on discretization methods. 
For #gls("ld"), the goal is to achieve the closest match to the original aerodynamic load distribution with as few #gls("lie") as possible. 
Pure discretization is known as curve-fitting or regression 
@Kaptanoglu2022 @Silva2020 @Tibshirani1996 @Brunton2016 @Frochte2020 @Brunton2022 @Bishop2006 @Arlinghaus2023 @Zielesny2016 @James2023 @Richter2019 @prince2023understanding @Zheng2018.
Here, function values are assigned at discrete support points. 
Translated to loads, discrete support points mean #gls("lie") and the function values are force magnitudes.
There are various methods through which regression can be performed.
The simplest would be linear regression. 
However, non-linearities can also be used to reproduce prescribed behavior.
The latter corresponds to the definition of Machine Learning. 
Machine Learning is, simply put, a method to generate a surrogate model using existing data and optimization @Brunton2022.
This surrogate model is in many cases a regression model.
Thus, the technique of regression is a subset of Machine Learning, which is why there is much literature available on this topic.

// ---------------------------------- step ---------------------------------- //

According to Professor Steve Brunton, who works at the University of Washington and specializes in physics-based simulations and Machine Learning, systems that represent reality are parsimonious.
In the context of modeling surrogate models, parsimonious means that the number of free parameters should be chosen as low as possible and as high as necessary.
To understand this, we should first discuss the difference between interpolation and extrapolation.
For this, a concrete example should be presented. 
Let's assume we have 100 data points in a two-dimensional space. One dimension could represent shoe size and the other dimension could represent height.
These 100 shoe sizes and heights span a known space. 
If a new shoe size is given that falls within the known space, the corresponding height can be determined through interpolation.
For a simplified understanding of extrapolation, let's further assume that the minimum shoe size was 36 and the maximum shoe size was 46 in our dataset.
If now a shoe size of 47 is given to determine a height based on it, this is called extrapolation.
Extrapolation is the calculation of outputs where the input lies outside the training dataset.

Now that the difference between extrapolation and interpolation is known, let's assume we have two models that both equally well cover the observed training behavior.
Let's assume that our actual system underlies a linear function. In other words, the training dataset was generated by a linear function. 
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
Whether this is actually the case can be answered, among other things, by considering interpolation and extrapolation.
Very often, the Euclidean or L2-norm @Brunton2022 according to @eq_70 is used in optimization.
Here, $f(x_k)$ represents the data value from the training dataset or the output of a function value, and $x_k$ is the estimate that the regression model reproduces.

$ E_2(f) = sqrt(1/n sum_(k=1) ^n [x_k- f(x_k)]^2) $<eq_70>

The L2-norm tends to assign non-zero values to all available model parameters. 
This means it tries to attribute a certain importance to all parameters.
However, for this, the importance or magnitude of the model parameters must be reduced.
In summary, this means that the L2-norm tries to use as many available parameters as possible to learn an underlying system.
The L1-norm according to @eq_71 @Brunton2022 gives less weight to outliers, contrary to the behavior of the L2-norm.

$ E_1(f) = 1/n sum_(k=1) ^n |x_k - f(x_k)| $<eq_71>

// ---------------------------------- step ---------------------------------- //

The consequence is that the L1-norm favors sparse weight matrices.
Sparse means that in the matrix containing the individual coefficients or weights for a regression model, the majority of entries are assigned a 0.
A 0 in the weight matrix means that the coefficients are not used.
The result is an attempt to learn the underlying system behavior, which should be recognized from the training behavior, with as few parameters as possible.

Applying what has been discussed so far to the linear and non-linear model of fourth order, the following can be noted.
By optimizing the non-linear model of fourth degree with the L2-norm, all five available parameters are assigned some importance. 
In interpolation, this should not pose a problem since the optimization has minimized the error specifically for this.
However, highly unreliable output values are to be expected in extrapolation.
The linear regression model should also be trained with the L2-norm. 
Since the underlying system is a linear function, in this case both interpolation and extrapolation would be correct.

The example presented should show that more complex models do not always provide better accuracy.
More complex models allow more flexibility in learning. 
However, this flexibility might exceed the behavior that should be extracted from the training data.
Besides accuracy, computation time also plays a major role. 
Whether a model has 2 or 100 parameters would lead to very large differences in accuracy in extrapolation.
However, for computation time, such parameter numbers would not play a role with today's available hardware.
Today, large models are no longer calculated on the #gls("cpu"), but on the #gls("gpu").
This has many reasons, but the main one is the parallelizability of the #gls("gpu").
According to current standards, models with $#num("7e9")$ 
@Li2023 @Jiang2023 @Touvron2023a @Touvron2023
parameters are quite common and are seen in certain circles in the field of #gls("llm") as entry-level model size.
Larger models can easily have $#num("7e10")$ 
@Chowdhery2022 @Team2023 @Almazrouei2023 @link_Mixtral_8_7
model parameters.
Since there is a lot of rapid progress in the world of #gls("llm"), there exists more than just one overview paper.
A fairly current overview paper on the number of model parameters can be found in @Minaee2024. 
For interested readers, so-called tiny language models have a model count of about $#num("1e9")$ @Zhang2024

The reference to #gls("llm") should show that the number of model parameters can be neglected for our approximation.
Therefore, only the accuracy requirement is significant.
We further note that the L2-norm is favorable for flexible models for extrapolation.
The L1-norm ensures within the optimization that superfluous model parameters are switched off (set to 0), making it more suitable for extrapolation.
If a model is to reproduce reality, it must be able to both interpolate and extrapolate.
As a reminder, parsimonious states, as simple or uncomplicated as possible and as complex as necessary.
Translated to regression models, this means as few model parameters as possible and only as many as necessary.  
If reality behaves parsimoniously, it particularly agrees well with the L1-norm.
One reason why the L2-norm is preferred over the L1-norm is the convergence behavior.
The optimizer can usually reach a solution faster with the L2-norm than with an L1-norm.

// ---------------------------------- step ---------------------------------- //

So far, we have explained the relationship between Machine Learning techniques and regression models.
Subsequently, important basic knowledge about model size and model accuracy influencing factors was provided.
Next, this knowledge should be applied to the problem of #gls("ld").
As mentioned before, #gls("ld") is mathematically nothing other than a regression or interpolation task.
The difference between regression and interpolation is that in interpolation, each individual support point must be hit, whereas this is optional in regression.
This can be imagined as follows: in interpolation models, it is particularly important that the support points, which represent the data points from the training dataset, reproduce the known output as accurately as possible. 
In other words, the known output must be hit exactly.
In regression, this is not necessarily the case. 
Here, other factors might have greater importance.
A possible example would be that the course between two data points can be represented as a continuous curve with tangent continuity.
The aerodynamic distribution load provides both local spatial coordinates and the magnitude of the force acting there.
For the #gls("ld"), specific support points are sought at which the #gls("lie") are applied with a force magnitude. 
Due to the previously made justifications, the first method with which one would usually start would be the linear surrogate model.
However, it is already known that the aerodynamic distribution load is not linear.
Therefore, it would be possible to go higher with the order of the method.

A potential method by which the search for the right order could be accelerated through regression and optimization would be PySINDY @Kaptanoglu2022 @Silva2020 @Brunton2016.
It is a Python @VanRossum2009 code that takes desired terms as input and generates a sparse output through optimization.
This means the user would specify a list of candidates. 
The candidates would be, for example, linear, quadratic, cubic, cos, sin, log, exp, and whatever terms the user considers relevant.
The optimization would try to keep only the relevant candidates and remove all others.
The output is either the list of sparse candidates or the analytically applicable equation from the candidates.
Since an analytical equation would be available that describes the course of the continuous aerodynamics, further analytical work could be done.
The difference between numerical and analytical approaches is that even when we speak of continuous aerodynamics, this distribution is not numerically continuous.
In numerics or on the computer, lists of entries are taken. 
Therefore, the calculated aerodynamic force is not a continuous force, but since it was obtained numerically, it is strictly speaking a discrete representation of the continuous aerodynamic force distribution in reality. 
The reader should not be confused here, the aerodynamic force distribution that comes from an aerosolver is usually resolved so finely that we can call it continuous with acceptable deviation.
However, if the analytical replacement function is calculated with PySINDY, an analytical function is present, as known from school mathematics.
This function can be analytically derived, integrated, or otherwise used.

// ---------------------------------- step ---------------------------------- //
If an analytical function is available that actually generates an output at any desired location and is thus mathematically continuous, a curve simplification method could be applied.
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

Whichever curve simplification method may be chosen, in the end, there would be a similar curve with significantly fewer support points.
These support points could be seen as position specifications for the #gls("lie").
The magnitudes of the forces and the dimensions of the #gls("lie") could be obtained through subsequent optimization.
An alternative to curve fitting or regression models is provided by unsupervised methods alongside supervised methods
@Fukami2023 
// supervised
@Pruneski2022 @Das2024 @Nafea2024 @Sun2024
// unsupervised
@Luong2020 @Zhang2022a @Naeem2023 @Eckhardt2022.
In unsupervised learning, no comparison data is provided against which the input could compare the output.  
Only inputs are given, and the corresponding outputs or patterns must be determined independently by the model.
To illustrate this, a concrete example should be discussed using @fig_59 to @fig_61.

In Figure @fig_59, the solution of a chaotic system @Strogatz2019 @Argyris2017 @SPROTT2020 @Datseris2022 is visible.
For understanding the presented unsupervised method, it is sufficient to understand that a chaotic system is described by differential equations.
The solution of the differential equation is given in Figure @fig_59. 
This is the trajectory of the well-known Lorenz Attractor @Lorenz1963.
The trajectory provides x-, y-, and z-coordinates in a three-dimensional space over a temporal course.
For each time point, there is exactly one combination of x-, y-, and z-coordinates, which are shown in Figure @fig_59.
When the three-dimensional trajectory is subjected to an unsupervised procedure (kmeans++, to be discussed in detail later), so-called centroids are obtained.
The centroids are characteristic quantities that the procedure has found in the dataset consisting of the trajectory.
Visually, the centroids can also be represented by three-dimensional points, as shown in Figure @fig_60.
In the latter, it can be observed that the procedure was allowed to determine 10 characteristic quantities.
Figure @fig_61 shows which region each centroid covers. 
As an example, Centroid 3 describes the entire green region in Figure @fig_61.


// -------------------------------------------------------------------------- //

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0.svg", 
  width: 100%),
  caption: [Trajektorie, x-, y- und z-Koordinaten über einen zeitlichen Verlauf]
) <fig_59>


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/1.svg", 
  width: 100%),
  caption: [Centroids, Zentrum der gefundenen characktersitischen Größen]
) <fig_60>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/2.svg", 
  width: 100%),
  caption: [Wirkfläche der einzelnen centroids]
) <fig_61>
// -------------------------------------------------------------------------- //

Depending on how high the number of characteristic quantities, the centroids, is chosen, finer details can be allowed.
In the case of kmeans++ @Arthur2006, it would therefore also be possible to generate a smaller and simpler substitute model or to view kmeans++ as reduced order modeling.
The idea behind kmeans++ is to create groups based on local similarities.
It attempts to find coordinates for the centroids so that the distance of the centroids within their group members is reduced.
The group members are all the entries that belong to a centroid. 
In Figure @fig_61, the crosses show the respective centroid. 
Let's again consider centroid 3 and its corresponding green area.
All coordinates that lie within this green area are group members of centroid 3.
The colored area or active effective area and the position of the respective centroid are interdependent.
The goal is to place the centroid within an effective area so that the distance to all group members is reduced.
An example that can illustrate the grouping of kmeans++ would be the following.
A box with 30 points, of which 10 are on the left, 10 in the middle, and 10 on the right side of the box. 
With such a constellation, it would make sense to form 3 groups, one for each overall position (left, middle, and right). 
Each group would contain 10 points. 
These groups are called clusters, and the geometric center of each cluster is referred to as the centroid.


// ---------------------------------- step ---------------------------------- //

After explaining the basic idea behind kmeans++, more details about the procedure should be given.
In @kmeans_Visual_Explanation @kmeans_Init_Points, the author of kmeans++ provides a visual explanation of how the initial positions for the centroids are first chosen.
The position of the first centroid can be chosen randomly. 
For each data point in the dataset, the distance to the nearest already chosen centroid is calculated. 
This means that after selecting the first centroid, the distance to this centroid is calculated for every other data point. 
The distance is typically measured as Euclidean or L2-norm distance.
Another data point is selected as the next centroid, where the probability of a particular data point being chosen is proportional to the square of its distance to the nearest centroid. 
Consequently, this means that data points that are further from the already chosen centroids have a higher probability of being selected as the next centroids. 
In simple words, the data point which has the largest distance to the already found centroids has the highest probability of being taken as the initial estimate for the position of the next centroid.
kmeans++ differs from kmeans only in the described initialization.
Due to the better initialization, kmeans++ shows several advantages. 
Among these are faster convergence, consistency of results, and in general, the clusters are found better.
What is meant by clusters can be found better should be explained in the following.

// ---------------------------------- step ---------------------------------- //
The problem that kmeans++ tries to solve can be formulated as an optimization problem and is solved accordingly.
With optimizations, it is known that there are multiple possible solutions, so-called local optima.
Through initialization, kmeans++ usually manages to converge the objective function according to @eq_72 towards a smaller function value.
The notation in @eq_72 is taken from @Frochte2020 and states that $d, x_j$ and $mu_i$ stand for a distance function, the current data point, and the centroid.
In this case, $k$ centroids would be available.
$ J = sum_(i=1)^k sum_(x_j in C_i) d(x_j, mu_i) $ <eq_72>

Furthermore, $x_j in C_i$ specifically means a data point $x_j$ from the cluster or group $C_i$. 
The latter indicates the following. 
After positions for all centroids have been found and thus it is clear which entries belong to which cluster or group, the geometric center of gravity can be determined.
The centers of gravity are the new starting positions for the respective centroids, so that the group membership of each individual data point can be determined again.
This process is an iterative process and can be visually understood with @fig_62.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3.png", 
  width: 100%),
  caption: [Visual representation of the individual steps of unsupervised kmeans++ @Arthur2006 taken from @link_Kmeans_Img_Proc],
)<fig_62>

Up to this point, we have explained the difference between regression and unsupervised learning. 
We have named concrete methods for both previously mentioned machine learning techniques. 
For unsupervised learning, kmeans++ was discussed in detail.
For further proceedings, specific areas should be named in which kmeans++ is already being used, both as justification for why this method is being considered and to show the reader how powerful this procedure is.
Subsequently, it should be explained in detail how kmeans++ could be used for #gls("ld").
Kmeans is used, among others, in image recognition @Alam2018 @Omari2024, image processing @Nanda2018 @Eqtedaei2023, image segmentation @Zhai2024, market analysis @Siregar2024, medicine @Xiang2024, health @Sim2024, pandemics @GarciaVidal2024, voice cloning @Wang2024, modeling of chaotic systems @link_Javed_Master and many others.
A list of methods similar to kmeans with calculated results can be found in @fig_63.
A detailed description of the shown methods is outside the scope of this work.
Interested readers are encouraged to either follow the given link @link_Cluster_Meth and/or read @Ikotun2023 among others.
In @Ikotun2023, further developments of kmeans and additional areas in which kmeans finds application are mentioned.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/4.png", 
  width: 100%),
  caption: [List of other clustering methods that are similar to kmeans @link_Cluster_Meth]
)<fig_63>

After showing that kmeans++ is a method that finds application in various areas in industry and science, we should focus on the #gls("ld"). 
The input for kmeans++ would be the numerically calculated aerodynamic load distribution. 
This is two-dimensional and includes on one hand the local position where the force acts and on the other hand the magnitude of the force. 
However, the aerodynamic load distribution can also contain six dimensions if the load distribution is to be considered as a 3D force distribution.
In this case, the locality of the force would already be three-dimensional, as the 3D space must be described by exactly three coordinates.
The force could act at an angle in 3D space, thus force components would exist in each spatial direction.
The resulting force would be divided into three force components in the three spatial directions. 
kmeans++ is a mathematical procedure that can theoretically scale to arbitrarily high dimensions without restrictions.
The limitation would arise through available computing power. 
Here, both the number of points and the number of dimensions play a role.
However, from experience, the author of this report can say that even with very high data points and dimensions, the procedure is remarkably fast.

When kmeans++ is applied to #gls("ld"), the input would be a load distribution. 
The output would be the centroids, which have a physically relevant meaning.
First, it should be noted that the number of input dimensions determines the number of dimensions of the output.
It is a direct 1:1 relationship. If the input is two-dimensional, then the output is also two-dimensional.
In a two-dimensional input, as mentioned before, the first dimension would be the locality of the load and the other would represent the magnitude of the force.
The first dimension of the two-dimensional centroid matrix would give the respective position of the #gls("lie"). 
The second entry in the centroid matrix would give a representative force magnitude.
Before the physical evaluation is discussed further, a brief explanation should be given as to why the term centroid matrix was used.
If the input (load distribution) is two-dimensional, then the number of columns in the centroid matrix is 2. 
The number of rows results from the number of allowed centroids.

We had said that the second entry would each indicate a representative force magnitude that should act on the corresponding #gls("lie").
However, this interpretation is not complete, which should be explained in the following.
The centroids are obtained through geometric averaging. While the averaging can be used to represent a group, these values cannot be used as loads for the #gls("lie").
If an averaged force were to be applied, partial loads would be ignored.
The goal is for all partial loads to be combined and added up to a resulting force.
This means instead of using the value that kmeans++ would indicate in the second dimension of the matrix as a load value for the #gls("lie"), all partial forces within a cluster should be added up to a resulting force.
The partial forces would be all group members of a group or cluster.
The numerical application of kmeans++ on a computer is possible through the free and open-source library Scikit-learn @Pedregosa2011, for example.
The implementation in Scikit-learn is already optimized and runs on multiple cores. 
Another reason that speaks for Scikit-learn is that it is a widespread and widely used library @Volk2024 @Chen2024 @Wang2023 @Mehdi2024 @Yu2024.
Additionally, the library is easily accessible, installable, and easy to use.
Accordingly, the summation of individual partial forces within a cluster to a resulting cluster force can be achieved without much effort.

Another possibility for physically motivated interpretation is offered by the clusters themselves. 
The area of the clusters could be viewed as the dimension of individual #gls("lie").
However, this would be counterproductive since the clusters extend over all individual data points.
Applied to the #gls("ld"), it would mean that the entire wing skin would be covered because one cluster directly joins the next.
If the clusters are so close together, the #gls("lie") would accordingly also be close together and there would no longer be sufficient free viewing area for any visual measurement technology.
After both the procedure via regression and kmeans++ have been explained and interpreted, a decision should be made between the two possible paths.
Since kmeans++ can provide a good starting value for two important quantities in addition to specifying the positions for the #gls("lie") through summation of the partial forces, kmeans++ is preferred over the regression path.

At this point, the following should be clearly stated. While kmeans++ has various advantages and allows physical interpretations, it does not answer all questions that would be required for the experimental execution of the structural test. 
Through kmeans++ a good starting value for the positions of the #gls("lie") and the resulting force magnitudes that should act on the respective #gls("lie") can be obtained. 
However, this can only limitedly indicate what the dimensions of the individual #gls("lie") should look like.
The latter is of particular importance when there is a requirement for free viewing area. 
While it would be possible to cover the entire wing with #gls("lie"), this is not common practice.
Furthermore, blocking the view would have other undesired disadvantages.
Besides the impossibility of optical measurement technology, it would no longer be possible for engineers to apply loads with visual judgment.
A concrete example could be that the internal pressure should be increased from $10 #unit("MPa")$ to $60 #unit("MPa")$.
While the pressure is being increased, damage could occur that would be visually perceptible. 
If the view were blocked, this would only be limitedly possible or not possible at all.
Therefore, the output of kmeans++ can be used as a starting value for further optimization.

In this section, it was first explained what is meant by #gls("ld"), why it is required, and which two major paths would be possible to discretize the load.
Furthermore, important fundamentals of Machine Learning were provided and concrete regression methods were listed. 
Subsequently, the alternative path via kmeans++ was shown, compared with the regression path, and justified in settling on the favorite kmeans++.
The essential progress achieved in this section was finding, evaluating, and deciding on a method that enables #gls("ld").
Finally, it was explained which questions are still open and that subsequent optimization would be recommended.
