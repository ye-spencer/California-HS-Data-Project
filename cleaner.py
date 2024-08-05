import pandas as pd

# Read CSV file into pandas DataFrame
df = pd.read_csv('DATA/Scores & Information.csv')

# df.drop(df[].index, inplace=True)
# df.drop(df[].index, inplace=True)

print(df.head())

filter = (df['School Name'].str.contains("Continuation") == False) 
print(filter.head())
filtered_df = df[filter]
print(filtered_df.head())

# df = df[df["School Name"].str.contains("Continuation")]

# len(df["School Name"]) < 50

# df = df.drop(df[(True) & (True)].index)

# df[df['School Name'].index("continuation")]

# Display the DataFrame (table)
print(len(filtered_df))

filtered_df.to_csv("out.csv", sep=',', encoding='utf-8', index=False, header=True)