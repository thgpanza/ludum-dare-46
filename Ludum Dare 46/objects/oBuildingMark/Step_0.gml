/// @description Re-positioning

// Handling the X Position
if (mouse_x < lastXpoint) {
	x = int64(mouse_x/64) * 64;
} else {
	x = int64(lastXpoint/64) * 64;
}

// Handling the Y Position
if (mouse_y < lastYpoint) {
	y = int64(mouse_y/64) * 64;
} else {
	y = int64(lastYpoint/64) * 64;
}
