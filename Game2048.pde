// Grid will be GRIDSIZE number of rows and cols.
final int GRIDSIZE = 8;

Game game;

void setup() {
  size(800, 800);
  background(255);
  colorMode(HSB);

  game = new Game(GRIDSIZE);
}


void draw() {
  background(255);
  game.run();
}

void keyPressed() {
    if (key == CODED) {
      switch(keyCode) {
      case LEFT:
        game.goLeft();
        break;
      case UP:
        game.goUp();
        break;
      case DOWN:
        game.goDown();
        break;
      case RIGHT:
        game.goRight();
        break;
      }
      game.createNewTiles();
    }
    // createNewTiles();
   // game.handleInput(keyCode);
}
