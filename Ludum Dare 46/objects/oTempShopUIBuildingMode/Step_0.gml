/// @description Temp Show UI Handler

// Hiding the shop UI while hovering it (to more easily see the space/towers beneath it).
if (mouse_x > 192 && mouse_x <= 320 && mouse_y <= 128) {
	if (image_alpha = 1) {
		image_alpha = 0;
	}
} else {
	if (image_alpha = 0) {
		image_alpha = 1;
	}
}

// Showing which tower is selected to be built.
if (!global.isOnBuildingMode) {
	image_alpha = 0.75;
} else {
	image_alpha = 1;
}
