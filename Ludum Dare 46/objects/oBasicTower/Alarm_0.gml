/// @description Tower Shooting Loop

if (instance_exists(target)) {
	var bullet = instance_create_layer(x, y, "BulletsLayer", oBasicBullet);
	bullet.speed = GetDeltaTime(bulletSpeed);
	bullet.direction = point_direction(x, y, target.x, target.y);
	alarm[0] = fireRate;
} else {
	shooting = false;
}
