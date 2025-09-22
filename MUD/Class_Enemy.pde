class Enemy {
  String name="";
  int health;
  int strength;

  Enemy(String name,int health, int strength) {
    this.name=name;
    this.health=health;
    this.strength=strength;
  }

  void attack(Player player) {
    player.health-=this.strength;
  }

  void takeDamage(int dmg) {
    this.health-=dmg;
  }
}
