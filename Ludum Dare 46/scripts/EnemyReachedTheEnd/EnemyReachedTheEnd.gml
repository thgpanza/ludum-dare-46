/// @description EnemyReachedTheEnd(damage)
/// @param damage

/*
 * Damages the player after an enemy reaches the end.
 */

global.playerHp -= argument0;

instance_destroy();
