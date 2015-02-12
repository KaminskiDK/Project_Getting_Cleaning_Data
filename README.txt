The enclosed script “run_analysis.R” manipulates the ‘Human Activity Recognition Using Smartphones Dataset’. This is available, along with full experimental information, here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Data is provided for 30 subjects across 6 activities (walking, walking upstairs, walking downstairs, sitting, standing and laying). The script combines data from the training and test sets. It provides an average for each experimental variable representing a mean or standard deviation for each subject performing each activity. Full details of the variables are given in the file ‘CodeBook.txt’.

Step by step explanation of the script is provided within “run_analysis.R”. As a summary, what the script does is: 

1. Read in the feature list
2. Read in the activity labels
3. Read in the collected data for both the training and test sets
4. Combine these using ‘rbind’
5. Name the columns using the provided features file
6. Read in activity data for both training and test set
7. Bind the rows of the two sets together to form one
8. Convert the activity number to a descriptive label using activity labels
9. Provide the descriptive label "Activity"
10.Read in subject data for both training and test set
11.Bind the rows of the two sets together to form one
12.Provide the descriptive label "Subject"
13.Bind subject and activity data as columns to the front of collected data
14.Select columns which correspond to 'mean’, 'standard deviation’, activity or subject
15.Calculate the average of each variable for each subject and each activity
16.Write new wide tidy data set to text file ‘data_summary.txt’
