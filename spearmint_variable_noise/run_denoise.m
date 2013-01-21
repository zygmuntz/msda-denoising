args = argv();

for i = 1:nargin
	args{i} = str2num( args{i} );
end

noise = cell2mat( args )
layers = nargin

%%%

train_file = 'data/kin8nm_train.csv'
validation_file = 'data/kin8nm_validation.csv'
test_file = 'data/kin8nm_test.csv'

% files to write

output_train_file = 'data/kin_denoised_train.csv';
output_validation_file = 'data/kin_denoised_validation.csv';
output_test_file = 'data/kin_denoised_test.csv';

train = csvread( train_file );
validation = csvread( validation_file );
test = csvread( test_file );

y_train = train(:,end);
y_validation = validation(:,end);
y_test = test(:,end);

x_combined = [ train(:,1:end-1); validation(:,1:end-1); test(:,1:end-1); ];


% denoise

ncol = size( x_combined, 2 );

start_i = 1 + ( layers - 1 ) * ncol;
end_i = layers * ncol;

[ allhx, Ws ] = my_mSDA( x_combined', noise );

x2 = allhx';
x2 = x2(:, start_i:end_i );

% split back

train_rows = size( y_train );
validation_rows = size( y_validation );
test_rows = size( y_test );

x2_train = x2( 1:train_rows, : );
x2_validation = x2( (train_rows + 1):(train_rows + validation_rows), : );
x2_test = x2( (train_rows + validation_rows + 1):end, : );

%%%

csvwrite( output_train_file, [y_train x2_train] );
csvwrite( output_validation_file, [y_validation x2_validation] );
csvwrite( output_test_file, [y_test x2_test] );

'OK'


