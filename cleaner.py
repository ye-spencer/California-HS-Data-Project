# cleaner.py
# Author: Spencer Ye
# Last Edited: August 5th, 2024
# Version: 0.1
import pandas as pd

# Read CSV file into pandas DataFrame
df = pd.read_csv('DATA/Scores & Information.csv')

# Create filter array and filter the dataframe
filter = (df['School Name'].str.contains("Continuation") == False) 
filtered_df = df[filter]

# Write the filtered dataframe outwards
filtered_df.to_csv("out.csv", sep=',', encoding='utf-8', index=False, header=True)