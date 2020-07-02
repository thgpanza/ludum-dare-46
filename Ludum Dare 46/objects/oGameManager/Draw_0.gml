/// @description Handling the UI

#region DAYLIGHT ZONE UI

if (room = rDaylightZone) {
	var coinsTextBackgroundX = (room_width / 2) - (global.halfTileWidth * 2);
	var coinsTextBackgroundY = global.halfTileHeight;
	
	// Drawing the amount of coins owned by the player to the screen.
	draw_set_color(c_black);
	draw_set_alpha(0.4);
	draw_rectangle(coinsTextBackgroundX, coinsTextBackgroundY - 4, coinsTextBackgroundX + (global.halfTileWidth * 4), coinsTextBackgroundY + 24, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(coinsTextBackgroundX + 8, coinsTextBackgroundY, "Coins: " + string(global.playerCoinsOwned));
}

#endregion

#region NIGHT ZONE UI

if (room = rNightZone) {
	var cornsTextBackgroundX = (room_width / 2) - (global.halfTileWidth * 2);
	var cornsTextBackgroundY = global.halfTileWidth;

	var hpTextX = 36;
	var hpTextY = room_height - 32;

	var turnTextX = 228;
	var turnTextY = room_height - 32;

	// Drawing the amount of corns owned by the player to the screen.
	draw_set_color(c_black);
	draw_set_alpha(0.4);
	draw_rectangle(cornsTextBackgroundX, cornsTextBackgroundY - 4, cornsTextBackgroundX + (global.halfTileWidth * 4), cornsTextBackgroundY + 24, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(cornsTextBackgroundX + 8, cornsTextBackgroundY, "Corns: " + string(global.playerCornsOwned));

	// Drawing the player's remaining health to the screen.
	draw_set_color(c_black);
	draw_set_alpha(0.4);
	draw_rectangle(hpTextX - 12, hpTextY - 4, hpTextX + 70, hpTextY + 24, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(hpTextX, hpTextY, "HP: " + string(global.playerHp));

	// Drawing the current turn to the screen.
	draw_set_color(c_black);
	draw_set_alpha(0.4);
	draw_rectangle(turnTextX - 12, turnTextY - 4, turnTextX + 90, turnTextY + 24, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(turnTextX, turnTextY, "Turn: " + string(global.turn + 1));
}

#endregion
