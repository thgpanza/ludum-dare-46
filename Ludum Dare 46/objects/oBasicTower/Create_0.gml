/// @description Variable Initialization

var towerMap0 = oGameController.towers[0];

price       = towerMap0[? "Price"];        // How many corns this tower costs.
damage      = towerMap0[? "Damage"];       // The amount of damage that this turret deals.
atkSpeed    = towerMap0[? "Attack Speed"]; // The stat that influences how fast this turret shoots.
fireRate    = room_speed / atkSpeed;       // The actual fire rate of this turret.
bulletSpeed = towerMap0[? "Bullet Speed"]; // How fast this tower's bullet will travel.
range       = towerMap0[? "Range"];        // How far this tower can shoot (in pixels).

isShooting  = false;                 // Wheter this tower is shooting or not.
target      = noone;                 // This tower's current target.
