/// @description Chance(towersMapIndex)
/// @param towersMapIndex

var towerMap = oGameController.towers[argument0];

// The tower's stats.
price       = towerMap[? "Price"];        // How many corns the tower costs.
damage      = towerMap[? "Damage"];       // The amount of damage that the turret deals.
atkSpeed    = towerMap[? "Attack Speed"]; // The stat that influences how fast the turret shoots.
fireRate    = room_speed / atkSpeed;      // The actual fire rate of the turret.
bulletSpeed = towerMap[? "Bullet Speed"]; // How fast the tower's bullet will travel.
range       = towerMap[? "Range"];        // How far the tower can shoot (in pixels).

// The tower's control variables.
isShooting  = false;                      // Wheter the tower is shooting or not.
target      = noone;                      // The tower's current target.
