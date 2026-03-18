#set page(paper: "a4", margin: 2cm)
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true)

#align(center)[
  #text(size: 16pt, weight: "bold")[IT1244 Project: README] \
  #v(0.3em)
  #text(size: 11pt)[Predicting Customer Subscription to Term Deposits Using Machine Learning]
  #v(0.5em)
]

= Project Structure

```
IT1244_Team_Project/
  notebooks/
    IT1244_Bank_Marketing.ipynb    # Main Jupyter notebook
  scripts/
    run_analysis.py                # Standalone script (same logic)
  data/
    bank-additional/
      bank-additional-full.csv     # Dataset (41,188 records)
      bank-additional-names.txt    # Feature descriptions
  models/
    logistic_regression.pkl        # Trained Logistic Regression
    decision_tree.pkl              # Trained Decision Tree
    random_forest.pkl              # Trained Random Forest
    gradient_boosting.pkl          # Trained Gradient Boosting
    scaler.pkl                     # StandardScaler (fitted)
  report/
    report.pdf                     # 4-page AAAI-format report
    *.png                          # Generated figures
    model_results.csv              # Tabulated metrics
  README.pdf                       # This file
```

= Step-by-Step Instructions

== 1. Prerequisites

Install Python 3.10+ and the required packages:

```
pip install numpy pandas matplotlib seaborn scikit-learn imbalanced-learn joblib
```

Or, if using `uv`:
```
uv pip install --system numpy pandas matplotlib seaborn scikit-learn imbalanced-learn joblib
```

== 2. Running the Jupyter Notebook

Open the notebook in JupyterLab or Google Colab:

```
cd notebooks/
jupyter lab IT1244_Bank_Marketing.ipynb
```

Run all cells sequentially (Kernel > Run All). The notebook will:
- Load and explore the dataset
- Generate all EDA visualisations
- Preprocess the data (handle unknowns, encode categoricals, SMOTE)
- Train four models (Logistic Regression, Decision Tree, Random Forest, Gradient Boosting)
- Evaluate and compare models (accuracy, precision, recall, F1, AUC-ROC)
- Save trained models to `models/` and plots to `report/`

== 3. Running as a Standalone Script (Alternative)

If you prefer not to use Jupyter:

```
cd scripts/
python run_analysis.py
```

This produces the same outputs (plots, models, metrics CSV).

== 4. Output Files

After execution, the following files are produced:
- `report/target_dist.png` -- Target class distribution
- `report/num_distributions.png` -- Numerical feature histograms
- `report/correlation_heatmap.png` -- Feature correlation matrix
- `report/job_subscription.png` -- Subscription rate by job type
- `report/month_subscription.png` -- Subscription rate by month
- `report/roc_curves.png` -- ROC curves for all models
- `report/confusion_matrices.png` -- Confusion matrices
- `report/feature_importance.png` -- Top 15 features (Gradient Boosting)
- `report/model_results.csv` -- Tabulated metrics
- `models/*.pkl` -- Serialised trained models

== 5. Loading a Saved Model

```python
import joblib
model = joblib.load('models/gradient_boosting.pkl')
scaler = joblib.load('models/scaler.pkl')
# Preprocess new data the same way, then:
predictions = model.predict(X_new_scaled)
```

= Notes

- The `duration` feature is excluded from training because it is only available after the call ends, making it unsuitable for pre-call prediction.
- SMOTE is applied only to the training set; the test set is unmodified.
- The Random Forest model file (`random_forest.pkl`) is approximately 72 MB. If this exceeds the 10 MB submission limit, upload it to Google Drive and provide a link in a text file as per the project handout.
