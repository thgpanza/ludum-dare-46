/// @description EnemyInitializer(enemiesMapIndex)
/// @param enemiesMapIndex

var enemyMap = oGameController.enemies[argument0];

// The enemy's stats.
hp        = enemyMap[? "Hit Points"]; // How many corns the tower costs.
damage    = enemyMap[? "Damage"];     // The amount of damage that the turret deals.
moveSpeed = enemyMap[? "Move Speed"]; // The stat that influences how fast the turret shoots.
cornValue = enemyMap[? "Corn Value"]; // The actual fire rate of the turret.
