# create data directory
if (!file.exists("data")) {
  dir.create("data")
}

# download dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFilename <- "./data/HumanActivityRecognition.zip"
download.file(fileUrl, destfile = zipFilename)

# unzip file
unzip(zipFilename,exdir="./data")

# Read training set data
subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",header = FALSE)
datasetTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt",header = FALSE)
activityTrain <- read.table("./data/UCI HAR Dataset/train/Y_train.txt",header = FALSE)

# Reads test set data
subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",header = FALSE)
datasetTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt",header = FALSE)
activityTest <- read.table("./data/UCI HAR Dataset/test/Y_test.txt",header = FALSE)

# 1. Merges the training and the test sets
subjectAll <- rbind(subjectTrain,subjectTest)
datasetAll <- rbind(datasetTrain,datasetTest)
activityAll <- rbind(activityTrain,activityTest)

# Set names for each data frame
names(subjectAll)<-c("subject")
names(activityAll)<- c("activity")
# get datasetAll names from features.txt
datasetAllNames <- read.table("./data/UCI HAR Dataset/features.txt",head=FALSE)
names(datasetAll)<- datasetAllNames$V2

# Combine data frames by columns to create one data set
subjectActivityAll <- cbind(subjectAll, activityAll)
humanActivityData <- cbind(subjectActivityAll,datasetAll)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
# get names which contain mean() or std() from datasetAllNames
meanStdNames<-datasetAllNames$V2[grep("mean\\(\\)|std\\(\\)", datasetAllNames$V2)]
selectedNames<-c("subject", "activity",as.character(meanStdNames))

# subset data fram only "subject", "activity", and columns which contain mean() and std()
humanActivityData <- humanActivityData[,selectedNames]

# 3. Uses descriptive activity names to name the activities in the data set
# get activity Labels
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt",header = FALSE)

# create factor activity
humanActivityData$activity <- factor(humanActivityData$activity,labels=as.character(activityLabels$V2))

# 4. Appropriately labels the data set with descriptive variable names
# replace abbreviations as metion in features_info.txt
# prefix t is replaced by  time
# prefix f is replaced by frequency
# Acc is replaced by Accelerometer
# Gyro is replaced by Gyroscope
# Mag is replaced by Magnitude
# BodyBody is replaced by Body
names(humanActivityData)<-gsub("^t", "time", names(humanActivityData))
names(humanActivityData)<-gsub("^f", "frequency", names(humanActivityData))
names(humanActivityData)<-gsub("Acc", "Accelerometer", names(humanActivityData))
names(humanActivityData)<-gsub("Gyro", "Gyroscope", names(humanActivityData))
names(humanActivityData)<-gsub("Mag", "Magnitude", names(humanActivityData))
names(humanActivityData)<-gsub("BodyBody", "Body", names(humanActivityData))

# 5. From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject
# install "dplyr" if it doens't exist
if (!require("dplyr")){
  install.packages("dplyr")
}
library(dplyr)

# average each variable grop by subject and activity
meanData <- humanActivityData %>% group_by( subject, activity) %>% summarise_each(funs(mean))
write.table(meanData, file = "averageHumanActivityRecognition.txt",row.name=FALSE)
