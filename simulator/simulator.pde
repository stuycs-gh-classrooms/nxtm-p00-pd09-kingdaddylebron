int NUM_ORBS = 10;
int MIN_SIZE = 10;
int MAX_SIZE = 60;
float MIN_MASS = 10;
float MAX_MASS = 100;
float G_CONSTANT = 0.5;
float D_COEF = 0.1;

int SPRING_LENGTH = 50;
float SPRING_K = 0.005;

int MOVING = 0;
int BOUNCE = 1;
int GRAVITY = 2;
int DRAGF = 3;
int WIND = 4;
boolean[] toggles = new boolean[5];
String[] modes = {"Moving", "Bounce", "Gravity", "Drag", "Wind"};

FixedOrb earth;
OrbNode o0, o1, o2, o3;

void setup() {
  size(600, 600);
  earth = new FixedOrb(width/2, height/2, 100, 20000);
  makeOrbs();
}

void draw() {
  background(255);
  displayMode();

  o0.display();
  o1.display();

  PVector sf = o0.getSpring(o0.next, SPRING_LENGTH, SPRING_K);
  o0.applyForce(sf);
  sf = o1.getSpring(o1.previous, SPRING_LENGTH, SPRING_K);
  o1.applyForce(sf);
  
  o0.move(toggles[BOUNCE]);
  o1.move(toggles[BOUNCE]);
  
  if (toggles[GRAVITY]) simulateGravity();
//  if (toggles[BOUNCE]) simulateSpringForce();
  if (toggles[DRAGF]) simulateDrag();
}

void makeOrbs() {
  o0 = new OrbNode();
  o1 = new OrbNode();
  o2 = new OrbNode();
  o3 = new OrbNode();

  o0.next = o1;
  o1.previous = o0;
  o1.next = o2;
  o2.previous = o1;
  o2.next = o3;
  o3.previous = o2;
}

void keyPressed() {
  if (key == ' ') toggles[MOVING] = !toggles[MOVING];
  if (key == '1') toggles[BOUNCE] = !toggles[BOUNCE];
  if (key == '2') toggles[GRAVITY] = !toggles[GRAVITY];
  if (key == '3') toggles[DRAGF] = !toggles[DRAGF];
  if (key == '4') toggles[WIND] = !toggles[WIND];
  makeOrbs();
}

void displayMode() {
  textAlign(LEFT, TOP);
  textSize(20);
  noStroke();
  int x = 0;

  for (int m = 0; m < toggles.length; m++) {
    fill(toggles[m] ? color(0, 255, 0) : color(255, 0, 0));
    float w = textWidth(modes[m]);
    rect(x, 0, w + 5, 20);
    fill(0);
    text(modes[m], x + 2, 2);
    x += w + 5;
  }
}

void simulateGravity() {
  for (OrbNode orb = o0; orb != null; orb = orb.next) {
    PVector gravity = orb.getGravity(earth, G_CONSTANT);
    orb.applyForce(gravity);
    orb.move(true);
    earth.display();
    orb.display();
  }
}

//void simulateSpringForce() {
//  for (OrbNode orb = o0; orb != null; orb = orb.next) {
//    if (orb != earth) {
//      PVector springForce = orb.getSpring(earth, SPRING_LENGTH, SPRING_K);
//      orb.applyForce(springForce);
//    }
//    orb.move(true);
//    orb.display();
//  }
//}

void simulateDrag() {
  for (OrbNode orb = o0; orb != null; orb = orb.next) {
    PVector gravity = new PVector(0, 0.5 * orb.mass);
    PVector dragForce = orb.getDragForce(D_COEF);
    orb.applyForce(gravity);
    orb.applyForce(dragForce);
    orb.move(false);
    orb.display();
  }
}
