library( ridge )

source( 'f_rmse.r' )

train_file = 'data/kin_denoised_train.csv'
validation_file = 'data/kin_denoised_validation.csv'

train <- read.csv( train_file, header = F )
validation <- read.csv( validation_file, header = F )

# for scoring
y_validation = validation[, 1]

###

model = linearRidge( V1 ~ ., train )
p <- predict( model, validation )
res = rmse( y_validation, p )

cat( 'RMSE:', res, "\n" )


