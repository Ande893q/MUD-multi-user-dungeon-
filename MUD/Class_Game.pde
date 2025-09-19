
class Game {
  Player player;
  ArrayList<Room> rooms;
  Command command;

  Game() {
    rooms = new ArrayList<Room>();
    player = new Player("Hero", 100);
    command = new Command();

    // Opret et eksempelrum
    Room r1 = new Room("You are in a dark cave.");
    Room r2 = new Room("You are in a sunny meadow.");
    r1.addExit("north", r2);
    r2.addExit("south", r1);

    // Tilføj items og enemies
    Item sword = new Item("Sword", "A sharp blade.", "Increase attack");
    Item hammer = new Item("hammer", "Realy heavy.", "Decrease attack");
    Enemy goblin = new Enemy("Goblin", 30, 5);

    r1.addItem(sword);
    r2.addItem(hammer);
    r1.addEnemy(goblin);

    rooms.add(r1);
    rooms.add(r2);

    player.setLocation(r1);
  }

  void start() {
    println("Game started!");
    println(player.location.description);
  }

  void gameloop() {
    // her kunne du opdatere input/output og game state

    input.display(); // viser tekstbox på canvas




    if (inputText) {
      handleInput(input.getText());
      inputText=false;
      input.reset();
    }
  }

  void handleInput(String input) {
    command.parseInput(input, this);
  }
}
