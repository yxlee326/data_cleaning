
# Getting and Cleaning Data Project

This repo is an exercise in getting and cleaning data. The data used in this project is from the UCI Machine Learning Repository. The data is from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

And the assignment is to create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. The end result is shown in the file tidy_dataset.txt.
7. The code book is in the file CodeBook.md.
8. The R script is in the file run_analysis.R.

## How to run the script

1. Download the data source and put into a folder on your local drive. You'll have a UCI HAR Dataset folder.
2. Put run_analysis.R in the parent folder of UCI HAR Dataset. The reading path has been set in the script.
3. Run source("run_analysis.R"), then it will generate a new file tidy_dataset.txt in the same level of the script.
4. The tidy_dataset.txt is the tidy data set with the average of each variable for each activity and each subject.

## Information about the variables can be found in CodeBook.md.