class Orb {
  PVector center, velocity, acceleration;
  float bsize, mass;
  color c;

  Orb() {
    bsize = random(10, MAX_SIZE);
    center = new PVector(random(bsize/2, width-bsize/2), random(bsize/2, height-bsize/2));
    mass = random(10, 100);
    velocity = new PVector();
    acceleration = new PVector();
    setColor();
  }

  Orb(float x, float y, float s, float m) {
    bsize = s;
    mass = m;
    center = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
    setColor();
  }

  void move(boolean bounce) {
    if (bounce) {
      xBounce();
      yBounce();
    }
    velocity.add(acceleration);
    center.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector scaleForce = force.copy().div(mass);
    acceleration.add(scaleForce);
  }

  PVector getDragForce(float cd) {
    float dragMag = -0.5 * velocity.magSq() * cd;
    PVector dragForce = velocity.copy().normalize().mult(dragMag);
    return dragForce;
  }

  PVector getGravity(Orb other, float G) {
    float r = max(center.dist(other.center), MIN_SIZE);
    float strength = G * mass * other.mass / (r * r);
    PVector force = PVector.sub(other.center, center).mult(strength);
    return force;
  }

  PVector getSpring(Orb other, int springLength, float springK) {
    PVector direction = PVector.sub(other.center, center).normalize();
    float displacement = center.dist(other.center) - springLength;
    return direction.mult(springK * displacement);
  }

  boolean yBounce() {
    if (center.y > height - bsize/2 || center.y < bsize/2) {
      velocity.y *= -1;
      center.y = constrain(center.y, bsize/2, height - bsize/2);
      return true;
    }
    return false;
  }

  boolean xBounce() {
    if (center.x > width - bsize/2 || center.x < bsize/2) {
      velocity.x *= -1;
      center.x = constrain(center.x, bsize/2, width - bsize/2);
      return true;
    }
    return false;
  }

  void setColor() {
    c = lerpColor(color(0, 255, 255), color(0), (mass - MIN_SIZE) / (MAX_MASS - MIN_SIZE));
  }

  void display() {
    fill(c);
    circle(center.x, center.y, bsize);
  }
}
