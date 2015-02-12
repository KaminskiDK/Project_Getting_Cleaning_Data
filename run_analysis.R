## Read in feature list
features <- features <- read.table("UCI HAR Dataset/features.txt",stringsAsFactors = FALSE) 
## Load in activity levels
activity_labels <- read.table("UCI HAR Dataset//activity_labels.txt",stringsAsFactors = FALSE)

## Read in collected data for both training and test set
X_train <- read.table("UCI HAR Dataset//train//X_train.txt",stringsAsFactors = FALSE)
X_test <- read.table("UCI HAR Dataset//test//X_test.txt",stringsAsFactors = FALSE)
## Bind the rows of the two sets together to form one 
X_all <- rbind(X_train,X_test)
## Use the second column of the feature data to provide column names
names(X_all) <- features[,2]

## Read in activity data for both training and test set
y_train <- read.table("UCI HAR Dataset//train//y_train.txt",stringsAsFactors = FALSE)
y_test <- read.table("UCI HAR Dataset//test//y_test.txt",stringsAsFactors = FALSE)
## Bind the rows of the two sets together to form one
y_all <- rbind(y_train,y_test)
## Convert the activity number to a descriptive label using activity labels
y_all_labels <- data.frame(activity_labels[y_all[,1],2],stringsAsFactors=FALSE)
## Provide the descriptive label "Activity"
names(y_all_labels) <- "Activity"

## Read in subject data for both training and test set
subject_train <- read.table("UCI HAR Dataset//train/subject_train.txt",stringsAsFactors = FALSE)
subject_test <- read.table("UCI HAR Dataset//test//subject_test.txt",stringsAsFactors = FALSE)
## Bind the rows of the two sets together to form one
subject_all <- rbind(subject_train,subject_test)
## Provide the descriptive label "Subject"
names(subject_all) <- "Subject"

## Bind subject and activity data as columns to the front of collected data 
data <- cbind(subject_all,y_all_labels,X_all)

## Select columns which correspond to 'mean' or 'standard deviation'
## Note we retain subject and activity lables
column_selection <- grepl("[mM][eE][aA][nN]|[sS][tT][dD]|Subject|Activity",names(data))
data_mean_std <- data[,column_selection]

## Calculate the average of each variable for each subject and each activity
means <- data_mean_std %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))

## Write new wide tidy data set to text file
write.table(means,file="data_summary.txt",row.names=FALSE)