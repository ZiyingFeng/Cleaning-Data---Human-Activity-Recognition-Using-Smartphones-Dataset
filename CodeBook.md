## CodeBook
<p> *test_set*: Table from X_test.txt </p>
<p> train_set: Table from X_train.txt </p>
<p> data: Combined test_set and train_set </p>
<p> feature: Table from features.txt </p>
<p> feature_mean_std: The indices of rows that match "mean" or "std" </p>
<p> data2: Extracts only the measurements on the mean and standard deviation for each measurement, and store the data set into data2 </p>
<p> subject_test: Table from subject_test.txt </p>
<p> subject_train: Table from subject_train.txt </p>
<p> subject: Combined subject_test and subject_train </p>
<p> activity_label_test: Table from y_test.txt, the labels of the test set </p>
<p> activity_label_train: Table from y_train.txt, the labels of the train set </p>
<p> activity: Combined activity_label_test and activity_label_train </p>
<p> data3: Bind the subject column (2nd column) and the activity column (1st column) to the data2, and store it in data3 </p>
<p> activity_labels: Table from activity_labels.txt </p>
<p> name: Variable names of data3 </p>
<p> tidy_data_set: Independent tidy data set with the average of each variable for each activity and each subject </p>
