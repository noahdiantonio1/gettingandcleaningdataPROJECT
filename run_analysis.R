## run_analysis.R

## This script converts a dataset of data collected from the accelerometers and 
## gyroscopes from the Samsung Galaxy S smartphone into a new, tidy dataset which
## displays the (newly calculated) averages of the mean and standard deviation 
## values (included in the original dataset) of the accelerometer and gyroscope 
## measurements for each subject and for each activity performed by each subject.

## Download and Unzip Files
if(!file.exists("UCIHARzip.zip")) {
        file.create("UCIHARZIP.zip")
}
zipurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipurl, "UCIHARZIP.zip")
currentwd <- getwd()
unzip("UCIHARZIP.zip", exdir = currentwd)

## Read Unzipped Files Into R
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("label", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "feature"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "label")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "label")

## Convert "y_test" and "y_train" to Contain Activity Labels
library(dplyr) ## Allows use of "left_join", "select"
y_test <- left_join(y_test, activity_labels, by = "label") ## Merges y_test and activity_labels but retains order of y_test
y_test <- subset(y_test, select = activity) ## Remove extraneous "label" variable
y_train <- left_join(y_train, activity_labels, by = "label") ## Merges y_train and activity_labels but retains order of y_train
y_train <- subset(y_train, select = activity) ## Remove extraneous "label" variable
## This step fulfills the assignment requirement "Uses descriptive activity names to name the activities in the data set."

## Create Data Frames
test_df <- cbind(subject_test, y_test, x_test) ## Data frame for test group
train_df <- cbind(subject_train, y_train, x_train) ## Data frame for training group

## Combine Test and Training Data Frames
combined_df <- rbind(test_df, train_df) ## Data frame for combined groups
## This step fulfills the assignment requirement "Merges the training and the test sets to create one data set."

## Extract only the measurements on the mean and standard deviation for each measurement
tidydata <- select(combined_df, subject, activity, contains(".mean.."), contains(".std.."))
## Only those variables which contain "mean()" or "std()" in the original data are counted.
## This is because those represent the mean and standard deviation for each measurement.
## This function excludes "meanFreq()" and the five additional vectors listed at the bottom of features.info.
## This step fulfills the assignment requirement "Extracts only the measurements on the mean and standard deviation for each measurement."

## Rename Feature Variables
names(tidydata) <- gsub("^t", "Time", names(tidydata))
names(tidydata) <- gsub("^f", "Frequency", names(tidydata))
names(tidydata) <- gsub("Acc", "Accelerometer", names(tidydata))
names(tidydata) <- gsub("Gyro", "Gyroscope", names(tidydata))
names(tidydata) <- gsub("Mag", "Magnitude", names(tidydata))
names(tidydata) <- gsub(".mean..", "Mean", names(tidydata))
names(tidydata) <- gsub(".std..", "STD", names(tidydata))
names(tidydata) <- gsub(".X", "X", names(tidydata))
names(tidydata) <- gsub(".Y", "Y", names(tidydata))
names(tidydata) <- gsub(".Z", "Z", names(tidydata))
## This step fulfills the assignment requirement "Appropriately labels the data set with descriptive variable names."

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject
if(!file.exists("MeanData.txt")) { ## Create file to hold data set
        file.create("MeanData.txt")
}
AveragesData <- tidydata %>% ## Create new data frame which groups by subject and activity and takes the mean of the feature values
        group_by(subject, activity) %>%
        summarize(across(.fns = mean))
names(AveragesData) <- gsub("^", "Mean", names(AveragesData)) ## Update variable names for AveragesData to reflect that the mean of each value has been taken
names(AveragesData) <- gsub("Meansubject", "subject", names(AveragesData)) ## Revert name for "subject" column
names(AveragesData) <- gsub("Meanactivity", "activity", names(AveragesData)) ## Revert name for "activity" coulumn
write.table(AveragesData, file = "MeanData.txt", row.names = FALSE)
## This step fulfills the assignment requirement "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."