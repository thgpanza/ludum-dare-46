/// @description Shop UI Handler

// Hiding the shop UI while hovering it (to more easily see the space/towers beneath it).
if (mouse_x >= 192 && mouse_x < 384 && mouse_y >= 0 && mouse_y < 112) {
	if (image_alpha > 0) {
		image_alpha = 0;
	}
} else {
	// Showing if this tower is selected to be built.
	if (global.towerToBuild != oBasicTower || !global.isOnShopMode) {
		image_alpha = 0.75;
	} else if (global.towerToBuild == oBasicTower) {	
		image_alpha = 1;
	}
}
