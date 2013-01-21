results = csvread( 'results.csv' );

err = results(:,1);

good = err < 0.14;

good_results = results( good, 2:end );

%plot( good_results' )

plot( mean( good_results ))

xlabel( 'layers')
ylabel( 'noise' )