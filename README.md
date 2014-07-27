**README**
========================================================
In order to complete the project, the following files were created:

**tidyDS.txt** (attached at Coursera site) - a tidy dataset obtained by cleaning up and extracting a piece of data from Human Activity Recognition Using Smartphones Dataset available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The original dataset contains the data for 30 volunteers doing 6 activities while wearing Galaxy SII smartphone on their waist. The total number of measures coming from this experiment is 561.The tidy dataset contains the means only for mean and standard deviation measures from the original dataset(79, freqmean included), calculated for each combination of subject and actitity (180).
The dataset is tidy as it satisfies the criteria of tidy datasets from Jeff Leek's [notes](https://github.com/jtleek/datasharing): each variable is in one column, each observation is is a different row, etc. 
To read a dataset correclty, you would use read.table command. The data also seems nice if opening in Notepad++ editor.
For more information on how the tidy dataset was obtained and what variables it has, please refer to *Code Book*.

**run_analysis.R** - the script for performing the analysis. To get the script run, you need to put a zip archive in your working directory and to change all paths to the ones with your working directory.
The script contains the comments on what each command does.

**CodeBook.md** - this is a Code Book which contains an extensive tidy dataset description, including the information about variables forming this dataset.