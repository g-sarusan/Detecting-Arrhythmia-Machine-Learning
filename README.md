# Detecting-Arrhythmia-Machine-Learning
This project explores anomaly detection in raw biomedical signals, with a focus on **ECG (Electrocardiogram)** data. The pipeline integrates **MATLAB** for signal preprocessing and noise reduction, **Excel** for feature engineering, and **Python** (using `scikit-learn`) for training a **logistic regression** model to detect abnormal cardiac activity.

---

## 📌 Overview

The goal of this project is to create a proof-of-concept diagnostic tool that can identify anomalies (e.g., arrhythmias or irregular cardiac activity) in ECG signals using a hybrid computational workflow.

---

## 🧠 Tools & Technologies

- **MATLAB**: Signal denoising, feature extraction from raw ECG data
- **Excel**: Manual creation of feature matrix from preprocessed data
- **Python**: Logistic regression modeling, data visualization, and anomaly prediction
- **Libraries Used**: `pandas`, `numpy`, `scikit-learn`, `matplotlib`

---

## 🔁 Workflow

1. **Signal Preprocessing (MATLAB)**
   - Imported raw ECG data (`.mat` files)
   - Applied filtering (e.g., Butterworth, median filter)
   - Extracted key metrics: RR intervals, heart rate variability, peak detection

2. **Feature Engineering (Excel)**
   - Exported relevant metrics from MATLAB
   - Constructed labeled feature matrix (e.g., RR intervals, QRS durations, HRV metrics)
   - Cleaned and normalized features for training

3. **Modeling & Classification (Python)**
   - Imported cleaned feature matrix from Excel
   - Split dataset into training/testing sets
   - Trained **logistic regression model** for binary classification (normal vs. abnormal)
   - Evaluated using accuracy, precision, recall, and confusion matrix

---

## 📊 Results

- Achieved baseline classification accuracy of ~XX% (update with your result)
- Visualized model performance and misclassified cases
- Identified limitations due to manual feature engineering and limited data size

---

## ✅ Skills Demonstrated

- Biomedical signal processing using MATLAB
- Cross-platform data handling (MATLAB ↔ Excel ↔ Python)
- Feature extraction and classification modeling
- Interdisciplinary thinking in biomedical + data science
