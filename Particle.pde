class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifeSpan;
  PImage img = loadImage("particleTexture.png");
  boolean isTextured = false;
  boolean isCircle = true;
  color particleColor;
  PVector angularVelocity;
  float mass;

  Particle(PVector l) {
    location = l.get();
    velocity = new PVector(random(-XVelocityControl, XVelocityControl), random(-YVelocityControl, YVelocityControl));
    acceleration = new PVector(0, 0);
    lifeSpan = lifeControl;
    isTextured = textureControl;
    isCircle = shapeControl;
    img.resize((int)sizeControl * 3, (int)sizeControl * 3);
//    mass = random(0, massControl);
    particleColor = color(RControl, GControl, BControl);
    angle = 0;
    angularVelocity = velocity.get();
  }

  void run() {
    //    update();
    //    applyForce();
    //    display();
  }

  void update() {
    lifeSpan -= 2.0;
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  //  void display() {
  //    noStroke();
  //    float alphaFactor = map(lifeSpan, 0, lifeControl, 0, 255);
  //    if (!isTextured) {
  //      fill(RControl, GControl, BControl, alphaFactor);
  //      if (isCircle) {
  //        ellipse(location.x, location.y, sizeControl, sizeControl);
  //      } else {
  //        rect(location.x, location.y, sizeControl, sizeControl);
  //      }
  //    } else {
  //      imageMode(CENTER);
  //      tint(RControl, GControl, BControl, alphaFactor);
  //      image(img, location.x, location.y);
  //    }
  //  }

  void display() {
  }

  boolean isDead() {
    if (lifeSpan < 0.0) {
      return true;
    } else {
      return false;
    }
  }

  void applyWind() {
    float rotateFactor = map(rotationControl, 0, 8, 200, 30);
    //    location.add(new PVector(map(location.y, height, 50, 0, 3), 0));
    location.add(new PVector( windControl/3, 0));
    angularVelocity.set(velocity.x/rotateFactor, velocity.y/rotateFactor);
    angularVelocity.rotate(HALF_PI);
    velocity.add(angularVelocity);
  }

  void applyForce(PVector force) {
    PVector f = force.get();
//    f.div(mass);
    velocity.add(f);
  }
}

class circleParticle extends Particle {

  circleParticle(PVector l) {
    super(l);
  }

  void run() {
    super.update();
    super.applyWind();
    display();
  }

  void display() {
    pushMatrix();
    noStroke();
    float alphaFactor = map(lifeSpan, 0, lifeControl, 0, 255);
    if (!isTextured) {
      fill(particleColor, alphaFactor);
      ellipse(location.x, location.y, sizeControl, sizeControl);
    } else {
      imageMode(CENTER);
      tint(particleColor, alphaFactor);
      image(img, location.x, location.y);
    }
    popMatrix();
  }
}

class rectParticle extends Particle {

  rectParticle(PVector l) {
    super(l);
  }

  void run() {
    super.update();
    super.applyWind();
    display();
  }

  void display() {
    noStroke();
    float alphaFactor = map(lifeSpan, 0, lifeControl, 0, 255);
    if (!isTextured) {
      fill(particleColor, alphaFactor);
      rect(location.x, location.y, sizeControl, sizeControl);
    } else {
      imageMode(CENTER);
      tint(particleColor, alphaFactor);
      image(img, location.x, location.y);
    }
  }
}

