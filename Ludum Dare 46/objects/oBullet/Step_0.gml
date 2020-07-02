/// @description Fixing the Bullet's Speed

// Adjusting the bullets' speed.
var trueSpeed = GetDeltaTime(ownedTowerMap[? "Bullet Speed"]);
speed = trueSpeed;

// Checking if the bullet is outside the range of it's tower.
if (point_distance(x, y, ownedTowerX, ownedTowerY) > ownedTowerRange) {
	instance_destroy();
}
