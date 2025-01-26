/* -------------------------------------------------------------------------- */
#import "../../../3_Code/1_Fcns/0_Fcn_Main.typ": *
/* -------------------------------------------------------------------------- */
#pagebreak(weak:true)

// Word rep ins. done
// proofread ins. done

= Structural Testing Optimization Framework<chap_4>
The critical load case for an experimental structural static test was identified in @chap_3_0. 
The question of whether hydrogen can be replaced by other filling agents was addressed through the curvature study outlined in @chap_3_1 to @chap_3_3.
Subsequently, @chap_3_4 details the physical #glspl("lie", long:true) necessary to exert forces on the wing of #gls("swith", long:true).
As laid out in @chap_3_4, selecting an appropriate #gls("lie") or a combination of them requires additional information.
To derive this information, an optimization framework is developed.
Initially, @chap_4_0 describes how force distributions can be discretized.
@chap_4_1 then explains how aerodynamic forces can be obtained and incorporated into the method selected in @chap_4_0.
Since the optimization framework needs to work with structural information, essential beam model background is provided in @chap_4_2.
Similarly, fundamental knowledge about optimization is presented in @chap_4_3.
As optimization is a vast topic, only selected information relevant to understanding the optimization framework is included.
The integration of beam modeling within the optimization framework is elaborated in @chap_4_4.
The latter section also offers justification for choosing beam modeling over the well-established #gls("fem", long:true) for structural calculations.
The optimization framework is then applied to generate multiple solutions.
These solutions reflect real-world efforts undertaken for static experimental structural validation testing.
The modeling rationale and results are given in @chap_4_5_0 to @chap_4_5_3.


// Title was tested and is inshallah fine
== Discretization of Aerodynamic Loads <chap_4_0>

In the previous @chap_3_4, the #gls("lie", long:true) was introduced as a method for approximating aerodynamic loads in structural testing. Further investigation has identified key parameters that determine the effectiveness of #gls("lie") configurations, including their quantity, dimensional specifications, and the anticipated load magnitudes. These parameters require systematic derivation through comprehensive load approximation analysis.
The development of a structural testing methodology for both conventional aircraft and #glspl("swith") necessitates the transformation of continuous aerodynamic loads into physically applicable discrete forces. 
This transformation acts as a fundamental challenge in experimental mechanics: how to appropriately represent a continuous load distribution through a finite number of discrete load points while maintaining the essential characteristics of the original distribution.
The following section explores various approaches to this discretization hurdle, evaluating both traditional regression-based methods and modern unsupervised machine learning techniques. 
Through analysis of these approaches, a preferred method is identified.
This method's capabilities and limitations are then examined in detail, followed by an exploration of complementary strategies for addressing the identified constraints.

// -------------------------------------------------------------------------- //
According to current physical understanding, an aircraft in flight experiences load at every infinitesimally small point. 
This load is considered continuous: between any two points A and B on the aircraft's surface, it is impossible to find an infinitesimal point where no force acts.
Throughout this analysis, unless explicitly stated otherwise, the term #emp_[load] refers to aerodynamic load.
As established in @chap_3_4, several methods exist for approximating these aerodynamic loads in experimental setups. For the structural testing of #glspl("swith"), a ground-based experimental setup without a wind tunnel was selected. 
This approach necessitates #glspl("lie") attached locally to the wing skin to serve as physical interfaces for load transfer. 
The goal is to position and configure these #glspl("lie") such that their combined load distribution closely approximates the original aerodynamic loading profile.
#gls("ld", long:true) can thus be defined as: The approximation of a continuous force distribution through discrete point and area loads.

The application of #glspl("lie") to approximate continuous aerodynamic loading represents an optimization problem, with key parameters previously outlined in @chap_3_4. These parameters encompass the quantity of #glspl("lie"), their spatial positioning, dimensional specifications, load magnitudes, and inter-element spacing demands.
The optimization approach offers benefits beyond merely determining these parameters. From an economic and environmental perspective, optimization enables the identification of the minimum necessary number of #glspl("lie") while maintaining required accuracy. 
Consider a hypothetical $60 #unit("m")$ wing design case. When using electrically driven cylinders for load application, initial configurations might require 46 cylinders. 
Through optimization, this number could potentially be reduced to 23 cylinders while maintaining comparable accuracy. Such reduction yields substantial benefits in electricity consumption, personnel requirements, procurement costs, and logistics overhead.
The integration of #gls("ld") into an optimization framework serves as a systematic, mathematics-based engineering approach. 
This methodology ensures appropriate load accuracy while minimizing both the number of necessary #glspl("lie") and associated resources. 
The benefits extend to simplified safety protocols and reduced control system complexity.

// -------------------------------------------------------------------------- //
With the need for discretization established and the benefits of optimization clarified, the focus now shifts to specific discretization methods.
The primary objective in #gls("ld") is to achieve the optimal correspondence to the original aerodynamic load distribution while minimizing the number of #glspl("lie").
In its elementary form, discretization manifests as curve-fitting or regression @Kaptanoglu2022 @Silva2020 @Tibshirani1996 @Brunton2016 @Frochte2020 @Brunton2022 @Bishop2006 @Arlinghaus2023 @Zielesny2016 @James2023 @Richter2019 @prince2023understanding @Zheng2018. 
This mathematical concept assigns function values at discrete support points, which in the context of physical load application, translates to #glspl("lie") positions and corresponding force magnitudes.
Regression techniques span from basic linear approaches to more sophisticated non-linear methods capable of reproducing complex behaviors. This broader capability forms the foundation of machine learning, which generates surrogate models through data analysis and optimization @Brunton2022. As regression serves as a core subset of machine learning methodology, extensive literature exists documenting its applications and theoretical underpinnings.

// --------------------------------- brunton -------------------------------- //
According to Professor Steve Brunton of the University of Washington, an expert in physics-based simulations and machine learning, systems that characterize reality are parsimonious. In surrogate modeling, parsimony dictates selecting the minimum necessary number of free parameters while maintaining required functionality.

The concept of parsimony becomes clearer when examining the distinction between interpolation and extrapolation, as illustrated in @fig_59. Consider a hypothetical dataset of 100 points correlating shoe sizes with heights. Within this dataset, shoe sizes ranging from 36 to 46 establish the known space. 
Determining a corresponding height for a shoe size of 40 represents interpolation, as this value falls within the known range. 
Conversely, predicting height for a shoe size of 47 exemplifies extrapolation. This process involves generating outputs for inputs that lie beyond the boundaries of the training dataset. Extrapolation presents greater uncertainty than interpolation, as it requires the model to predict behavior in regions where no empirical data exists to validate the predictions.
This distinction proves fundamental in understanding model behavior at and beyond known data boundaries, as demonstrated in the contrasting regions depicted in @fig_59.

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/5_Interpolation.svg", 
  width: 100%),
  caption: [Illustrative depiction of Interpolation and Extrapolation.]
) <fig_59>

Building upon the understanding of interpolation and extrapolation, consider two models that exhibit equivalent performance on training data. When the underlying system follows a linear function, both linear and non-linear regression models can reproduce the observed behavior, though this underlying linearity remains unknown a priori.
A linear regression model, despite its simplicity, can fully capture linear relationships in the training data. Its limitation lies in representing only monotonic trends with constant gradients, either increasing or decreasing. 

In contrast, a fourth-degree non-linear model offers greater flexibility, capable of reproducing both linear behavior and local fluctuations through varying gradients.
Although the fourth-degree model's enhanced capabilities might suggest universal superiority over the linear model, this assumption warrants careful examination through the lens of interpolation, extrapolation, and optimization. The relative performance of these models depends significantly on their behavior within and beyond the training data boundaries.
// -------------------------------------------------------------------------- //
The performance evaluation of fitting procedures relies on specific error metrics, predominantly based on L2 or L1 norms. While @eq_33 previously introduced the L2-norm in the context of curvature magnitude calculation, a more general formulation is required for universal optimization applications. 
This generalized L2-norm (Euclidean distance) for higher dimensionality is expressed in @eq_70, with its squared form presented in @eq_71. The L1-norm (Manhattan distance) is given in @eq_72.


$ norm(x)_2 = sqrt(sum_i^n x_i^2) $ <eq_70>
$ norm(x)_2^2 = (sqrt(sum_i^n x_i^2))^2 = sum_i^n x_i^2 $ <eq_71>
$ norm(x)_1 = sum_i^n space.thin abs(x_i) $ <eq_72>

Alternative norms exist but fall outside the scope of this work. For comprehensive coverage of additional norm types, interested readers may refer to @Brunton2022.
The least-squares error metric, derived from the L2-norm @Brunton2022, is formulated in @eq_73, where $n$ denotes the number of data points, $f(x_k)$ represents the training dataset value or function output, and $x_k$ indicates the regression model's estimate.

$ E_2(f) = sqrt(1/n sum_(k=1) ^n [x_k- f(x_k)]^2) $<eq_73>

// -------------------------------------------------------------------------- //
The L2-norm optimization characteristically produces dense parameter matrices, assigning non-zero values across available model parameters while reducing their individual magnitudes to achieve optimal fit. 
This approach inherently utilizes the full parameter space for system approximation. The mean absolute error, derived from the L1-norm @Brunton2022, is expressed in @eq_74 and demonstrates greater robustness to outliers compared to the L2-norm's quadratic penalty structure.

$ E_1(f) = 1/n sum_(k=1) ^n space.thin abs( x_k - f(x_k) ) $<eq_74>

// --------------------------------- l1 norm -------------------------------- //
Optimization with the L1-norm characteristically produces sparse weight matrices, where the majority of coefficients are reduced to zero, effectively eliminating their contribution to the model. This sparsity-inducing property leads to parsimonious model representations that capture underlying system behavior with minimal parameters.
When applying these principles to polynomial regression models, distinct behavioral patterns emerge. 
L2-norm optimization of a fourth-degree polynomial model maintains non-zero values across all five parameters, reflecting effective interpolation within the training domain. 
However, this parameter density often yields unreliable extrapolation performance. Conversely, while the linear regression model trained with the L2-norm offers fewer parameters, its simpler structure provides reliable performance in both interpolation and extrapolation when the underlying system exhibits linear characteristics.
This comparative behavior is illustrated in @fig_60, where both models demonstrate comparable interpolation accuracy within the training domain. 
The extrapolation region, in contrast, reveals the fourth-order model's excessive flexibility, resulting in significant deviations from the underlying linear trend and consequently diminished performance relative to the linear model.


// -------------------------------------------------------------------------- //
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/6_Lin_Poly.svg", 
  width: 100%),
  caption: [Comparison of linear and fourth-order polynomial regression models: (left) interpolation behavior within the training domain; (right) extrapolation performance demonstrating the polynomial model's excessive flexibility beyond the training range.]
) <fig_60>

// -------------------------------------------------------------------------- //
While model accuracy remains paramount, computational efficiency must also be considered in developing regression and optimization methods. 
Advances in modern hardware have markedly altered the relationship between model complexity and computational requirements.
For instance, a model with 2 parameters versus 100 parameters may exhibit substantial differences in extrapolation accuracy, yet the computational overhead for such parameter ranges is negligible on contemporary hardware architectures.
Contemporary computational workflows increasingly utilize #gls("gpu", long:true) rather than traditional #gls("cpu", long:true) processing, leveraging the parallel processing capabilities of graphics hardware as previously mentioned in @chap_3_0. This architectural shift has dramatically expanded the feasible parameter space for optimization problems. 
To contextualize the scale of modern computational capabilities, it is instructive to explore recent developments in #gls("llm", long:true). Current #gls("llm") implementations routinely employ $7 times 10^9$ parameters @Li2023 @Jiang2023 @Touvron2023a @Touvron2023, with larger architectures extending to $7 times 10^10$ parameters @Chowdhery2022 @Team2023 @Almazrouei2023 @link_Mixtral_8_7.
A comprehensive review of model parameter scaling is provided in @Minaee2024, with even #emp_[tiny] language models utilizing approximately $1 times 10^9$ parameters @Zhang2024.
// -------------------------------------------------------------------------- //

The preceding elaboration of #gls("llm") parameter scales serves to contextualize computational demands for load approximation. 
While #gls("llm") architectures operate with $1 times 10^9$ parameters or more, load approximation typically can be assumed to require fewer than $1 times 10^3$ parameters to achieve sufficient accuracy.
This stark contrast, combined with the demonstrated computational capabilities of modern hardware, indicates that computational constraints are not limiting factors in the selection of a load approximation method. Instead, accuracy requirements emerge as the primary criterion.
In evaluating accuracy optimization, the choice between L1 and L2 norms becomes significant. 
The L2-norm yields advantages for interpolation tasks, particularly when optimization convergence is prioritized
This characteristic proves beneficial for models requiring flexibility within the training domain. 

Conversely, the L1-norm inherently nullifies superfluous model parameters, effectively setting them to zero. This property makes L1-norm optimization especially suitable for extrapolation tasks.
Given that real-world applications demand both interpolation and extrapolation capabilities, the selection of an appropriate norm warrants careful consideration. 
The principle of parsimony, which states that models should maintain only necessary complexity, guides this selection. For regression models, this translates to minimizing the number of model parameters while preserving essential physical behavior. 
The L1-norm's tendency toward parameter sparsity naturally aligns with this approach, notably when modeling phenomena that manifest simple underlying patterns.


// --------------------- relationship ML and regression --------------------- //
The preceding examination established fundamental relationships between machine learning techniques and regression models, along with critical factors influencing model size and accuracy. 
This theoretical framework can now be applied to the specific challenge of #gls("ld").
At its mathematical core, #gls("ld") represents a regression or interpolation task. The distinction between these approaches lies in their treatment of support points. 
Interpolation methods require exact reproduction of known data points from the training dataset, demanding precise matching between input and output values at these points. 
In contrast, regression methods offer greater flexibility, allowing deviations from exact point matching when other aspects take precedence. 
One such objective could be maintaining tangent continuity in the curve between adjacent data points, prioritizing smooth transitions over exact point matching.

In the context of aerodynamic load distribution, spatial coordinates and corresponding force magnitudes are key components of the problem. 
The objective of #gls("ld") involves identifying specific support points for #glspl("lie") application with appropriate force magnitudes. 
While conventional practice might suggest beginning with a linear surrogate model, the known non-linear nature of aerodynamic load distribution indicates the potential necessity for higher-order methods.
// -------------------------------------------------------------------------- //
For determining the appropriate model order, PySINDY @Kaptanoglu2022 @Silva2020 @Brunton2016 yields a potential approach that leverages regression and optimization. 
This Python-based @VanRossum2009 tool generates sparse output through optimization with user-specified mathematical terms.
These terms may include linear, quadratic, cubic functions, as well as trigonometric functions (cos, sin), logarithmic (log), exponential (exp), and any other mathematical expressions relevant to describing the load distribution or regression task.

The optimization process identifies and retains only the most relevant mathematical terms while eliminating others, producing either a list of sparse candidates or an analytically applicable equation. This analytical representation of the continuous aerodynamic behavior enables further mathematical analysis through standard calculus operations.
A fundamental distinction exists between numerical and analytical approaches in capturing continuous aerodynamics. 
While the physical phenomenon of aerodynamic force distribution is continuous, numerical methods inherently discretize this continuity into finite data points. 
The aerodynamic force calculated through numerical methods, thus, serves as a discrete approximation of the continuous physical distribution. 
Modern aerodynamic solvers typically employ sufficiently fine resolution to approximate continuity within acceptable tolerance limits.
Nonetheless, PySINDY's analytical output provides a continuous mathematical function analogous to classical mathematical expressions. This analytical form enables direct mathematical operations such as differentiation and integration, offering advantages over purely numerical representations.

// ---------------------------------- anly ---------------------------------- //
Given an analytical function capable of generating output at arbitrary points within a meaningful input range, curve simplification methods offer a potential approach for #gls("ld"). 
These methods reduce the number of support points in a curve while preserving its essential form and characteristic properties @Kerkhof2018 @Shen2018a @Ai2016 @Ratschek2001. 
The application of such techniques spans multiple domains including cartography, computer graphics, signal processing, and data compression, where simplified renditions facilitate storage efficiency, computational speed, and visual clarity @CHUON2011 @Shen2018a @wu2003non @Barkowsky2000 @Boucheham2005 @Boucheham2006.
Several established methods address point reduction, including the Douglas-Peucker algorithm @wu2003non, Visvalingam-Whyatt algorithm @Visvalingam1993 @Visvalingam2016, and Lang's algorithm @Shi2006. 
These methods focus primarily on eliminating insignificant support points while maintaining curve characteristics, with implementations readily available for various applications.

In contrast, methods such as the Chaikin algorithm @Chaikin1974 @Bityukov2016 emphasize curve smoothing through point addition, making them unsuitable for the current point reduction objectives.
// ------------------------ curve simplfication concl ----------------------- //
The application of any curve simplification method yields a reduced representation that preserves essential features while utilizing significantly fewer support points.
These support points can be interpreted as position specifications for #glspl("lie") on the wing surface. 
Further optimization processes could then determine appropriate force magnitudes and #glspl("lie") dimensions.
Beyond curve fitting and regression approaches, machine learning offers alternative methodologies through supervised and unsupervised techniques 
@Fukami2023 
// supervised
@Pruneski2022 @Das2024 @Nafea2024 @Sun2024
// unsupervised
@Luong2020 @Zhang2022a @Naeem2023 @Eckhardt2022. 
Unsupervised learning constitutes a distinct approach where the model independently identifies patterns and relationships within input data without reference to comparison datasets. This methodology warrants examination through concrete examples, as illustrated in @fig_61 to @fig_63.


// -------------------------------------------------------------------------- //
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/0.svg", 
  width: 89%),
  caption: [Trajectory showing x-, y- and z-coordinates over time @link_Javed_Master.]
) <fig_61>


#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/1.svg", 
  width: 89%),
  caption: [Centroids representing the centers of identified characteristic features @link_Javed_Master.]
) <fig_62>

#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/2.svg", 
  width: 89%),
  caption: [Active regions of individual centroids @link_Javed_Master.]
) <fig_63>
// -------------------------------------------------------------------------- //


// ------------------------------ kmeans intro ------------------------------ //
The concept of k-means++ clustering can be effectively demonstrated through the analysis of a chaotic system @Strogatz2019 @Argyris2017 @SPROTT2020 @Datseris2022. @fig_61 presents the solution trajectory of the well-known Lorenz Attractor @Lorenz1963, a chaotic system described by differential equations. 
This trajectory maps three-dimensional coordinates (x, y, z) over time, with each temporal point corresponding to a unique spatial position.
When this three-dimensional trajectory is analyzed using k-means++ @Arthur2006, an unsupervised learning procedure, the algorithm identifies characteristic points called centroids. These centroids mark local centers of data clusters, effectively reducing the complex trajectory into distinct regions. As illustrated in @fig_62, the algorithm identified ten such characteristic points in the dataset, each embodying a cluster of similar trajectory positions.
The effectiveness of k-means++ lies in its ability to partition the data space into meaningful regions, with each centroid serving as a representative point for its corresponding cluster. 

@fig_63 demonstrates this partitioning, where each colored region delineates the domain of influence for its respective centroid (depicted as crosses). 
For instance, the green region associated with centroid 3 encompasses all trajectory points that share greater similarity with this centroid than with any other.
The granularity of this abstraction can be adjusted through the number of centroids selected. By varying this parameter, k-means++ can function as a reduced-order modeling technique, with more centroids enabling finer resolution of the underlying data structure.
The algorithm operates through iterative optimization of centroid positions. 
In each iteration, it calculates the distance between data points and centroids. Data points become cluster members of their closest centroid. 
The algorithm then minimizes the cumulative distance between centroids and their respective cluster members.
This clustering approach relies on metric-based similarity measures. The optimization process minimizes the total distance within each cluster. This results in distinct, well-separated clusters, each represented by its centroid.

// -------------------------- kmeans init differece ------------------------- //
Having established the basic principles of k-means++, it is essential to examine its initialization procedure in detail, particularly in contrast to standard k-means. The standard k-means algorithm employs a simple uniform random selection of k points from the dataset as initial centroids. This approach, while straightforward, fails to account for the spatial distribution of data points or inter-centroid distances. Consequently, initial centroids may cluster in nearby regions, leaving significant portions of the feature space unrepresented. Such suboptimal initialization often culminates in poor local minima and extended convergence times.
K-means++ addresses these limitations through a more sophisticated initialization strategy.

A visual explanation by the author of k-means++ for the initial positions for the centroids can be found at @kmeans_Visual_Explanation.
The first centroid is selected uniformly at random from the dataset.
For each subsequent initialization step, the algorithm computes the minimum distance from each data point to its nearest previously selected centroid.
The distance metric employed is typically the Euclidean- or L2-norm.
The selection probability for each point is then defined as proportional to the squared distance to its nearest previously selected centroid.
This probability distribution ensures that points further from existing centroids have a higher probability of selection as subsequent centroids.
Specifically, this weighted probabilistic selection mechanism favors points in regions of the feature space that are currently underrepresented by existing centroids.
K-means++ differs from standard k-means solely in this initialization procedure.
The improved initialization leads to several theoretical and practical advantages: faster convergence to local optima, improved statistical consistency of results, and empirically superior cluster assignments with respect to the k-means objective function.

// -------------------------- kmeans objective fcn -------------------------- //
The k-means++ clustering method can be formulated as a mathematical optimization problem solved through heuristic algorithms @Brunton2022. Given its iterative nature and dependence on initial conditions @Brunton2022, the algorithm cannot guarantee convergence to a global optimum. 
The formal optimization problem is expressed in @eq_75, following the notation established in @Frochte2020. In this formulation, $d$ indicates the distance function while $x_j$ denotes individual data points. The cluster mean for cluster $i$ is expressed by $mu_i$, and $k$ stands for the total number of available centroids.


$ J = sum_(i)^k sum_(x_j in C_i) d(x_j, mu_i) $ <eq_75>

The notation $x_j in C_i$ carries specific meaning: it indicates that only data points $x_j$ assigned to a unique cluster $C_i$ are considered in the calculation. 
The computational implementation requires calculating distances between each data point and all $k$ clusters to determine cluster membership. Once the membership is determined, the geometric center of gravity for each cluster can be obtained. These centers of gravity serve as new centroid positions for the next iteration, initiating another round of distance-based cluster membership assignments. @fig_64 provides a visual description of this iterative process.


#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/3.png", 
  width: 100%),
  caption: [Progression of k-means++ algorithm from initial centroid placement to final cluster convergence @Arthur2006 @link_Kmeans_Img_Proc.],
)<fig_64>
// -------------------------------------------------------------------------- //

// ---------------------------------- here ---------------------------------- //
Employing the squared L2-norm as the distance metric in @eq_75 yields the k-means optimization problem shown in @eq_76, where $Phi(C_i)$ represents the cumulative distances between a cluster's centroid and its respective members.

$ op("argmin",limits: #true)_(mu_i) 
sum_(i)^k underbrace(sum_(x_j in C_i) norm(x_j - mu_i)_2^2, Phi(C_i))  = sum_(i)^k Phi(C_i) $ <eq_76>


The preceding analysis has established fundamental distinctions between regression and unsupervised learning approaches, elaborating specific methods for each methodology with particular emphasis on k-means++. To demonstrate the robustness and versatility of k-means++, it is instructive to examine its widespread applications across diverse scientific and industrial domains. The algorithm has proven effective in image recognition @Alam2018 @Omari2024, image processing @Nanda2018 @Eqtedaei2023, image segmentation @Zhai2024, market analysis @Siregar2024, medicine @Xiang2024, healthcare systems @Sim2024, pandemic modeling @GarciaVidal2024, voice synthesis @Wang2024, and chaotic system analysis @link_Javed_Master. This broad applicability validates k-means++ as a robust foundation for addressing the challenges of #gls("ld").
@fig_65 presents a comparative overview of clustering methods related to k-means. 
A comprehensive review of these methods extends beyond this work's scope. Interested readers may find detailed elaborations in @Ikotun2023 and through the supplementary resources available at @link_Cluster_Meth. Recent developments in k-means and its expanding applications are further explored by @Ikotun2023.


// only the figure caption
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/4.png", 
  width: 100%),
  caption: [List of other clustering methods that are similar to k-means @link_Cluster_Meth.]
)<fig_65>

Having established k-means++ as a widely adopted method across industry and scientific applications, attention can now be directed to its implementation for #gls("ld"). 
The algorithm accepts numerically calculated aerodynamic load distributions as input data. In its simplest form, this distribution is two-dimensional, comprising the local position of force application and the corresponding force magnitude. 
The dimensionality can extend to six dimensions when considering three-dimensional force distributions. This expansion occurs naturally as three coordinates are essential to specify force locality in 3D space, while the force vector itself requires three additional components to describe its magnitude and direction in each spatial dimension. 
K-means++ demonstrates remarkable scalability, operating effectively across arbitrary dimensional spaces without theoretical constraints. While computational limitations exist due to the interplay between the number of data points and dimensionality, practical experience indicates exceptional performance even with high-dimensional datasets and substantial point clouds @link_Javed_Master.

// -------------------------- applying kmeans to ld ------------------------- //
For the application of k-means++ to #gls("ld"), a load distribution serves as input, producing centroids with physical interpretation as output. A fundamental characteristic of this process is the dimensional correspondence between input and output spaces. This one-to-one relationship ensures that two-dimensional input data yields two-dimensional output data.
In the context of two-dimensional analysis, the first dimension corresponds to load locality while the second specifies force magnitude. This structure is reflected in the centroid matrix $bold(C)$, where the first column $bold(C[:,0])$ specifies #gls("lie") positions and the second column $bold(C[:,1])$ indicates representative force magnitudes. The mathematical formulation is expressed in @eq_77, where $L_i$ provides coordinate information, $F_i$ denotes force magnitude, with index $i in {0, ... , n-1}$ and $n$ indicating the total number of centroids.

$  bold(C) = mat(
  L_0, F_0;
  L_1, F_1;
  L_2, F_2;
  dots.v, dots.v;
  L_(n-1), F_(n-1);
) $ <eq_77>

A more general formulation extends beyond the two-dimensional case through the centroid matrix presented in @eq_78. The dimension of this general centroid matrix $bold(C)$ is defined as $bold(C)^(n times m)$, with n corresponding to the number of centroids and m denoting the number of features. This dimensional structure justifies the terminology #emp_[centroid matrix] for $bold(C)$. The elements are composed of feature vectors $Y_(i,j)$, where indices span $i in {0, ... , n-1}$ and $j in {0, ... , m-1}$.

$  bold(C) = mat(
  Y_(0,0), Y_(0,1), ... , Y_(0,m-1);
  Y_(1,0), Y_(1,1), ... , Y_(1,m-1);
  Y_(2,0), Y_(2,1), ... , Y_(2,m-1);
  dots.v, dots.v, dots.down, dots.v;
  Y_(n-1,0),  Y_(n-1,1), ..., Y_(n-1,m-1);
) $ <eq_78>

The term #emp_[feature vector] originates from machine learning nomenclature, and its explcit usage is particularly appropriate as k-means++ is fundamentally a machine learning algorithm. Feature vectors can encompass any measurable data representable through numerical values. 
In the specific context of two-dimensional #gls("ld"), these abstract feature vectors acquire physical meaning, where the positional vector $L$ and force magnitude vector $F$ constitute the features as shown in @eq_77. 
The formulation in @eq_78 demonstrates that while $n$ centroids exist, each requires m-dimensional characterization corresponding to the feature vector dimension. Complete description of any individual centroid therefore necessitates specification of all feature attributes.

// ---------------------------- resulting forces ---------------------------- //
The physical interpretation of the centroid matrix, especially its second column $bold(C[:,1])$, warrants careful consideration regarding force magnitude specification for the corresponding #glspl("lie"). While this column initially appears to provide representative force magnitudes, a more nuanced analysis reveals additional complexity in the physical interpretation.
The centroid determination process employs geometric averaging, which generates characteristic points for each cluster. However, these averaged values prove inadequate for accurately reflecting the resulting loads for #gls("ld"). 
Applying averaged forces would fail to properly account for the cumulative effect of all partial loads within each cluster, leading to physically incorrect force representations.
For physically accurate load representation, the partial forces within each cluster must be combined through superposition rather than averaging. This principle has direct implications for interpreting the k-means++ output. The force magnitude indicated by k-means++ in the second dimension $bold(C[:,1])$ of the matrix should not be directly applied as the load value for the #glspl("lie"). Instead, it is necessary to sum all partial forces within each cluster to obtain the appropriate resulting force.
This summation approach ensures proper accounting of all contributing loads within each cluster and is visually explained in @fig_66.


// number of memebers
#figure(
  image("../../../1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret/7_Kmeans_Avg_Sum.svg", 
  width: 100%),
  caption: [Comparison of force distributions showing original clustered data (top) and the resulting average forces (bottom left) versus summed forces (bottom right) for each cluster.]
)<fig_66>

The top plot in @fig_66 presents a sinusoidal force distribution selected for demonstration purposes. 
The data points are color-coded to indicate their membership in one of five clusters.
The two-dimensional colored backgrounds highlight the regions where data points would be assigned to their respective color-coded clusters.
The varying lengths of these colored background regions indicate that clusters possess different spatial extents for member assignment. 
Although not immediately apparent in this visualization, cluster membership sizes can vary significantly. One cluster might contain the majority of data points while the remaining clusters together comprise the minority.
The diamond-shaped markers in the top plot of @fig_66 indicate the two-dimensional positions of each centroid. The adjacent numerical values correspond to the force magnitudes computed by k-means++. 
During its iterative process, k-means++ uses mean values for updates until convergence. At convergence, these centroid values represent the mean forces within their respective clusters.
These mean values reflect the forces shown in the bottom left plot. A comparison with the bottom right plot reveals decisive differences between averaged and summed forces. This disparity becomes increasingly pronounced as the number of members within each cluster increases.

// --------------------------------- sklearn -------------------------------- //
The practical implementation of k-means++ is facilitated through Scikit-learn @Pedregosa2011, a free and open-source library. This implementation offers optimized performance through multi-core processing capabilities. Scikit-learn's widespread adoption and extensive use across various applications is well-documented @Volk2024 @Chen2024a @Wang2023 @Mehdi2024 @Yu2024. Its accessibility and straightforward implementation enable efficient computation of cluster force summations following k-means++ analysis.
Beyond the mathematical interpretation of k-means++ solutions presented previously, the clusters themselves offer additional physical insights. 
The cluster regions, visualized as color-coded areas in the upper portion of @fig_66, provide a valid theoretical basis for specifying the dimensions of an individual #gls("lie"). 
The spatial extent of each cluster directly determines the length of its corresponding #gls("lie"). 
When clusters possess greater lengths, the correspondingly greater #glspl("lie") lengths lead to reduced free space between adjacent elements.
This reduction in available space can prove disadvantageous when clearance is required for visual inspection and measurement techniques.

// ------------------------------ reg vs kmeans ----------------------------- //
Following the detailed examination of both regression-based approaches and k-means++ clustering, it is necessary to evaluate their relative merits for #gls("ld"). The k-means++ algorithm demonstrates particular utility in providing initial values for two critical parameters. 
First, the center positions of the #glspl("lie") can be directly derived from the centroid positions represented by $bold(C[:,0])$. Second, the requisite force magnitudes can be computed through the cluster summation method described previously.
These characteristics render k-means++ preferable to regression-based approaches for initial parameter determination. However, it is essential to acknowledge certain limitations in the k-means++ algorithm with respect to comprehensive structural testing requirements. While the algorithm effectively yields initial #glspl("lie") positions and corresponding force magnitudes, it offers limited guidance regarding optimal dimensional specifications for individual #glspl("lie").

This dimensional aspect assumes distinct significance in contexts requiring unobstructed viewing areas. Although complete wing coverage with #glspl("lie") is theoretically possible, such an approach deviates from established testing practices and introduces several operational constraints. The presence of extensive #glspl("lie") coverage would impede both optical measurement systems and direct visual inspection by engineering personnel.
To illustrate this limitation, consider a pressure testing scenario where internal pressure mandates incremental increase from $10 #unit("MPa")$ to $60 #unit("MPa")$. 
During this process, the ability to visually detect potential structural anomalies or damage becomes critical. Excessive #glspl("lie") coverage would substantially compromise this essential monitoring capability.
Consequently, while k-means++ provides valuable initial parameters, these values are best utilized as starting points for subsequent optimization processes that can incorporate additional practical constraints and testing requirements. 
The integration of k-means++ with an optimization framework is examined in detail in @chap_4_5_0 to @chap_4_5_3.

// --------------------------------- summary -------------------------------- //
#summary_([
This section established the fundamental concepts and methodologies for #gls("ld"), defining it as the systematic approximation of continuous aerodynamic loads through discrete point and area loads. 
The investigation presented two primary options for determining optimal #gls("lie") configurations: regression-based methods and k-means++ clustering, an unsupervised machine learning technique. 
Initial analysis explored regression methods, examining their capabilities through the lens of interpolation, extrapolation, and various error metrics including L1 and L2 norms. The mathematical foundations of these options were thoroughly investigated to assess their applicability to load approximation tasks.

Subsequently, k-means++ clustering emerged as a particularly promising methodology, offering direct computation of #gls("lie") positions through centroid calculation and enabling physical interpretation of cluster regions. 
The algorithm's capability to yield both positional information and appropriate force magnitudes through cluster summation demonstrated significant advantages over regression-based approaches. 
Furthermore, the widespread implementation of k-means++ across diverse scientific applications supported its selection as the preferred method.

However, critical limitations were identified in the k-means++ approach, especially regarding the determination of individual #gls("lie") dimensions and the maintenance of unobstructed viewing areas necessary for inspection and measurements.
These limitations, while important, do not diminish the method's value as an initial parameter derivation tool. 
Rather, they highlight the necessity for additional steps to overcome practical constraints in structural testing applications. 
The integration of k-means++ outputs with a comprehensive optimization framework, as examined in @chap_4_5_0 to @chap_4_5_3, provides a pathway for resolving these remaining challenges. This approach also retains the advantages of the clustering method.



])