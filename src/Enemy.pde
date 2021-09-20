class Enemy {
  PVector pos;
  PVector initialPos;
  float width, height;
  float speed;
  PImage enemy;
  float centerX;
  float centerY;
  float distX;
  float distY;
  float tx = 0;
  float ty = 10000;
  PVector velocity;
  PVector target;
  boolean enemyDisplayed = false;
  boolean oneTime = true;
  float speedX = 5;
  float speedY = 5;


  Enemy (float x, float y, float speed, float width, float height, String path) {
    pos = new PVector(x, y);
    initialPos = new PVector(x, y);
    this.speed = speed;
    this.width = width;
    this.height = height;
    enemy = loadImage(path);
  }


  void moveEnglish() {
    pos.x += speed;
    if (pos.x == 230) {
      speed = -speed;
    } else if (pos.x == 544) {
      speed = -speed;
    }
  }

  void moveMath(float targetX, float targetY) {
    if (level == 4) {
      pos.x = constrain(pos.x, 231, 544);
      pos.y = constrain(pos.y, 215, 360);
      if ((pos.x <= 231 || pos.x >= 544)) {
        pos.y = constrain(pos.y, 250, 275);
      }
    }
    target = new PVector(targetX, targetY);
    target.sub(pos);
    target.setMag(0.7);
    velocity = target;
    pos.add(velocity);
  }


  void moveInnovation(float targetX, float targetY) {
    if (pos.x <= 3 || pos.x >= 795 || pos.y <= 3 || pos.y >= 595) {
      for (int i=7; i<=9; i++) {
        pos.x = random(50, 700); 
        pos.y = random(50, 500);
      }
      oneTime = true;
    }

    if (oneTime) {
      float dx = targetX - pos.x;
      float dy = targetY - pos.y;
      float angle = atan2(dy, dx);
      speedX = speed * cos(angle);
      speedY = speed * sin(angle);
      oneTime = false;
    }
    pos.x += speedX;
    pos.y += speedY;
  }


  void moveAttestation() {
    fill(255, 0, 0, 120);
    ellipse(centerX, centerY, 150, 150);
    pos.x = map(noise(tx), 0, 1, 220, 550);
    pos.y = map(noise(ty), 0, 1, 200, 390);
    tx += 0.005;
    ty += 0.005;
  }

  void applyToAtt() {
    fill(255, 0, 0, 120);
    float borderSize = 75 +talyp.width/2;
    float mag = 3;
    if (level == 10) {
      ellipse(centerX, centerY, 240, 240);
      borderSize = 120 + talyp.width/2;
      mag = 8;
    } else {    
      ellipse(centerX, centerY, 150, 150);
    }
    if (dist(talyp.centerX, talyp.centerY, centerX, centerY) <= borderSize) {
      target = new PVector(centerX, centerY);
      target.sub(talyp.pos);
      target.setMag(mag);
      velocity = target;
      talyp.pos.add(velocity);
    }
  }

  void lastLevelMove() {
    distX = width/2;
    distY = height/2;
    centerX = pos.x + width/2;
    centerY = pos.y + height/2;

    if (distOne(centerX, 800) <= distX) {
      speedX = -speedX;
    } else if (distOne(centerX, 0) <= distX) {
      speedX = -speedX;
    }
    if (distOne(centerY, 600) <= distY) {
      speedY = -speedY;
    } else if (distOne(centerY, 0) <= distY) {
      speedY = -speedY;
    }

    pos.x += speedX;
    pos.y += speedY;
  }

  void changeSize() {
    width = 50;
    height = 50;
  }

  boolean touchEnemy(boolean enemyTouched) {
    distX = width/2 + talyp.width/2;
    distY = height/2 + talyp.height/2;
    centerX = pos.x + width/2;
    centerY = pos.y + height/2;
    if (enemyDisplayed == true) {
      if ((distOne(talyp.centerX, centerX) <= distX) && (distOne(talyp.centerY, centerY) <= distY)) {
        enemyTouched = true;
      } else {
        enemyTouched = false;
      }
    }
    return enemyTouched;
  }


  void displayEnemy() {
    image(enemy, pos.x, pos.y, width, height);
    enemyDisplayed = true;
  }

  void deathPause() {
    if (reset && enemyDisplayed) {
      delay(1000);
      reset = false;
    }
  }
}
