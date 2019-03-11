class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector origin;                   // An origin point for where particles are birthed

  ParticleSystem(PVector v) {
    particles = new ArrayList<Particle>();   // Initialize the arraylist
    particles.add(new Particle(v));
    
    //origin = v.copy();         // Store the origin point
    //for (int i = 0; i < num; i++) {
    //  particles.add(new Particle(origin));    // Add "num" amount of particles to the arraylist
    //}
  }

  void run() {
    // Cycle through the ArrayList backwards, because we are deleting while iterating
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle() {
    Particle p;
    p = new Particle(origin);
    particles.add(p);
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    return particles.isEmpty();
  }
}


class Particle {
  PVector position;
  //PVector velocity;
  //PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    //acceleration = new PVector(0, 0.05);
    //velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    //velocity.add(acceleration);
    //position.add(velocity);
    lifespan -= 10;
  }

  // Method to display
  void display() {
    //stroke(255, random(50, 100), random(100, 200), lifespan);
    fill(255, 50, 50, lifespan);
    ellipse(position.x, position.y, 50, 50);
    //text("lava", position.x, position.y);
  }

  // Is the particle still useful?
  boolean isDead() {
    return (lifespan < 0.0);
  }
}
