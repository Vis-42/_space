
IT1244 Project Proposal
Project Title: Predicting Customer Subscription to Term Deposits Using Machine Learning
Team Members
Roy Sougata
Parth
Veer Mehta
Devanshu

Meeting Log
First Meeting – 12 March 2026
During our first meeting, the team reviewed several potential datasets and evaluated them based on relevance, complexity, and suitability for machine learning classification tasks. We examined the structure of each dataset, including available features, target variables, and potential analytical value.
After reviewing the available options, we decided to work with the Bank Telemarketing Campaign Dataset, as it provides a rich combination of demographic, behavioral, and macroeconomic indicators that can be used to predict customer responses to financial marketing campaigns.
During this meeting we also examined all the dataset features in detail and discussed the potential challenges such as class imbalance, missing values encoded as “unknown”, and potential data leakage through certain variables.

Second Meeting – 16 March 2026
In our second meeting, the team finalized the project direction and distributed responsibilities among members.
The responsibilities were divided as follows:
Roy Sougata
Responsible for feature preprocessing, feature scaling, and data visualization. This includes handling categorical encoding, normalization of numerical variables, and generating visual insights into feature relationships and distributions.
Devanshu
Responsible for machine learning model development and implementation of classification algorithms.
Veer Mehta
Responsible for assisting with model construction, evaluation, and optimization, including testing different models and tuning hyperparameters.
Parth
Responsible for project documentation, presentation preparation, and assisting other team members where necessary.

Dataset Description
The project uses the Bank Telemarketing Campaign Dataset, which contains approximately 40,000 records of customers contacted during telemarketing campaigns conducted by a Portuguese banking institution.
The goal of the dataset is to predict whether a customer will subscribe to a term deposit product based on their demographic characteristics, past interactions with the bank, and macroeconomic conditions at the time of contact.
Each observation represents a customer interaction during a marketing campaign.
The dataset consists of 21 columns, including:
20 features
1 target variable
Feature Categories
1. Customer Demographics
Age
Job type
Marital status
Education level
Credit default status
Housing loan status
Personal loan status
These features provide insight into the financial and demographic profile of customers.

2. Campaign Contact Information
Communication type (cellular / telephone)
Month of contact
Day of week
These variables help analyze timing and communication strategies used in campaigns.

3. Campaign Interaction Features
Number of contacts in current campaign
Days since last contact in previous campaign
Number of previous contacts
Duration of the last call
These features capture customer engagement history and campaign intensity.

4. Socioeconomic Indicators
Employment variation rate
Consumer price index
Consumer confidence index
Euribor 3-month interest rate
Number of employees in the economy
These variables reflect the macroeconomic environment, which may influence consumer financial decisions.

5. Target Variable
The target variable indicates whether the customer subscribed to a term deposit:
1 — Yes
0 — No
This makes the problem a binary classification problem.

Why We Chose This Dataset
Our team selected the Bank Telemarketing Campaign Dataset for several reasons.
1. Real-World Financial Application
The dataset reflects a real business problem faced by financial institutions: identifying customers who are most likely to subscribe to financial products. Predictive modeling in this context can significantly improve marketing efficiency and reduce operational costs.
2. Combination of Micro and Macroeconomic Data
Unlike many classification datasets that rely solely on customer attributes, this dataset includes macroeconomic indicators such as interest rates, employment variation, and consumer confidence. These variables allow us to explore how broader economic conditions influence customer behavior.
3. Relevance to Financial Analytics and Data Science
Several members of the team have strong interests in data science, financial markets, and quantitative analysis. This dataset allows us to explore how predictive modeling can be applied to financial decision-making and customer behavior analysis.
4. Opportunities for Data Science Techniques
The dataset presents several practical machine learning challenges including:
Class imbalance
Categorical feature encoding
Feature scaling
Feature selection
Model evaluation with multiple metrics
These challenges make the dataset suitable for applying a wide range of data science techniques and machine learning models.
5. Business Impact
Predicting which customers are likely to subscribe to a term deposit allows banks to optimize marketing campaigns by focusing on high-probability customers. This can reduce the number of unnecessary calls and improve conversion rates, making the project highly relevant from a business perspective.

Project Objective
The objective of this project is to build and evaluate machine learning models that can predict whether a customer will subscribe to a term deposit based on available customer, campaign, and economic data.
The project will focus on:
Data preprocessing and feature engineering
Exploratory data analysis and visualization
Building and comparing multiple classification models
Evaluating model performance using appropriate metrics such as precision, recall, F1-score, and AUC-ROC
Through this project, we aim to gain insights into which factors most strongly influence customer subscription decisions and how predictive analytics can support marketing strategies in the banking sector.

If you want, I can also help you add two extra sections that professors usually love:
Proposed Models (Logistic Regression, Random Forest, XGBoost etc.)
Expected Outcomes / Hypothesis
That would make this look like a very strong A-level proposal.
IT1244 Project Proposal
You’re viewing user-generated content that may be unverified or unsafe.
Report
Roy, I’ll structure this like a clean IT1244 project proposal that you can directly submit or slightly edit. I’ll keep it formal but still aligned with the motivations you mentioned (economic decision-making, finance interest, data science, etc.).

IT1244 Project Proposal
Project Title: Predicting Customer Subscription to Term Deposits Using Machine Learning
Team Members
Roy Sougata
Parth
Veer Mehta
Devanshu

Meeting Log
First Meeting – 12 March 2026
During our first meeting, the team reviewed several potential datasets and evaluated them based on relevance, complexity, and suitability for machine learning classification tasks. We examined the structure of each dataset, including available features, target variables, and potential analytical value.
After reviewing the available options, we decided to work with the Bank Telemarketing Campaign Dataset, as it provides a rich combination of demographic, behavioral, and macroeconomic indicators that can be used to predict customer responses to financial marketing campaigns.
During this meeting we also examined all the dataset features in detail and discussed the potential challenges such as class imbalance, missing values encoded as “unknown”, and potential data leakage through certain variables.

Second Meeting – 16 March 2026
In our second meeting, the team finalized the project direction and distributed responsibilities among members.
The responsibilities were divided as follows:
Roy Sougata
Responsible for feature preprocessing, feature scaling, and data visualization. This includes handling categorical encoding, normalization of numerical variables, and generating visual insights into feature relationships and distributions.
Devanshu
Responsible for machine learning model development and implementation of classification algorithms.
Veer Mehta
Responsible for assisting with model construction, evaluation, and optimization, including testing different models and tuning hyperparameters.
Parth
Responsible for project documentation, presentation preparation, and assisting other team members where necessary.

Dataset Description
The project uses the Bank Telemarketing Campaign Dataset, which contains approximately 40,000 records of customers contacted during telemarketing campaigns conducted by a Portuguese banking institution.
The goal of the dataset is to predict whether a customer will subscribe to a term deposit product based on their demographic characteristics, past interactions with the bank, and macroeconomic conditions at the time of contact.
Each observation represents a customer interaction during a marketing campaign.
The dataset consists of 21 columns, including:
20 features
1 target variable
Feature Categories
1. Customer Demographics
Age
Job type
Marital status
Education level
Credit default status
Housing loan status
Personal loan status
These features provide insight into the financial and demographic profile of customers.

2. Campaign Contact Information
Communication type (cellular / telephone)
Month of contact
Day of week
These variables help analyze timing and communication strategies used in campaigns.

3. Campaign Interaction Features
Number of contacts in current campaign
Days since last contact in previous campaign
Number of previous contacts
Duration of the last call
These features capture customer engagement history and campaign intensity.

4. Socioeconomic Indicators
Employment variation rate
Consumer price index
Consumer confidence index
Euribor 3-month interest rate
Number of employees in the economy
These variables reflect the macroeconomic environment, which may influence consumer financial decisions.

5. Target Variable
The target variable indicates whether the customer subscribed to a term deposit:
1 — Yes
0 — No
This makes the problem a binary classification problem.

Why We Chose This Dataset
Our team selected the Bank Telemarketing Campaign Dataset for several reasons.
1. Real-World Financial Application
The dataset reflects a real business problem faced by financial institutions: identifying customers who are most likely to subscribe to financial products. Predictive modeling in this context can significantly improve marketing efficiency and reduce operational costs.
2. Combination of Micro and Macroeconomic Data
Unlike many classification datasets that rely solely on customer attributes, this dataset includes macroeconomic indicators such as interest rates, employment variation, and consumer confidence. These variables allow us to explore how broader economic conditions influence customer behavior.
3. Relevance to Financial Analytics and Data Science
Several members of the team have strong interests in data science, financial markets, and quantitative analysis. This dataset allows us to explore how predictive modeling can be applied to financial decision-making and customer behavior analysis.
4. Opportunities for Data Science Techniques
The dataset presents several practical machine learning challenges including:
Class imbalance
Categorical feature encoding
Feature scaling
Feature selection
Model evaluation with multiple metrics
These challenges make the dataset suitable for applying a wide range of data science techniques and machine learning models.
5. Business Impact
Predicting which customers are likely to subscribe to a term deposit allows banks to optimize marketing campaigns by focusing on high-probability customers. This can reduce the number of unnecessary calls and improve conversion rates, making the project highly relevant from a business perspective.

Project Objective
The objective of this project is to build and evaluate machine learning models that can predict whether a customer will subscribe to a term deposit based on available customer, campaign, and economic data.
The project will focus on:
Data preprocessing and feature engineering
Exploratory data analysis and visualization
Building and comparing multiple classification models
Evaluating model performance using appropriate metrics such as precision, recall, F1-score, and AUC-ROC
Through this project, we aim to gain insights into which factors most strongly influence customer subscription decisions and how predictive analytics can support marketing strategies in the banking sector.


