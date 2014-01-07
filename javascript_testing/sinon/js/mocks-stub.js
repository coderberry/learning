var Combat = function() {
};

Combat.prototype.attack = function(attacker, defender) {
  if (attacker.calculateHit(defender)) {
    defender.takeDamage(attacker.damage);
  }
};

var Character = function() {
};

Character.prototype.calculateHit = function() {
  // ...
};

Character.prototype.takeDamage = function() {
  // ...
};

