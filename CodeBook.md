## Code Book

## Preprocessing
 The Samsung data was downloaded from the course website. Then the train and the test set are combined into one dataset. The column unrelated to a mean or a standard deviation of some observables are excluded. Finally an average of each column is computed for each subject and each activity. 

## variables

# 1. subject
This variable is an identifier of the subject who carried out the experiment.

# 2. activity
This variable indicates a type of activity which the subject took. It can take six values:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING.

# 3. the 66 Signals
The rest of the variables are signals measured by the sensors. The variable names are for example "tBodyAcc-mean()-Y" or "fBodyAccJerk-std()-Z". A variable name consists of four components and each component represents the type of the variables according to the following rule.
* "t" or "f" 
    * "t" indicates if the variable is in a time domain.
    * "f" indicates if the variable is in a frequency domain (computed as a fft.)
- "BodyAcc" indicates that the variable is a body accelearation signal.
- "GrabityAcc" indicates that the variable is a gravity accelearation signal.
	- 