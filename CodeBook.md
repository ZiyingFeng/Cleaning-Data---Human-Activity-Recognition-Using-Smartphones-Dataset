## CodeBook
<p> test_set: Table from X_test.txt </p>
<p> train_set: Table from X_train.txt </p>
<p> data: Combined test_set and train_set </p>
<p> feature: Table from features.txt </p>
<p> feature_mean_std: The indices of rows that match "mean" or "std" </p>
<p> data2: Extracts only the measurements on the mean and standard deviation for each measurement, and store the data set into data2 </p>
<p> activity_label_test: Table from y_test.txt, the labels of the test set </p>
<p> activity_label_train: Table from y_train.txt, the labels of the train set </p>
<p> activity_label_test_des: Parse the number in the test labels according to the label descriptions in activity_labels.txt, and turn them into factors </p>
<p> activity_label_train_des: Parse the number in the train labels according to the label descriptions in activity_labels.txt, and turn them into factors </p>
<p> activity_label_des: Combine the activity_label_test_des and the activity_label_train </p>
<p> data3: Add the descriptive activity names to the first column (row names), and store the data in data3 </p>
<p> tidy_data_set: Independent tidy data set with the average of each variable for each activity and each subject </p>
