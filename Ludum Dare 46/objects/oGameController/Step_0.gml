/// @description Game Controller

/* INITIALIZING LOCAL VARIABLES */

var kbBuildingModeKey = keyboard_check_pressed(ord("B"));
var kbBasicTowerKey = keyboard_check_pressed(ord("1"));
var kbBuildKey = mouse_check_button_pressed(mb_left);
var kbSellKey = mouse_check_button_pressed(mb_right);


/* ACTUAL GAME CONTROLLING */

#region BUILDING MODE

/* BUILDING MODE ACTIVATION/DEACTIVATION */

if (kbBuildingModeKey) {
	// Entering/Exiting building mode.
	if (buildingMode == false) {
		buildingMode = true;
		
		// Instancing the Building Mark
		var mouseXgridPos = int64(mouse_x/64) * 64;
		var mouseYgridPos = int64(mouse_y/64) * 64;
		
		buildingMark = instance_create_layer(mouseXgridPos, mouseYgridPos, "UILayer", oBuildingMark);
	
	} else {
		buildingMode = false;
		
		instance_destroy(buildingMark);
	}
}


/* BUILDING MODE CONTROLLER */

if (buildingMode) {
	// Choosing which tower to build.
	if (kbBasicTowerKey) {
		towerToBuild = oBasicTower;		
	}
	
	// Building the tower at the mouse's position.
	if (kbBuildKey) {
		var mouseXgridPos = int64(mouse_x/64) * 64;
		var mouseYgridPos = int64(mouse_y/64) * 64;
		
		var xPosToCheck = mouseXgridPos + global.halfTileWidth;
		var yPosToCheck = mouseYgridPos + global.halfTileHeight;
		
		if (!instance_position(xPosToCheck, yPosToCheck, oTower) &&
			!instance_position(xPosToCheck, yPosToCheck, oSoilPath)) {
			if (towerToBuild != noone) {
				var towersMapIndex = -1;
				
				switch (towerToBuild) {
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
					
					instance_create_layer(xPosToCheck, yPosToCheck, "ExCornfieldLayer", oExCornfield);
					instance_create_layer(xPosToCheck, yPosToCheck, "TowersLayer", towerToBuild);
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

#endregion


/* GAME OVER CODE */

if (global.playerHp <= 0) {
	game_end();
}
