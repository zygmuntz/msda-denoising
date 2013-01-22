# train a random forest on denoised data

library( randomForest )

source( 'f_rmse.r' )

ntrees = 400

train_file = 'data/kin_denoised_train.csv'
validation_file = 'data/kin_denoised_validation.csv'

train <- read.csv( train_file, header = F )
validation <- read.csv( validation_file, header = F )

x_train = train[, -1]
y_train = train[, 1]

x_validation = validation[, -1]
y_validation = validation[, 1]

###

rf <- randomForest( x_train, y_train, ntree = ntrees, do.trace = 10 )  # mtry = nvars

p <- predict( rf, x_validation )

print( rmse( y_validation, p ))

# 0.1395531 with 14 layers and 0.06 noise