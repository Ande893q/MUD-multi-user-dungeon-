class Player {
  String name="";
  int health;
  int strength;
  Item lastItem;
  ArrayList<Item> inventory=new ArrayList<Item>();
  Room currentRoom;


  Player(String name, int health, int strength) {
    this.name=name;
    this.health=health;
    this.strength = strength;
  }

  void setLocation(Room room) {
    currentRoom=room;
  }

  void take(Item item) {
    inventory.add(item);
    lastItem=item;
  }

  void attack(Enemy enemy) {
    enemy.takeDamage(this.strength);  
  }
  
 Item getLastItem(){
 return lastItem;
 }
}
