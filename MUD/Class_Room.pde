class Room {
  //atributter
  String description;
  HashMap <String, Room> exits =new HashMap<String, Room>();
  ArrayList<Item> items=new ArrayList<Item>();
  ArrayList<Enemy> enemies=new ArrayList<Enemy>();

  //konstrukter
Room(String description){
  
this.description=description;
}


  //metoder
  Room getExit(String direction) {
    return exits.get(direction);
  }
  void addExit(String direction,Room room){
  exits.put(direction,room);
  }
  
  void addItem(Item item) {
    items.add(item);
  }
  void addEnemy(Enemy enemy) {
    enemies.add(enemy);
  }
}
