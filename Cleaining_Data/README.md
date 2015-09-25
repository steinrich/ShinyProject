Producing tidy dataset based on raw data collected via Samsung wearable smartphone
===============================================================================
The aim of this project is to calculate average of each variable for each activity and each subject.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

================================================================================
The dataset includes
1. R code to produce average of each variable for each activity and each subject.
2. A tidy dataset saved in txt format
3. A CodeBook that describes the variables,the data and transformation work

================================================================================
How to run the data analysis?
Run the file run_analysis.R in R;
================================================================================
Data transformation:
Loading data
1. Merges the training (train_table) and the test sets (test_table) to create one data set.
2. Name each variable column according to features names
3. Select the feature measurements with keywords "mean" and "std" in features names
4. Create a subset (data_mean_std) including measurement of "mean" and "std"
5. Use descriptive activity name to name activities by combining the subset with activity name table (data_mean_std_act)
6. Set up a new dataset (by_act_table) to store average data (per activity/per subject/per variable)
7. Use loop to calculate average data and merge into dataset (by_act_table) above
8. Write the merged table into text file ("Getting_and_Cleaning_Data.txt")
================================================================================
How to have a quick check of result produced by code attached?
Run below commands in R:
>table_test<-read.table("Getting_and_Cleaning_Data.txt")
>table_test[1:5,1:5]

Command above shows average number of three variables of Activity-Laying of subject 1-4 
Please refer to CodeBook for detail of the dataset. 