/// @description Chance(towersMapIndex)
/// @param towersMapIndex

/*
 * Initializes the given tower's variables.
 */

var towerMap = oGameManager.towers[argument0];

// The tower's stats.
name        = towerMap[? "Name"];
price       = towerMap[? "Price"];
level       = towerMap[? "Level"];
damage      = towerMap[? "Damage"];
atkSpeed    = towerMap[? "Attack Speed"];
fireRate    = towerMap[? "Fire Rate"];
bulletSpeed = towerMap[? "Bullet Speed"];
range       = towerMap[? "Range"];

// The tower's control variables.
isShooting  = false;
target      = noone;
