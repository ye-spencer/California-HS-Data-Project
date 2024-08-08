# California High School Ranking

The premise of this project is to use a Random Forest machine learning model to determine what factors lead to high school success as measured by standarized test scores

## Procedure

I used SK-Learn's RandomForestRegressor and took data from cde.ca.gov. 

Creating the RandomForestRegressor was straightforward. I just instantiated a version, ran RandomizedSearchCV to find the best hyperparameters of max_depth and n_estimators. Then all was left was splitting the data, fitting the data, all done with built-in functions.

Developing a dataset as much more challenging. I scoured the internet for datasets with various information relating to Californian High Schools, including Teacher/Student Ratio and more. These datasets were put into a database using BigQuery, with School Code as the main primary key.

## Results

My own data analysis has not been completed since I created this project on a 8 year-old laptop that was not strong enough to run the program quickly enough. I hope to return here and display my own in the future.


If you wish to use your own data, this program can print a bar graph of the most important features:

![image](https://github.com/user-attachments/assets/2fc0e3dd-52ee-4a43-81c2-bec29427d1c2)

