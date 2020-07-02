/// @description Start Growing

if (turnPlanted == -1) {
	UpdateSeed(seedIndex);
}

if (canStartGrowing) {
	canStartGrowing = false;
	
	turnPlanted = global.turn;
}

if ((global.turn - turnPlanted) >= growRate) {
	image_index = 1;
	
	canHarvest = true;
}
