# run_analysis
Getting and Cleaning Data Course Project
#COURSERA- Getting and Cleaning Data Project,  by: Juan Arnoldo Chocooj Iten

#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement.
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names.
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

contains 3 Tidy data sets:

1) data -> all data from x and y test and train rows. 10,299 rows and 563 variables.
2) measurements -> DF data, selecting only mean and std measures, combine with subject variable. 10,299 roes and 81 variables.
3) avg_act_subj -> data, grouping by subject and activity by average.
