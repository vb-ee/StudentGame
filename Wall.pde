class Wall {
  PVector pos; 
  int width;
  int height;
  float centerX;
  float centerY;
  float distX;
  float distY;


  Wall(int x, int y, int width, int height) {
    pos = new PVector(x, y);
    this.width = width;
    this.height = height;
    centerX = pos.x + width/2;
    centerY = pos.y + height/2;
  }


  boolean touchWall(boolean wallTouched) { 
    distX = width/2 + talyp.width/2;
    distY = height/2 + talyp.height/2;
    if ((distOne(talyp.centerX, centerX) <= distX) && (distOne(talyp.centerY, centerY) <= distY)) {
      wallTouched = true;
    } else {
      wallTouched = false;
    }
    return wallTouched;
  }    


  void displayWall() {
    noStroke();
    fill(0);
    rect(pos.x, pos.y, width, height);
  }
} 
