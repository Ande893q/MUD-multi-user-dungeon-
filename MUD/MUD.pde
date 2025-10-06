import processing.core.*; //<>// //<>//

Game game;
Input input = new Input();


void setup() {
  size(400, 400);
  game=new Game();
  game.start();
  getInput().display();
  commandBox();
 
}


void draw() {
  game.gameloop();
   inventory();
}

Input getInput() {
  return input;
}

void keyPressed() {
  if (key == ENTER) {
    getInput().inputText = true;
  }
}

void commandBox() {
  int textSize = 20;
  int textOffset = 2;
  textSize(textSize);

  rect(0, 0, 150, textSize*11+textOffset);
  fill(0);
  text("\"attack <index>\"", textOffset, textSize);
  text("\"use <index>\"", textOffset, textSize*2);
  text("\"look\"", textOffset, textSize*3);
  text("\"take\"", textOffset, textSize*4);
  text("\"inventory\"", textOffset, textSize*5);
  text("\"stats\"", textOffset, textSize*6);
  text("\"north\"", textOffset, textSize*7);
  text("\"east\"", textOffset, textSize*8);
  text("\"south\"", textOffset, textSize*9);
  text("\"west\"", textOffset, textSize*10);
  text("\"items\"", textOffset, textSize*11);
}

void inventory() {
  int textSize=20;
  int textOffset=2;

  fill(255);
  rect(200, 0, 200, 160);
  fill(1);
    textSize(textSize*1.5);
  text("Inventory", 250, textSize*1.5);
  textSize(textSize);
  
    for (int i = 0; i < game.player.inventory.size(); i++) {
    Item item = game.player.inventory.get(i);
    text(i + ": " + item.name, 200 + textOffset, textSize * i + 50);
  }
}
  
  
 
