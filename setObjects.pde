void setWall() {
  walls[0] = new Wall(100, 170, 4, 260);
  walls[1] = new Wall(100, 170, 90, 4);
  walls[2] = new Wall(100, 430, 170, 4);
  walls[3] = new Wall(190, 170, 4, 220);
  walls[4] = new Wall(190, 390, 40, 4);
  walls[5] = new Wall(226, 210, 4, 180);
  walls[6] = new Wall(266, 390, 4, 40);
  walls[7] = new Wall(700, 170, 4, 260);
  walls[8] = new Wall(534, 170, 170, 4);
  walls[9] = new Wall(614, 430, 90, 4);
  walls[10] = new Wall(610, 210, 4, 224);
  walls[11] = new Wall(574, 210, 40, 4);
  walls[12] = new Wall(534, 170, 4, 40);
  walls[13] = new Wall(574, 210, 4, 180);
  walls[14] = new Wall(230, 210, 308, 4);
  walls[15] = new Wall(270, 390, 308, 4);
}

void setEnemy() {
  //english
  enemies[0] = new Enemy(534, 220, 2, 32, 22, "resources/english.png");
  enemies[1] = new Enemy(260, 355, 2, 30, 25, "resources/english.png");
  enemies[2] = new Enemy(480, 290, 2, 30, 25, "resources/english.png");
  //math
  enemies[3] = new Enemy(random(250, 530), random(275, 385), 1, 35, 28, "resources/math.jpg");
  enemies[4] = new Enemy(random(300, 600), random(250, 450), 1, 35, 28, "resources/math.jpg");
  enemies[5] = new Enemy(random(300, 600), random(250, 450), 1, 35, 28, "resources/math.jpg");
  //attestation 
  enemies[6] = new Enemy(random(235, 530), random(275, 385), 1, 30, 30, "resources/A.jpg");
  //Others
  enemies[7] = new Enemy(random(100, 700), random(100, 600), 5, 35, 32, "resources/physics.jpg");
  enemies[8] = new Enemy(random(100, 700), random(100, 600), 5, 35, 32, "resources/physics.jpg");
  enemies[9] = new Enemy(random(100, 700), random(100, 600), 5, 35, 32, "resources/physics.jpg");
}
