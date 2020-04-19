/// @description EnemyReachedTheEnd(damage)
/// @param damage The amout of hp that the player will lose if an enemy reaches
///                   the end of the path.

global.playerHp -= argument0;

instance_destroy();
