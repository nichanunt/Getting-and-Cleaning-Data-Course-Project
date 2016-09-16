# Getting and Cleaning Data Course Project

This poroject uses 'Human Activity Recognition Using Smartphones' Dataset.In 'run_analysis.R', it merges  
training set and test set data, create tidy dataset in "averageHumanActivityRecognition.txt" which 
contains the average of each 68 variables for each activity and each subject.


##The original data

The data source is downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This project uses files as variables in dataset below:


Variable name 	     |group        |file              | Description 
---------------------|-------------|------------------|------------
subject              |tranning set |subject_train.txt |30 subjects who performed the activities (range is 1-30)
		     |test set     |subject_test.txt  |30 subjects who performed the activities (range is 1-30)
activity             |tranning set |Y_train.txt       |activities that each subject performs
                     |test set     |Y_test.txt        |activities that each subject performs
get from features.txt|tranning set |X_train.txt       |measurement data as define in features.txt
  	             |test set     |X_test.txt        |measurement data as define in features.txt  
    
Acitvitis are
- 1 WALKING
- 2 WALKING_UPSTAIRS
- 3 WALKING_DOWNSTAIRS
- 4 SITTING
- 5 STANDING
- 6 LAYING


##Creating the tidy data file

1. Download dataset and unzip files in "data" folder
2. Read training set and test set data into "subject", "activity", and "dataset"
3. Merge training set and test set data by "subject", "activity", and "dataset"
4. Set variable names for each data frame. For "dataset", it gets variable names from 'features.txt'
5. Combine data frames by columns to create one data set
6. Extract only the measurement variables which are mean and standard deviation
7. Get activity labels from 'activity_labels.txt'to name the activities in the data set
8. Replace abbreviations for measurement variables
    - prefix t is replaced by  time
    - prefix f is replaced by frequency
    - Acc is replaced by Accelerometer
    - Mag is replaced by Magnitude
    - BodyBody is replaced by Body
9. Create data set with the average of each variable for each activity and each subject in
 "averageHumanActivityRecognition.txt"


##Description of the variables
There are 68 Variables in "averageHumanActivityRecognition.txt" as follow:
 * subject
 * activity
 * measurement variables which are mean and standard deviation are:
    - timeBodyAccelerometer-mean()-X 
    - timeBodyAccelerometer-mean()-Y 
    - timeBodyAccelerometer-mean()-Z 
    - timeBodyAccelerometer-std()-X 
    - timeBodyAccelerometer-std()-Y 
    - timeBodyAccelerometer-std()-Z 
    - timeGravityAccelerometer-mean()-X 
    - timeGravityAccelerometer-mean()-Y 
    - timeGravityAccelerometer-mean()-Z 
    - timeGravityAccelerometer-std()-X 
    - timeGravityAccelerometer-std()-Y 
    - timeGravityAccelerometer-std()-Z 
    - timeBodyAccelerometerJerk-mean()-X 
    - timeBodyAccelerometerJerk-mean()-Y 
    - timeBodyAccelerometerJerk-mean()-Z 
    - timeBodyAccelerometerJerk-std()-X 
    - timeBodyAccelerometerJerk-std()-Y 
    - timeBodyAccelerometerJerk-std()-Z 
    - timeBodyGyroscope-mean()-X 
    - timeBodyGyroscope-mean()-Y 
    - timeBodyGyroscope-mean()-Z 
    - timeBodyGyroscope-std()-X 
    - timeBodyGyroscope-std()-Y 
    - timeBodyGyroscope-std()-Z 
    - timeBodyGyroscopeJerk-mean()-X
    - timeBodyGyroscopeJerk-mean()-Y
    - timeBodyGyroscopeJerk-mean()-Z
    - timeBodyGyroscopeJerk-std()-X
    - timeBodyGyroscopeJerk-std()-Y
    - timeBodyGyroscopeJerk-std()-Z
    - timeBodyAccelerometerMagnitude-mean()
    - timeBodyAccelerometerMagnitude-std()
    - timeGravityAccelerometerMagnitude-mean()
    - timeGravityAccelerometerMagnitude-std()
    - timeBodyAccelerometerJerkMagnitude-mean()
    - timeBodyAccelerometerJerkMagnitude-std()
    - timeBodyGyroscopeMagnitude-mean()
    - timeBodyGyroscopeMagnitude-std()
    - timeBodyGyroscopeJerkMagnitude-mean()
    - timeBodyGyroscopeJerkMagnitude-std()
    - frequencyBodyAccelerometer-mean()-X
    - frequencyBodyAccelerometer-mean()-Y
    - frequencyBodyAccelerometer-mean()-Z
    - frequencyBodyAccelerometer-std()-X
    - frequencyBodyAccelerometer-std()-Y
    - frequencyBodyAccelerometer-std()-Z
    - frequencyBodyAccelerometerJerk-mean()-X
    - frequencyBodyAccelerometerJerk-mean()-Y
    - frequencyBodyAccelerometerJerk-mean()-Z
    - frequencyBodyAccelerometerJerk-std()-X
    - frequencyBodyAccelerometerJerk-std()-Y
    - frequencyBodyAccelerometerJerk-std()-Z
    - frequencyBodyGyroscope-mean()-X
    - frequencyBodyGyroscope-mean()-Y
    - frequencyBodyGyroscope-mean()-Z
    - frequencyBodyGyroscope-std()-X
    - frequencyBodyGyroscope-std()-Y
    - frequencyBodyGyroscope-std()-Z
    - frequencyBodyAccelerometerMagnitude-mean()
    - frequencyBodyAccelerometerMagnitude-std()
    - frequencyBodyAccelerometerJerkMagnitude-mean()
    - frequencyBodyAccelerometerJerkMagnitude-std()
    - frequencyBodyGyroscopeMagnitude-mean()
    - frequencyBodyGyroscopeMagnitude-std()
    - frequencyBodyGyroscopeJerkMagnitude-mean()
    - frequencyBodyGyroscopeJerkMagnitude-std()

##Summary
'run_analysis.R'creates result in "averageHumanActivityRecognition.txt" which contains
the average of 66 measurement variables for each subject in 6 activities.
