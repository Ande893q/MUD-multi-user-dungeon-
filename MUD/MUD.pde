import processing.core.*; //<>// //<>//

Game game;
Input input = new Input();


void setup() {
  size(400, 400);
  game=new Game();
  game.start();
  getInput().display();
  
}


void draw() {
  game.gameloop();
}

Input getInput() {
  return input;
}

void keyPressed() {
  if (key == ENTER) {
    getInput().inputText = true;
  }
}

void commandBox(){


}
