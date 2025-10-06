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
    String[][] splitDataFileRooms = new String[dataFileRooms.length][dataFileRooms[0].length()-1];

    for (int i = 0; i < 6; i++) {
      splitDataFileRooms[i] = split(dataFileRooms[i], ',');
    }

    for (int i=0; i<splitDataFileRooms.length; i++) {
      Room r= new Room(splitDataFileRooms[i][1]);
      rooms.add(r);
    }


    String[]dataFileItems=loadStrings("DataItems.txt");
    String[][] splitDataFileItems = new String[dataFileItems.length][dataFileItems[0].length()-1];

    for (int i = 0; i < 6; i++) {
      splitDataFileItems[i] = split(dataFileItems[i], ',');
    }

    for (int i=0; i<splitDataFileItems.length; i++) {
      Item r= new Item(splitDataFileItems[i][0], splitDataFileItems[i][1], splitDataFileItems[i][2]);
      items.add(r);
    }


    String[]dataFileEnemies=loadStrings("DataEnemies.txt"); //<>//
    String[][] splitDataFileEnemies = new String[dataFileEnemies.length][3];

    for (int i = 0; i < splitDataFileEnemies.length; i++) {
      splitDataFileEnemies[i] = split(dataFileEnemies[i], ','); //<>//
    }
    
      for (int i=0; i<splitDataFileEnemies.length; i++) {
      Enemy r= new Enemy(splitDataFileEnemies[i][0], Integer.valueOf(splitDataFileEnemies[i][1]), Integer.valueOf(splitDataFileEnemies[i][2]));
      enemies.add(r);
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
    rooms.get(0).addItem(items.get(0));
    rooms.get(1).addItem(items.get(1));
    rooms.get(2).addItem(items.get(2));
    rooms.get(3).addItem(items.get(3));
    rooms.get(4).addItem(items.get(4));
    rooms.get(5).addItem(items.get(5));

    // Tilføj enemies
    rooms.get(0).addEnemy(enemies.get(0));
    rooms.get(1).addEnemy(enemies.get(1));
    rooms.get(2).addEnemy(enemies.get(2));
    rooms.get(3).addEnemy(enemies.get(3));
    rooms.get(5).addEnemy(enemies.get(4));

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
