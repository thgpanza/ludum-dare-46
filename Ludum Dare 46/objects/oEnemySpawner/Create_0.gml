/// @description Initializing Variables

#region CONTROL VARIABLES

initialSmallEnemiestoSpawn = 4;              // The amount of small enemies to spawn at the given turn.
smallEnemiesRemaining      = 0;              // The amount of small enemies that haven't spawned yet at the given turn.
smallEnemiesTurnMultiplier = 4;              // How many more small enemies to spawn each turn.
smallEnemiesSpawnTimer     = room_speed;     // The cooldown (1 second) between spawns of the small enemies.

initialBigEnemiesToSpawn   = 2;              // The amount of big enemies to spawn at the given turn.
bigEnemiesRemaining        = 0;              // The amount of big enemies that haven't spawned yet at the given turn.
bigEnemiesTurnMultiplier   = 2;              // How many more big enemies to spawn each turn.
bigEnemiesSpawnTimer       = room_speed * 2; // The cooldown (2 seconds) between spawns of the big enemies.

#endregion
