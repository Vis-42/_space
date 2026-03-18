"""
IT1244 Bank Marketing Analysis Script
Runs the full ML pipeline and saves all plots and models.
"""
import os
import sys
from pathlib import Path

import numpy as np
import pandas as pd
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split, cross_val_score, StratifiedKFold
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier, GradientBoostingClassifier
from sklearn.metrics import (
    accuracy_score, precision_score, recall_score, f1_score,
    roc_auc_score, roc_curve, classification_report, confusion_matrix
)
from imblearn.over_sampling import SMOTE
import joblib
import warnings
warnings.filterwarnings('ignore')

plt.rcParams['figure.dpi'] = 120
sns.set_style('whitegrid')

BASE = Path(__file__).resolve().parent.parent
REPORT = BASE / "report"
REPORT.mkdir(exist_ok=True)
MODELS = BASE / "models"
MODELS.mkdir(exist_ok=True)

# ── 1. Data Loading ──────────────────────────────────────────────────
print("=" * 60)
print("IT1244 Bank Marketing – Full Analysis")
print("=" * 60)

df = pd.read_csv(BASE / "data" / "bank-additional" / "bank-additional-full.csv", sep=";")
print(f"\nDataset shape: {df.shape}")
print(f"Target distribution:\n{df['y'].value_counts()}")
ratio = df['y'].value_counts()['no'] / df['y'].value_counts()['yes']
print(f"Class ratio (no:yes) = {ratio:.1f}:1")

# Unknown values
print("\nColumns with 'unknown' values:")
for col in df.select_dtypes(include='object').columns:
    n = (df[col] == 'unknown').sum()
    if n > 0:
        print(f"  {col}: {n} ({n/len(df)*100:.1f}%)")

# ── 2. EDA Plots ─────────────────────────────────────────────────────
print("\nGenerating EDA plots ...")

# Target distribution
fig, ax = plt.subplots(figsize=(5, 4))
df['y'].value_counts().plot(kind='bar', color=['#e74c3c', '#2ecc71'], ax=ax)
ax.set_title('Target Variable Distribution')
ax.set_xlabel('Subscribed to Term Deposit')
ax.set_ylabel('Count')
for i, v in enumerate(df['y'].value_counts()):
    ax.text(i, v + 200, str(v), ha='center', fontweight='bold')
plt.tight_layout()
fig.savefig(REPORT / "target_dist.png", dpi=150, bbox_inches='tight')
plt.close(fig)
print("  saved target_dist.png")

# Numerical feature distributions
num_cols = df.select_dtypes(include=[np.number]).columns.tolist()
fig, axes = plt.subplots(3, 4, figsize=(16, 10))
for i, col in enumerate(num_cols):
    ax = axes[i // 4, i % 4]
    df[col].hist(bins=40, ax=ax, color='steelblue', edgecolor='white', alpha=0.8)
    ax.set_title(col, fontsize=10)
for j in range(len(num_cols), 12):
    axes[j // 4, j % 4].set_visible(False)
fig.suptitle('Distribution of Numerical Features', fontsize=14, y=1.01)
plt.tight_layout()
fig.savefig(REPORT / "num_distributions.png", dpi=150, bbox_inches='tight')
plt.close(fig)
print("  saved num_distributions.png")

# Subscription rate by job
job_sub = df.groupby('job')['y'].apply(lambda x: (x == 'yes').mean()).sort_values(ascending=False)
fig, ax = plt.subplots(figsize=(10, 5))
job_sub.plot(kind='bar', color='teal', ax=ax)
ax.set_title('Subscription Rate by Job Type')
ax.set_ylabel('Subscription Rate')
ax.set_xlabel('')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
fig.savefig(REPORT / "job_subscription.png", dpi=150, bbox_inches='tight')
plt.close(fig)
print("  saved job_subscription.png")

# Correlation heatmap
fig, ax = plt.subplots(figsize=(10, 8))
corr = df[num_cols].corr()
mask = np.triu(np.ones_like(corr, dtype=bool))
sns.heatmap(corr, mask=mask, annot=True, fmt='.2f', cmap='RdBu_r',
            center=0, vmin=-1, vmax=1, ax=ax, square=True,
            linewidths=0.5, annot_kws={'size': 7})
ax.set_title('Correlation Matrix of Numerical Features')
plt.tight_layout()
fig.savefig(REPORT / "correlation_heatmap.png", dpi=150, bbox_inches='tight')
plt.close(fig)
print("  saved correlation_heatmap.png")

# Subscription rate by month
month_order = ['jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec']
existing_months = [m for m in month_order if m in df['month'].unique()]
month_sub = df.groupby('month')['y'].apply(lambda x: (x == 'yes').mean()).reindex(existing_months)
fig, ax = plt.subplots(figsize=(8, 4))
month_sub.plot(kind='bar', color='coral', ax=ax)
ax.set_title('Subscription Rate by Contact Month')
ax.set_ylabel('Subscription Rate')
ax.set_xlabel('')
plt.tight_layout()
fig.savefig(REPORT / "month_subscription.png", dpi=150, bbox_inches='tight')
plt.close(fig)
print("  saved month_subscription.png")

# ── 3. Preprocessing ────────────────────────────────────────────────
print("\nPreprocessing ...")
df_clean = df.copy()
df_clean['y'] = (df_clean['y'] == 'yes').astype(int)

# Drop duration (data leakage)
df_clean = df_clean.drop('duration', axis=1)

# Replace unknowns with mode
for col in ['job', 'marital', 'education', 'default', 'housing', 'loan']:
    mode_val = df_clean[df_clean[col] != 'unknown'][col].mode()[0]
    df_clean[col] = df_clean[col].replace('unknown', mode_val)

# pdays feature engineering
df_clean['previously_contacted'] = (df_clean['pdays'] != 999).astype(int)
df_clean['pdays_clean'] = df_clean['pdays'].replace(999, 0)
df_clean = df_clean.drop('pdays', axis=1)

# One-hot encoding
cat_cols = df_clean.select_dtypes(include='object').columns.tolist()
df_encoded = pd.get_dummies(df_clean, columns=cat_cols, drop_first=True)
print(f"  Encoded shape: {df_encoded.shape}")

X = df_encoded.drop('y', axis=1)
y = df_encoded['y']

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, stratify=y
)
print(f"  Training: {X_train.shape[0]}, Test: {X_test.shape[0]}")

# Scale + SMOTE
num_features = X_train.select_dtypes(include=[np.number]).columns
scaler = StandardScaler()
X_train_scaled = X_train.copy()
X_test_scaled = X_test.copy()
X_train_scaled[num_features] = scaler.fit_transform(X_train[num_features])
X_test_scaled[num_features] = scaler.transform(X_test[num_features])

smote = SMOTE(random_state=42)
X_train_res, y_train_res = smote.fit_resample(X_train_scaled, y_train)
print(f"  After SMOTE: {X_train_res.shape[0]} samples")

# ── 4. Model Training ───────────────────────────────────────────────
print("\nTraining models ...")
models = {
    'Logistic Regression': LogisticRegression(max_iter=1000, random_state=42),
    'Decision Tree': DecisionTreeClassifier(max_depth=10, random_state=42),
    'Random Forest': RandomForestClassifier(n_estimators=200, max_depth=15, random_state=42, n_jobs=-1),
    'Gradient Boosting': GradientBoostingClassifier(n_estimators=200, max_depth=5, learning_rate=0.1, random_state=42),
}

results = {}
cv = StratifiedKFold(n_splits=5, shuffle=True, random_state=42)

for name, model in models.items():
    print(f"  Training {name} ...")
    model.fit(X_train_res, y_train_res)

    y_pred = model.predict(X_test_scaled)
    y_prob = model.predict_proba(X_test_scaled)[:, 1]

    cv_scores = cross_val_score(model, X_train_res, y_train_res, cv=cv, scoring='f1')

    results[name] = {
        'accuracy': accuracy_score(y_test, y_pred),
        'precision': precision_score(y_test, y_pred),
        'recall': recall_score(y_test, y_pred),
        'f1': f1_score(y_test, y_pred),
        'auc_roc': roc_auc_score(y_test, y_prob),
        'cv_f1_mean': cv_scores.mean(),
        'cv_f1_std': cv_scores.std(),
        'y_prob': y_prob,
    }
    print(f"    Acc={results[name]['accuracy']:.4f}  F1={results[name]['f1']:.4f}  "
          f"AUC={results[name]['auc_roc']:.4f}")

# Results table
results_df = pd.DataFrame({
    name: {k: v for k, v in vals.items() if k != 'y_prob'}
    for name, vals in results.items()
}).T.round(4)
print(f"\n{results_df}")
results_df.to_csv(REPORT / "model_results.csv")

# ── 5. Model Comparison Plots ───────────────────────────────────────
print("\nGenerating model comparison plots ...")

# ROC curves
fig, ax = plt.subplots(figsize=(7, 6))
colors = ['#3498db', '#e67e22', '#2ecc71', '#e74c3c']
for (name, vals), color in zip(results.items(), colors):
    fpr, tpr, _ = roc_curve(y_test, vals['y_prob'])
    ax.plot(fpr, tpr, color=color, lw=2,
            label=f'{name} (AUC = {vals["auc_roc"]:.3f})')
ax.plot([0, 1], [0, 1], 'k--', lw=1, alpha=0.5)
ax.set_xlabel('False Positive Rate')
ax.set_ylabel('True Positive Rate')
ax.set_title('ROC Curves')
ax.legend(loc='lower right')
plt.tight_layout()
fig.savefig(REPORT / "roc_curves.png", dpi=150, bbox_inches='tight')
plt.close(fig)
print("  saved roc_curves.png")

# Confusion matrices
fig, axes = plt.subplots(1, 4, figsize=(18, 4))
for ax, (name, model) in zip(axes, models.items()):
    y_pred = model.predict(X_test_scaled)
    cm = confusion_matrix(y_test, y_pred)
    sns.heatmap(cm, annot=True, fmt='d', cmap='Blues', ax=ax,
                xticklabels=['No', 'Yes'], yticklabels=['No', 'Yes'])
    ax.set_title(name, fontsize=10)
    ax.set_xlabel('Predicted')
    ax.set_ylabel('Actual')
plt.suptitle('Confusion Matrices', fontsize=13)
plt.tight_layout()
fig.savefig(REPORT / "confusion_matrices.png", dpi=150, bbox_inches='tight')
plt.close(fig)
print("  saved confusion_matrices.png")

# Feature importance (Gradient Boosting)
gb_model = models['Gradient Boosting']
feat_imp = pd.Series(gb_model.feature_importances_, index=X_train.columns).sort_values(ascending=False)
fig, ax = plt.subplots(figsize=(8, 6))
feat_imp.head(15).plot(kind='barh', color='teal', ax=ax)
ax.set_title('Top 15 Features (Gradient Boosting)')
ax.set_xlabel('Feature Importance')
ax.invert_yaxis()
plt.tight_layout()
fig.savefig(REPORT / "feature_importance.png", dpi=150, bbox_inches='tight')
plt.close(fig)
print("  saved feature_importance.png")

# Classification report for best model
y_pred_best = gb_model.predict(X_test_scaled)
report_text = classification_report(y_test, y_pred_best, target_names=['No', 'Yes'])
print(f"\nClassification Report (Gradient Boosting):\n{report_text}")

# ── 6. Save Models ──────────────────────────────────────────────────
print("Saving models ...")
for name, model in models.items():
    fname = name.lower().replace(' ', '_') + '.pkl'
    joblib.dump(model, MODELS / fname)
    print(f"  saved {fname}")
joblib.dump(scaler, MODELS / 'scaler.pkl')
print("  saved scaler.pkl")

print("\nAll done.")
