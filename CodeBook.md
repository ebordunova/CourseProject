**Code Book**
========================================================
**Information about a tidy dataset**
The tidy dataset (*tidyDS.txt*) was obtained by cleaning up and extracting a piece of data from Human Activity Recognition Using Smartphones Dataset available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The original dataset contains the data for 30 volunteers doing 6 activities while wearing Galaxy SII smartphone on their waist. The total number of measures coming from this experiment is 561.  
The tidy dataset contains the means only for mean and standard deviation measures from the original dataset(79, freqmean included), calculated for each combination of subject and actitity (180).  

**The operations performed to get a tidy dataset**:
1. Downloading and reading x, y and subject files (for both test and training samples)  
2. Appending features names to x datasets and deleting unnessessary punctuation from the names such as () and "," (for both test and training samples)  
3. Merging x, y and subject files together (for both test and training samples)  
4. Merging test and training samples together  
5. Appending the meaningful(descriptive) activity names to the merged dataset  
6. Extracting only the measurements on mean and standard deviation from the merged dataset (*please note that freqmean were included while angles weren't, so the resulting number of extracted variables is 79*)  
7. Aggregating the extracted dataset by subject and activity and calculating a mean for each variable for each 'subject-activity' combination.  

*The functions used to perform these operation are present and commented in detail in run_analysis.R file*


**Variables description**
The tidy dataset contains 81 variables.  
All measures, except from subjectID and activityID, are means of the corresponding features in the mother dataset so are normalized and bounded within [-1,1] (no units applied).   
Adding 'mean' to the variable names was intentionally ignored to avoid overloading and confisuion. Here is the key on how to read each of 79 measures for which means were calculated (in order of measures' appeacrence in the variables' names).  

*'t' prefix* - time domain signals  
*'f' prefix* - signals after applying a Fast Fourier Transform  
*Body* - body acceleration signals (after using a low pass Butterworth filter with a corner frequency of 0.3 Hz.)  
*Gravity* - gravity acceleration signals (after using a low pass Butterworth filter with a corner frequency of 0.3 Hz.)  
*Acc* - accelerometer signals  
*Gyro* - gyroscope signals  
*Jerk* - Jerk signals were obtained by deriving in time the body linear acceleration and angular velocity  
*Mag* - calculated magnitude for 3-dimentional signals  
*mean* - mean  
*std* - standard deviation  
*X/Y/Z* - axes of signals  

List of variables in the tidy dataset:
**Name**             | **Column**          **Class**       **Meaning**                   **Code**
-------------------- |-----------------|---------------|--------------------------------|--------|
subjectID            |    1               int             Volunteer ID                    1-30
activityID           |    2               factor          Activity done by subject        1 WALKING 2 WALKING UPSTAIRS 3 WALKING DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
tBodyAccmeanX        |    3               num             mean (see key above)            [-1,1]               
tBodyAccmeanY        |    4               num             mean (see key above)            [-1,1]
tBodyAccmeanZ        |    5               num             mean (see key above)            [-1,1]
tBodyAccstdX         |    6               num             mean (see key above)            [-1,1]
tBodyAccstdY         |    7               num             mean (see key above)            [-1,1]
tBodyAccstdZ         |    8               num             mean (see key above)            [-1,1]
tGravityAccmeanX     |    9               num             mean (see key above)            [-1,1]
tGravityAccmeanY     |    10              num             mean (see key above)            [-1,1]
tGravityAccmeanZ     |    11              num             mean (see key above)            [-1,1]
tGravityAccstdX      |    12              num             mean (see key above)            [-1,1]
tGravityAccstdY      |    13              num             mean (see key above)            [-1,1]
tGravityAccstdZ      |    14              num             mean (see key above)            [-1,1]
tBodyAccJerkmeanX    |    15              num             mean (see key above)            [-1,1]
tBodyAccJerkmeanY    |    16              num             mean (see key above)            [-1,1]
tBodyAccJerkmeanZ    |    17              num             mean (see key above)            [-1,1]
tBodyAccJerkstdX     |    18              num             mean (see key above)            [-1,1]
tBodyAccJerkstdY     |    19              num             mean (see key above)            [-1,1]
tBodyAccJerkstdZ     |    20              num             mean (see key above)            [-1,1]
tBodyGyromeanX       |    21              num             mean (see key above)            [-1,1]
tBodyGyromeanY       |    22              num             mean (see key above)            [-1,1]
tBodyGyromeanZ       |    23              num             mean (see key above)            [-1,1]
tBodyGyrostdX        |    24              num             mean (see key above)            [-1,1]
tBodyGyrostdY        |    25              num             mean (see key above)            [-1,1]
tBodyGyrostdZ        |    26              num             mean (see key above)            [-1,1]
tBodyGyroJerkmeanX   |    27              num             mean (see key above)            [-1,1]
tBodyGyroJerkmeanY   |    28              num             mean (see key above)            [-1,1]
tBodyGyroJerkmeanZ   |    29              num             mean (see key above)            [-1,1]
tBodyGyroJerkstdX    |    30              num             mean (see key above)            [-1,1]
tBodyGyroJerkstdY    |    31              num             mean (see key above)            [-1,1]
tBodyGyroJerkstdZ    |    32              num             mean (see key above)            [-1,1]
tBodyAccMagmean      |    33              num             mean (see key above)            [-1,1]
tBodyAccMagstd       |    34              num             mean (see key above)            [-1,1]
tGravityAccMagmean   |    35              num             mean (see key above)            [-1,1]
tGravityAccMagstd    |    36              num             mean (see key above)            [-1,1]
tBodyAccJerkMagmean  |    37              num             mean (see key above)            [-1,1]
tBodyAccJerkMagstd   |    38              num             mean (see key above)            [-1,1]
tBodyGyroMagmean     |    39              num             mean (see key above)            [-1,1]
tBodyGyroMagstd      |    40              num             mean (see key above)            [-1,1]
tBodyGyroJerkMagmean |    41              num             mean (see key above)            [-1,1]
tBodyGyroJerkMagstd  |    42              num             mean (see key above)            [-1,1]
fBodyAccmeanX        |    43              num             mean (see key above)            [-1,1]
fBodyAccmeanY        |    44              num             mean (see key above)            [-1,1]
fBodyAccmeanZ        |    45              num             mean (see key above)            [-1,1]
fBodyAccstdX         |    46              num             mean (see key above)            [-1,1]
fBodyAccstdY         |    47              num             mean (see key above)            [-1,1]
fBodyAccstdZ         |    48              num             mean (see key above)            [-1,1]
fBodyAccmeanFreqX    |    49              num             mean (see key above)            [-1,1]
fBodyAccmeanFreqY    |    50              num             mean (see key above)            [-1,1]
fBodyAccmeanFreqZ    |    51              num             mean (see key above)            [-1,1]
fBodyAccJerkmeanX    |    52              num             mean (see key above)            [-1,1]
fBodyAccJerkmeanY    |    53              num             mean (see key above)            [-1,1]
fBodyAccJerkmeanZ    |    54              num             mean (see key above)            [-1,1]
fBodyAccJerkstdX     |    55              num             mean (see key above)            [-1,1]
fBodyAccJerkstdY     |    56              num             mean (see key above)            [-1,1]
fBodyAccJerkstdZ     |    57              num             mean (see key above)            [-1,1]
fBodyAccJerkmeanFreqX|   58              num             mean (see key above)            [-1,1]
fBodyAccJerkmeanFreqY|   59              num             mean (see key above)            [-1,1]
fBodyAccJerkmeanFreqZ|   60              num             mean (see key above)            [-1,1]
fBodyGyromeanX       |   61              num             mean (see key above)            [-1,1]
fBodyGyromeanY       |   62              num             mean (see key above)            [-1,1]
fBodyGyromeanZ       |   63              num             mean (see key above)            [-1,1]
fBodyGyrostdX        |   64              num             mean (see key above)            [-1,1]
fBodyGyrostdY        |   65              num             mean (see key above)            [-1,1]
fBodyGyrostdZ        |   66              num             mean (see key above)            [-1,1]
fBodyGyromeanFreqX   |   67              num             mean (see key above)            [-1,1]
fBodyGyromeanFreqY   |   68              num             mean (see key above)            [-1,1]
fBodyGyromeanFreqZ   |   69              num             mean (see key above)            [-1,1]
fBodyAccMagmean      |   70              num             mean (see key above)            [-1,1]
fBodyAccMagstd       |   71              num             mean (see key above)            [-1,1]
fBodyAccMagmeanFreq  |  72              num             mean (see key above)            [-1,1]
fBodyBodyAccJerkMagmean| 73              num             mean (see key above)            [-1,1]
fBodyBodyAccJerkMagstd|  74              num             mean (see key above)            [-1,1]
fBodyBodyAccJerkMagmeanFreq| 75          num             mean (see key above)            [-1,1]
fBodyBodyGyroMagmean |   76              num             mean (see key above)            [-1,1]
fBodyBodyGyroMagstd  |   77              num             mean (see key above)            [-1,1]
fBodyBodyGyroMagmeanFreq| 78             num             mean (see key above)            [-1,1]
fBodyBodyGyroJerkMagmean| 79             num             mean (see key above)            [-1,1]
fBodyBodyGyroJerkMagstd|  80             num             mean (see key above)            [-1,1]
fBodyBodyGyroJerkMagmeanFreq| 81         num             mean (see key above)            [-1,1]