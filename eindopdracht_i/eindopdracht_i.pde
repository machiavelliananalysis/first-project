ArrayList<PVector> snakeTail = new ArrayList<PVector>();
PVector pos;
PVector food;
PVector dir = new PVector(0, 0);
int size = 30;
int w, h;
int len = 5;
int score = 0;

void setup() {
  frameRate(10);
  size(1000, 800);
  w = width / size;
  h = height / size;

  pos = new PVector(w / 2, h / 2);
  food = new PVector(int(random(w)), int(random(h)));

  noStroke();
  fill(0);
}

void draw() {
  background(0);
  drawSnake();
  updateSnake();
  drawFood();
  displayScore();
}

void drawFood() {
  fill(0, 250, 0);
  rect(food.x * size, food.y * size, size, size);
}

void newFood() {
  food = new PVector(int(random(w)), int(random(h)));
}

void drawSnake() {
  fill(0, 150, 150);
  rect(pos.x * size, pos.y * size, size, size);
  for (int i = 0; i < snakeTail.size(); i++) {
    rect(snakeTail.get(i).x * size, snakeTail.get(i).y * size, size, size);
  }
}

void updateSnake() {
  fill(0, 150, 150);
  snakeTail.add(new PVector(pos.x, pos.y));
  while (snakeTail.size() > len) {
    snakeTail.remove(0);
  }
  pos.add(dir);

  if (pos.x == food.x && pos.y == food.y) {
    newFood();
    len += 1;
    score += 10;
  }

  for (int i = 0; i < snakeTail.size(); i++) {
    if (pos.x == snakeTail.get(i).x && pos.y == snakeTail.get(i).y) {
      resetGame();
    }
  }

  if (pos.x < 0) {
    pos.x = w - 1;
  }
  if (pos.x > w) {
    pos.x = 0;
  }
  if (pos.y < 0) {
    pos.y = h - 1;
  }
  if (pos.y > h) {
    pos.y = 0;
  }
}

void resetGame() {
  len = 5;
  pos = new PVector(w / 2, h / 2);
  newFood();
  snakeTail = new ArrayList<PVector>();
  dir = new PVector(0, 0);
  score = 0; 
}

void displayScore() {
  fill(255);
  textSize(20);
  text("Score: " + score, 20, 30);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      dir = new PVector(0, -1);
    }
    if (keyCode == DOWN) {
      dir = new PVector(0, 1);
    }
    if (keyCode == RIGHT) {
      dir = new PVector(1, 0);
    }
    if (keyCode == LEFT) {
      dir = new PVector(-1, 0);
    }
  }
}
