UCI-HAR-Data
============

Getting &amp; Cleaning Data Course Project data anlaysis

This repository contains:
1. the R script (run_analysis.R) to generate the tidy data set (tidydata.txt).
2. the codebook to describe the tidydata.txt file.
3. this README.md file.
4. a sample copy of the tidydata.txt output.

The course project is to take the UCI HAR Data set  (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
and combine/summarise the 'train' and 'test' data sets into one output table (tidydata.txt).

The output data set can be reproduced by copying the run_analysis.R script into a directory which has the UCI data extracted. After unzipping that data it will create 'train' and 'test' folders.
To run the script, you need the R programming language installed, v3 or later and the dplyr package.
The script file should be editied to change the 'mainDir' variable to the local UCI data directory.
When the script is run, it will create a new directory 'all' and place the tidydata.txt summary output file into it.

The file 'features_info.txt' in the UCI HAR Data set is the code book supplied.

