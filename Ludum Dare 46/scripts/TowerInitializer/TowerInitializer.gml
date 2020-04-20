/// @description Chance(towersMapIndex)
/// @param towersMapIndex

var towerMap = oGameManager.towers[argument0];

// The tower's stats.
name        = towerMap[? "Name"];         // The tower's name.
price       = towerMap[? "Price"];        // How many corns the tower costs.
damage      = towerMap[? "Damage"];       // The amount of damage that the turret deals.
atkSpeed    = towerMap[? "Attack Speed"]; // The stat that influences how fast the turret shoots.
fireRate    = towerMap[? "Fire Rate"];    // The actual fire rate of the turret.
bulletSpeed = towerMap[? "Bullet Speed"]; // How fast the tower's bullet will travel.
range       = towerMap[? "Range"];        // How far the tower can shoot (in pixels).

// The tower's control variables.
isShooting  = false;                      // Whether the tower is shooting or not.
target      = noone;                      // The tower's current target.
