/// @description Small Enemy Spawner

// Spawning one small enemy.
instance_create_layer(-(global.halfTileWidth * 4),
					  -(global.halfTileHeight * 4),
					  "SmallEnemiesLayer",
					  oSmallEnemy);

// Resetting the alarm.
alarm[0] = alarm0cd;
