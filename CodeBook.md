### Code Book

## Preprocessing
 The original data was downloaded from the course website. Then the train and the test set are combined into one dataset. The column unrelated to a mean or a standard deviation of some observables are excluded. Finally an average of each column is computed for each subject and each activity. 

## Variables

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
The rest of the variables are signals measured by the sensors. The variable names are for example "tBodyAcc-mean()-Y" or "fBodyAccJerk-std()-Z". A variable name consists of six components and each component represents the type of the variables according to the following rule.
* Domain
    * "t" indicates if the variable is in a time domain.
    * "f" indicates if the variable is in a frequency domain (computed as a fft.)
* Body or Gravity
    * "Body" indicates the varirable is a body signal.
    * "Gravity" indicates the varirable is a gravity signal.
* Sensor
    * "Acc" indicates the signal is measured by an accelerometer.
    * "Gyro" indicates the signal is measured by a gyroscope.
* Jerk
    * If a variable name contains "Jerk", it is a jerk signal
* Magnitude or 3-dimension direction
	* If a variable name contains "Mag", it is a magnitude of a 3-dimension vector.
	* If a variable name ends with "X", "Y" or "Z", it is a respective component of a 3-dimension vector.
* mean or standard deviation
    * If a variable name contains "mean()", it is an average of the values taken from the sensor.
    * If a variable name contains "std()", it is a standard deviation of the values taken from the sensor.
