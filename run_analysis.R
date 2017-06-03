library(dplyr)

# Read the test set into test_set and the training set into train_set
test_set <- read.table("./test/X_test.txt", header = FALSE, stringsAsFactors = FALSE)
train_set <- read.table("./train/X_train.txt", header = FALSE, stringsAsFactors = FALSE)

# 1. Merges the training (train_set) and the test sets (test_set) to create one data set (data).
data <- rbind(test_set, train_set)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement, and store the data set into data2.
feature <- read.table("features.txt", header = FALSE, stringsAsFactors = FALSE)
feature_mean_std <- grep("mean|std", feature[,2])
data2 <- data[,feature_mean_std]


# Label the data set with variable names (from the feature) (column names)
names(data) <- feature[,2]
data2 <- data[,feature_mean_std] # regenerate data2 (this one with variable names)

# Read and bind the test subject and the train subject
subject_test <- read.table("./test/subject_test.txt", header = FALSE, stringsAsFactors = FALSE)
subject_train <- read.table("./train/subject_train.txt", header = FALSE, stringsAsFactors = FALSE)
subject <- rbind(subject_test, subject_train)

# Read and bind the test labels and the train labels
activity_label_test <- read.table("./test/y_test.txt", header = FALSE, stringsAsFactors = FALSE)
activity_label_train <- read.table("./train/y_train.txt", header = FALSE, stringsAsFactors = FALSE)
activity <- rbind(activity_label_test, activity_label_train)
#activity_label_test_des <- factor(activity_label_test[,1],labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
#activity_label_train_des <- factor(activity_label_train[,1],labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

# Bind the subject column and the activity column to the data2, and store it in data3
data3 <- cbind(subject, data2)
data3 <- cbind(activity, data3)
names(data3)[1] <- "activity"
names(data3)[2] <- "subject"


# 3. Uses descriptive activity names to name the activities in the data set.
# Convert the label number into the descriptive label
activity_labels <- read.table("./activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)
data3$activity <- activity_labels[data3$activity, 2]

# 4. Appropriately labels the data set with descriptive variable names.
name <- names(data3)
name <- gsub("^t", "time", name)
name <- gsub("^f", "freq", name)
name <- gsub("\\(\\)", "", name)
# \\(\\) escape brackets
name <- names(data3) 


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data_set <- aggregate(data3[,3:ncol(data3)], by = data3[,1:2], FUN = mean)
write.table(tidy_data_set, file = "tidy_data_set.txt", row.names = FALSE)
write.csv(tidy_data_set, file = "tidy_data_set.csv", row.names = FALSE)



