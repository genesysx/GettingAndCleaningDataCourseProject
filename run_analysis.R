setwd("~/R/Functions R/Week3/Course Project")
library(plyr)

# Step 1: Merge Test and Training Dataset

X_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
s_train<-read.table("train/subject_train.txt")

X_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
s_test<-read.table("test/subject_test.txt")

# Merging train and test sets
x<-rbind(X_train, X_test)
y<-rbind(y_train, y_test)
s<-rbind(s_train,s_test)

# Step 2: Extract only the measurements on the mean and the standard
# deviation for each measurement

features<-read.table("features.txt")

# get columns with mean and standard deviation within its description
# but exclude meanFreq
mean_std_features<-intersect(grep("mean()|std()", features[,2]),
                             grep("meanFreq()", features[,2], invert=TRUE))

# subset the measurement data
x<-x[,mean_std_features]

names(x)<-features[mean_std_features,2]

# Step 3: Uses descriptive activity names to name the activities in 
# the data set

a <- read.table("activity_labels.txt")

# update values with correct activity names
y[, 1] <- a[y[, 1], 2]

# correct column name
names(y) <- "activity"

# Step 4: Appropriately label the data set with descriptive variable names

# correct column name
names(s) <- "subject"

# bind all the data in a single data set
combinedData <- cbind(x, y, s)

# Step 5: Create a second, independent tidy data set with the average of 
# each variable for each activity and each subject taking columns
# 1 to 66 and excluding the last 2 columns (activity & subject)

averages_data <- ddply(combinedData, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)
