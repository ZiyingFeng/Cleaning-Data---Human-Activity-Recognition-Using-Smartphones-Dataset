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

# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# Read the activity labels into activity_label_test, activity_label_train, and parse the number in the label according to the label descriptions in activity_labels.txt
# And turn them into factors
activity_label_test <- read.table("./test/y_test.txt", header = FALSE, stringsAsFactors = FALSE)
activity_label_train <- read.table("./train/y_train.txt", header = FALSE, stringsAsFactors = FALSE)
activity_label_test_des <- factor(activity_label_test[,1],labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
activity_label_train_des <- factor(activity_label_train[,1],labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
# To bind the descriptive labels they need to be the same column name
activity_label_test_des <- as.data.frame(activity_label_test_des)
activity_label_train_des <- as.data.frame(activity_label_train_des)
names(activity_label_train_des) <- "V1"
names(activity_label_test_des) <- "V1"
activity_label_des <- rbind(activity_label_test_des, activity_label_train_des)
# Label the data set with variable names (from the feature) (column names)
names(data) <- feature[,2]
data2 <- data[,feature_mean_std] # regenerate data2 (this one with variable names)
# Add the descriptive activity names to the first column (row names), and store the data in data3
data3 <- cbind(activity_label_des[,1], data2)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data4 <- split(data3, data3[,1])
tidy_data_set <- sapply(data4, function(x) colMeans(x[,2:80]))
# split the data according the activity factors, then apply the colMeans to each group



