This repository contains an implementation of a Support Vector Machine (SVM) classifier for vowel recognition tasks. The model classifies vowel sounds based on acoustic features.


Project Overview
This project implements an SVM classifier to distinguish between different vowel sounds using acoustic features like LPC coefficients, duration, and other spectral characteristics. The model can be used for:

Speech recognition systems,
Linguistic research,
Voice-controlled applications,
Educational tools for language learning.


Dataset:
The model is trained on the custom dataset.
Link to processed dataset: https://drive.google.com/file/d/1JJ9yrs9J0QNc3ldw43PWXc_BcAnJvOp3/view?usp=drive_link
Link to original dataset: https://drive.google.com/drive/folders/1vzrVQs6BWuTonXPVjdo3ZjMPjhrJnQE1?usp=drive_link

Features:
SVM implementation with different kernels (linear, RBF, polynomial)
Feature normalization and scaling,
Hyperparameter tuning using GridSearchCV,
Cross-validation for robust evaluation.
