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

// TODO redo the intro
In the previous @chap_3_0_4, #gls("lie", long:true) was introduced as a method for approximating aerodynamic loads in structural testing. Further investigation has identified key parameters that determine the effectiveness of #gls("lie") configurations, including their quantity, dimensional specifications, and the anticipated load magnitudes. These parameters require systematic determination through comprehensive load approximation analysis.
This subsection investigates methods for discretizing continuous aerodynamic loads. Initially, regression-based approaches for transforming continuous loads into discrete representations are examined. Subsequently, the unsupervised learning technique k-means++ is explored as an alternative approach for determining optimal #gls("lie") positions and corresponding load magnitudes. Through systematic comparison of both methods, a preferred approach is identified. 
// maybe better to say, it is explained why the selected method can be used as startinf point for an following optimiaztion. there is no reason to give the reason in the intro - just make it clear that this is explained in the text
The selected method provides valuable initial parameters, though additional optimization is required to maintain adequate 
// it is not explained what is meant with that
viewing areas for visual inspection and optical measurement systems.

// -------------------------------------------------------------------------- //
According to current physical understanding, an aircraft in flight experiences load at every infinitesimally small point. This load is considered continuous - between any two points A and B on the aircraft's surface, it is impossible to find an infinitesimally small point where no force acts. Throughout this analysis, unless explicitly stated otherwise, the term #emp_[load] refers to aerodynamic load.
As established in @chap_3_0_4, several methods exist for approximating these aerodynamic loads in experimental setups. For the structural testing of #gls("swith"), a ground-based experimental setup without a wind tunnel was selected. This approach necessitates #glspl("lie") attached locally to the wing skin to serve as physical interfaces for load application. The goal is to position and configure these #glspl("lie") such that their combined load distribution closely approximates the original aerodynamic loading profile.
#gls("ld") can thus be defined as: The approximation of a continuous force distribution through discrete point and area loads.

The application of #glspl("lie") to approximate continuous aerodynamic loading represents an optimization problem, with key parameters previously outlined in @chap_3_0_4. These parameters encompass the quantity of #glspl("lie"), their spatial positioning, dimensional specifications, load magnitudes, and inter-element spacing requirements.
The optimization approach offers benefits beyond merely determining these parameters. From an economic and environmental perspective, optimization enables the identification of the minimum necessary number of #glspl("lie") while maintaining required accuracy. 
Consider a hypothetical $60 #unit("m")$ wing design case. When using electrically driven cylinders for load application, initial configurations might require 46 cylinders. Through optimization, this number could potentially be reduced to 23 cylinders while maintaining comparable accuracy. Such reduction yields substantial benefits in electrical consumption, personnel requirements, procurement costs, and logistics overhead.
The integration of #gls("ld") with optimization establishes a systematic, mathematics-based engineering approach. This methodology ensures appropriate load accuracy while minimizing both the number of required #glspl("lie") and associated resources. The benefits extend to simplified safety protocols and reduced control system complexity.

// -------------------------------------------------------------------------- //
Having established the principles of discretization and optimization benefits, the focus now shifts to specific discretization methods. The primary objective in #gls("ld") remains achieving optimal correspondence to the original aerodynamic load distribution while minimizing the number of #glspl("lie").
In its fundamental form, discretization manifests as curve-fitting or regression @Kaptanoglu2022 @Silva2020 @Tibshirani1996 @Brunton2016 @Frochte2020 @Brunton2022 @Bishop2006 @Arlinghaus2023 @Zielesny2016 @James2023 @Richter2019 @prince2023understanding @Zheng2018. This mathematical concept assigns function values at discrete support points, which in the context of physical load application, translates to #glspl("lie") positions and corresponding force magnitudes.
Regression techniques span from basic linear approaches to more sophisticated non-linear methods capable of reproducing complex behaviors. This broader capability forms the foundation of Machine Learning, which generates surrogate models through data analysis and optimization @Brunton2022. As regression represents a fundamental subset of Machine Learning methodology, extensive literature exists documenting its applications and theoretical underpinnings.

// --------------------------------- brunton -------------------------------- //
According to Professor Steve Brunton of the University of Washington, an expert in physics-based simulations and Machine Learning, systems that represent reality are parsimonious. In surrogate modeling, parsimony dictates selecting the minimum necessary number of free parameters while maintaining required functionality.

The concept of parsimony becomes clearer when examining the distinction between interpolation and extrapolation, as illustrated in @fig_59. Consider a hypothetical dataset of 100 points correlating shoe sizes with heights. Within this dataset, shoe sizes ranging from 36 to 46 establish a known space. Determining a corresponding height for a shoe size of 40 represents interpolation, as this value falls within the known range. 
Conversely, predicting height for a shoe size of 47 exemplifies extrapolation. This process involves generating outputs for inputs that lie beyond the boundaries of the training dataset. Extrapolation presents greater uncertainty than interpolation, as it requires the model to predict behavior in regions where no empirical data exists to validate the predictions.
This distinction proves fundamental in understanding model behavior at and beyond known data boundaries, as demonstrated in the contrasting regions depicted in @fig_59.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/5_Interpolation.svg", 
  width: 100%),
  caption: [Illustrative depiction of Interpolation and Extrapolation.]
) <fig_59>

Building upon the understanding of interpolation and extrapolation, consider two models that demonstrate equivalent performance on training data. When the underlying system follows a linear function, both linear and non-linear regression models can reproduce the observed behavior, though this underlying linearity remains unknown a priori.
A linear regression model, despite its simplicity, can perfectly capture linear relationships in the training data. Its limitation lies in representing only monotonic trends with constant gradients, either increasing or decreasing. In contrast, a fourth-degree non-linear model offers greater flexibility, capable of reproducing both linear behavior and local fluctuations through varying gradients.
While the fourth-degree model's enhanced capabilities might suggest universal superiority over the linear model, this assumption requires careful examination through the lens of interpolation, extrapolation, and optimization methodology. The relative performance of these models depends significantly on their behavior within and beyond the training data boundaries.
// -------------------------------------------------------------------------- //
The performance evaluation of fitting procedures relies on specific error metrics, predominantly based on L2 or L1 norms. While @eq_33 previously introduced the L2-norm in the context of curvature magnitude calculation, a more general formulation is required for universal optimization applications. 
This generalized L2-norm (Euclidean distance) for higher dimensionality is expressed in @eq_70, with its squared form presented in @eq_71. The L1-norm (Manhattan distance) is given in @eq_72.


$ norm(x)_2 = sqrt(sum_i^n x_i^2) $ <eq_70>
$ norm(x)_2^2 = (sqrt(sum_i^n x_i^2))^2 = sum_i^n x_i^2 $ <eq_71>
$ norm(x)_1 = sum_i^n space.thin abs(x_i) $ <eq_72>

Alternative norms exist but fall outside the scope of this work. For comprehensive coverage of additional norm types, interested readers may refer to @Brunton2022.
The least-squares error metric, derived from the L2-norm @Brunton2022, is presented in @eq_73, where $n$ denotes the number of data points, $f(x_k)$ represents the training dataset value or function output, and $x_k$ indicates the regression model's estimate.

$ E_2(f) = sqrt(1/n sum_(k=1) ^n [x_k- f(x_k)]^2) $<eq_73>

// -------------------------------------------------------------------------- //
The L2-norm optimization characteristically produces dense parameter matrices, assigning non-zero values across available model parameters while reducing their individual magnitudes to achieve optimal fit. 
This approach inherently utilizes the full parameter space for system approximation. The mean absolute error, derived from the L1-norm @Brunton2022, is expressed in @eq_74 and demonstrates greater robustness to outliers compared to the L2-norm's quadratic penalty structure.

$ E_1(f) = 1/n sum_(k=1) ^n space.thin abs( x_k - f(x_k) ) $<eq_74>

// --------------------------------- l1 norm -------------------------------- //
Optimization with the L1-norm characteristically produces sparse weight matrices, where the majority of coefficients are reduced to zero, effectively eliminating their contribution to the model. This sparsity-inducing property leads to parsimonious model representations that capture underlying system behavior with minimal parameters.
When applying these principles to polynomial regression models, distinct behavioral patterns emerge. L2-norm optimization of a fourth-degree polynomial model maintains non-zero values across all five parameters, yielding effective interpolation within the training domain. However, this parameter density often results in unreliable extrapolation performance. Conversely, while the linear regression model trained with the L2-norm offers fewer parameters, its simpler structure provides reliable performance in both interpolation and extrapolation when the underlying system exhibits linear characteristics.
This comparative behavior is illustrated in @fig_60, where both models demonstrate comparable interpolation accuracy within the training domain. The extrapolation region, however, reveals the fourth-order model's excessive flexibility, resulting in significant deviations from the underlying linear trend and consequently diminished performance relative to the linear model.


// -------------------------------------------------------------------------- //
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/6_Lin_Poly.svg", 
  width: 100%),
  caption: [Comparison of linear and fourth-order polynomial regression models: (left) interpolation behavior within the training domain; (right) extrapolation performance demonstrating the polynomial model's excessive flexibility beyond the training range.]
) <fig_60>

// -------------------------------------------------------------------------- //
While model accuracy is paramount, computational efficiency warrants consideration in the implementation of regression and optimization methods. The relationship between model complexity and computational requirements has evolved significantly with modern hardware capabilities. For instance, a model with 2 parameters versus 100 parameters may exhibit substantial differences in extrapolation accuracy, yet the computational overhead for such parameter ranges is negligible on contemporary hardware architectures.
Contemporary computational workflows increasingly utilize #gls("gpu") rather than traditional #gls("cpu") processing, leveraging the parallel processing capabilities of graphics hardware as previously mentioned in @chap_3_0. This architectural shift has dramatically expanded the feasible parameter space for optimization problems. 
To contextualize the scale of modern computational capabilities, it is instructive to consider recent developments in #gls("llm", long:true). Current #gls("llm") implementations routinely employ $7 times 10^9$ parameters @Li2023 @Jiang2023 @Touvron2023a @Touvron2023, with larger architectures extending to $7 times 10^10$ parameters @Chowdhery2022 @Team2023 @Almazrouei2023 @link_Mixtral_8_7.
A comprehensive review of model parameter scaling is provided in @Minaee2024, with even #emp_[tiny] language models utilizing approximately $1 times 10^9$ parameters @Zhang2024
// -------------------------------------------------------------------------- //

The preceding elaboration of #gls("llm") parameter scales serves to contextualize computational requirements for load approximation. 
While #gls("llm") architectures operate with $1 times 10^9$ parameters or more, load approximation typically can be assumed to require fewer than $1 times 10^3$ parameters to achieve sufficient accuracy.
This stark contrast, combined with the demonstrated computational capabilities of modern hardware, indicates that computational constraints are not limiting factors in load approximation methodology selection. Instead, accuracy requirements emerge as the primary consideration in selecting appropriate approximation methods.
In considering accuracy optimization, the choice between L1 and L2 norms becomes significant. The L2-norm demonstrates advantages for interpolation tasks, particularly when rapid convergence during optimization is prioritized. This characteristic proves beneficial for models requiring flexibility within the training domain. Conversely, the L1-norm exhibits an inherent capacity to nullify superfluous model parameters during optimization, effectively setting them to zero. This property renders L1-norm optimization particularly suitable for extrapolation tasks.
Given that physical reality demands both interpolation and extrapolation capabilities, the selection of an appropriate norm requires careful consideration. 
The principle of parsimony, which states that models should maintain only necessary complexity, guides this selection. For regression models, this translates to minimizing the number of model parameters while preserving essential physical behavior. 
The L1-norm's tendency toward parameter sparsity naturally aligns with this approach, particularly when modeling phenomena that exhibit simple underlying patterns.


// --------------------- relationship ML and regression --------------------- //
The preceding examination established fundamental relationships between Machine Learning techniques and regression models, along with critical factors influencing model size and accuracy. 
This theoretical framework can now be applied to the specific challenge of #gls("ld").
At its mathematical core, #gls("ld") represents a regression or interpolation task. The distinction between these approaches lies in their treatment of support points. 
Interpolation methods require exact reproduction of known data points from the training dataset, demanding precise matching between input and output values at these points. 
In contrast, regression methods offer greater flexibility, allowing deviations from exact point matching when other considerations take precedence. 
One such consideration could be maintaining tangent continuity in the curve between adjacent data points, prioritizing smooth transitions over exact point matching.
In the context of aerodynamic load distribution, the problem provides both spatial coordinates and corresponding force magnitudes. The objective of #gls("ld") involves identifying specific support points for #glspl("lie") application with appropriate force magnitudes. 
While conventional practice might suggest beginning with a linear surrogate model, the known non-linear nature of aerodynamic load distribution indicates the potential necessity for higher-order methods.

// -------------------------------------------------------------------------- //
For determining the appropriate model order, PySINDY @Kaptanoglu2022 @Silva2020 @Brunton2016 represents a potential approach that leverages regression and optimization. 
This Python-based @VanRossum2009 tool generates sparse output through optimization based on user-specified mathematical terms.
These terms may include linear, quadratic, cubic functions, as well as trigonometric functions (cos, sin), logarithmic (log), exponential (exp), and any other mathematical expressions relevant to describing the load distribution or regression task
The optimization process identifies and retains only the most relevant mathematical terms while eliminating others, producing either a list of sparse candidates or an analytically applicable equation. This analytical representation of the continuous aerodynamic behavior enables further mathematical analysis through standard calculus operations.
A fundamental distinction exists between numerical and analytical approaches in representing continuous aerodynamics. 
While the physical phenomenon of aerodynamic force distribution is continuous, numerical methods inherently discretize this continuity into finite data points. 
The aerodynamic force calculated through numerical methods thus represents a discrete approximation of the continuous physical distribution. 
Modern aerodynamic solvers typically employ sufficiently fine resolution to approximate continuity within acceptable tolerance limits.
PySINDY's analytical output provides a continuous mathematical function analogous to classical mathematical expressions. This analytical form enables direct mathematical operations such as differentiation and integration, offering advantages over purely numerical representations.

// ---------------------------------- here ---------------------------------- //
// ---------------------------------- anly ---------------------------------- //
Given an analytical function capable of generating output at arbitrary points within a meaningful input range, curve simplification methods offer a potential approach for #gls("ld"). 
These methods reduce the number of support points in a curve while preserving its essential form and characteristic properties @Kerkhof2018 @Shen2018a @Ai2016 @Ratschek2001. The application of such techniques spans multiple domains including cartography, computer graphics, signal processing, and data compression, where simplified representations facilitate storage efficiency, computational speed, and visual clarity @CHUON2011 @Shen2018a @wu2003non @Barkowsky2000 @Boucheham2005 @Boucheham2006.
Several established methods address point reduction, including the Douglas-Peucker algorithm @wu2003non, Visvalingam-Whyatt algorithm @Visvalingam1993 @Visvalingam2016, and Lang's algorithm @Shi2006. 
These methods focus primarily on eliminating insignificant support points while maintaining curve characteristics, with implementations readily available for various applications. 
In contrast, methods such as the Chaikin algorithm @Chaikin1974 @Bityukov2016 emphasize curve smoothing through point addition, making them unsuitable for the current point reduction objectives.
// ------------------------ curve simplfication concl ----------------------- //
The application of any curve simplification method yields a reduced representation maintaining essential curve characteristics while utilizing significantly fewer support points. These support points can be interpreted as potential position specifications for #glspl("lie") on the wing surface. Further optimization processes could then determine appropriate force magnitudes and #glspl("lie") dimensions.
Beyond curve fitting and regression approaches, machine learning offers alternative methodologies through supervised and unsupervised techniques 
@Fukami2023 
// supervised
@Pruneski2022 @Das2024 @Nafea2024 @Sun2024
// unsupervised
@Luong2020 @Zhang2022a @Naeem2023 @Eckhardt2022. 
Unsupervised learning presents a distinct approach where the model independently identifies patterns and relationships within input data without reference to comparison datasets. This methodology warrants examination through concrete examples, as illustrated in @fig_61 through @fig_63.


// -------------------------------------------------------------------------- //
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/0.svg", 
  width: 89%),
  caption: [Trajectory showing x-, y- and z-coordinates over time @link_Javed_Master.]
) <fig_61>


#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/1.svg", 
  width: 89%),
  caption: [Centroids representing the centers of identified characteristic features @link_Javed_Master.]
) <fig_62>

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/2.svg", 
  width: 89%),
  caption: [Active regions of individual centroids @link_Javed_Master.]
) <fig_63>
// -------------------------------------------------------------------------- //


// ------------------------------ kmeans intro ------------------------------ //
The concept of k-means++ clustering can be effectively demonstrated through the analysis of a chaotic system @Strogatz2019 @Argyris2017 @SPROTT2020 @Datseris2022. @fig_61 presents the solution trajectory of the well-known Lorenz Attractor @Lorenz1963, a chaotic system described by differential equations. 
This trajectory maps three-dimensional coordinates (x, y, z) over time, with each temporal point corresponding to a unique spatial position.
When this three-dimensional trajectory is analyzed using k-means++ @Arthur2006, an unsupervised learning procedure, the algorithm identifies characteristic points called centroids. These centroids represent local centers of data clusters, effectively reducing the complex trajectory into distinct regions. As illustrated in @fig_62, the algorithm identified 10 such characteristic points in the dataset, each representing a cluster of similar trajectory positions.
The effectiveness of k-means++ lies in its ability to partition the data space into meaningful regions, with each centroid serving as a representative point for its corresponding cluster. 

@fig_63 demonstrates this partitioning, where each colored region represents the domain of influence for its respective centroid (depicted as crosses). For instance, the green region associated with centroid 3 encompasses all trajectory points that share greater similarity with this centroid than with any other.
The granularity of this representation can be adjusted through the number of centroids selected. By varying this parameter, k-means++ can function as a reduced-order modeling technique, with more centroids enabling finer resolution of the underlying data structure.

The algorithm operates through iterative optimization of centroid positions. In each iteration, it calculates the distance between data points and centroids. Data points become cluster members of their closest centroid. 
The algorithm then minimizes the cumulative distance between centroids and their respective cluster members.
This clustering approach relies on metric-based similarity measures. The optimization process minimizes the total distance within each cluster. This results in distinct, well-separated clusters, each represented by its centroid.

// -------------------------- kmeans init differece ------------------------- //
Having established the basic principles of k-means++, it is essential to examine its initialization procedure in detail, particularly in contrast to standard k-means. The standard k-means algorithm employs a simple uniform random selection of k points from the dataset as initial centroids. This approach, while straightforward, fails to account for the spatial distribution of data points or inter-centroid distances. Consequently, initial centroids may cluster in nearby regions, leaving significant portions of the feature space unrepresented. Such suboptimal initialization often results in poor local minima and extended convergence times.
K-means++ addresses these limitations through a more sophisticated initialization strategy.
A visual explanation by the author of k-means++ for the initial positions for the centroids can be found at @kmeans_Visual_Explanation.
The first centroid is selected uniformly at random from the dataset.
For each subsequent initialization step, the algorithm computes the minimum distance from each data point to its nearest previously selected centroid.
The distance metric employed is typically the Euclidean or L2-norm distance.
The selection probability for each point is then defined as proportional to the squared distance to its nearest previously selected centroid.
This probability distribution ensures that points further from existing centroids have a higher probability of selection as subsequent centroids.
Specifically, this weighted probabilistic selection mechanism favors points in regions of the feature space that are currently underrepresented by existing centroids.
K-means++ differs from standard k-means solely in this initialization procedure.
The improved initialization leads to several theoretical and practical advantages: faster convergence to local optima, improved statistical consistency of results, and empirically superior cluster assignments with respect to the k-means objective function

// -------------------------- kmeans objective fcn -------------------------- //
// ---------------------------------- here ---------------------------------- //
The problem that k-means++ tries to solve can be formulated as an mathematical optimization problem and can be solved thorugh heuristic algorithms @Brunton2022.
Since, the k-means++ optimization problem usally is solved iteratively and the final solution depends on the inital starting point @Brunton2022, there is no gurantee that the converegnce ends at the global optima.
The optimization problem of the k-means++ is given as @eq_75. Its notation is taken from @Frochte2020 and states the distance funciton $d$, the data point $x_j$ and the mean $mu_i$ from the cluster $i$.
In this case, $k$ centroids would be available.

$ J = sum_(i)^k sum_(x_j in C_i) d(x_j, mu_i) $ <eq_75>

Furthermore, $x_j in C_i$ specifically means that only data points $x_j$ are considered that are assigned to one unique cluster or group $C_i$. 
Note, when deploying computational numerics, in order to know which data points belong to which cluster, the difference between each available data point and each of the k clsuters needs to calculated.
After its known which data points belongs to which cluster or group, the geometric center of gravity can be determined.
The centers of gravity are the new starting positions for each of the centroids, so that the group membership of each individual data point thorugh distance calculation can be determined again.
This iterative process and can be visually understood with @fig_64.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/3.png", 
  width: 100%),
  caption: [Visual representation of the individual steps of unsupervised k-means++ @Arthur2006  @link_Kmeans_Img_Proc],
)<fig_64>

Inserting the squared L2-norm as the distance metric in @eq_75 and writing the objective of k-means as an optimization problem, @eq_76 is obtained.
The variable $Phi(C_i)$ denotes the sum of the distances between the centroid of one cluster and all its cluster members.

$ op("argmin",limits: #true)_(mu_i) 
sum_(i)^k underbrace(sum_(x_j in C_i) norm(x_j - mu_i)_2^2, Phi(C_i))  = sum_(i)^k Phi(C_i) $ <eq_76>


Up to this point, we have explained the difference between regression and unsupervised learning. 
We have named concrete methods for both previously mentioned machine learning techniques. 
For unsupervised learning, k-means++ was elaborated in detail.
// can be said more eloquently
For further proceedings, specific areas should be named in which k-means++ is already being used, both as justification for why this method is being considered and to show the reader how powerful this procedure is.
Subsequently, it should be explained in detail how k-means++ could be used for #gls("ld").
K-means is used, among others, in image recognition @Alam2018 @Omari2024, image processing @Nanda2018 @Eqtedaei2023, image segmentation @Zhai2024, market analysis @Siregar2024, medicine @Xiang2024, health @Sim2024, pandemics @GarciaVidal2024, voice cloning @Wang2024, modeling of chaotic systems @link_Javed_Master and many others.
A list of methods similar to k-means with calculated results can be found in @fig_65.
A detailed description of the shown methods is outside the scope of this work.
Interested readers are encouraged to either follow the given link @link_Cluster_Meth and/or read @Ikotun2023 among others.
In @Ikotun2023, further developments of k-means and additional areas in which k-means finds application are mentioned.

#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/4.png", 
  width: 100%),
  caption: [List of other clustering methods that are similar to k-means @link_Cluster_Meth]
)<fig_65>

After having showed that k-means++ is a method that finds application in various areas in industry and science, the focus is set to #gls("ld"). 
The input for k-means++ would be the numerically calculated aerodynamic load distribution. 
This is two-dimensional and includes on one hand the local position where the force acts and on the other hand the magnitude of the force. 
However, the aerodynamic load distribution can also contain six dimensions if the load distribution is to be considered as a 3D force distribution.
In this case, the locality of the force would already be three-dimensional, as the 3D space must be described by exactly three coordinates.
The force could act at an angle in 3D space, thus force components would exist in each spatial direction.
The resulting force would be divided into three force components in the three spatial directions. 
k-means++ is a mathematical procedure that can theoretically scale to arbitrarily high dimensions without restrictions.
The limitation would arise through available computing power. 
Here, both the number of points and the number of dimensions play a role.
However, from experience, the author of this report can say that even with very high data points and dimensions, the procedure is remarkably fast @link_Javed_Master.

// -------------------------- applying kmeans to ld ------------------------- //
When k-means++ is applied to #gls("ld"), the input would be a load distribution. 
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

The term feature vector comes from the machine leanring environment. Since k-means++ is a machine learning technique, for general purposes explanations, it considered to be more apropriate to use the machine-learning specific term feature vector.
In general the feature vector could contain any measurable data that can be represted through numericla numbers.
However, when adding physical meaning to the feature vector in the 2d #gls("ld") case, the features vectores becomes the positional vector $L$ and the force magnitude vector $F$ as expressed in @eq_77.
Moreover, the defintion of @eq_78 explains that while thre are n centroids, each centroid has the dimension m, which is  the dimension of the feture vector.
Consequently, in order to describe one centroid fully, all feature attributes needs to be known.

// ---------------------------- resulting forces ---------------------------- //
Focusing on the physical relevant interpretation of the centroid matix, it was said that the second column $bold(C[:,1])$ would indicate a representative force magnitude that should act on the corresponding #glspl("lie").
However, this interpretation is not complete, which should be explained in the following.
In order to obtain the centroids, one step is to apply geometric averaging. 
While this averaging can be used to obtain one representiative entity for an group, these averaged values cannot be used as representation for the resulting loads for the #glspl("ld").
If an averaged force were to be applied, other partial loads that are part of the same cluster would not be accounted physically correct.
The goal is to combine all partial loads through addition to get a resulting force.
This means instead of using the value that k-means++ would indicate in the second dimension $bold(C[:,1])$ of the matrix as a load value for the #glspl("lie"), all partial forces within each cluster should be added up to one resulting force.
This concept is explained visually through @fig_66.

// number of memebers
#figure(
  image("../../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/7_Kmeans_Avg_Sum.svg", 
  width: 100%),
  caption: [Original Data with Clusters and Centroids, Average Forces from Centroids,  Summed Forces per Cluster ]
)<fig_66>

The upper figure shows a sinus like force distribution, which was selected for demonstration pruposes. The colored data points represent the membership to one of the five clusters. The colored background in 2d hihglights the area in which data points would become a member of the corresponding color coded cluster.
Since the length of the colored background is not constant, it can be concluded that some clusters have a broader area in which their cluster member can be placed than other clusters.
While not speicifally visible in this viszulaiation, generally, the number of the members of clusters do not need to match as well. It could be that one cluster has the majority of available data points as its members while the oter remaining togehter have the minority.
Moreover, the location of  the diamond shaped dots in the top @fig_66 give the 2d dimensional informaiton for the corresponding centroid. The number next to the diamond dot is the force value, which the centroid would provide. K-means++ utlizes the mean as part of of its update. With reaching a convergence the final centroid values are the mean values within each unique cluster. Thus, the numbers next to the diamond dots represent the mean force within the respective cluster.
These mean values match with the lower left figure. Comparing them with the forces depicted in the lower right figure, it becomes obious that there is a big difference wheter the froces are avergaed or summed up.
This becomes more evident the higher the number of members of each cluster becomes.


// --------------------------------- sklearn -------------------------------- //
The numerical application of k-means++ on a computer is possible through the free and open-source library Scikit-learn @Pedregosa2011, for example.
The implementation in Scikit-learn is already optimized and runs on multiple cores. 
Another reason that speaks for Scikit-learn is that it is a widespread and widely used library @Volk2024 @Chen2024a @Wang2023 @Mehdi2024 @Yu2024.
Additionally, the library is easily accessible, installable, and easy to use.
Accordingly, the summation of individual partial forces within a cluster to a resulting cluster force after performing k-means++ can be achieved without much effort.
Having explained how to interpret the solution of k-means++ with physical background, 
Another possibility for physically motivated interpretation is offered by the clusters themselves. 
The area of the clusters as depicted as the color coded background in the upper @fig_66 could be viewed as the dimension of individual #glspl("lie").
However, this would be counterproductive since the clusters extend over all individual data points.
Applied to the #gls("ld"), it would mean that the entire wing skin would be covered because one cluster directly joins the next.
If the clusters are so close together, the #glspl("lie") would accordingly also be close together and there would no longer be sufficient free viewing area for any visual measurement technology.

// ------------------------------ reg vs kmeans ----------------------------- //
After both the procedure via regression and k-means++ have been explained and interpreted, a decision should be made between the two possible paths.
K-means++ can provide a good starting value for two important quantities.
These are the center posistion of the #glspl("lie"), directly obtained through the values of the centroids $bold(C[:,0])$.
The other iportant quantity is the resulting force, which can be obtained explained above.
Therefore k-means++ is preferred over the regression path.
At this point, the following should be clearly stated. While k-means++ has various advantages and allows physical interpretations, it does not answer all questions that would be required for the experimental execution of the structural test. 
Through k-means++ a good starting value for the positions of the #glspl("lie") and the resulting force magnitudes that should act on the respective #gls("lie") can be obtained. 
However, this can only limitedly indicate what the dimensions of the individual #gls("lie") should look like.
The latter is of particular importance when there is a requirement for free viewing area. 
While it would be possible to cover the entire wing with #glspl("lie"), this is not common practice.
Furthermore, blocking the view would have other undesired disadvantages.
Besides the obstacle for optical measurement technology, it would no longer be possible for engineers to apply loads with visual judgment.
A concrete example could be that the internal pressure should be increased from $10 #unit("MPa")$ to $60 #unit("MPa")$.
While the pressure is being increased, damage could occur that would be visually perceptible. 
If the view were blocked, this would only be limitedly possible or not possible at all.
Therefore, the output of k-means++ can be used as a starting value for further optimization.

// --------------------------------- summary -------------------------------- //
#summary_([

// These are just some starting fractions. based on the provided text above, the summary could be expanded and refined
In this subsection, it was first explained what is meant by #gls("ld"), why it is required, and which two major paths would be possible to discretize the load.
Furthermore, important fundamentals of Machine Learning were provided and concrete regression methods were listed. 
Subsequently, the alternative path via k-means++ was shown, compared with the regression path, and justified in settling on the favorite k-means++.
The essential progress achieved in this subsection was finding, evaluating, and deciding on a method that enables #gls("ld").
Finally, it was explained which questions are still open and that subsequent optimization can be regarded as a potential solution for them.
])