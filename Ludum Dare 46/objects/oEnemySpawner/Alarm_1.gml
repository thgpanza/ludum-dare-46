/// @description Big Enemy Spawner

// Spawning one big enemy.
instance_create_layer(-(global.halfTileWidth * 4),
					  -(global.halfTileHeight * 4),
					  "BigEnemiesLayer",
					  oBigEnemy);

// Resetting the alarm.
alarm[1] = alarm1cd;
