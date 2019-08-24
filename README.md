
# Differential Privacy for Decision Trees

### Abstract
<div style="text-align: justify">
When public available data sets contain sensitive information about individuals, security measures are essentially. This paper provides an overview of traditional techniques with their corresponding weaknesses and introduces *differential privacy* (DP) as a mathematical substantiated framework to guarantee privacy. After a mathematical derivation, real world examples illustrate the technique and point out possible disadvantages. To extract general relationships out of noisy data, machine learning algorithms are introduced with respect to the trade-off between the number of queries and accurate results. Finally, an own implementation of a random private decision tree and forest is presented, applied on a real data set and compared with nonprivate decision trees and forests.

### Main aspects

 - Mathematical derivation of the capabilities to guarantee privacy.
 - critical evaluation and potential weaknesses.
 - Anonymization of a sensitive data set ([UCI census income data set](https://archive.ics.uci.edu/ml/datasets/census+income)) by prepared statements for SQL-Server (T-SQL).
 - Reconstruction capabilities by random trees and forests by analyzing the error and variance.

## What I have learned

### Background
The most influential reason behind this project was to get hands dirty experience about model development. Prior machine learning use cases were focussed on the application and parameter tuning to make predictions.
This project allowed me to develop an extension to tree-based estimators while learn more about data privacy on the other hand.

### Action

After studying limitations of traditional data anonymization techniques like *k-anonymity* and *k-diversity*, I derived the DP framework. The mathematical core initially seemed very complex, which which led me to focus on practical examples after the mathematical derivation. For the model implementation and verification, I used the UCI census income data set to predict the outcome of individuals w.r.t their characteristics (like profession, age, gender). To simulate a realistic environment, I integrated the SQL-Server with the true data and only used a DP-protected query. After the model implementations, I tried to classify the outcome (if it is over $50,000 p.a. or below) w.r.t. to several privacy budgets.

### Lessons learned

I learned that conventional data privacy techniques are not feasible to guarantee privacy and even DP goes hand in hand with some limitations. But there are valid use cases, that can protect individuals within certain limits.
For the evaluation of the tree-based estimators, I experienced the strong run-time requirements. Even a parallelization of all paths through the trees took a long time, up to several hours for deep instances. This let me to do my experiments on AWS instances and get some experience with Amazons web services.
For the final evaluation, only the use of bimodal visualization get me the insights that I needed and shown in the paper. For this case, I made my first experiences with Tableau.

Overall, this project was very informative, not only about the implementation of decision trees and DP, but also about cloud computation, palatalization and data evaluation.
</div>
