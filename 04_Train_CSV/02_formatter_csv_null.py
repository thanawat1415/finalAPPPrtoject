import pandas as pd

# df = pd.read_csv("fitness_poses_csvs_out\Right.csv")




df = pd.read_csv("fitness_poses_csvs_out/up.csv")
#checking the number of empty rows in th csv file
print (df.isnull().sum())
#Droping the empty rows
modifiedDF = df.dropna() 
#Saving it to the csv file 
# modifiedDF.to_csv('fitness_poses_csvs_out_remove_null\Right.csv',index=False)

modifiedDF.to_csv('fitness_poses_csvs_out_remove_null/up.csv',index=False)


# run python 3.8.0