/// @description Game Controller

#region LOCAL VARIABLES

var kbStartGameKey       = keyboard_check_pressed(vk_space);
var kbPauseGameKey       = keyboard_check_pressed(vk_escape);
var kbShopModeKey        = keyboard_check_pressed(ord("S"));
var kbNexWaveKey         = keyboard_check_pressed(ord("N"));
var kbMainNumberOneKey   = keyboard_check_pressed(ord("1"));
var kbMainNumberTwoKey   = keyboard_check_pressed(ord("2"));
var kbMainNumberThreeKey = keyboard_check_pressed(ord("3"));
var kbPlaceKey           = mouse_check_button_pressed(mb_left);
var kbSellKey            = mouse_check_button_pressed(mb_right);

#endregion

#region GAME CONTROLLER CONFIGS

// Setting this object to be persistent across rooms.
if (!persistent) {
	persistent = true;
}

// Setting both game rooms ("rNightZone" and "rDaylightZone) to be persistent.
if (room == rNightZone || room == rDaylightZone) {
	if (!room_persistent) {
		room_persistent = true;
	}
}

#endregion

/* GAME CONTROLLERS */

#region BUILDING MODE (Night Zone)

if (room == rNightZone) {
	
	
	/* BUILDING MODE ACTIVATION/DEACTIVATION */
	
	if (kbShopModeKey) {
		// Entering/Exiting building mode.
		if (global.isOnShopMode == false) {
			global.isOnShopMode = true;
		
			// Instancing the Building Mark
			var mouseXgridPos = int64(mouse_x/64) * 64;
			var mouseYgridPos = int64(mouse_y/64) * 64;
		
			buildingMark = instance_create_layer(mouseXgridPos, mouseYgridPos, "UILayer", oBuildingMark);
	
		} else {
			global.isOnShopMode = false;
			global.towerToBuild = noone;
		
			instance_destroy(buildingMark);
		}
	}


	/* BUILDING MODE CONTROLLER */

	if (global.isOnShopMode) {
		// Choosing which tower to build.
		if (kbMainNumberOneKey) {
			global.towerToBuild = oBasicTower;
		}
	
		// Building the tower at the mouse's position.
		if (kbPlaceKey) {
			var mouseXgridPos = int64(mouse_x/64) * 64;
			var mouseYgridPos = int64(mouse_y/64) * 64;
		
			var xPosToCheck = mouseXgridPos + global.halfTileWidth;
			var yPosToCheck = mouseYgridPos + global.halfTileHeight;
		
			if (!instance_position(xPosToCheck, yPosToCheck, oTower) &&
				!instance_position(xPosToCheck, yPosToCheck, oSoilPath)) {
				if (global.towerToBuild != noone) {
					var towersMapIndex = -1;
				
					switch (global.towerToBuild) {
						case oBasicTower:
							towersMapIndex = 0;
							break;
						default:
							show_debug_message("ERROR: No tower found!");
							break;
					}
				
					if (towersMapIndex != -1) {
						var towerMap = towers[towersMapIndex];
						
						if ((global.playerCornsOwned - towerMap[? "Price"]) >= 0) {
							global.playerCornsOwned -= towerMap[? "Price"];
					
							var exCornfieldTileFound = instance_position(xPosToCheck, yPosToCheck, oExCornfield);
					
							if (!exCornfieldTileFound) {
								instance_create_layer(xPosToCheck, yPosToCheck, "ExCornfieldLayer", oExCornfield);
							}
					
							instance_create_layer(xPosToCheck, yPosToCheck, "TowersLayer", global.towerToBuild);
						}
					}
				}
			}
		}
	
		// Selling the tower at the mouse's position.
		if (kbSellKey) {
			var mouseXgridPos = int64(mouse_x/64) * 64;
			var mouseYgridPos = int64(mouse_y/64) * 64;
		
			var xPosToCheck = mouseXgridPos + global.halfTileWidth;
			var yPosToCheck = mouseYgridPos + global.halfTileHeight;
		
			var instanceFound = instance_position(xPosToCheck, yPosToCheck, oTower);
		
			if (instanceFound != noone) {
				global.playerCornsOwned += int64(instanceFound.price * global.playerTowerSellRefundValuePercent);
			
				instance_destroy(instanceFound);
			}
		}
	}
}

#endregion

#region FARMING MODE (Daylight Zone)

if (room == rDaylightZone) {
	
	/* BUILDING MODE ACTIVATION/DEACTIVATION */
	
	if (kbShopModeKey) {
		// Entering/Exiting building mode.
		if (global.isOnShopMode == false) {
			global.isOnShopMode = true;
		
			// Instancing the Building Mark
			var mouseXgridPos = int64(mouse_x/64) * 64;
			var mouseYgridPos = int64(mouse_y/64) * 64;
		
			buildingMark = instance_create_layer(mouseXgridPos, mouseYgridPos, "UILayer", oBuildingMark);
	
		} else {
			global.isOnShopMode = false;
			global.seedToPlant = noone;
		
			instance_destroy(buildingMark);
		}
	}
	
	
	/* BUILDING MODE CONTROLLER */
	
	if (global.isOnShopMode) {
		// Choosing which seed to plant.
		if (kbMainNumberOneKey) {
			global.seedToPlant = oSeedChocolate;
		} else if (kbMainNumberTwoKey) {
			global.seedToPlant = oSeedPeanut;
		} else if (kbMainNumberThreeKey) {
			global.seedToPlant = oSeedBeer;
		}
	
		// Planting the seed at the mouse's position.
		if (kbPlaceKey) {
			var mouseXgridPos = int64(mouse_x/64) * 64;
			var mouseYgridPos = int64(mouse_y/64) * 64;
		
			var xPosToCheck = mouseXgridPos + global.halfTileWidth;
			var yPosToCheck = mouseYgridPos + global.halfTileHeight;
		
			if (instance_position(xPosToCheck, yPosToCheck, oFarmSeedableTile) &&
				!instance_position(xPosToCheck, yPosToCheck, oSeed)) {
				if (global.seedToPlant != noone) {
					var seedsMapIndex = -1;
				
					switch (global.seedToPlant) {
						case oSeedChocolate:
							seedsMapIndex = 0;
							break;
						case oSeedPeanut:
							seedsMapIndex = 1;
							break;
						case oSeedBeer:
							seedsMapIndex = 2;
							break;
						default:
							show_debug_message("ERROR: No seed found!");
							break;
					}
				
					if (seedsMapIndex != -1) {
						var seedMap = seeds[seedsMapIndex];
						
						if ((global.playerCoinsOwned - seedMap[? "Price"]) >= 0) {
							global.playerCoinsOwned -= seedMap[? "Price"];
					
							var seedInstance = instance_create_layer(xPosToCheck, yPosToCheck, "SeedsLayer", global.seedToPlant);
							
							seedInstance.seedIndex = seedsMapIndex;
							seedInstance.canStartGrowing = true;
						}
					}
				}
			}
		}
		
		// Selling the tower at the mouse's position.
		if (kbSellKey) {
			var mouseXgridPos = int64(mouse_x/64) * 64;
			var mouseYgridPos = int64(mouse_y/64) * 64;
		
			var xPosToCheck = mouseXgridPos + global.halfTileWidth;
			var yPosToCheck = mouseYgridPos + global.halfTileHeight;
		
			var instanceFound = instance_position(xPosToCheck, yPosToCheck, oSeed);
		
			if (instanceFound != noone) {
				if (instanceFound.canHarvest) {
					global.playerCoinsOwned += instanceFound.coinValue;
					
					instance_destroy(instanceFound);
				}
			}
		}
	}
}



#endregion

#region CHANGING ROOMS

// "Starting" the game.
if (room == rTitleScreen) {
	if (kbStartGameKey) {
		room_goto(rDaylightZone);
	}
}

// Changing back to "rNightZone" room ("N" as in "Next (Turn/Round)").
if (room == rDaylightZone) {
	if (kbNexWaveKey) {
		global.canStartNextTurn = true;
		
		room_goto(rNightZone);
	}
}

// Changing to "rDaylightZone" every 5 turns.
if (room == rNightZone && global.endNight) {
	global.endNight = false;
	
	while (instance_exists(oBullet)) {
		var bulletInstance = instance_find(oBullet, 0);
		
		instance_destroy(bulletInstance);
	}
	
	// Converting some of the player's corns from the current night to coins.
	global.playerCoinsOwned += int64(global.playerCornsOwned * global.playerCornsToCoinsValuePercent);
	global.playerCornsOwned = 0;
	
	room_goto(rDaylightZone);
}

#endregion

#region PAUSE SYSTEM

if (kbPauseGameKey) {
	if (!isGamePaused) {
		instance_deactivate_all(true);
		isGamePaused = true;
	} else {
		instance_activate_all();
		isGamePaused = false;
	}
}

#endregion

#region GAME OVER CODE

if (global.playerHp <= 0) {
	game_end();
}

#endregion
