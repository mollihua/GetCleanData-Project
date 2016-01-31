# GetCleanData-Project

This project is for the Coursera Data Sciece Specialization course: Getting and Cleaning Data.  

The data are collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The goal is to create one R script called run_analysis.R that does the following.  
    1. Merges the training and the test sets to create one data set. 
    2. Extracts only the measurements on the mean and standard deviation for each measurement.  
    3. Uses descriptive activity names to name the activities in the data set.  
    4. Appropriately labels the data set with descriptive variable names.  
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

To test the R script:  
    1. Set the current directory:  
	setwd ("~/Desktop/3.Get_and_Cleaning_Data/project/GetCleanData-Projec")  
    2. Run the R script:
	source ("./run_analysis.R")  

