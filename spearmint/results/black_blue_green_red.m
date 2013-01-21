results = csvread( 'results2.csv' );

err = results(:,1);

red = err < 0.139;
green = err < 0.14;
blue = err < 0.144;
black = err >= 0.144;

plot( results( black, 2 ), results( black, 3 ), 'ko' )
hold on;

plot( results( blue, 2 ), results( blue, 3 ), 'bo' )
plot( results( green, 2 ), results( green, 3 ), 'go' )
plot( results( red, 2 ), results( red, 3 ), 'ro' )

xlabel( 'layers')
ylabel( 'noise' )

hold off;

