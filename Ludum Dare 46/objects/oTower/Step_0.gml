/// @description Tower AI

// If it isn't shooting, start shooting the nearest enemy.
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
