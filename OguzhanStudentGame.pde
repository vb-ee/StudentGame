import ddf.minim.*;

boolean[] keys = new boolean[50];
Wall[] walls = new Wall[16];
Student talyp;
Diploma diplom;
Enemy[] enemies = new Enemy[10];
String audioName = "resources/music.mp3";
PImage oguzhan;
boolean imageDisplayed = true;
Minim minim;
AudioPlayer player;


void setup() {
  oguzhan = loadImage("resources/Oguzhan.jpg");
  playAudio();
  size(800, 600);
  setWall();
  setEnemy();
  talyp = new Student(135, 220, 24, 25, 2, "resources/T.jpg");
  diplom = new Diploma(640, 340, 1, 50, 38, "resources/grad.png");
}


void draw() {
  background(255);
  setStudentCenter();
  if (level<=5) {
    for (int i=0; i<walls.length; i++) {
      walls[i].displayWall();
    }
    deathWall();
  }
  nextLevel();
  deathEnemy();
  talyp.move();
  talyp.displayStudent();
  diplom.displayDiploma();
  displayLevel();

  if (imageDisplayed) {
    image(oguzhan, 0, 0, width, height);
  }
  if (key == ' ') {
    imageDisplayed = false;
  }
}


void playAudio() {
  minim = new Minim(this);
  player =  minim.loadFile(audioName);
  player.play();
}

void keyPressed() {
  if (key == CODED) {
    keys[keyCode] = true;
  }
}

void keyReleased() {
  if (key == CODED) {
    keys[keyCode] = false;
  }
}

float distOne(float x1, float x2) {
  return abs(x1-x2);
}

void setStudentCenter() {
  talyp.centerX = talyp.pos.x + talyp.width/2;
  talyp.centerY = talyp.pos.y + talyp.height/2;
}
