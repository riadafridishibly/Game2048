class Game {

  int gridSize;
  Tile[][] tiles;

  boolean moved;

  float[] pos;


  Game(int n) {
    gridSize = n;
    init();
  }

  void init() {
    moved = false;
    tiles = new Tile[gridSize][gridSize];

    float f = height / gridSize;

    for (int i = 0; i < gridSize; ++i) {
      for (int j = 0; j < gridSize; ++j) {
        tiles[i][j] = new Tile(j * f + f / 2, i * f + f / 2, 0);
      }
    }
    createNewTiles();
  }

  void createNewTiles() {
    ArrayList<Tile> items = getEmptyTiles();
    if (items.size() < 3 && moved == true)
      return;
    if (items.size() > 0) {
      int cnt = 0;

      for (int i = 0; i < items.size(); ++i) {
        if (cnt == 2)
          return;
        float r = random(1);
        if (r < 0.10) {
          items.get(i).setValue(2);
          cnt++;
        }
      }
      if (cnt < 2) {
        items.get(0).setValue(2);
        items.get(items.size() - 1).setValue(2);
      }
    } else {
      //noLoop();
      println("GameOVER Possibly");
    }
  }

  void run() {


    show();
  }

  void show() {
    for (Tile[] arr : tiles) {
      for (Tile t : arr) {
        if (t != null)
          t.show();
      }
    }
  }

  // void handleInput(int x) {
  // }

  ArrayList<Tile> getEmptyTiles() {
    ArrayList <Tile> ret = new ArrayList<Tile>();
    for (int i = 0; i < gridSize; ++i) {
      for (int j = 0; j < gridSize; ++j) {
        Tile t = tiles[i][j];
        if (t.empty()) {
          ret.add(t);
        }
      }
    }
    return ret;
  }

  // Horrible code. There must be some better ways to do the same thing.
  // But quick and dirty way. -_-

  void goLeft() {
    for (int r = 0; r < gridSize; ++r) {
      ArrayList<Tile> list = new ArrayList<Tile>();
      for (int i = 0; i < gridSize; ++i) {
        Tile t = tiles[r][i];
        if (!t.empty()) {
          list.add(t);
        }
      }
      for (int i = 1; i < list.size(); ++i) {
        int v1 = list.get(i - 1).getValue();
        int v2 = list.get(i).getValue();
        if (v1 == v2) {
          list.get(i - 1).setValue(v1 + v2);
          list.get(i).setValue(0);
          ++i;
        }
      }
      ArrayList<Tile> valid = new ArrayList<Tile>();

      for (int i = 0; i < gridSize; ++i) {
        Tile t = tiles[r][i];
        if (!t.empty())
          valid.add(t);
      }
      for (int i = 0; i < valid.size(); ++i) {
        Tile t = tiles[r][i];
        if (t.mPosX != valid.get(i).mPosX) {
          tiles[r][i].setValue(valid.get(i).getValue());
          valid.get(i).setValue(0);
          moved = true;
        } else {
          moved = false;
        }
      }
    }
  }

  void goRight() {
    for (int r = 0; r < gridSize; ++r) {
      ArrayList<Tile> list = new ArrayList<Tile>();
      for (int i = gridSize - 1; i >= 0; --i) {
        Tile t = tiles[r][i];
        if (!t.empty()) {
          list.add(t);
        }
      }
      for (int i = 1; i < list.size(); ++i) {
        int v1 = list.get(i - 1).getValue();
        int v2 = list.get(i).getValue();
        if (v1 == v2) {
          list.get(i - 1).setValue(v1 + v2);
          list.get(i).setValue(0);
          ++i;
        }
      }
      ArrayList<Tile> valid = new ArrayList<Tile>();

      for (int i = gridSize - 1; i >= 0; --i) {
        Tile t = tiles[r][i];
        if (!t.empty())
          valid.add(t);
      }
      for (int i = 0; i < valid.size(); ++i) {
        Tile t = tiles[r][gridSize - 1 - i];
        if (t.mPosX != valid.get(i).mPosX) {
          tiles[r][gridSize - 1 - i].setValue(valid.get(i).getValue());
          valid.get(i).setValue(0);
          moved = true;
        } else {
          moved = false;
        }
      }
    }
  }

  void goUp() {
    for (int c = 0; c < gridSize; ++c) {
      ArrayList<Tile> list = new ArrayList<Tile>();
      for (int i = 0; i < gridSize; ++i) {
        Tile t = tiles[i][c];
        if (!t.empty()) {
          list.add(t);
        }
      }
      for (int i = 1; i < list.size(); ++i) {
        int v1 = list.get(i - 1).getValue();
        int v2 = list.get(i).getValue();
        if (v1 == v2) {
          list.get(i - 1).setValue(v1 + v2);
          list.get(i).setValue(0);
          ++i;
        }
      }
      ArrayList<Tile> valid = new ArrayList<Tile>();

      for (int i = 0; i < gridSize; ++i) {
        Tile t = tiles[i][c];
        if (!t.empty())
          valid.add(t);
      }
      for (int i = 0; i < valid.size(); ++i) {
        Tile t = tiles[i][c];
        if (t.mPosY != valid.get(i).mPosY) {
          tiles[i][c].setValue(valid.get(i).getValue());
          valid.get(i).setValue(0);
          moved = true;
        } else {
          moved = false;
        }
      }
    }
  }

  void goDown() {
    for (int c = 0; c < gridSize; ++c) {
      ArrayList<Tile> list = new ArrayList<Tile>();
      for (int i = gridSize - 1; i >= 0; --i) {
        Tile t = tiles[i][c];
        if (!t.empty()) {
          list.add(t);
        }
      }
      for (int i = 1; i < list.size(); ++i) {
        int v1 = list.get(i - 1).getValue();
        int v2 = list.get(i).getValue();
        if (v1 == v2) {
          list.get(i - 1).setValue(v1 + v2);
          list.get(i).setValue(0);
          ++i;
        }
      }
      ArrayList<Tile> valid = new ArrayList<Tile>();

      for (int i = gridSize - 1; i >= 0; --i) {
        Tile t = tiles[i][c];
        if (!t.empty())
          valid.add(t);
      }
      for (int i = 0; i < valid.size(); ++i) {
        Tile t = tiles[gridSize - 1 - i][c];
        if (t.mPosY != valid.get(i).mPosY) {
          tiles[gridSize - 1 - i][c].setValue(valid.get(i).getValue());
          valid.get(i).setValue(0);
          moved = true;
        } else {
          moved = false;
        }
      }
    }
  }
}
