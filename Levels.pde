int level = 1;
int death = 0;
boolean checkWall;
boolean checkEnemy;
boolean checkLevel;
boolean reset = false;


void nextLevel() {
  checkLevel = diplom.touchDiploma(false);
  if (checkLevel == true) {
    level++;
    delay(300);     
    talyp.pos.x = talyp.initialPos.x;
    talyp.pos.y = talyp.initialPos.y;
  }

  checkLevel = false;

  if (level == 1) {
    image(talyp.talyp, 110, 50, 25, 27);
    text(" - Talyp", 137, 70);
    image(diplom.diplom, 110, 90, 25, 30);
    text(" - Diplom", 137, 110);
  } else if (level == 2) {
    removeEnemy();
    image(enemies[0].enemy, 110, 90, 30, 25);
    text(" - English", 137, 110);
    enemies[0].moveEnglish();
    enemies[0].displayEnemy();
  } else if (level == 3) {
    removeEnemy();
    enemies[0].moveEnglish();
    enemies[1].moveEnglish();
    enemies[2].moveEnglish();
    for (int i=0; i<3; i++) {
      enemies[i].displayEnemy();
    }
  } else if (level == 4) {
    removeEnemy();
    image(enemies[3].enemy, 110, 90, 30, 25);
    text(" - Math", 137, 110);
    enemies[0].moveEnglish();
    enemies[1].moveEnglish();
    enemies[2].moveEnglish();
    enemies[3].moveMath(talyp.centerX, talyp.centerY);
    for (int i=0; i<4; i++) {
      enemies[i].displayEnemy();
    }
  } else if (level == 5) {
    removeEnemy();
    image(enemies[6].enemy, 110, 90, 30, 25);
    text(" - Attestaciya", 137, 110);
    enemies[6].moveAttestation();
    enemies[6].applyToAtt();
    enemies[6].displayEnemy();
  } else if (level == 6) {
    removeEnemy();
    diplom.moveDiploma();
    for (int i=3; i<=5; i++) {
      enemies[i].moveMath(talyp.centerX, talyp.centerY);
      enemies[i].displayEnemy();
    }
  } else if (level == 7) {
    image(enemies[7].enemy, 220, 30, 35, 30);
    text(" - Innovative Technnologies", 257, 50);
    removeEnemy();
    diplom.moveDiploma();
    for (int i=4; i<=5; i++) {
      enemies[i].moveMath(talyp.centerX, talyp.centerY);
      enemies[i].displayEnemy();
    }
    enemies[7].moveInnovation(talyp.centerX, talyp.centerY);
    enemies[7].displayEnemy();
  } else if (level == 8) {
    removeEnemy();
    diplom.moveDiploma();
    for (int i=4; i<=5; i++) {
      enemies[i].moveMath(talyp.centerX, talyp.centerY);
      enemies[i].displayEnemy();
    }
    for (int i=7; i<=8; i++) {
      enemies[i].moveInnovation(talyp.centerX, talyp.centerY);
      enemies[i].displayEnemy();
    }
  } else if (level == 9) {
    removeEnemy();
    diplom.moveDiploma();
    for (int i=4; i<=5; i++) {
      enemies[i].moveMath(talyp.centerX, talyp.centerY);
      enemies[i].displayEnemy();
    }
    for (int i=7; i<=9; i++) {
      enemies[i].moveInnovation(talyp.centerX, talyp.centerY);
      enemies[i].displayEnemy();
    }
  } else if (level == 10) {
    removeEnemy();
    enemies[6].applyToAtt();
    for (int i=0; i<enemies.length; i++) {
      enemies[i].changeSize();
      enemies[i].lastLevelMove();
      enemies[i].displayEnemy();
    }
  }
}

void deathWall() {
  for (int i=0; i<walls.length; i++) {
    checkWall = walls[i].touchWall(false);
    if (checkWall == true) {
      death++;      
      delay(300);
      talyp.resetStudent();  
      resetEnemies();
      checkWall = false;  
      break;
    }
  }
}

void deathEnemy() {
  for (int i=0; i<enemies.length; i++) {
    checkEnemy = enemies[i].touchEnemy(false); 
    if (checkEnemy == true) {
      death++;
      delay(300);
      talyp.resetStudent();
      if (level <= 9) {
        resetEnemies();
      } else if (level >= 10) {
        resetOthers();
      }
      checkEnemy = false;
      break;
    }
  }
}


void resetEnemies() {
  for (int j=0; j<enemies.length; j++) {
    if (j>=0 && j<=2) {
      enemies[j].pos.x = enemies[j].initialPos.x;
      enemies[j].pos.y = enemies[j].initialPos.y;
    } else if (j>=3 && j<=5 &&level == 4) {
      enemies[j].pos.x = random(250, 530); 
      enemies[j].pos.y = random(275, 385);
    } else if (j>=3 && j<=5 && level > 4) {
      enemies[j].pos.x = random(200, 650); 
      enemies[j].pos.y = random(180, 400);
    } else {
      enemies[j].pos.x = random(50, 700); 
      enemies[j].pos.y = random(50, 500);
    }
  }
  reset = true;
}

void resetOthers() {
  for (int j=0; j<enemies.length; j++) {
    enemies[j].pos.x = random(50, 700); 
    enemies[j].pos.y = random(50, 500);
  }
  reset = true;
}

void removeEnemy() {
  for (int j=0; j<enemies.length; j++) {
    enemies[j].enemyDisplayed = false;
  }
}


void displayLevel() {
  textSize(20);  
  fill(0);
  if (level <= 5) {
    text("Level: " + level, 620, 150);
    text("Deaths: " + death, 110, 150);
  } else {
    text("Level: " + level, 620, 50);
    text("Deaths: " + death, 110, 50);
  }
}
