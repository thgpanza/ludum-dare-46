/// @description Hit the Enemy

var damage = ownedTower.damage;

with (other) {
	hp -= damage;
}

instance_destroy();
