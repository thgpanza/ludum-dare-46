/// @description Fixing the Bullet's Speed

// Getting owned tower's position.
if (!isPositionStored) {
	ownedTowerX = ownedTower.x;
	ownedTowerY = ownedTower.y;
	ownedTowerRange = ownedTower.range;
	
	isPositionStored = true;
}

// Adjusting the bullets' speed.
var trueSpeed = GetDeltaTime(ownedTowerMap[? "Bullet Speed"]);
speed = trueSpeed;

// Checking if the bullet is outside the range of it's tower.
if (point_distance(x, y, ownedTowerX, ownedTowerY) > ownedTowerRange) {
	instance_destroy();
}
