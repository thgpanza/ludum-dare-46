/// @description Tower AI

/* NEW SYSTEM */

target = noone;

if (instance_exists(oEnemy)) {
	for (var i = 0; i < instance_number(oEnemy); i++) {
		var enemy = instance_find(oEnemy, i);
		var distanceToEnemy = point_distance(x, y, enemy.x, enemy.y);
		
		if (distanceToEnemy <= range) {
			if (target = noone) {
				target = enemy;
			}
			
			var pathPos = enemy.path_position;
			
			if (pathPos > target.path_position) {
				target = enemy;
			}
		}
	}
	
	if (target != noone) {
		image_angle = point_direction(x, y, target.x, target.y);
		
		var distanceToTarget = point_distance(x, y, target.x, target.y);
		
		if (distanceToTarget <= range) {
			if (!isShooting) {
				isShooting = true;
				alarm[0] = 1;
			}
		} else {
			isShooting = false;
			target = noone;
		}
	}
}


/* OLD SYSTEM */

/*

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

*/
