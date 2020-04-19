/// @description Fixing the Bullet's Speed

// Adjusting the bullets' speed.
var trueSpeed = GetDeltaTime(ownedTowerMap[? "Bullet Speed"]);
speed = trueSpeed;

// Checking if the bullet is outside the screen and destroying it.
if (x < 0 || x > room_width || y < 0 || y > room_height) {
	instance_destroy();
}
