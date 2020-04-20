/// @description Temp Show UI Handler

// Hiding the shop UI while hovering it (to more easily see the space/towers beneath it).
if (mouse_x <= 192 && mouse_y <= 128) {
	if (layer_get_visible("TempUILayer")) {
		layer_set_visible("TempUILayer", false);
	}
} else {
	if (!layer_get_visible("TempUILayer")) {
		layer_set_visible("TempUILayer", true);
	}
}

// Showing which tower is selected to be built.
if (global.towerToBuild == noone || !global.isOnBuildingMode) {
	image_alpha = 0.75;
	
	if (global.towerToBuild != noone) {
		global.towerToBuild = noone;
	}
} else {
	if (global.towerToBuild == oBasicTower) {	
		image_alpha = 1;
	}
}
