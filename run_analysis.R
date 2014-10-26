# run_analysis.R
# Script for Coursera Getting & Cleaning Data course - Course Project
# Peter J Dodge. 24th October 2014.
#
# Project requirements:
#   1. Merge the training and the test sets to create one data set.
#   2. Extract only the measurements on the mean and standard deviation for each measurement.
#   3. Use descriptive activity names to name the activities in the data set.
#   4. Appropriately label the data set with descriptive variable names.
#   5. From the data set in step 4, create a second, independent tidy data set with the
#        average of each variable for each activity and each subject.
#
# Initalise section. Load dplyr package and create variables for dirs/files.
library(dplyr)
mainDir <- "C:/Users/Peter/Documents/Git/Get-Data/UCI HAR Dataset"
testDir <- "test"
trainDir <- "train"
comDir <- "all"                     # combined data
fcolumn_names <- "features.txt"     # full column name list
ftrain_data <- "X_train.txt"        # training measurment file. 561 x 7352.
ftrain_subs <- "subject_train.txt"  # training subjects file. 21 subjects.
ftrain_acts <- "y_train.txt"        # training activities file. Splits subjects into 6 activities.
ftest_data <- "X_test.txt"          # test measurment file. 561 x 2947.
ftest_subs <- "subject_test.txt"    # test subjects file. 9 subjects.
ftest_acts <- "y_test.txt"          # test activities file. Splits each subject into 6 activities.
ftidy <- "tidydata.txt"             # final output file for completed tidy data.
if (file.exists(comDir)){
    setwd(file.path(mainDir))
} else {
    dir.create(file.path(mainDir, comDir))
    setwd(file.path(mainDir))
}
## Load and set column names
cols <- read.table(fcolumn_names, stringsAsFactors = FALSE)
col.names <- cols[,2]               # vector of all column names

# Step 1. Merge data sets
#         I chose to add column names in this step and select the mean/standard deviation columns.

# Load training files and combine into one dataframe 'train'
dfs <- read.table(file.path(trainDir, ftrain_subs), col.names = "subject")
dfa <- read.table(file.path(trainDir, ftrain_acts), col.names = "activity")
dfd <- read.table(file.path(trainDir, ftrain_data), stringsAsFactors = FALSE, col.names = col.names)
dfd <- select(dfd, matches("mean|std")) # select columns which have 'mean' and 'std' in the name.
train <- cbind(dfs, dfa)                # subjects, activities
train <- cbind(train, dfd)              # subjects, activities, data. 7352 x 88.
rm(dfs, dfa, dfd)                       # will be overwritten, but to be tidy let's delete.

# Load test files and combine into one dataframe 'test'
dfs <- read.table(file.path(testDir, ftest_subs), col.names = "subject")
dfa <- read.table(file.path(testDir, ftest_acts), col.names = "activity")
dfd <- read.table(file.path(testDir, ftest_data), stringsAsFactors = FALSE, col.names = col.names)
dfd <- select(dfd, matches("mean|std")) # select columns which have 'mean' and 'std' in the name.
test <- cbind(dfs, dfa)                 # subjects, activities
test <- cbind(test, dfd)                # subjects, activities, data. 2947 x 88.
rm(dfs, dfa, dfd)                       # remove temp dataframes
# ..and combine train and test data sets into one dataframe 'all'
all <- rbind(train, test)               # 10299 x 88.
# rm(train, test)                       # can remove our separate dataframes.

# Step 2. Extract the mean and standard deviation columns.
#         As part of Step 1, we selected only the mean and standard deviation columns.
#         This reduced the dataframe columns from 561 to 86.

# Step 3. Not really necessary, but lets choose the following for activity names.
#         This order is from the data description and corresponds to the numbers
#         1 to 6 in the 'activity' column. Use dataframe so that we can merge it later.
activities <- data.frame(actId=c(1:6),
                         activity=c("1.walking",
                                    "2.walking_upstairs",
                                    "3.walking_downstairs",
                                    "4.sitting",
                                    "5.standing",
                                    "6.laying"),
                         stringsAsFactors=FALSE)

# Step 4. As part of Step 1 above, we chose to replace the default read.table column names (V1, etc)
#          with the actual column names in the data set documentation (features.txt file).
#          R replaces some invalid column name characters with '.', but the name is meaningful.

# Step 5. Produce an average of each variable for each activity and each subject.
#         Easier to use the dplyr group_by and summarise_each commands for this.
all <- tbl_df(all) # to dplyr table
by_sa <- group_by(all, subject, activity)   # group by subject and activity
by_sa <- summarise_each(by_sa, funs(mean))  # produce mean for each variable. 180 x 88.
# switch activity column from numeric 1:6 to activity names.
mydf <- merge(x=activities, y=by_sa, by.x="actId", by.y="activity", all.y=TRUE)[,-c(1)]
mydf <- tbl_df(mydf)
mydf <- mydf %>%
        select(subject, activity, tBodyAcc.mean...X:angle.Z.gravityMean.) %>% # reorder columns
        arrange(subject, activity) 
write.table(mydf, file.path(comDir, ftidy), row.names = FALSE) # write the tidy data to folder/file.
# end of script