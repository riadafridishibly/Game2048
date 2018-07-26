class Tile {
  float mPosX, mPosY;
  float mTileSize;
  int mValue = 0;

  Tile(float _posX, float _posY, int _value) {
    mPosX = _posX;
    mPosY = _posY;
    mValue = _value;
    mTileSize = height / GRIDSIZE - 10;
  }

  void show() {

    if (mValue < 2) {
      return;
    }

    pushStyle();

    rectMode(CENTER);
    noStroke();

    float tColor = map(Util.log2(mValue), 0, Util.log2(2048), 0, 255);
    fill(color(tColor, 255, 255));

    rect(mPosX, mPosY, mTileSize, mTileSize, 11);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(50);

    String txt = Integer.toString(mValue);
    text(txt, mPosX, mPosY);

    popStyle();
  }

  void setValue(int x) {
    mValue = x;
  }

  int getValue() {
    return mValue;
  }

  boolean empty() {
    return mValue < 2;
  }

  void move() {
  }
}
