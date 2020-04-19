/// @description Handling the UI

// Setting the draw color to white.
draw_set_color(c_white);

// Drawing the amount of corns owned by the player to the screen.
draw_text(room_width / 2, 32, global.playerCornsOwned);

// Drawing the player's remaining health to the screen.
draw_text(32, room_height - 32, global.playerHp);
