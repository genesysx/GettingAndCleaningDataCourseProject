## The code book contains a description of the variables used within this project

X_train, y_train, s_train contain the training set from the downloaded data.
X_test, y_test, s_test contain the test set from the downloaded data.
x,y and s are the respective combined training and test sets.
features contain the header/column names for the data contained within x
a on the other hand contains the header/column names for activities within y
mean_std_features is a vector containing only the features for mean or standard deviation only
combinedData is the dataset produced by combining the data sets x, y and s

averages_data is the output vector achieved by applying the package plyr and using the function ddply together with the 
colMeans function to produce averages based on both the subject and activity. The output file written is: averages_data.txt
