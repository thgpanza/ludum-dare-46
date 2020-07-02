/// @description Variable Initialization

#region GLOBAL VARIABLES

// Utility variables.
global.halfTileWidth  = 32;                      // The half size of the game's tile width.
global.halfTileHeight = 32;                      // The half size of the game's tile height.

// Player's variables.
global.playerHp = 20;                            // The player's hit points. When it reaches 0, it's game over.

global.playerCornsOwned                  = 150;  // The amount of corns ("Night Zone" currency) that the player owns.
global.playerTowerSellRefundValuePercent = 0.25; // The percentage of the tower's value the player receives back after selling it.

global.playerCoinsOwned               = 300;     // The amount of coins ("Daylight Zone" currency) that the owns.
global.playerCornsToCoinsValuePercent = 0.2;

// Night Zone variables.
global.turn             = -1;                    // The turn that the player is currently in.
global.canStartNextTurn = true;                  // Controls whether the enemy spawner can send the next wave or not.
global.isOnShopMode     = false;                 // The variable that activates the turret building mode.
global.towerToBuild     = noone;                 // The tower to build when using the "building mode".
global.endNight         = false;                 // Controls whether the game manager can change to the daylight room;

// Daylight zone variables.
global.seedToPlant = noone;                      // The seed to plant when using the "building mode".

#endregion

#region CONTROL VARIABLES

buildingMark = noone;                            // Building mark instance holder.
isGamePaused = false;                            // Comment this later...

#endregion

/* DS_MAP DATABASES */

#region SEEDS' INFO

// 0) Chocolate Seed
seeds[0] = ds_map_create();

ds_map_add(seeds[0], "Name",       "Chocolate Seed");
ds_map_add(seeds[0], "Price",      150);
ds_map_add(seeds[0], "Grow Rate",  5);
ds_map_add(seeds[0], "Coin Value", 300);

// 1) Peanut Seed
seeds[1] = ds_map_create();

ds_map_add(seeds[1], "Name",       "Peanut Seed");
ds_map_add(seeds[1], "Price",      300);
ds_map_add(seeds[1], "Grow Rate",  10);
ds_map_add(seeds[1], "Coin Value", 600);

// 2) Beer Seed
seeds[2] = ds_map_create();

ds_map_add(seeds[2], "Name",       "Beer Seed");
ds_map_add(seeds[2], "Price",      450);
ds_map_add(seeds[2], "Grow Rate",  15);
ds_map_add(seeds[2], "Coin Value", 950);

#endregion

#region TOWERS' INFO

var towerMap = noone;

// 0) Basic Tower
towers[0] = ds_map_create();

towerMap = towers[0];

ds_map_add(towers[0], "Name",         "Basic Tower");
ds_map_add(towers[0], "Price",        50);
ds_map_add(towers[0], "Level",        1);
ds_map_add(towers[0], "Damage",       2);
ds_map_add(towers[0], "Attack Speed", 1);
ds_map_add(towers[0], "Fire Rate",    room_speed * towerMap[? "Attack Speed"]);
ds_map_add(towers[0], "Bullet Speed", 8);
ds_map_add(towers[0], "Range",        128);

#endregion

#region ENEMIES' INFO

var enemyMap = noone;

// 0) Small Enemy
enemies[0] = ds_map_create();

smallEnemyMapIndex = 0;

enemyMap = enemies[0];

ds_map_add(enemies[0], "Name",                "Small Enemy");
ds_map_add(enemies[0], "Hit Points",          4);
ds_map_add(enemies[0], "Starting Hit Points", enemyMap[? "Hit Points"]);
ds_map_add(enemies[0], "Damage",              1);
ds_map_add(enemies[0], "Move Speed",          1.44);
ds_map_add(enemies[0], "Starting Move Speed", enemyMap[? "Move Speed"]);
ds_map_add(enemies[0], "Corn Value",          20);


// 1) Big Enemy
enemies[1] = ds_map_create();

bigEnemyMapIndex = 1;

enemyMap = enemies[1];

ds_map_add(enemies[1], "Name",                "Big Enemy");
ds_map_add(enemies[1], "Hit Points",          8);
ds_map_add(enemies[1], "Starting Hit Points", enemyMap[? "Hit Points"]);
ds_map_add(enemies[1], "Damage",              2);
ds_map_add(enemies[1], "Move Speed",          0.96);
ds_map_add(enemies[1], "Starting Move Speed", enemyMap[? "Move Speed"]);
ds_map_add(enemies[1], "Corn Value",          40);

#endregion

#region CURSOR'S CONFIGS

cursor_sprite = sMouseCursor; // Changing the game's cursor to my own.
window_set_cursor(cr_none);   // Removing the OS' default cursor.

#endregion
