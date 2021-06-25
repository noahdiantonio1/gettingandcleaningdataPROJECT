# Course Project: Getting and Cleaning Data
### Noah DiAntonio

This repository contains four relevant files:
- README.md
- run_analysis.R
- MeanData.txt
- Codebook.md

#### README.me
README.md is the file that you are reading right now.

#### run_analysis.R
run_analysis.R contains a script which converts a dataset of data collected from the accelerometers and gyroscopes from the Samsung Galaxy S smartphone into a new, tidy dataset which displays the (newly calculated) averages of the mean and standard deviation values (included in the original dataset) of the accelerometer and gyroscope measurements for each subject and for each activity performed by each subject.

It does this in eight steps:
1. Downloads and unzips the file containing the dataset
2. Reads the unzipped files into R
3. Converts codes listed in the files "y_test" and "y_train" to the activities those codes represent
4. Creates data frames for the "test" group and the "training" group in the original dataset
5. Combines those two data frames into one
6. Extracts only the measurements on the mean and standard deviation for each measurement
7. Renames the feature variables to have more complete and easier to understand variable names
8. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

These steps fulfill the five requirements for the script laid out in the assignment:
- "Merges the training and the test sets to create one data set" is fulfilled by steps 1, 2, 4, and 5
- "Extracts only the measurements on the mean and standard deviation for each measurement" is fulfilled by step 6
- "Uses descriptive activity names to name the activities in the data set" is fulfilled by step 3
- "Appropriately labels the data set with descriptive variable names" is fulfilled by step 7
- "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject" is fulfilled by step 8

#### MeanData.txt
MeanData.txt is the output file from step 8 of run_analysis.R. It contains the averages of the mean and standard deviation values of the accelerometer and gyroscope measurements for each subject and for each activity performed by each subject.

To read MeanData.txt into R, download MeanData.txt to your working directory and use the following code:

```{r}
MeanData <- read.table("MeanData.txt", header = TRUE)
View(MeanData)
```
#### Codebook.md
Codebook.md contains the answers to these four questions:
1. What is the original data that goes into run_analysis.R?
2. How is the data transformed in the course of run_analysis.R?
3. What are the variables in MeanData.txt?
