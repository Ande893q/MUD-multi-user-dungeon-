class Item {
  String name="";
  String description;
  String use;

    Item(String name, String description, String use) {
    this.name=name;
    this.description=description;
    this.use=use;
  }

  void use() {
    println(use);
  }
}
