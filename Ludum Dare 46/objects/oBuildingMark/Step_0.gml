/// @description Re-positioning

#region HANDLING THE X POSITION

if (mouse_x > 0 && mouse_x < lastXpoint) {
	x = int64(mouse_x/64) * 64;
} else {
	if (mouse_x < 0) {
		x = 0;
	} else {
		x = int64(lastXpoint/64) * 64;
	}
}

#endregion

#region HANDLING THE Y POSITION

if (mouse_y > 0 && mouse_y < lastYpoint) {
	y = int64(mouse_y/64) * 64;
} else {
	if (mouse_y < 0) {
		y = 0;
	} else {
		y = int64(lastYpoint/64) * 64;
	}
}

#endregion
