class Player {
  String name="";
  int health;
  Item lastItem;
  ArrayList<Item> inventory=new ArrayList<Item>();
  Room currentRoom;


  Player(String name, int health) {
    this.name=name;
    this.health=health;
  }

  void move(String direction) {
  }
  void setLocation(Room room) {
  }

  void take(Item item) {
    inventory.add(item);
    lastItem=item;
  }

  void attack(Enemy enemy) {
  }
  
 Item getLastItem(){
 return lastItem;
 }
}
