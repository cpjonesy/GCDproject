## Getting and Cleaning Data Project

This project contains one script and two documents:

- *run_analysis.R*
- *CodeBook.MD* (contains description of the dataset and the transformations performed in the script above)
- *README.MD* (this document)

With the unzipped raw data in your working directory, *run_analysis.R* writes *tidyData.txt* to your working directory:

* The dataset compiles the training and test data together, using *features.txt* to select the appropriate columns (mean and SD), and *subject_train.txt* and *subject_test.txt* to append subject data.
* The dataset is then re-cast using the *reshape2* package.
* Each observation is the mean of the feature for the specified subject performing the specified activity. 
* There are 30 subjects and 6 named activities, so this gives 180 rows in the dataset.



