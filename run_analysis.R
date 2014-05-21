## required packages
if (!require("reshape2")) {
   install.packages("reshape2")
   require("reshape2")
}

## read in the feature names
features <- read.table("./features.txt", colClasses=c("NULL", "character"))[[1]]
selection <- grepl("(mean|std)\\(\\)", features)
columns <- matrix("NULL", length(features))
columns[selection] <- "numeric"

## read in training data
train.data <- read.table("./train/X_train.txt",
        colClasses = columns)
train.labels <- read.table("./train/y_train.txt")
train.subject <- read.table("./train/subject_train.txt")

## read in test data
test.data <- read.table("./test/X_test.txt", 
        colClasses = columns)
test.labels <- read.table("./test/y_test.txt")
test.subject <- read.table("./test/subject_test.txt")

#compile test and training data
tidy.data <- rbind(train.data, test.data)
names(tidy.data) <- features[selection]

#add activity and subject labels
activity.labels <- read.table("./activity_labels.txt", 
        colClasses = c("NULL", "character"))[[1]]
labels.compile <- rbind(train.labels, test.labels)
tidy.data <- cbind(sapply(labels.compile, function(x) activity.labels[x]),
        tidy.data)
subject <- rbind(train.subject, test.subject)
tidy.data <- cbind(subject, tidy.data)

## rename subject and activity columns
names(tidy.data)[names(tidy.data)=="V1"] <- c("Subject", "Activity")

## turn subject ID into a factor
tidy.data[,1] <- as.factor(tidy.data[,1])

## reshape the data so the mean can be combined to each combination of the
## two id variables (Subject and Activity)
melted.data <- melt(tidy.data, id=c("Subject","Activity"))
mean.data <- dcast(melted.data, formula = Subject + Activity ~ variable, mean)

## write the two tidy data sets into your working directory
write.table(mean.data, "./tidyData.txt")





