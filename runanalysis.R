## runanalysis.R
## Course Project of Getting and Cleaning Data, September 2014
# This program code reads the train and the test dataset and combines them into one.

# I assume the data files have already been unzipped and stored in the directory below.
setwd("~/UCI HAR Dataset/")

## Step 1. Merges the training and the test sets to create one data set.
# First reads the raw data files
trainX <- read.table("train/X_train.txt")
trainSubj <- read.table("train/subject_train.txt")
trainY <- read.table("train/Y_train.txt")
testX <- read.table("test/X_test.txt")
testSubj <- read.table("test//subject_test.txt")
testY <- read.table("test/Y_test.txt")

# finally merges the train and the test datasets.
mergedX <- rbind(trainX, testX)
mergedSubj <- rbind(trainSubj, testSubj)
mergedY <- rbind(trainY, testY)

# Remark: I think I should add a column representing if the observation is from the train set or the test set in production.
# But I did not because there are no instructions in the Course Project.

## Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# Remark: According to the description on meanFreq() below, it does not represent a mean value of the signals.
# > meanFreq(): Weighted average of the frequency components to obtain a mean frequency
# Then I have decided to use only "mean()" variables, excluding "meanFreq()".

# reads name of the features
features <- read.table("features.txt")
colnames(features) <- c("colIndex", "colName")

# The set of column indices which have a substring "mean()" and "std()" in the string.
extractedMeanIndex <- grep("-mean\\(\\)", features$colName)
extractedStdIndex <- grep("-std\\(\\)", features$colName)

# merges and sorts the two sets of the indices.
extractedIndex = sort(c(extractedMeanIndex, extractedStdIndex))

# finally extracts only the variables relating to a mean or a standard deviation
extractedX <- mergedX[, extractedIndex]


## Step 3. Uses descriptive activity names to name the activities in the data set

# defines a variable activityNumber and uses it as a key for merging.
colnames(mergedY) <- "activityNumber"

# reads the activity labels from the file.
activityLabel <- read.table("activity_labels.txt")
colnames(activityLabel) <- c("activityNumber", "activityLabel")

# combines the activity number data with the activity labels
labeledY <- merge(mergedY, activityLabel, by="activityNumber")


## Step 4. Appropriately labels the data set with descriptive variable names. 
colnames(extractedX) <- features$colName[extractedIndex]
        
## Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
colnames(mergedSubj) <- "subject"
aggregated <- aggregate (extractedX, by=list(mergedSubj$subject, labeledY$activityLabel), FUN=mean)
colnames(aggregated)[1:2] = c("subject", "activity")
write.table(aggregated, file = "aggregated.txt", row.name=FALSE)
