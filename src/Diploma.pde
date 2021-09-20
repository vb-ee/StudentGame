class Diploma {
  PVector pos;
  PImage diplom;
  float width;
  float height;
  float centerX;
  float centerY;
  float distX;
  float distY;
  float tx = 0;
  float ty = 10000;
  PVector velocity;
  float speed;
  boolean escaped = true;


  Diploma(float x, float y, float speed, float width, float height, String path) {
    pos = new PVector(x, y);
    this.width = width;
    this.height = height;
    diplom = loadImage(path);
    this.speed = speed;
  }


  boolean touchDiploma(boolean dipTouched) {
    distX = width/2 + talyp.width/2;
    distY = height/2 + talyp.height/2;
    centerX = pos.x + width/2;
    centerY = pos.y + height/2;
    if ((distOne(talyp.centerX, centerX) <= distX) && (distOne(talyp.centerY, centerY) <= distY)) {
      dipTouched = true;
    } else {
      dipTouched = false;
    }
    return dipTouched;
  }


  void moveDiploma() {
    pos.x = map(noise(tx), 0, 1, 500, 800);
    pos.y = map(noise(ty), 0, 1, 0, 300);
    tx += 0.006;
    ty += 0.006;
  }

  void displayDiploma() {
    image(diplom, pos.x, pos.y, width, height);
  }
}
