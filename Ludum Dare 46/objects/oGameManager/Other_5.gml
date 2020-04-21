/// @description Resetting Variables

// Making sure the building shop is closed and the building mark is destroyed.
if (room == rNightZone || room = rDaylightZone) {
	if (buildingMark != noone) {
		instance_destroy(buildingMark);
	}
	
	global.isOnShopMode = false;
}
