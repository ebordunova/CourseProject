getwd()   #checking what directory is currently a working one
setwd("D:\\COURSERA\\3. Getting and Cleaning Data\\Course Project")   #setting a working directory

#Downloading a file from the link provided into a current wd and checking if the file has been downloaded
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl1, destfile = "D:\\COURSERA\\3. Getting and Cleaning Data\\Course Project\\projectdata.zip", method = "auto")
file.exists("D:\\COURSERA\\3. Getting and Cleaning Data\\Course Project\\projectdata.zip")

#Unzipping file into the current working directory
unzip("D:\\COURSERA\\3. Getting and Cleaning Data\\Course Project\\projectdata.zip")

#Reading TRAINING tables to see their structure
xTrain <- read.table("D:\\COURSERA\\3. Getting and Cleaning Data\\Course Project\\UCI HAR Dataset\\train\\X_train.txt")
yTrain <- read.table("D:\\COURSERA\\3. Getting and Cleaning Data\\Course Project\\UCI HAR Dataset\\train\\Y_train.txt")
subjectTrain <- read.table("D:\\COURSERA\\3. Getting and Cleaning Data\\Course Project\\UCI HAR Dataset\\train\\subject_train.txt")
dim(xTrain)
dim(yTrain)
dim(subjectTrain)

#Reading TEST tables to see their structure
xTest <- read.table("D:\\COURSERA\\3. Getting and Cleaning Data\\Course Project\\UCI HAR Dataset\\test\\X_test.txt")
yTest <- read.table("D:\\COURSERA\\3. Getting and Cleaning Data\\Course Project\\UCI HAR Dataset\\test\\Y_test.txt")
subjectTest <- read.table("D:\\COURSERA\\3. Getting and Cleaning Data\\Course Project\\UCI HAR Dataset\\test\\subject_test.txt")
dim(xTest)
dim(yTest)
dim(subjectTest)

#Appending column names to xTrain
##Reading features file
features <- read.table("D:\\COURSERA\\3. Getting and Cleaning Data\\Course Project\\UCI HAR Dataset\\features.txt")
str(features)
##Using V2 from features file as column labels
colnames(xTrain) <- features$V2
colnames(xTrain) <- gsub("-", "", colnames(xTrain))
colnames(xTrain) <- gsub("\\()", "", colnames(xTrain))
##Checking if they have benn appended correctly
names(xTrain)

#Appending column names to xTest
##Using V2 from features file as column labels
colnames(xTest) <- features$V2
colnames(xTest) <- gsub("-", "", colnames(xTest))
colnames(xTest) <- gsub("\\()", "", colnames(xTest))
##Checking if they have benn appended correctly
names(xTest)

#Merging TRAINING sets together using cbind
TrainData <- cbind(subjectTrain, yTrain, xTrain)
str(TrainData)

#Merging TEST sets together using cbind
TestData <- cbind(subjectTest, yTest, xTest)
str(TestData)

#Merging 2 datasets using rbind
AllData <- rbind(TrainData, TestData)
str(AllData)
head(AllData)
names(AllData)

#Renaming 1st and 2nd columns (as now we have two V1 variables)
colnames(AllData)[1] <- "subjectID"
colnames(AllData)[2] <- "activityID"
names(AllData)

#Using descriptive activity names to name the activities in the data set
activityLabels <- read.table("D:\\COURSERA\\3. Getting and Cleaning Data\\Course Project\\UCI HAR Dataset\\activity_labels.txt")
str(activityLabels)
activityLabels$V2 <- as.character(activityLabels$V2)
activityLabels

##Matching codes with activities names
m <- match(AllData$activityID, activityLabels$V1)
##Storing labels in a separate column in a dataset
AllData$activityID2 <- activityLabels[m,2]
##Checking if the converting worked correctly (and yes, it did :-))
table(AllData$activityID, AllData$activityID2)

#Extracts the measurements on the mean and standard deviation (PLEASE NORE THAT I DO INCLUDE freqmean BUT DON'T INCLUDE ANGLES)
subsetData <- AllData[,grep("mean|std", colnames(AllData))]
str(subsetData)

##Adding back subject and activity
subsetDataFin <- cbind(AllData$subjectID, AllData$activityID2, subsetData)
str(subsetDataFin) #it has 81 variables = 79 measures + subject + activity
colnames(subsetDataFin)[1] <- "subjectID"
colnames(subsetDataFin)[2] <- "activityID"

#Creates a tidy data set with the average of each variable for each activity and each subject
##Aggregating the data so we have every combination of variable-activity-subject
aggrData <- aggregate(subsetDataFin[,3:81], by=list(subsetDataFin$subjectID, subsetDataFin$activityID), FUN=mean, na.rm=TRUE)
str(aggrData) #so it has 180 observations of 81 variables
colnames(aggrData)[1] <- "subjectID"
colnames(aggrData)[2] <- "activityID"
head(aggrData)

#Writing the dataset into a table
write.table(aggrData, "D:\\COURSERA\\3. Getting and Cleaning Data\\Course Project\\tidyDS.txt",  col.names = TRUE)
#Checking how it works
tidyDS <- read.table("D:\\COURSERA\\3. Getting and Cleaning Data\\Course Project\\tidyDS.txt")
head(tidyDS)
names(tidyDS)
