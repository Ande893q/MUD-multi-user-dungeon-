class Command {


  void parseInput(String input, Game game) {
    // Meget simpel input parser
    if (input.equals("look")) {
      println(game.player.currentRoom.description);

      if (game.player.currentRoom.enemies.size()>0) {
        for (Enemy en : game.player.currentRoom.enemies) {
          println("Enemy: " + en.name + " - " + en.name);
        }
      }
    } else if (input.equals("items")) {

      if (game.player.currentRoom.items.size()>0) {
        for (Item it : game.player.currentRoom.items) {
          println("Item: " + it.name + " - " + it.description);
        }
      }
    } else if (input.equals("north") && game.player.currentRoom.exits.containsKey("north")) {
      game.player.setLocation(game.player.currentRoom.exits.get("north"));
      println("You moved north to: " + game.player.currentRoom.description);
    } else if (input.equals("south") && game.player.currentRoom.exits.containsKey("south")) {
      game.player.setLocation(game.player.currentRoom.exits.get("south"));
      println("You moved south to: " + game.player.currentRoom.description);
    } else if (input.equals("take") && game.player.currentRoom.items.size()>0) {
      game.player.take(game.player.currentRoom.items.get(0));
      println("You pickedup a: " + game.player.getLastItem());
    } else {
      println("Command not recognized.");
    }
  }
}
