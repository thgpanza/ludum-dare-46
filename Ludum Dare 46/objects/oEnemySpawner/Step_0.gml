/// @description Wave per Turn Controller

var enemiesToSpawn = smallEnemiesRemaining + bigEnemiesRemaining;

if (enemiesToSpawn == 0 && instance_number(oEnemy) == 0 && !global.canStartNextTurn) {
	global.endNight = true;
}

if (enemiesToSpawn == 0 && instance_number(oEnemy) == 0 && global.canStartNextTurn) {
	global.turn += 1;
	
	smallEnemiesRemaining = initialSmallEnemiestoSpawn + global.turn * smallEnemiesTurnMultiplier;
	bigEnemiesRemaining = initialBigEnemiesToSpawn + global.turn * bigEnemiesTurnMultiplier;
	
	var smallEnemyMap = oGameManager.enemies[oGameManager.smallEnemyMapIndex];
	//var smallEnemyCurrentHp = smallEnemyMap[? "Hit Points"];
	//var smallEnemyCurrentMoveSpd = smallEnemyMap[? "Move Speed"];
	ds_map_replace(smallEnemyMap, "Hit Points", smallEnemyMap[? "Starting Hit Points"] + (1 * global.turn));
	ds_map_replace(smallEnemyMap, "Move Speed", smallEnemyMap[? "Starting Move Speed"] + (0.06 * global.turn));
	
	UpdateEnemy(oGameManager.smallEnemyMapIndex);
	
	var bigEnemyMap = oGameManager.enemies[oGameManager.bigEnemyMapIndex];
	//var bigEnemyCurrentHp = bigEnemyMap[? "Hit Points"];
	//var bigEnemyCurrentMoveSpd = bigEnemyMap[? "Move Speed"];
	ds_map_replace(bigEnemyMap, "Hit Points", bigEnemyMap[? "Starting Hit Points"] + (2 * global.turn));
	ds_map_replace(bigEnemyMap, "Move Speed", bigEnemyMap[? "Starting Move Speed"] + (0.04 * global.turn));
	
	UpdateEnemy(oGameManager.bigEnemyMapIndex);	
	
	alarm[0] = smallEnemiesSpawnTimer;
	alarm[1] = bigEnemiesSpawnTimer;
}
