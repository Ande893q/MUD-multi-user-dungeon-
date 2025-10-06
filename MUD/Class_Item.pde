class Item {
  String name="";
  String description;
  String use;
  int strengthAdd;
  int healthAdd;

  Item(String name, String description, String use, int strengthAdd, int healthAdd) {
    this.name=name;
    this.description=description;
    this.use=use;
    this.strengthAdd=strengthAdd;
    this.healthAdd=healthAdd;
  }

  void use() {
    println(use);
    
    game.player.strength += strengthAdd;
    println("Strength +" + strengthAdd);
    
    game.player.health += healthAdd;
    println("health +" + healthAdd);
    
  }
}
