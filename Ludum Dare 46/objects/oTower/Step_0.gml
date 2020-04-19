/// @description Tower AI

// If the tower isn't shooting and there's at least one enemy in range, start shooting the nearest enemy.
var enemy = instance_nearest(x, y, oEnemy);

if (enemy != noone) {
	if (point_distance(x, y, enemy.x, enemy.y) <= range) {
		if (!isShooting) {
			isShooting = true;
			alarm[0] = 1;
		}
		target = enemy;
	} else {
		isShooting = false;
		target = noone;
	}
}
