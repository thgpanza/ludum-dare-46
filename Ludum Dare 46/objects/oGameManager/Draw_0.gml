/// @description Handling the UI

if (room = rNightZone) {
	var cornsTextX = (room_width / 2) - 50;
	var cornsTextY = 32;

	var hpTextX = 36;
	var hpTextY = room_height - 32;

	var turnTextX = 228;
	var turnTextY = room_height - 32;

	// Drawing the amount of corns owned by the player to the screen.
	draw_set_color(c_black);
	draw_set_alpha(0.4);
	draw_rectangle(cornsTextX - 16, cornsTextY - 4, cornsTextX + 114, cornsTextY + 24, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(cornsTextX, cornsTextY, "Corns: " + string(global.playerCornsOwned));

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
	draw_text(turnTextX, turnTextY, "Turn: " + string(global.turn));
}
