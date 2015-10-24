library(dplyr)
library(data.table)

# 0.Download and unzip data
targeturl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url=targeturl, destfile="../data.zip", method="curl")
unzip("../data.zip", exdir="../")

# 1.Merges the training and the test sets to create one data set.
# combine x files
xtrain <- read.table("../UCI HAR Dataset/train/X_train.txt")
xtest <- read.table("../UCI HAR Dataset/test/X_test.txt")
xall <- rbind(xtrain, xtest)
# combine y files
ytrain <- read.table("../UCI HAR Dataset/train/y_train.txt")
ytest <- read.table("../UCI HAR Dataset/test/y_test.txt")
yall <- rbind(ytrain, ytest)
# combine subject files
subtrain <- read.table("../UCI HAR Dataset/train/subject_train.txt")
subtest <- read.table("../UCI HAR Dataset/test/subject_test.txt")
suball <- rbind(subtrain, subtest)
# combine all by column
dataall <- cbind(suball, yall, xall)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
filefeatrues <- read.table("../UCI HAR Dataset/features.txt")
features <- filefeatrues[,2] 
labelall <- c("subject","activity", as.character(features))
# find the columns corresponding to mean or std
mean1 <- grepl(".*mean.*", labelall)
mean2 <- grepl(".*Mean.*", labelall)
std <- grepl(".*std.*", labelall)
labelkeep <- mean1 | mean2 | std
indexkeep <- which(labelkeep)
# add the 1st and 2nd columns (subject and activity)
indexkeep2 <- c(1, 2, indexkeep)
# the data to be kept
datakeep <- dataall[, indexkeep2]

# 3.Uses descriptive activity names to name the activities in the data set
activities <- read.table("../UCI HAR Dataset/activity_labels.txt")
datakeep2 <- mutate(datakeep, V1.1=factor(V1.1%%7, labels=activities[,2]))

# 4.Appropriately labels the data set with descriptive variable names. 
labelkeepnames <- labelall[indexkeep2]
names(datakeep2) <- labelkeepnames

# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
write.table(datakeep2,"tidydata.txt", quote=FALSE, row.names=FALSE)