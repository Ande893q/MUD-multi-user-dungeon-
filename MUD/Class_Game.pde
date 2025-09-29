class Game {
  Player player;

  Command command;


  Game() {
    ArrayList<Room> rooms = new ArrayList<Room>();
    ArrayList<Item> items =new ArrayList<Item>();
    ArrayList<Enemy> enemies =new ArrayList<Enemy>();
    
    player = new Player("Hero", 100, 5);
    command = new Command();

    String[]dataFileRooms=loadStrings("DataRooms.txt");
    String[][] splitDataFileRooms = new String[6][6];

    for (int i = 0; i < 6; i++) {
      splitDataFileRooms[i] = split(dataFileRooms[i], ',');
    }

    for (int i=0; i<splitDataFileRooms.length; i++) {
      Room r= new Room(splitDataFileRooms[i][1]);
      rooms.add(r);
    }


    String[]dataFileItems=loadStrings("DataItems.txt");
    String[][] splitDataFileItems = new String[6][6];

    for (int i = 0; i < 6; i++) {
      splitDataFileItems[i] = split(dataFileItems[i], ',');
    }

    for (int i=0; i<splitDataFileItems.length; i++) {
      Item r= new Room(splitDataFileItems[i][1]);
      items.add(r);
    }



    // Tilføj exits
    rooms.get(0).addExit("north", rooms.get(1));
    rooms.get(0).addExit("west", rooms.get(2));
    rooms.get(0).addExit("east", rooms.get(3));
    rooms.get(0).addExit("south", rooms.get(4));
    rooms.get(1).addExit("south", rooms.get(0));
    rooms.get(1).addExit("east", rooms.get(5));
    rooms.get(5).addExit("south", rooms.get(3));
    rooms.get(5).addExit("west", rooms.get(1));
    rooms.get(2).addExit("east", rooms.get(0));
    rooms.get(3).addExit("west", rooms.get(0));
    rooms.get(4).addExit("north", rooms.get(0));

    // Tilføj items
    rooms.get(0).addItem(sword);
    rooms.get(1).addItem(hammer);
    rooms.get(2).addItem(shield);
    rooms.get(3).addItem(bow);
    rooms.get(4).addItem(staff);
    rooms.get(5).addItem(boots);

    // Tilføj enemies
    rooms.get(0).addEnemy(goblin);
    rooms.get(1).addEnemy(bat);
    rooms.get(2).addEnemy(spider);
    rooms.get(3).addEnemy(orc);
    rooms.get(5).addEnemy(rabbit);

    // Sæt startlokation
    player.setLocation(rooms.get(0));
  }

  void start() {
    println("Game started!");
    println(player.currentRoom.description);
  }

  void gameloop() {
    // her kunne du opdatere input/output og game state

    if (getInput().inputText) {
      handleInput(input.getText());
      getInput().inputText=false;
      getInput().reset();
    }
  }

  void handleInput(String input) {
    command.parseInput(input, this);
  }
}
