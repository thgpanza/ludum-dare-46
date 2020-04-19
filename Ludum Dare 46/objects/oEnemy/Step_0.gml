/// @description Setting the Enemy Speed

// Adjusting the enemies' speed.
var trueSpeed = GetDeltaTime(moveSpeed);
path_speed = trueSpeed;

// Dealing damage to the player when reaching the end of the path alive.
if (path_position == 1) {
	script_execute(EnemyReachedTheEnd, damage);
}

// Death Code
if (hp <= 0) {
	global.playerCornsOwned += cornValue;
	
	instance_destroy();
}
