#Data downloaded, extracted on DIR "UCI HAR Dataset", loaded each .txt as a table
#and assigned column names where needed

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"tozip.zip")
unzip("tozip.zip") 
features <- read.table("UCI HAR Dataset/features.txt")
colnames(features) <- c("featurecode", "feature")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activities) <- c("activitycode", "activity")
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(subjecttest) <- c("subject")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
colnames(xtest) <- features$feature
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
colnames(ytest) <- c("activitycode")
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(subjecttrain) <- c("subject")
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
colnames(xtrain) <- features$feature
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
colnames(ytrain) <- c("activitycode")

#Binded test data and train data, and then merged both in a dataset

test <- cbind(subjecttest, ytest, xtest)
train <- cbind(subjecttrain, ytrain, xtrain)
mergeddataset <- rbind(test,train)

#Filtered the merged dataset by mean and std columns only

meancols <- grep("mean",colnames(mergeddataset), ignore.case = TRUE)
stdcols <- grep("std",colnames(mergeddataset), ignore.case = TRUE)
selcols <- c(1,2,meancols,stdcols)
selcolss <- sort(selcols, decreasing = FALSE)
filteredset <- mergeddataset[,selcolss]

#Applied descriptive activities to the filtered dataset

filteredset$activitycode <- activities[filteredset$activitycode, 2]

#Applied descriptive variable names, instead of abbreviations 

names(filteredset)[2] <- "activity"
names(filteredset) <- gsub("^t","Time",names(filteredset))
names(filteredset) <- gsub("Acc","Accelerometer",names(filteredset))
names(filteredset) <- gsub("-mean()","Mean",names(filteredset))
names(filteredset) <- gsub("-std()","StandardDeviation",names(filteredset))
names(filteredset) <- gsub("^f","Frequency",names(filteredset))
names(filteredset) <- gsub("BodyBody","Body",names(filteredset))
names(filteredset) <- gsub("MeanFreq","MeanFrequency",names(filteredset))

#Categorized the dataset, and got the mean for each subject and each activity

library(dplyr)
groupeddata <- group_by(filteredset,subject,activity)
summarizeddata <- summarise_all(groupeddata,mean)
write.table(summarizeddata,"FinalSet.txt", row.names = FALSE)