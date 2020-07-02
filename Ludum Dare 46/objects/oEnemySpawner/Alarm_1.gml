/// @description Big Enemy Spawner

#region BIG ENEMY SPAWN CONTROLLER

// Spawning one big enemy.
if (bigEnemiesRemaining > 0) {
	instance_create_layer(-(global.halfTileWidth * 4),
						  -(global.halfTileHeight * 4),
						  "BigEnemiesLayer",
						  oBigEnemy);
	
	// Reducing the amount of big enemies left to spawn this turn.
	bigEnemiesRemaining -= 1;
	
	if ((global.turn + 1) % 5 == 0) {
		if (global.canStartNextTurn) {
			global.canStartNextTurn = false;
		}
	}
}

#endregion

// Resetting the alarm.
alarm[1] = bigEnemiesSpawnTimer;
