function [allhx, Ws] = mSDA(xx, noise,layers)

% xx : dxn input
% noise: corruption level
% layers: number of layers to stack

% allhx: ( layers * d ) x n stacked hidden representations

lambda = 1e-05;
disp('stacking hidden layers...')
prevhx = xx;
allhx = [];
Ws={};
for layer = 1:layers
    	disp(['layer:',num2str(layer)])
	tic
	[newhx, W] = mDA(prevhx,noise,lambda);
	Ws{layer} = W;
	toc
	allhx = [allhx; newhx];
	prevhx = newhx;
end
