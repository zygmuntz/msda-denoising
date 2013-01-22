% black - blue - green - red plot for ridge regression results

results = csvread( 'results_ridge.csv' );

err = results(:,1);

red = err < 0.203;
green = err < 0.205;
blue = err < 0.21;
black = err >= 0.21;

plot( results( black, 2 ), results( black, 3 ), 'ko' )
hold on;

plot( results( blue, 2 ), results( blue, 3 ), 'bo' )
plot( results( green, 2 ), results( green, 3 ), 'go' )
plot( results( red, 2 ), results( red, 3 ), 'ro' )

xlabel( 'layers')
ylabel( 'noise' )

hold off;

