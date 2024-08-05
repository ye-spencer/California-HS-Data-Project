# Data Processing
import pandas as pd
import numpy as np

# Modelling
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import r2_score
from sklearn.model_selection import RandomizedSearchCV, train_test_split
from scipy.stats import randint
from matplotlib import pyplot as plt


# Load and split the data
data = pd.read_csv('DATA/Scores & Information.csv')

X = data.drop('score', axis=1)
X = X.drop('School Name', axis=1)
Y = data['score']

X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.15)


# Create a random forest classifier and find the best hyperparameters
param_dist = {'n_estimators': randint(50,500), 'max_depth': randint(1,100)}

rf = RandomForestRegressor()
rand_search = RandomizedSearchCV(rf, param_distributions = param_dist, n_iter=5, cv=5)

rand_search.fit(X_train, y_train)


# Create a variable for the best model, train, and test it
best_rf = rand_search.best_estimator_

best_rf.fit(X_train, y_train)

y_pred = best_rf.predict(X_test)

r2_strength = r2_score(y_test, y_pred)
print("Best R2 Score:", r2_strength)


# Create a series containing feature importances from the model and feature names from the training data
feature_importances = pd.Series(best_rf.feature_importances_, index=X_train.columns).sort_values(ascending=False)

# Plot the most important features
plt.bar(feature_importances.keys(), feature_importances.values, color ='maroon', width = 0.4)
plt.xlabel("Feature")
plt.ylabel("Weight")
plt.title("The most important features by weight")
plt.show()