class ParticleSystem {

  ArrayList<Particle> particles;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  void run() {

    if (shapeControl) {
      if (emitControl) {
        particles.add(new circleParticle(new PVector(random(0, width), -20)));
      } else {
        particles.add(new circleParticle(new PVector(XPosControl, YPosControl)));
      }
    } else {
      if (emitControl) {
        particles.add(new rectParticle(new PVector(random(0, width), -20)));
      } else {
        particles.add(new rectParticle(new PVector(XPosControl, YPosControl)));
      }
    }
    Iterator<Particle> it = particles.iterator();

    while (it.hasNext ()) {
      Particle iP = it.next();
      iP.run();
      if (iP.isDead()) {
        it.remove();
      }
    }
  }

  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }

  void applyObstruction(Obstacle ob) {
    for (Particle p : particles) {
      PVector f = ob.repelv2(p);
      p.applyForce(f);
    }
  }
}

