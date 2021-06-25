# Codebook
### Noah DiAntonio

## Original Data
The original data can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data contains data captured by the accelerometors and gyroscopes of Samsung S smartphones as part of an experiment by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto of Smartlab - Non Linear Complex Systems Laboratory. They captured movement data in three dimensions as subjects perfomed six different motions: Walking, walking upstairs, walking downstairs, sitting, standing, and laying. This data included acceleration and velocity. Acceleration was then disaggregated into the individual's body acceleration and gravitational force. Additional calcuations obtained jerk signals and their magnitude. Finally, a Fast Fourier Transform (FFT) was applied to measure signals in the frequency domain.

The subjects were split into two groups, a test group and a training group.

This data comes in eight files:
- features.txt contains a list of all of the features (measurements/calculations)
- activity_labels.txt contains a data frame containing the numeric labels for activities and the written names of the activities
- subject_test.txt contains the subject codes for the test group
- subject_train.txt contains the subject codes for the training group
- y_test.txt contains the numeric activity labels for the test group
- y_train.txt contains the numeric activity labels for the training group
- x_test.txt contains the values of the measurements for the test group
- x_train.txt contains the values of the measurements for the training group

## Data Transformation in run_analysis.R
run_analysis.R:
- Downloads and unzips the aforementioned files
- Reads the aforementioned files into R as data frames
- Joins y_test and y_train, respectively, with the activity_labels data frame to match the numeric labels with the activity names, then removes the numeric labels
- Binds together the subject, y, and x data frames for each group, creating a test_df data frame and train_df data frame
- Binds those data frames into combined_df, a data frame which contains all observations
- Renames the variable names to make them more readable
- Creates a new data frame which groups combined_df by subject and activity, then takes the mean of the other variables for each subject and activity
- Renames the variables in the new data frame (other than "subject" and "activity") to have "Mean" at the start of their names to show that the mean of the value has been taken
- Prints the resulting new data frame to MeanData.txt

## Variables in MeanData.txt
ID Variables:
subject: the numeric identifier for a given subject
activity: the activity performed by the subject

Measurement Variables:
For the measurement variables, rather than providing a description of all 66 measurement variables, I will provide you with a key to reading them. For each term which might show up in a variable name, I will provide a description:
- Mean (at the beginning): All measurement variables have this, it is representing that all of these values are the mean of whatever follows
- Time: This variable was calculated in the time domain
- Frequency: This variable was calculated in the frequency domain
- Body: This variable is measuring body acceleration
- Gravity: This variable is measuring gravitational force
- Accelerometer: This variable was measured using an accelerometer
- Gyroscope: This variable was measured using a gyroscope
- Jerk: This variable is measuring a jerk signal
- Magnitude: This variable is measuring the magnitude of the signal
- Mean (near or at the end): This variable is measuring the mean of the signal
- STD (near or at the end): This variable is measuring the standard deviation of the signal
- X, Y, or X: This variable is an axial signal in the X, Y, or Z direction

A complete list of the variables in MeanData.txt:
```{r, echo=FALSE}
MeanData <- read.table("MeanData.txt", header = TRUE)
names(MeanData)
```