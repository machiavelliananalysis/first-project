int gridSize = 20;
int cols, rows;
ArrayList<Cell> snake;
PVector dir;
boolean gameOver;
boolean foodEaten;
Cell food;

void setup() {
  size(400, 400);
  frameRate(10);
  cols = width / gridSize;
  rows = height / gridSize;
  dir = new PVector(1, 0);
  snake = new ArrayList<Cell>();
  snake.add(new Cell(floor(cols / 2), floor(rows / 2)));
  placeFood();
  gameOver = false;
  foodEaten = false;
}

void draw() {
  background(51);
  if (!gameOver) {
    moveSnake();
    checkCollision();
    eatFood();
  }
  drawGrid();
  drawSnake();
  drawFood();
  if (gameOver) {
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Game Over", width / 2, height / 2);
  }
}

void keyPressed() {
  if (keyCode == UP && dir.y == 0) {
    dir.set(0, -1);
  } else if (keyCode == DOWN && dir.y == 0) {
    dir.set(0, 1);
  } else if (keyCode == LEFT && dir.x == 0) {
    dir.set(-1, 0);
  } else if (keyCode == RIGHT && dir.x == 0) {
    dir.set(1, 0);
    } else if (key == ' ' || key == ENTER) {
    // Reset the game when the space bar or enter key is pressed
    resetGame();
  }
}

} else if (key == ' ' || key == ENTER) {
    // Reset the game when the space bar or enter key is pressed
    resetGame();

void moveSnake() {
  if (!gameOver) {
    Cell head = snake.get(0).copy();
    head.add(dir);
    snake.add(0, head);
    if (!foodEaten) {
      snake.remove(snake.size() - 1);
    } else {
      foodEaten = false;
      placeFood();
    }
  }
}

void checkCollision() {
  Cell head = snake.get(0);
  if (head.x < 0 || head.x >= cols || head.y < 0 || head.y >= rows) {
    gameOver = true;
  }
  for (int i = 1; i < snake.size(); i++) {
    if (head.equals(snake.get(i))) {
      gameOver = true;
      break;
    }
  }
}

void eatFood() {
  Cell head = snake.get(0);
  if (head.equals(food)) {
    foodEaten = true;
  }
}

void placeFood() {
  int x = floor(random(cols));
  int y = floor(random(rows));
  food = new Cell(x, y);
}

void drawGrid() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      stroke(0);
      noFill();
      rect(i * gridSize, j * gridSize, gridSize, gridSize);
    }
  }
}

void drawSnake() {
  fill(255, 255, 0);
  for (Cell cell : snake) {
    rect(cell.x * gridSize, cell.y * gridSize, gridSize, gridSize);
  }
}

void drawFood() {
  fill(255, 0, 0);
  rect(food.x * gridSize, food.y * gridSize, gridSize, gridSize);
}

class Cell {
  int x, y;

  Cell(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void add(PVector v) {
    this.x += v.x;
    this.y += v.y;
  }

  boolean equals(Cell other) {
    return this.x == other.x && this.y == other.y;
  }

  Cell copy() {
    return new Cell(this.x, this.y);
  }
}
