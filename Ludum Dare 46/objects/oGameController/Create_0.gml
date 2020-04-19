/// @description Variable Initialization

// Global variables.
global.halfTileWidth  = 32; // The half size of the game's tile width.
global.halfTileHeight = 32; // The half size of the game's tile height.

global.playerHp                =   10; // The player's hit points. When it reaches 0, it's game over.
global.playerCornsOwned        =  100; // The amount of corns that the player owns.
global.playerSellRefundPercent = 0.25; // The percentage of the tower's value the player receives back after selling it.

// Controller variables.
buildingMode = false; // The variable that activates the turret building mode.
towerToBuild = noone; // The tower to build when using "building mode".

#region Towers' Info

// 0) Basic Tower
towers[0] = ds_map_create();

ds_map_add(towers[0], "Price",         50);
ds_map_add(towers[0], "Damage",         1);
ds_map_add(towers[0], "Attack Speed",   2);
ds_map_add(towers[0], "Bullet Speed",   8);
ds_map_add(towers[0], "Range",        128);

#endregion

// Setting the cursor's sprite.
cursor_sprite = sMouseCursor;
window_set_cursor(cr_none);
