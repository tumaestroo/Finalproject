---
title: "Code Book for getting and cleaning data course project"
author: "Luis Nuñez"
date: "19/1/2021"
output: md_document
---

## Introduction  

An R script called run_analysis.R has been created, the script does the following:

1. Downloads the dataset, creates the directory, and extract the files to the specified
folder

2. Reads the extracted files into tables and names to columns are assigned where needed

3. Merges the training and the test sets to create one data set

4. Extracts only the measurements on the mean and standard deviation for each measurement

5. Uses descriptive activity names to name the activities in the data set

6. Appropriately labels the data set with descriptive variable names

7. From the data set in the previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Download the dataset

The dataset is downloaded, and the data files are extracted in "UCI HAR Dataset" folder

## Reads the extracted files into tables and names to columns are assigned where needed

features <- features.txt (561 obs. of 2 variables)
The features selected for this database come from the accelerometer and gyroscope 
3-axial raw signals tAcc-XYZ and tGyro-XYZ.
Names were asigned to the columns (featurecode, feature)

activities <- activity_labels.txt (6 obs. of 2 variables)
Links the class labels with their activity name. Names were assigned to the columns
(activitycode, activity)

subjecttest <- subject_test.txt (2947obs. of 1 variable)
Each row identifies the subject who performed the activity for each window sample
30% of the subjects were selected to generate the test data (9 of 30 subjects)
A name was assigned to the column (subject)

subjecttrain <- subject_train.txt (7352 obs. of 1 variable)
Each row identifies the subject who performed the activity for each window sample
70% of the subjects were selected to generate the train data (9 of 30 subjects)
A name was assigned to the column (subject)

xtest <- X_test.txt (2947 obs. of 561 variables) Test set. Feature names were assigned to the
columns names

ytest <- y_test.txt (2947 obs. of 1 variable) Test labels

xtrain <- X_train.txt (7352 obs. of 561 variables) Training set. Feature names were assigned to the columns names 

ytrain <- y_train.txt (7352 obs. of 1 variable) Training labels

## Merges the training and the test sets to create one data set

test (2947 obs.of 563 variables) result of merging test set, test labels and test
subjects using cbind

train (7352 obs. of 563 variables) result of merging training set, training labels
and training subjects using cbind

mergeddataset (10299 obs of 563 variables) result of merging train and test data
using rbind

## Extracts only the measurements on the mean and standard deviation for each measurement

filteredset (10299 obs. of 88 variables) is created by selecting subject, activity, mean and std related columns of mergeddataset.

## Uses descriptive activity names to name the activities in the data set

Numbers of activity column in filtereddataset replaced by its corresponding activity (2nd
column of activities table)

## Appropriately labels the data set with descriptive variable names

Changes on column names of filteredset

2nd column is renamed "activity"
"^t" replaced by "Time"
"Acc" replaced by "Accelerometer"
"-mean()"replaced by "Mean"
"-std()"replaced by"StandardDeviation"
"^f"replaced by "Frequency"
"BodyBody" replaced by "Body"
"MeanFreq"replaced by"MeanFrequency"

## From the data set in the previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The filteredset is grouped by activity and subject, the resulting dataset is called groupeddata. groupeddata is summarized by each group obtaining the mean for each case, the 
resulting dataset is called summarizeddata. 
summarizeddata is exported as "FinalSet.txt"