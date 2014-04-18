CodeBook for 'Getting and Cleaning Data' Course Project
=======================================================

Original data source
-------------------
The Human Activity Recognition Using Smartphones Dataset Version 1.0 (UCI HAR Dataset) was provided 
courtesy of the original authors, see reference [1] below.
The UCI HAR Dataset comprised output from experiments conducted with 30 volunteers (age 19-48 years).
Each person was wearing a smartphone on the waist. Smartphone sensors (accelerometer and 
gyroscope) recorded data while each volunteer carried out six different activities: WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
The sensor data was pre-processed as described in reference [1] below.
The pre-processed data were randomly parttioned such that training data was derived from 70% of 
volunteers and test data were derived from 30% of volunteers.

Data used in Course Project
---------------------------
The UCI HAR Dataset dataset was downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
All files were extracted from the directories /train and /test in the zip archive.
Inertial Signals data were not used.

Analysis procedure conducted in R
---------------------------------
The script run_analysis.R comprised the following steps:
	+ read data files from working directory
	+ identify measurement features specified for this analysis (mean and std)
	+ merge subjects, activities and training and test data 
	+ replace numeric codes with descriptive names
	+ calculate average for each variable for each activity and subject
	+ output a tidy data set
	
Reference
---------
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity 
Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International 
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
