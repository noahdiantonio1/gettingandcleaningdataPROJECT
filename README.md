# Course Project: Getting and Cleaning Data
### Noah DiAntonio\
\

This repository contains four relevant files:\
README.md\
run_analysis.R\
MeanData.txt\
Codebook.md\
\

#### README.me\
README.md is the file that you are reading right now.\




MeanData <- read.table("MeanData.txt", header = TRUE)
View(MeanData)


This script converts a dataset of data collected from the accelerometers and gyroscopes from the Samsung Galaxy S smartphone into a new, tidy dataset which displays the (newly calculated) averages of the mean and standard deviation values (included in the original dataset) of the accelerometer and gyroscope measurements for each subject and for each activity performed by each subject.
