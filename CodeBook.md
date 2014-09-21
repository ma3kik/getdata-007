## Code Book

# Preprocessing
 The Samsung data was downloaded from the course website. Then the train and the test set are combined into one dataset. The column unrelated to a mean or a standard deviation of some observables are excluded. Finally an average of each column is computed for each subject and each activity. 

# 1. subject
This variable is an identifier of the subject who carried out the experiment.

# 2. activity
This variable indicates a type of activity which the subject took. It can take six values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

# 3. 