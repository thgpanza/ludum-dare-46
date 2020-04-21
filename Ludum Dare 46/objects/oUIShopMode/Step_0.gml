/// @description Shop UI Handler

#region NIGHT ZONE SHOP UI

if (room == rNightZone) {
	// Hiding the shop UI while hovering it (to more easily see the space/towers beneath it).
	if (mouse_x >= 0 && mouse_x < 192 && mouse_y >= 0 && mouse_y < 112) {
		if (image_alpha > 0) {
			image_alpha = 0;
		}
	} else {
		// Showing if the Shop Mode is activated or not.
		if (!global.isOnShopMode) {
			image_alpha = 0.75;
		} else {
			image_alpha = 1;
		}
	}
}

#endregion

#region DAYLIGHT ZONE SHOP UI

if (room == rDaylightZone) {
	// Showing if the Shop Mode is activated or not.
	if (!global.isOnShopMode) {
		image_alpha = 0.75;
	} else {
		image_alpha = 1;
	}
}

#endregion
