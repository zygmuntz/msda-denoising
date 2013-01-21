function [allhx, Ws] = my_mSDA( xx, noise_vector )

% xx : dxn input
% noise: corruption level
% layers = size( noise_vector )

% allhx: ( layers * d ) x n stacked hidden representations

layers = size( noise_vector, 1 )

lambda = 1e-05;
disp('stacking hidden layers...')
prevhx = xx;
allhx = [];
Ws={};
for layer = 1:layers
    disp(['layer:',num2str(layer)])
	noise = noise_vector(layer)
	
	tic
	[newhx, W] = mDA(prevhx,noise,lambda);
	Ws{layer} = W;
	toc
	
	allhx = [allhx; newhx];
	prevhx = newhx;
end
