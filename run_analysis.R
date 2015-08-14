library(dplyr)

# Creating a directory "Course Project" and setting it as home directory 

if (!file.exists("Course_Project")) dir.create("Course_Project")
setwd("./Course_Project/")


# downloading the file from Url and unzipping it

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile = "data.zip")

unzip(zipfile = "data.zip")

# Reading the tables from train and test data
# Y data correspond to activity data
# X data correspond to features data
# subject data correspond to the people

dataActivityTest <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
dataActivityTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

dataSubjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
dataSubjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)

dataFeaturesTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
dataFeaturesTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)

# Merge the test and train datasets of activity, subject and features to form 3 datasets of
# activity, subject and features

dataActivity <- rbind(dataActivityTrain,dataActivityTest)
dataSubject <- rbind(dataSubjectTrain,dataSubjectTest)
dataFeatures <- rbind(dataFeaturesTrain,dataFeaturesTest)


# Extract the feature names of 561 variables from the text file

featureNames <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)

# renaming the features dataset with the feature names obtained from the previous step

names(dataFeatures) <- featureNames$V2

# Renaming subject and activity datasets with proper column names

names(dataSubject) <- "subject"
names(dataActivity) <- "activity"

# Combining all the three (feature, subject and activity) to form a single dataset

dataCbind <- cbind(dataSubject,dataActivity)
dataMerge <- cbind(dataFeatures,dataCbind)

# Extracting feature names that involve with mean and standard deviation alone
# Ignorning angle measurements involving mean and standard deviation


reqFeatureNames <- featureNames$V2[grepl("mean\\(\\)|std\\(\\)",featureNames$V2)]

# Character vectors containing only the extracted column names (calculating mean and sd)
# along with subject and activity

reqColumns <- c(as.character(reqFeatureNames),"subject","activity")

# Subsetting the merged dataset taking out only the required columns

reqData <- subset(dataMerge, select = reqColumns)

# Renaming the feature names with descriptive labels

names(reqData) <- gsub("^t","time",names(reqData))
names(reqData) <- gsub("^f","frequency",names(reqData))
names(reqData) <- gsub("BodyBody","Body",names(reqData))
names(reqData) <- gsub("Acc","Accelerometer",names(reqData))
names(reqData) <- gsub("Gyro","Gyrometer",names(reqData))
names(reqData) <- gsub("Mag","Magnitude",names(reqData))

# Extract the activity labels(SITTING, WALKING,...) from the activity labels dataset

activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt",header = FALSE,stringsAsFactors = TRUE)


# subject and activity columns as factors
# activity columns provided with appropriate labels from the activity labels info dataset

reqData$activity <- factor(reqData$activity,levels = activityLabels$V1, labels = activityLabels$V2)
reqData$subject <- factor(reqData$subject)


# Creating a tidy data set average of each variable and each subject.

opData <- aggregate(.~activity+subject,reqData,FUN = mean)

# Writing the obtained tidy data set to a text file

write.table(opData,file = "tidyData.txt",row.names = FALSE, quote = FALSE)

