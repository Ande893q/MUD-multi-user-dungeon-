class Command {


  void parseInput(String input, Game game) {

    // Meget simpel input parser
    if (input == null) {
      input = "thiscommanddoesnotexist";
    } else if (input.contains("look")) {
      println(game.player.currentRoom.description);

      if (game.player.currentRoom.enemies.size()>0) {
        for (Enemy en : game.player.currentRoom.enemies) {
          println("Enemy: " + en.name + " - " + en.name);
        }
      }
    } else if (input.contains("items")) {

      if (game.player.currentRoom.items.size()>0) {
        for (Item it : game.player.currentRoom.items) {
          println("Item: " + it.name + " - " + it.description);
        }
      }
    } else if (input.contains("inventory")) {

      if (game.player.inventory.size()>0) {
        for (Item it : game.player.inventory) {
          println("Item: " + it.name + " - " + it.description);
        }
      }
    } else if (input.contains("north") && game.player.currentRoom.exits.containsKey("north")) {
      game.player.setLocation(game.player.currentRoom.exits.get("north"));
      println("You moved north to: " + game.player.currentRoom.description);
    } else if (input.contains("south") && game.player.currentRoom.exits.containsKey("south")) {
      game.player.setLocation(game.player.currentRoom.exits.get("south"));
      println("You moved south to: " + game.player.currentRoom.description);
    } else if (input.contains("west") && game.player.currentRoom.exits.containsKey("west")) {
      game.player.setLocation(game.player.currentRoom.exits.get("west"));
      println("You moved west to: " + game.player.currentRoom.description);
    } else if (input.contains("east") && game.player.currentRoom.exits.containsKey("east")) {
      game.player.setLocation(game.player.currentRoom.exits.get("east"));
      println("You moved east to: " + game.player.currentRoom.description);
    } else if (input.contains("take") && game.player.currentRoom.items.size()>0) {
      game.player.take(game.player.currentRoom.items.get(0));
      println("You picked up a: " + game.player.getLastItem().name);
    }else if (input.contains("stats")){
    println(game.player.health+" HP");
    println(game.player.strength+" ATK");
    }  
    
    else if (input.contains("attack")) {
      String[] split = input.split(" ");
      String[] split2 = split[1].split("");
      int index = Integer.valueOf(split2[0]);

      // Credit til min goat, ChatGPT
      if (index >= 0 && index < game.player.currentRoom.enemies.size()) {
        Enemy enemy = game.player.currentRoom.enemies.get(index);
        if (enemy != null) {
          game.player.attack(enemy);
          enemy.attack(game.player);
          println("Enemy: " + enemy.name + " - " + enemy.health + " HP");
          println("Player: " + game.player.name + " - " + game.player.health + " HP");
        }
      } else {
        println("enemy doesn't exist");
      }
    } else if (input.contains("use")) {
      String[] split = input.split(" ");
      String[] split2 = split[1].split("");
      int index = Integer.valueOf(split2[0]);

      // Credit til min goat, ChatGPT
      if (index >= 0 && index < game.player.inventory.size()) {
        Item item = game.player.inventory.get(index);
        if (item != null) {
          item.use();
        }
      } else {
        println("Item doesn't exist");
      }
    } else {
      println("Command not recognized.");
    }
  }
}
