## Support Vector Machines
Support Vector Machine (SVM) are among the most popular and efficient suppervised learning methods currently available for classification and regression.
An SVM training algorithm builds a model that assigns observations into one of the two avaiable, making it a non-probabilistic binary linear classifier. SVM models can easily be extend to multi-level classifiction problems.

A SVM model is a representation of the examples as points in space, mapped so that the examples of the separate categories are divided by a clear gap that is as wide as possible. In addition to performing linear classification, SVMs can efficiently perform a non-linear classification by using kernels that implicitly map their inputs into high-dimensional feature spaces.

## Support Vector Machine Sandbox
SVM performance is highly sensitive to parameter tuning. The SupportVectorMachine Sandbox application b The sandbox environment is based on the famous Iris dataset and is restricted to the classification of Iris Species (setosa,versicolor and virginica) in on a two dimensional variable space. The Support Vector Machine Sandbox environment currently restricted to in-sample prediction statistics.

### Input Variables
Four variables are supported: Petal.Width,Petal.Length, Sepal.Width and Sepal.Length. You can assign any of these variables to either the X or Y axis in the plot.

You can Learn more about the iris data set [here] (http://www.inside-r.org/r-doc/datasets/iris).

The following SVM kernels are supported:
* Linear
* Polymonial
* Radial basis
* Sigmoid 

The following additional SVM parameters are supported:
* classification type:
    * C
    * nu
* Cost: cost of constraints violation
* Gamma: needed for all kernels except linear

You can Learn more about the e1071 R-package and the parameterization of the svm function [here] (https://cran.r-project.org/web/packages/e1071/index.html).

### Plot tab
The scatter plot includes observations from the three different Iris Species. The class boundaries as per the SVM model model fit are illustrated by a background contour plot in pale red, green and blue.

### Summary tab
This tab reports the actual SVM function call, the parameters used and the number of support vectors and outcome clasess of the resulting SVM classification model. 

### Confusion tab
A confustion matrix provides insight in the (mis)match between the species classes of the observations (Reference) and the classification as per the SVM model(Prediction). 

Detailed statistics are provided on prediction accuracy, sensitivity, specificity etc.. Note that, the Support Vector Machine Sandbox environment is currently restricted to in-sample prediction statistics.

### Help tab
You already found it.
