/// @description Shop UI Handler

// Showing if this seed is selected to be planted.
if (global.seedToPlant != oSeedPeanut || !global.isOnShopMode) {
	image_alpha = 0.75;
} else if (global.seedToPlant == oSeedPeanut) {	
	image_alpha = 1;
}
