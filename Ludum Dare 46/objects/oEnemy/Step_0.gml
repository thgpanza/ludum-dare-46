/// @description Setting the Enemy Speed

path_speed = GetDeltaTime(mySpeed);

if (path_position == 1) {
	script_execute(EnemyReachedTheEnd, myDamage);
}
