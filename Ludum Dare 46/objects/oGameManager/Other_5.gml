/// @description Resetting Variables

// Making sure the building mark is destroyed.
if (room == rNightZone) {
	if (buildingMark != noone) {
		instance_destroy(buildingMark);
	}
}
