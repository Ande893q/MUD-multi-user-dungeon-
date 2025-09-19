class Command {


  void parseInput(String input, Game game) {
    // Meget simpel input parser
    if (input.equals("look")) {
      println(game.player.location.description);

      if (game.player.location.enemies.size()>0) {
        for (Enemy en : game.player.location.enemies) {
          println("Enemy: " + en.name + " - " + en.name);
        }
      }
    } else if (input.equals("items")) {

      if (game.player.location.items.size()>0) {
        for (Item it : game.player.location.items) {
          println("Item: " + it.name + " - " + it.description);
        }
      }
    } else if (input.equals("north") && game.player.location.exits.containsKey("north")) {
      game.player.setLocation(game.player.location.exits.get("north"));
      println("You moved north to: " + game.player.location.description);
    } else if (input.equals("south") && game.player.location.exits.containsKey("south")) {
      game.player.setLocation(game.player.location.exits.get("south"));
      println("You moved south to: " + game.player.location.description);
    } else if (input.equals("take") && game.player.location.items.size()>0) {
      game.player.pickUp(game.player.location.items.get(0));
      println("You pickedup a: " + game.player.getLastItem());
    } else {
      println("Command not recognized.");
    }
  }
}
