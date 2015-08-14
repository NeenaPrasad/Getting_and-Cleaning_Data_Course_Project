# Getting_and-Cleaning_Data_Course_Project
Course Project for getdata-031 Getting and Cleaning Data


### Objective

The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The following are submitted for evaluation:

1) a tidy data set as described below, 
2) a link to a Github repository with the script for performing the analysis, and 
3) a code book that describes the variables, the data, and the transformations or work performed to clean up the data called CodeBook.md. 


### Problem Description

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


### Method

The script run_analysis.R does the following:

1) Download the data from the url provided and unzip it.
2) Merge the training and the test sets of subject, activity and feature valuess to create one data set.
3) Extracts only the measurements on the mean and standard deviation for each measurement(66 variables, not accounting for mean variables in angle measurements). 
4) Load the activity label info.
5) Activity names in the dataset are named, as character factors based on the activity label info. (eg:- WALKING, STANDING,. etc)
6) The variable names are renamed in detail, ie, prefix t is replaced by time and f by Frequency. Detailed explanation is given in CodeBook.md. 
7) From the data set obtained by the above 4 steps, a second, independent tidy data set is created with the average of each variable for each activity and each subject.