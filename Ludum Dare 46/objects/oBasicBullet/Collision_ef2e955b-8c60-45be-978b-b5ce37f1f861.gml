/// @description Hitting the Enemy

// Decreasing the enemy's hp.
with (other) {
	hp -= other.ownedTowerDamage;
}

// Destroying the bullet after hitting the enemy.
instance_destroy();
