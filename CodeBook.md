## CodeBook
**_test_set_**: Table from X_test.txt </p> 
**_train_set_**: Table from X_train.txt
**_data_**: Combined test_set and train_set
**_feature_**: Table from features.txt
**_feature_mean_std_**: The indices of rows that match "mean" or "std"
**_data2_**: Extracts only the measurements on the mean and standard deviation for each measurement, and store the data set into data2 
**_subject_test_**: Table from subject_test.txt 
**_subject_train_**: Table from subject_train.txt 
**_subject_**: Combined subject_test and subject_train 
**_activity_label_test_**: Table from y_test.txt, the labels of the test set
**_activity_label_train_**: Table from y_train.txt, the labels of the train set 
**_activity_**: Combined activity_label_test and activity_label_train
**_data3_**: Bind the subject column (2nd column) and the activity column (1st column) to the data2, and store it in data3
**_activity_labels_**: Table from activity_labels.txt 
**_name_**: Variable names of data3 
**_tidy_data_set_**: Independent tidy data set with the average of each variable for each activity and each subject 
