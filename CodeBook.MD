## Getting and Cleaning Data Project

###Source Data Info

>##Human Activity Recognition Using Smartphones Dataset

>#####Version 1.0

>#####Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
#####Smartlab - Non Linear Complex Systems Laboratory
#####DITEN - Università degli Studi di Genova.
#####Via Opera Pia 11A, I-16145, Genoa, Italy.
#####activityrecognition@smartlab.ws
#####www.smartlab.ws


>######The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>######The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

Data obtained from the [UCI Machine Learning Repository][1]

###Transformations
1. Features that were not a mean or standard deviation were culled from the dataset using regular expression on *features.txt*.
2. The training and test datasets were merged to create one dataset.
3. The labels for the subjects and the activities they performed (walking, sitting, etc) were applied as separate columns.
4. The dataset was melted using the *reshape2* package using the subject and activity columns as id variables.
5. The datasets was then recast to present the mean of each variable for each activity performed by each subject. 


###Variable Naming
No changes were made to the names of the feature variables. The naming scheme used by the original authors is comprehensive enough. Renaming variables further would require further expanding the length variable names. For help with interpreting the variable names, please see *features_info.txt* in the unzipped raw data.

[1]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones