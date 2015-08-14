# Getting_and-Cleaning_Data_Course_Project
Course Project for getdata-031 Getting and Cleaning Data

This code book summarises the method used in achieving the tidy data and all the variables involved.

### Data collection

Data was obtained from the url:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The same was unzipped and stored in the working directory. The following files where in the unzipped directory "UCI HAR Dataset":

1) "activity_labels.txt"
2) "features.txt"                                
3) "features_info.txt"
4) "README.txt"                                  
5) "test/Inertial Signals/body_acc_x_test.txt"
6) "test/Inertial Signals/body_acc_y_test.txt"   
7) "test/Inertial Signals/body_acc_z_test.txt" 
8) "test/Inertial Signals/body_gyro_x_test.txt"  
9) "test/Inertial Signals/body_gyro_y_test.txt"  
10) "test/Inertial Signals/body_gyro_z_test.txt"  
11) "test/Inertial Signals/total_acc_x_test.txt"   
12) "test/Inertial Signals/total_acc_y_test.txt"  
13) "test/Inertial Signals/total_acc_z_test.txt"   
14) "test/subject_test.txt"                       
15) "test/X_test.txt"                             
16) "test/y_test.txt"                             
17) "train/Inertial Signals/body_acc_x_train.txt"  
18) "train/Inertial Signals/body_acc_y_train.txt" 
19) "train/Inertial Signals/body_acc_z_train.txt"  
20) "train/Inertial Signals/body_gyro_x_train.txt"
21) "train/Inertial Signals/body_gyro_y_train.txt" 
22) "train/Inertial Signals/body_gyro_z_train.txt"
23) "train/Inertial Signals/total_acc_x_train.txt" 
24) "train/Inertial Signals/total_acc_y_train.txt"
25) "train/Inertial Signals/total_acc_z_train.txt" 
26) "train/subject_train.txt"                     
27) "train/X_train.txt"                            
28) "train/y_train.txt"     

Of these only the X,Y and subject datasets for both test and train are taken for tidying up. 
Inertial signals folder in  test and train is not considered because on further manipulation of 
data, only variable involving mean and standard deviation are required.

X datasets correspond to Feature values
Y datasets correspond to Activity values
Subject datasets corresponds to id of people who participated 

### Data Processing Method

Steps taken to tidy up the data and the variables involved are recorded in detail.

#### 1. Reading Data from the table

The following variables are created to stire data from the following text files:

dataActivity_test       <-      test/y_test.txt"

dataActivity_train      <-      train/y_train.txt"

dataSubject_test        <-      test/subject_test.txt"

dataSubject_train       <-      train/subject_train.txt"

dataFeatures_test       <-      test/X_test.txt"

dataFeatures_train      <-      train/X_train.txt"


#### 2. Merging datasets

The test and training datasets are combined to create three different datasets that involves
activity, subject and features, viz **dataActivity**, **dataSubject**, **dataFeatures** in the order
test and then train for all of them.

##### Properties of datasets

**dataActivity**        :      
'data.frame':	10299 obs. of  1 variable:
 $ activity: int  5 5 5 5 5 5 5 5 5 5 ...
 
 **dataSubject**        :       
 'data.frame':	10299 obs. of  1 variable:
 $ subject: int  1 1 1 1 1 1 1 1 1 1 ...
 
 **dataFeatures**       :       
data frame with 10299 rows and 561 variables

#### 3. Labelling the datasets

The **dataActivity** column is labelled __*activity*__ and **dataSubject** column is labelled __*subject*__.
**dataFeatures** feature names are in the file features.txt

**featureNames** stores the feature names from the file *features.txt*. The second column of it contains the 
feature names. The second column is assigned as the names of columns of the **dataFeatures** dataset.

#### 4. Merging datasets

All the three datasets,ie, **dataActivity**,**dataSubject**, and **dataFeatures** are merged to form a single dataset,**dataMerge**.

#### 5. Extracting features involving mean and standard deviation  

**grepl** function is used to extract the feature names involving mean and standard deviation. There are 66 variables that satisfy the condition, the subject and activity columns are also added to the *reqColumns* variable. A total of 68 variables are included in the *reqData* datasaet.

#### 6. Appropriate labelling of column names

All the __*66*__ feature names are relabelled with gsub function. The variables with prefix __*t*__ is replaced with **time**, prefix __*f*__ is replaced by **frequency**. The __*BodyBody*__ word in the variable is replaced by **Body**, __*Mag*__ is replaced with **Magnitude**, __*Acc*__ with **Accelerometer** and __*Gyro*__ with **Gyrometer**.

#### Variables

 1) "activity"                                      
 2) "subject"                                       
 3) "timeBodyAccelerometer-mean()-X"                
 4) "timeBodyAccelerometer-mean()-Y"                
 5) "timeBodyAccelerometer-mean()-Z"                
 6) "timeBodyAccelerometer-std()-X"                 
 7) "timeBodyAccelerometer-std()-Y"                 
 8) "timeBodyAccelerometer-std()-Z"                 
 9) "timeGravityAccelerometer-mean()-X"             
10) "timeGravityAccelerometer-mean()-Y"             
11) "timeGravityAccelerometer-mean()-Z"             
12) "timeGravityAccelerometer-std()-X"              
13) "timeGravityAccelerometer-std()-Y"              
14) "timeGravityAccelerometer-std()-Z"              
15) "timeBodyAccelerometerJerk-mean()-X"            
16) "timeBodyAccelerometerJerk-mean()-Y"            
17) "timeBodyAccelerometerJerk-mean()-Z"            
18) "timeBodyAccelerometerJerk-std()-X"             
19) "timeBodyAccelerometerJerk-std()-Y"             
20) "timeBodyAccelerometerJerk-std()-Z"             
21) "timeBodyGyrometer-mean()-X"                    
22) "timeBodyGyrometer-mean()-Y"                    
23) "timeBodyGyrometer-mean()-Z"                    
24) "timeBodyGyrometer-std()-X"                     
25) "timeBodyGyrometer-std()-Y"                     
26) "timeBodyGyrometer-std()-Z"                     
27) "timeBodyGyrometerJerk-mean()-X"                
28) "timeBodyGyrometerJerk-mean()-Y"                
29) "timeBodyGyrometerJerk-mean()-Z"                
30) "timeBodyGyrometerJerk-std()-X"                 
31) "timeBodyGyrometerJerk-std()-Y"                 
32) "timeBodyGyrometerJerk-std()-Z"                 
33) "timeBodyAccelerometerMagnitude-mean()"         
34) "timeBodyAccelerometerMagnitude-std()"          
35) "timeGravityAccelerometerMagnitude-mean()"      
36) "timeGravityAccelerometerMagnitude-std()"       
37) "timeBodyAccelerometerJerkMagnitude-mean()"     
38) "timeBodyAccelerometerJerkMagnitude-std()"      
39) "timeBodyGyrometerMagnitude-mean()"             
40) "timeBodyGyrometerMagnitude-std()"              
41) "timeBodyGyrometerJerkMagnitude-mean()"         
42) "timeBodyGyrometerJerkMagnitude-std()"          
43) "frequencyBodyAccelerometer-mean()-X"           
44) "frequencyBodyAccelerometer-mean()-Y"           
45) "frequencyBodyAccelerometer-mean()-Z"           
46) "frequencyBodyAccelerometer-std()-X"            
47) "frequencyBodyAccelerometer-std()-Y"            
48) "frequencyBodyAccelerometer-std()-Z"            
49) "frequencyBodyAccelerometerJerk-mean()-X"       
50) "frequencyBodyAccelerometerJerk-mean()-Y"       
51) "frequencyBodyAccelerometerJerk-mean()-Z"       
52) "frequencyBodyAccelerometerJerk-std()-X"        
53) "frequencyBodyAccelerometerJerk-std()-Y"        
54) "frequencyBodyAccelerometerJerk-std()-Z"        
55) "frequencyBodyGyrometer-mean()-X"               
56) "frequencyBodyGyrometer-mean()-Y"               
57) "frequencyBodyGyrometer-mean()-Z"               
58) "frequencyBodyGyrometer-std()-X"                
59) "frequencyBodyGyrometer-std()-Y"                
60) "frequencyBodyGyrometer-std()-Z"                
61) "frequencyBodyAccelerometerMagnitude-mean()"    
62) "frequencyBodyAccelerometerMagnitude-std()"     
63) "frequencyBodyAccelerometerJerkMagnitude-mean()"
64) "frequencyBodyAccelerometerJerkMagnitude-std()" 
65) "frequencyBodyGyrometerMagnitude-mean()"        
66) "frequencyBodyGyrometerMagnitude-std()"         
67) "frequencyBodyGyrometerJerkMagnitude-mean()"    
68) "frequencyBodyGyrometerJerkMagnitude-std()"     


Of the 68 variables __*subject*__ and __*activity*__ are factor variables.


#### 7. Relabelling activity column values

__activity_labels__ stores the activity labels for the activity column, ie, **LAYING, SITTING, STANDING, WALKING WALKING_DOWNSTAIRS  and WALKING_UPSTAIRS** from the text file activity_labels.txt. The activity column of the **reqData** is then factorised by providing character labels from activity _labels.
The subject column in the **reqData** is also factorised.

#### Activity Labels 

1 -     WALKING

2 -     WALKING_UPSTAIRS

3 -     WALKING_DOWNSTAIRS

4 -     SITTING

5 -     STANDING

6 -     LAYING

#### 8. Tidy data set

Aggregate function is used to find the average of the feature variables with __*subject*__ and __*activity*__ columns as the grouping elements(factor variables). It has 68 columns and 180 rows.

#### 9. Tidy data set output to text file

write.table is used to output the tidy data set to text file with name tidyData.txt.




