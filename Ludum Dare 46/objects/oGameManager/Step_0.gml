/// @description Game Controller

/* INITIALIZING LOCAL VARIABLES */

var kbBuildingModeKey = keyboard_check_pressed(ord("B"));
var kbBasicTowerKey = keyboard_check_pressed(ord("1"));
var kbBuildKey = mouse_check_button_pressed(mb_left);
var kbSellKey = mouse_check_button_pressed(mb_right);

if (!persistent) {
	persistent = true;
}


/* ACTUAL GAME CONTROLLING */

#region BUILDING MODE

/* BUILDING MODE ACTIVATION/DEACTIVATION */

if (room == rNightZone) {
	if (kbBuildingModeKey) {
		// Entering/Exiting building mode.
		if (global.isOnBuildingMode == false) {
			global.isOnBuildingMode = true;
		
			// Instancing the Building Mark
			var mouseXgridPos = int64(mouse_x/64) * 64;
			var mouseYgridPos = int64(mouse_y/64) * 64;
		
			buildingMark = instance_create_layer(mouseXgridPos, mouseYgridPos, "UILayer", oBuildingMark);
	
		} else {
			global.isOnBuildingMode = false;
		
			instance_destroy(buildingMark);
		}
	}


	/* BUILDING MODE CONTROLLER */

	if (global.isOnBuildingMode) {
		// Choosing which tower to build.
		if (kbBasicTowerKey) {
			global.towerToBuild = oBasicTower;		
		}
	
		// Building the tower at the mouse's position.
		if (kbBuildKey) {
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
	
		// Selling the tower at the mouse's position.
		if (kbSellKey) {
			var mouseXgridPos = int64(mouse_x/64) * 64;
			var mouseYgridPos = int64(mouse_y/64) * 64;
		
			var xPosToCheck = mouseXgridPos + global.halfTileWidth;
			var yPosToCheck = mouseYgridPos + global.halfTileHeight;
		
			var instanceFound = instance_position(xPosToCheck, yPosToCheck, oTower);
		
			if (instanceFound != noone) {
				global.playerCornsOwned += int64(instanceFound.price * global.playerSellRefundPercent);
			
				instance_destroy(instanceFound);
			}
		}
	}
}

#endregion

// Setting both game rooms ("rNightZone" and "rDaylightZone) to be persistent.
if (room == rNightZone || room == rDaylightZone) {
	if (!room_persistent) {
		room_persistent = true;
	}
}

// Changing to "rDaylightZone" every 5 turns.
if (room == rNightZone && global.endNight) {
	global.endNight = false;
	
	while (instance_exists(oBullet)) {
		var bulletInstance = instance_find(oBullet, 0);
		
		instance_destroy(bulletInstance);
	}
	
	room_goto(rDaylightZone);
}

// Changing back to "rNightZone" room ("N" as in "Next (Turn/Round)").
if (room == rDaylightZone) {
	if (keyboard_check_pressed(ord("N"))) {
		global.canStartNextTurn = true;
		
		room_goto(rNightZone);
	}
}

/* GAME OVER CODE */

if (global.playerHp <= 0) {
	game_end();
}
