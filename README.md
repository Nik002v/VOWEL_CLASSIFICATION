# 🔤 Vowel Recognition using SVM in MATLAB

This project implements a **vowel classification system** using **Support Vector Machines (SVM)** in **MATLAB**. The goal is to build a high-performing classifier for vowel sounds based on acoustic features such as LPC coefficients, duration, and other spectral characteristics.

Unlike typical educational implementations from scratch, this project leverages MATLAB's built-in machine learning tools to **focus on maximizing classification accuracy** through **hyperparameter optimization** and careful preprocessing.

---

## 🎯 Project Goal

The main objective is to **accurately classify vowel sounds** using SVMs by:

- Extracting informative acoustic features
- Preprocessing and normalizing data
- Tuning hyperparameters extensively
- Evaluating performance with cross-validation

---

## 📁 Dataset

- The model is trained on a **custom vowel audio dataset**.
- Audio is preprocessed into acoustic features (LPC, duration, etc.)

🔗 **Preprocessed Dataset:**  
[Download preprocessed CSV](https://drive.google.com/file/d/1JJ9yrs9J0QNc3ldw43PWXc_BcAnJvOp3/view?usp=drive_link)

🎧 **Original Dataset (audio files):**  
[Download original data](https://drive.google.com/drive/folders/1vzrVQs6BWuTonXPVjdo3ZjMPjhrJnQE1?usp=drive_link)

---

## ⚙️ Features

- ✅ Uses MATLAB's built-in `fitcsvm` and `fitcecoc` for SVM classification
- ✅ Experiments with:
  - Kernels: **linear**, **RBF**, **polynomial**
  - Regularization parameter `C`
  - Kernel scale (`auto`, grid search)
- ✅ Feature normalization and scaling
- ✅ Cross-validation for reliable evaluation
- ✅ Final system achieves **strong vowel classification accuracy**

---
