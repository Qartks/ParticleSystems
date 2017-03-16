class Obstacle {

  PVector location;
  float radius = 50;
  float strength = 100;

  Obstacle(float x, float y) {
    location = new PVector(x, y);
  }

  void display() {
    noStroke();
    fill(#EF2335);
    ellipse(location.x, location.y, radius, radius);
  }
  
  void update() {
    if(mousePressed && isOnThis()){
      location.x = mouseX;
      location.y = mouseY;
    }
  }
  
  private boolean isOnThis(){
    float distanceFromPointer = dist(mouseX, mouseY, location.x, location.y);
    if(distanceFromPointer < radius){
      return true;
    } else {
      return false;
    }
  }

  PVector repel(Particle p) {
    PVector dir = PVector.sub(location, p.location);
    float magna = dir.mag();
    magna = constrain(magna, 5, 500);
    dir.normalize();

    float f = -1 * strength / (magna * magna);
    dir.mult(f);
    return dir;
  }

  PVector repelv2(Particle p) {
    PVector f = new PVector(0, 0);

    if (collide(p)) {
      f = repel(p).get();
    }
    return f;
  }

  boolean collide(Particle p) {
    float distance = dist(location.x, location.y, p.location.x, p.location.y);
    if(distance < sizeControl + radius/2){
      return true;
    }
    return false;
  }
}

