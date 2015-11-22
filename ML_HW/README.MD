This package includes three files:
1. The RMD source code
2. The Readme file
3. The HTML page which illustrates the process and analysis 

Executive Summary:
I use three different methods (algos) to train the training dataset, by calculate the error rate using cross-validation; I get the most efficient methodologies. 
Then apply the method to the training dataset and print prediction result. In the analysis, three R packages are used: gbm, RandomForest and Rpart.

Step 1: Exploratory Analysis, reading the dimension of both training & dataset
Step 2: Cleaning data, removing features not related to Classe, and remove features which are factors as many algos can not deal with Features
Step 3: Train model using Boost/ RandomForest and Rpart; and calculate error rate respectively
Step 4: Apply training model to the testing set
Step 5: Print the prediction result 