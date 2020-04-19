/// @description Setting the Enemy Speed

var trueSpeed = GetDeltaTime(moveSpeed);
path_speed = trueSpeed;

if (path_position == 1) {
	script_execute(EnemyReachedTheEnd, damage);
}

// Death Code
if (hp <= 0) {
	global.playerCornsOwned += cornValue;
	
	instance_destroy();
}
