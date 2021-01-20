==================================================================
Getting and Cleaning data course project
==================================================================
Luis E. Nuñez 
==================================================================

This repository is the submission for the getting and cleaning data course project.

The submission consists of:

Codebook.md: A file describing the data, variables and the transformations apllied to
the data.

run_analysis.R: A R script which does the following:

1. Downloads the dataset, creates the directory, and extract the files to the specified
folder

2. Reads the extracted files into tables and names to columns are assigned where needed

3. Merges the training and the test sets to create one data set

4. Extracts only the measurements on the mean and standard deviation for each measurement

5. Uses descriptive activity names to name the activities in the data set

6. Appropriately labels the data set with descriptive variable names

7. From the data set in the previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

FinalSet.txt: The exported final data of runanalysis.R