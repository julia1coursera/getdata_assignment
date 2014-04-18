## This script assembles pre-processed sensor data (accelerometer and
## gyroscope) measured while volunteer subjects carried out various 
## activities (walking, sitting, standing, etc). The data source
## is desribed in CodeBook.md
## This script prepares two tidy data files:
## 1. selected sensor values for all subjects and all activities
## 2. average values calculated from 1 for all all subjects and 
## all activities
## additional detail provided in README.md and CodeBook.md

## Before running this script:
##    extract zip archive (see README.md) to your working directory
##    update workDir (code below) to reflect to your directory structure 

# read data files needed for this analysis task
    workDir <- file.path( "C:", "jdocs", "rwork", "UCI HAR Dataset")
    activities <- read.table(file.path(workDir, "activity_labels.txt"),colClasses = c("integer", "character"))
    features <- read.table(file.path(workDir, "features.txt"),colClasses = c("integer", "character"))
    datatest <- read.table(file.path(workDir, "test", "X_test.txt"),colClasses = "numeric")
    subjectstest <- read.table(file.path(workDir, "test", "subject_test.txt"),colClasses = "integer")
    activitytest <- read.table(file.path(workDir, "test", "y_test.txt"),colClasses = "integer")
    datatrain <- read.table(file.path(workDir, "train", "X_train.txt"),colClasses = "numeric")
    subjectstrain <- read.table(file.path(workDir, "train", "subject_train.txt"),colClasses = "integer")
    activitytrain <- read.table(file.path(workDir, "train", "y_train.txt"),colClasses = "integer")

# identify measurement features required for this analysis
    chars1 <- "mean()"  #mean values
    chars2 <- "std()"   #std dev values
    featureselect <- sort(c(grep(chars1, features$V2), grep(chars2, features$V2)))

# extract subsets of required features from test and train data
    datatest.sel <- datatest[,featureselect]
    datatrain.sel <- datatrain[,featureselect]

# append subsets, add columns for subjects and activities
    data.sel.all <-  rbind(datatrain.sel,datatest.sel)
    subjects.all <-  rbind(subjectstrain,subjectstest)
    activity.all <-  rbind(activitytrain,activitytest)
    dataselect <- cbind(subjects.all, activity.all, data.sel.all)

# insert descriptive names to replace code numbers 
    selfeaturename <- features$V2[featureselect]
    cleanfeaturename <- gsub("[[:punct:]]", "", selfeaturename)
    names(dataselect) <- c("subject", "activity", cleanfeaturename)
        for (i in (1:6)){
        dataselect$activity[dataselect$activity == i] <- activities$V2[activities$V1 == i]
        } 

# write tidy data file 1
    write.table(dataselect, "dataselect_tidy.csv", sep = ",") 

# calculate average for each variable for each activity and subject
    library(doBy)
    which(is.na(dataselect)) #check for NAs
    allmeans <- summaryBy(.~ subject + activity, data = dataselect, FUN = mean)
    # write tidy data file  2
    write.table(allmeans, "dataselect_means_tidy.txt", sep = ",")
 
## end of script run_analysis.R




 

