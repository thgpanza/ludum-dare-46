/// @description Tower Shooting Loop

#region SHOOTING THE CURRENT TARGET

if (instance_exists(target)) {
	var bullet = instance_create_layer(x, y, "BulletsLayer", oBasicBullet);
	bullet.ownedTowerRange = range;
	bullet.ownedTowerDamage = damage;
	bullet.speed = 1;
	bullet.direction = point_direction(x, y, target.x, target.y);
	alarm[0] = fireRate;
} else {
	isShooting = false;
}

#endregion
