/// @description Shop UI Handler

// Showing if this seed is selected to be planted.
if (global.seedToPlant != oSeedBeer || !global.isOnShopMode) {
	image_alpha = 0.75;
} else if (global.seedToPlant == oSeedBeer) {	
	image_alpha = 1;
}
