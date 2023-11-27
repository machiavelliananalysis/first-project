class Circle {
  float x, y;
  float radius;

  Circle(float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
  }

  void display() {
    ellipse(x, y, radius * 2, radius * 2);
  }
}
