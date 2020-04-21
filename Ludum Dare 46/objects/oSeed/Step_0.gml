/// @description Start Growing

if (canStartGrowing) {
	canStartGrowing = false;
	
	turnPlanted = global.turn;
}

if (turnPlanted != -1) {
	UpdateSeed(seedIndex);
}

if ((global.turn - turnPlanted) >= growRate) {
	image_index = 1;
	
	canHarvest = true;
}
