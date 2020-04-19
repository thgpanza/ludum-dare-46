/// @description Hitting the Enemy

event_inherited();

// Decreasing the enemy's hp.
with (other) {
	hp -= damage;
}

// Destroying the bullet after hitting the enemy.
instance_destroy();
