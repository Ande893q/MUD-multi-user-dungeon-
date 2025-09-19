class Player {
  String name="";
  int health=100;
  ArrayList<Item> inventory=new ArrayList<Item>();
  Room currentRoom;


  Player(String name) {
    this.name=name;
  }

  void move(String direction) {
  }
  void take(Item item) {
  }

  void attack(Enemy enemy) {
  }
}
