# train random forest on original robot arm data

library( randomForest )
ntrees = 400

source( 'f_rmse.r' )

train_file = 'data/kin8nm_train.csv'
validation_file = 'data/kin8nm_validation.csv'

train <- read.csv( train_file, header = F )
validation <- read.csv( validation_file, header = F )

x_train = train[, -9]
y_train = train[, 9]

x_validation = validation[, -9]
y_validation = validation[, 9]

###

rf <- randomForest( x_train, y_train, ntree = ntrees, do.trace = 10 )  # mtry = nvars

p <- predict( rf, x_validation )

print( rmse( y_validation, p ))

# 0.1470507
