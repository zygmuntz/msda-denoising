MSDA-denosing
=============

The code for Spearmints experiments described in [http://fastml.com/very-fast-denoising-autoencoder-with-a-robot-arm/](http://fastml.com/very-fast-denoising-autoencoder-with-a-robot-arm/).
	
	spearmint - optimize hyperparams (layers and noise) for a random forest (or ridge regression)
	spearmint_variable_noise - optimize noise separately for each of 10 layers
	
	denoised_rf.r - train a random forest on denoised data
	f_rmse.r - RMSE function
	rf.r - train a random forest on original data
	
The original experiments described in the article used only the last layer from MSDA. Updated `run_denoise.m` to use all layers, see user comments at the end of the post.
