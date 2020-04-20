/// @description Tower Shooting Loop

/* As long as the target still exists, instantiate the bullet and send it towards the target in
 *     a straight line.
 */
if (instance_exists(target)) {
	var bullet = instance_create_layer(x, y, "BulletsLayer", oBasicBullet);
	bullet.ownedTower = self;
	bullet.speed = 1;
	bullet.direction = point_direction(x, y, target.x, target.y);
	alarm[0] = fireRate;
} else {
	isShooting = false;
}
