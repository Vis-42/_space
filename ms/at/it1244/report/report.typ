// AAAI-style 2-column report
#set page(
  paper: "us-letter",
  margin: (top: 1.75cm, bottom: 2.54cm, left: 1.75cm, right: 1.75cm),
  numbering: "1",
)

#set text(font: "New Computer Modern", size: 10pt, lang: "en")
#set par(justify: true, first-line-indent: 0em, leading: 0.55em)
#set heading(numbering: none)
#show heading.where(level: 1): set text(size: 12pt, weight: "bold")
#show heading.where(level: 2): set text(size: 10pt, weight: "bold")
#show figure: set block(above: 0.8em, below: 0.8em)

// Title block
#align(center)[
  #text(size: 14pt, weight: "bold")[Predicting Customer Subscription to Term Deposits\ Using Machine Learning]

  #v(0.5em)
  #text(size: 10pt)[
    Roy Sougata#super[1], Parth Bhargava#super[1], Veer Mehta#super[1], Devanshu#super[1] \
    #super[1]National University of Singapore \
    IT1244: Artificial Intelligence -- Technology and Impact
  ]
  #v(0.8em)
]

#show: columns.with(2)

= Introduction

Targeted telemarketing remains a primary customer acquisition channel for retail banking, yet its low conversion rates (typically 5--15%) make campaign optimisation a pressing business problem. Predicting which customers are likely to subscribe to a term deposit before the call is made can reduce wasted contacts and improve overall marketing efficiency.

We study the UCI Bank Marketing dataset, which records 41,188 customer interactions from a Portuguese bank's telemarketing campaigns. The binary target variable indicates whether the customer subscribed to a term deposit. Our objective is to build and compare several classification models, identify the most predictive features, and evaluate performance using metrics appropriate for imbalanced datasets.

*Related Work.* Moro, Cortez, and Rita (2014) applied neural networks and SVMs to this dataset, achieving AUC scores near 0.80 with the call duration feature included. They noted that duration is only known after the call ends, making it unsuitable for pre-call prediction. Moro et al. (2015) later incorporated customer lifetime value as an additional feature. Xia et al. (2020) addressed the class imbalance using cost-sensitive boosting. Our work builds on these findings by (i) excluding duration for realistic deployment, (ii) applying SMOTE to handle imbalance, and (iii) comparing four models from simple baselines to gradient boosting.

= Dataset

The dataset contains 20 features and 1 binary target across 41,188 records. Features fall into four categories:

- *Customer demographics* (7 features): age, job type, marital status, education, credit default, housing loan, personal loan.
- *Campaign contact* (3 features): communication type, month, day of week.
- *Interaction history* (4 features): number of contacts in current campaign, days since last contact, number of previous contacts, call duration.
- *Socioeconomic indicators* (5 features): employment variation rate, consumer price index, consumer confidence index, Euribor 3-month rate, number of employees.

The target is heavily imbalanced: 36,548 (88.7%) did not subscribe versus 4,640 (11.3%) who did.

*Preprocessing.* We removed the `duration` feature to avoid data leakage. "Unknown" values in categorical columns (up to 20.9% for `default`) were replaced with the column mode. The `pdays` field (999 = never contacted) was split into a binary flag (`previously_contacted`) and a cleaned numeric field. Categorical features were one-hot encoded (drop-first), yielding 47 features. Numerical features were standardised to zero mean and unit variance.

*Class imbalance.* We applied SMOTE (Synthetic Minority Over-sampling Technique) to the training set only, producing a balanced training set of 58,476 samples. The test set was left unmodified to ensure realistic evaluation.

#figure(
  image("target_dist.png", width: 90%),
  caption: [Target class distribution: 88.7% negative vs 11.3% positive.],
)

= Methods

We implemented four classifiers of increasing complexity:

1. *Logistic Regression* (baseline): linear model with L2 regularisation.
2. *Decision Tree* (baseline): single tree with max depth 10.
3. *Random Forest*: ensemble of 200 trees, max depth 15.
4. *Gradient Boosting*: 200 boosting stages, max depth 5, learning rate 0.1.

All models were trained on the SMOTE-resampled training set and evaluated on the held-out test set (20%, stratified split). Five-fold stratified cross-validation on the training set provided estimates of generalisation performance. Evaluation metrics include accuracy, precision, recall, F1-score, and AUC-ROC.

#figure(
  image("correlation_heatmap.png", width: 100%),
  caption: [Correlation matrix of numerical features. Strong correlations exist among socioeconomic indicators.],
)

= Results and Discussion

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto),
    align: (left, center, center, center, center, center),
    stroke: 0.5pt,
    [*Model*], [*Acc*], [*Prec*], [*Rec*], [*F1*], [*AUC*],
    [Log. Regression], [0.808], [0.308], [0.560], [0.397], [0.755],
    [Decision Tree], [0.881], [0.470], [0.457], [0.463], [0.744],
    [Random Forest], [0.882], [0.479], [0.552], [0.513], [0.805],
    [Grad. Boosting], [0.893], [0.529], [0.430], [0.474], [0.797],
  ),
  caption: [Test set performance metrics for all four models.],
)

*Accuracy* is highest for Gradient Boosting (89.3%), but this metric is misleading for imbalanced data. *Random Forest* achieves the best F1-score (0.513) and AUC-ROC (0.805), balancing precision and recall most effectively. Logistic Regression has the highest recall (0.560) but poor precision (0.308), meaning it correctly identifies many subscribers but also produces many false positives.

#figure(
  image("roc_curves.png", width: 95%),
  caption: [ROC curves for all four models. Random Forest achieves the highest AUC.],
)

*Feature Importance.* The Gradient Boosting model identifies socioeconomic indicators (`euribor3m`, `nr.employed`, `emp.var.rate`) as the most predictive features, followed by `age` and `campaign` (number of contacts). This suggests that macroeconomic conditions at the time of contact strongly influence subscription decisions, consistent with Moro et al. (2014).

#figure(
  image("feature_importance.png", width: 95%),
  caption: [Top 15 features by Gradient Boosting importance.],
)

*Comparison with prior work.* Moro et al. (2014) reported AUC $≈$ 0.80 using neural networks with duration included. Our Random Forest achieves AUC 0.805 without duration, suggesting that the socioeconomic features adequately compensate for the missing call-length information.

*Societal impact.* Predictive models for telemarketing raise privacy concerns: customers may object to being profiled using socioeconomic data. Fairness should be evaluated across demographic groups (age, education) to ensure the model does not disproportionately target vulnerable populations. From a business perspective, the model does not need to outperform human intuition on every call; even a modest improvement in targeting efficiency (reducing unnecessary calls by 20--30%) delivers substantial cost savings at scale.

= References

1. S. Moro, P. Cortez, P. Rita, "A Data-Driven Approach to Predict the Success of Bank Telemarketing," _Decision Support Systems_ 62, pp. 22--31, 2014.

2. S. Moro, P. Cortez, P. Rita, "Using Customer Lifetime Value and Neural Networks to Improve the Prediction of Bank Deposit Subscription in Telemarketing Campaigns," _Neural Computing and Applications_ 26, pp. 131--139, 2015.

3. B. Xia et al., "Cost-Sensitive Boosted Tree for Imbalanced Classification in Bank Marketing," _Expert Systems with Applications_ 152, 2020.

#colbreak()

= Appendix: AI Usage Declaration

Generative AI tools (Claude) were used for brainstorming preprocessing strategies, debugging code errors, and improving writing clarity. All model selection, implementation, and analysis were performed by the team. AI chat history has been retained for verification.

#figure(
  table(
    columns: (auto, 1fr, 1fr),
    align: (left, left, left),
    stroke: 0.5pt,
    [*Tool*], [*Usage*], [*How Output Was Used*],
    [Claude], [Suggested preprocessing steps for handling "unknown" values and class imbalance.], [Used as reference; all decisions were made and implemented by the team.],
    [Claude], [Helped debug a `SettingWithCopyWarning` in the pandas pipeline.], [Applied the fix; understood the underlying cause (chained indexing).],
  ),
  caption: [AI tool usage declaration.],
)
