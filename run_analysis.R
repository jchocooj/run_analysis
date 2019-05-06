
#------Load of RAW data set-------i
setwd("E:/R/Getting and Cleanning data/UCI HAR Dataset/")
library(readr)
library(dplyr)
library(tidyr)
library(plyr)

#--Load de Headers from "features.txt" file
features <- as.data.frame(read.table("features.txt", quote="\"", comment.char=""))
activity_labels <- read.table("activity_labels.txt", quote="\"", comment.char="")

#--Load de Test data
subject_test <- read.table("test/subject_test.txt", quote="\"", comment.char="")
X_test <- read.table("test/X_test.txt", quote="\"", comment.char="")
y_test <- read.table("test/y_test.txt", quote="\"", comment.char="")

#--Load the Trainning data
subject_train <- read.table("train/subject_train.txt", quote="\"", comment.char="")
X_train <- read.table("train/X_train.txt", quote="\"", comment.char="")
y_train <- read.table("train/y_train.txt", quote="\"", comment.char="")

#--Cleaning data
features <- as.data.frame(t(features)) #Transpose data in columns to rows
features <- slice(features, 2:2) #select only de row contain names
features <- t(features)


# 1  --Merging and combining data frames
subject <- rbind(subject_test, subject_train)
x <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)
colnames(x) <- c(features)   #4.Appropriately labels the data set with descriptive variable names.
colnames(y) <- c("Activity")
colnames(subject) <- c("Subject")
colnames(activity_labels) <- c("Activity","Act_Descrip")
data <- cbind(subject,y,x)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
measurements <- data[,grepl("Subject|Activ|mean()|std()", colnames(data))]

#3.Uses descriptive activity names to name the activities in the data set
#library(plyr)
measurements <- join(measurements, activity_labels, by= "Activity", type= "left", match= "first")
measurements<- measurements[,c(2, 82, 3:81)]

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
avg_act_subj <- measurements[,c(3:81)]
avg_act_subj <- measurements%>%group_by(Subject, Act_Descrip)%>%
                    summarise_each(funs(mean))

rm(x, y, activity_labels , subject ,subject_test, subject_train, features, X_train, y_train, X_test, y_test)  
