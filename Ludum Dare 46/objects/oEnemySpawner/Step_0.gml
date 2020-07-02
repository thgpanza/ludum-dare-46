/// @description Wave System Controller

var enemiesToSpawn = smallEnemiesRemaining + bigEnemiesRemaining;

#region ENDING THE CURRENT NIGHT STATE

if (enemiesToSpawn == 0 && instance_number(oEnemy) == 0 && !global.canStartNextTurn) {
	global.endNight = true;
}

#endregion

#region UPDATING THE ENEMIES' STATS EACH TURN

if (enemiesToSpawn == 0 && instance_number(oEnemy) == 0 && global.canStartNextTurn) {
	global.turn += 1;
	
	// Setting the new amount of enemies for the next turn.
	smallEnemiesRemaining = initialSmallEnemiestoSpawn + global.turn * smallEnemiesTurnMultiplier;
	bigEnemiesRemaining = initialBigEnemiesToSpawn + global.turn * bigEnemiesTurnMultiplier;
	
	// Updating the small enemies' stats.
	var smallEnemyMap = oGameManager.enemies[oGameManager.smallEnemyMapIndex];

	ds_map_replace(smallEnemyMap, "Hit Points", smallEnemyMap[? "Starting Hit Points"] + (1 * global.turn));
	ds_map_replace(smallEnemyMap, "Move Speed", smallEnemyMap[? "Starting Move Speed"] + (0.06 * global.turn));
	
	UpdateEnemy(oGameManager.smallEnemyMapIndex);
	
	// Updating the big enemies' stats.
	
	var bigEnemyMap = oGameManager.enemies[oGameManager.bigEnemyMapIndex];

	ds_map_replace(bigEnemyMap, "Hit Points", bigEnemyMap[? "Starting Hit Points"] + (2 * global.turn));
	ds_map_replace(bigEnemyMap, "Move Speed", bigEnemyMap[? "Starting Move Speed"] + (0.04 * global.turn));
	
	UpdateEnemy(oGameManager.bigEnemyMapIndex);	
	
	// Starting the spawner's alarms.
	alarm[0] = smallEnemiesSpawnTimer;
	alarm[1] = bigEnemiesSpawnTimer;
}

#endregion
