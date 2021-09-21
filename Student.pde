class Student {
  PImage talyp;
  PVector pos;
  PVector initialPos;
  float speed;
  float width;
  float height;
  float centerX;
  float centerY;
  boolean dead = false;


  Student(float x, float y, float width, float height, float speed, String path ) {
    pos = new PVector(x, y);
    initialPos = new PVector(x, y);
    this.width = width;
    this.height = height;
    this.speed = speed;
    talyp = loadImage(path);
  }


  void move() {
    constrainStudent();
    if (keys[UP]) {
      pos.y -= speed;
    }

    if (keys[DOWN]) {
      pos.y += speed;
    }

    if (keys[RIGHT]) {
      pos.x += speed;
    }

    if (keys[LEFT]) {
      pos.x -= speed;
    }
  }

  void checkDead() {
    if (dead) {
      delay(1000);
      dead = false;
    }
  }

  void constrainStudent() {
    pos.x = constrain(pos.x, 0, 800-width);
    pos.y = constrain(pos.y, 0, 600-height);
  }

  void displayStudent() {
    image(talyp, pos.x, pos.y, width, height);
  }

  void resetStudent() {
    if (level >= 6 && level <= 9) {
      initialPos.x = 150;
      initialPos.y = 300;
    } else if (level >=10) {
      initialPos.x = 100;
      initialPos.y = 500;
    }
    pos.x = initialPos.x;
    pos.y = initialPos.y;
    //dead = true;
  }
}
