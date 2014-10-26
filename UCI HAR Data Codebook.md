---
title: "UCI-HAR Analysis Codebook"
author: "Peter J Dodge"
date: "Sunday, October 26, 2014"
output: html_document
---

Supplimentary codebook to describe Getting and Cleaning Data course project variables.  
UCI HAR Data provided (see readme for location) has the codebook: features_info.txt  

The summary output file (tidydata.txt) produced for project has 88 variables.
The 561 original data variables were reduced to 86. The project requirement was to choose the 'mean' and 'standard deviation' variables and this was done by selecting variables with the names 'mean' and 'std' in the title. these text strings are defined in the original data codebook as follows:

'''
The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
...
'''
When filtered (selected) for these names, the resulting number of variables was 86.
The project required the addition of the 'subject' and 'activity' variables, resulting in a total number of 88 variables.
The 86 measurement variables used were mapped into valid 'R' characters, thus '(', ')' and '-' were changed to the '.' character. This does not significantly change the readability and the mapping of all variables from the original data set are described below.
The 88 variables are defined as follows:

**subject** - is the combined 'train' and 'test' data subject number. 30 subjects, c(1:30).
**activity** - is the 6 defined activities that each subject was measured doing. 6 activities were originally defined as c(1:6), but mapped by this project into 6 text descriptions ("1.walking", "2.walking_upstairs", "3.walking_downstairs", "4.sitting", "5.standing", "6.laying").
**tBodyAcc.mean...X**  - maps to the original variable: 1 tBodyAcc-mean()-X
**tBodyAcc.mean...Y**  - maps to the original variable: 2 tBodyAcc-mean()-Y
**tBodyAcc.mean...Z**  - maps to the original variable: 3 tBodyAcc-mean()-Z
**tBodyAcc.std...X**  - maps to the original variable: 4 tBodyAcc-std()-X
**tBodyAcc.std...Y**  - maps to the original variable: 5 tBodyAcc-std()-Y
**tBodyAcc.std...Z**  - maps to the original variable: 6 tBodyAcc-std()-Z
**tGravityAcc.mean...X**  - maps to the original variable: 41 tGravityAcc-mean()-X
**tGravityAcc.mean...Y**  - maps to the original variable: 42 tGravityAcc-mean()-Y
**tGravityAcc.mean...Z**  - maps to the original variable: 43 tGravityAcc-mean()-Z
**tGravityAcc.std...X**  - maps to the original variable: 44 tGravityAcc-std()-X
**tGravityAcc.std...Y**  - maps to the original variable: 45 tGravityAcc-std()-Y
**tGravityAcc.std...Z**  - maps to the original variable: 46 tGravityAcc-std()-Z
**tBodyAccJerk.mean...X**  - maps to the original variable: 81 tBodyAccJerk-mean()-X
**tBodyAccJerk.mean...Y**  - maps to the original variable: 82 tBodyAccJerk-mean()-Y
**tBodyAccJerk.mean...Z**  - maps to the original variable: 83 tBodyAccJerk-mean()-Z
**tBodyAccJerk.std...X**  - maps to the original variable: 84 tBodyAccJerk-std()-X
**tBodyAccJerk.std...Y**  - maps to the original variable: 85 tBodyAccJerk-std()-Y
**tBodyAccJerk.std...Z**  - maps to the original variable: 86 tBodyAccJerk-std()-Z
**tBodyGyro.mean...X**  - maps to the original variable: 121 tBodyGyro-mean()-X
**tBodyGyro.mean...Y**  - maps to the original variable: 122 tBodyGyro-mean()-Y
**tBodyGyro.mean...Z**  - maps to the original variable: 123 tBodyGyro-mean()-Z
**tBodyGyro.std...X**  - maps to the original variable: 124 tBodyGyro-std()-X
**tBodyGyro.std...Y**  - maps to the original variable: 125 tBodyGyro-std()-Y
**tBodyGyro.std...Z**  - maps to the original variable: 126 tBodyGyro-std()-Z
**tBodyGyroJerk.mean...X**  - maps to the original variable: 161 tBodyGyroJerk-mean()-X
**tBodyGyroJerk.mean...Y**  - maps to the original variable: 162 tBodyGyroJerk-mean()-Y
**tBodyGyroJerk.mean...Z**  - maps to the original variable: 163 tBodyGyroJerk-mean()-Z
**tBodyGyroJerk.std...X**  - maps to the original variable: 164 tBodyGyroJerk-std()-X
**tBodyGyroJerk.std...Y**  - maps to the original variable: 165 tBodyGyroJerk-std()-Y
**tBodyGyroJerk.std...Z**  - maps to the original variable: 166 tBodyGyroJerk-std()-Z
**tBodyAccMag.mean..**  - maps to the original variable: 201 tBodyAccMag-mean()
**tBodyAccMag.std..**  - maps to the original variable: 202 tBodyAccMag-std()
**tGravityAccMag.mean..**  - maps to the original variable: 214 tGravityAccMag-mean()
**tGravityAccMag.std..**  - maps to the original variable: 215 tGravityAccMag-std()
**tBodyAccJerkMag.mean..**  - maps to the original variable: 227 tBodyAccJerkMag-mean()
**tBodyAccJerkMag.std..**  - maps to the original variable: 228 tBodyAccJerkMag-std()
**tBodyGyroMag.mean..**  - maps to the original variable: 240 tBodyGyroMag-mean()
**tBodyGyroMag.std..**  - maps to the original variable: 241 tBodyGyroMag-std()
**tBodyGyroJerkMag.mean..**  - maps to the original variable: 253 tBodyGyroJerkMag-mean()
**tBodyGyroJerkMag.std..**  - maps to the original variable: 254 tBodyGyroJerkMag-std()
**fBodyAcc.mean...X**  - maps to the original variable: 266 fBodyAcc-mean()-X
**fBodyAcc.mean...Y**  - maps to the original variable: 267 fBodyAcc-mean()-Y
**fBodyAcc.mean...Z**  - maps to the original variable: 268 fBodyAcc-mean()-Z
**fBodyAcc.std...X**  - maps to the original variable: 269 fBodyAcc-std()-X
**fBodyAcc.std...Y**  - maps to the original variable: 270 fBodyAcc-std()-Y
**fBodyAcc.std...Z**  - maps to the original variable: 271 fBodyAcc-std()-Z
**fBodyAcc.meanFreq...X**  - maps to the original variable: 294 fBodyAcc-meanFreq()-X
**fBodyAcc.meanFreq...Y**  - maps to the original variable: 295 fBodyAcc-meanFreq()-Y
**fBodyAcc.meanFreq...Z**  - maps to the original variable: 296 fBodyAcc-meanFreq()-Z
**fBodyAccJerk.mean...X**  - maps to the original variable: 345 fBodyAccJerk-mean()-X
**fBodyAccJerk.mean...Y**  - maps to the original variable: 346 fBodyAccJerk-mean()-Y
**fBodyAccJerk.mean...Z**  - maps to the original variable: 347 fBodyAccJerk-mean()-Z
**fBodyAccJerk.std...X**  - maps to the original variable: 348 fBodyAccJerk-std()-X
**fBodyAccJerk.std...Y**  - maps to the original variable: 349 fBodyAccJerk-std()-Y
**fBodyAccJerk.std...Z**  - maps to the original variable: 350 fBodyAccJerk-std()-Z
**fBodyAccJerk.meanFreq...X**  - maps to the original variable: 373 fBodyAccJerk-meanFreq()-X
**fBodyAccJerk.meanFreq...Y**  - maps to the original variable: 374 fBodyAccJerk-meanFreq()-Y
**fBodyAccJerk.meanFreq...Z**  - maps to the original variable: 375 fBodyAccJerk-meanFreq()-Z
**fBodyGyro.mean...X**  - maps to the original variable: 424 fBodyGyro-mean()-X
**fBodyGyro.mean...Y**  - maps to the original variable: 425 fBodyGyro-mean()-Y
**fBodyGyro.mean...Z**  - maps to the original variable: 426 fBodyGyro-mean()-Z
**fBodyGyro.std...X**  - maps to the original variable: 427 fBodyGyro-std()-X
**fBodyGyro.std...Y**  - maps to the original variable: 428 fBodyGyro-std()-Y
**fBodyGyro.std...Z**  - maps to the original variable: 429 fBodyGyro-std()-Z
**fBodyGyro.meanFreq...X**  - maps to the original variable: 452 fBodyGyro-meanFreq()-X
**fBodyGyro.meanFreq...Y**  - maps to the original variable: 453 fBodyGyro-meanFreq()-Y
**fBodyGyro.meanFreq...Z**  - maps to the original variable: 454 fBodyGyro-meanFreq()-Z
**fBodyAccMag.mean..**  - maps to the original variable: 503 fBodyAccMag-mean()
**fBodyAccMag.std..**  - maps to the original variable: 504 fBodyAccMag-std()
**fBodyAccMag.meanFreq..**  - maps to the original variable: 513 fBodyAccMag-meanFreq()
**fBodyBodyAccJerkMag.mean..**  - maps to the original variable: 516 fBodyBodyAccJerkMag-mean()
**fBodyBodyAccJerkMag.std..**  - maps to the original variable: 517 fBodyBodyAccJerkMag-std()
**fBodyBodyAccJerkMag.meanFreq..**  - maps to the original variable: 526 fBodyBodyAccJerkMag-meanFreq()
**fBodyBodyGyroMag.mean..**  - maps to the original variable: 529 fBodyBodyGyroMag-mean()
**fBodyBodyGyroMag.std..**  - maps to the original variable: 530 fBodyBodyGyroMag-std()
**fBodyBodyGyroMag.meanFreq..**  - maps to the original variable: 539 fBodyBodyGyroMag-meanFreq()
**fBodyBodyGyroJerkMag.mean..**  - maps to the original variable: 542 fBodyBodyGyroJerkMag-mean()
**fBodyBodyGyroJerkMag.std..**  - maps to the original variable: 543 fBodyBodyGyroJerkMag-std()
**fBodyBodyGyroJerkMag.meanFreq..**  - maps to the original variable: 552 fBodyBodyGyroJerkMag-meanFreq()
**angle.tBodyAccMean.gravity.**  - maps to the original variable: 555 angle(tBodyAccMean,gravity)
**angle.tBodyAccJerkMean..gravityMean.**  - maps to the original variable: 556 angle(tBodyAccJerkMean),gravityMean)
**angle.tBodyGyroMean.gravityMean.**  - maps to the original variable: 557 angle(tBodyGyroMean,gravityMean)
**angle.tBodyGyroJerkMean.gravityMean.**  - maps to the original variable: 558 angle(tBodyGyroJerkMean,gravityMean)
**angle.X.gravityMean.**  - maps to the original variable: 559 angle(X,gravityMean)
**angle.Y.gravityMean.**  - maps to the original variable: 560 angle(Y,gravityMean)
**angle.Z.gravityMean.**  - maps to the original variable: 561 angle(Z,gravityMean)

