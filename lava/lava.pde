ArrayList<ParticleSystem> systems;

String message = "volcano";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text
int color_change_a = 255;
int color_change_b = 255;
//float y_pos, x_pos = 0;

void setup() {
  size(640, 360);
  colorMode(RGB, 255, 255, 255);
  //stroke(255);
  //noFill();
  
  // Create the font
  textFont(createFont("/Library/Fonts/BebasNeue.otf", 48));
  textAlign(CENTER, CENTER);
  
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
  systems = new ArrayList<ParticleSystem>();
  
}

void draw() {
  

  background(0, 0, 0, 1);
  //ellipse(mouseX, mouseY, mouseX, mouseY);
  
  // Instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  fill(0);
  rect(0, 0, width, height);
  
  fill(color(255, color_change_a, color_change_b));
  // If the cursor is over the text, change the position
  if ((color_change_a == 100)) {
    fill(0);
    rect(0, 0, width, height);
    systems.add(new ParticleSystem(1, new PVector(mouseX, mouseY)));
    textFont(createFont("/Library/Fonts/BebasNeue.otf", 12));
  }
  else if ((color_change_a > 100)) {
    text(message, x, y);
  }
  for (ParticleSystem ps : systems) {
    ps.run();
    ps.addParticle();
  }
  
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    if ((color_change_a > 150)) {
      x += random(-5, 5);
      y += random(-2, 1);
    }
    else if ((color_change_a > 125)) {
      x += random(-9, 9);
      y += random(-1, 1);
    }
    else if ((color_change_a > 100)) {
      x += random(-10, 10);
      y += random(-5, 5);
    }
    color_change_a -= 1;
    color_change_b -= 2;
    fill(color(255, color_change_a, color_change_b));
  }
  //drawLava(x_pos, y_pos);
  
}

void drawLava(float xloc, float yloc) {
  for (int i = 0; i < height; i+=20) {
    ellipse(xloc+random(-5, 5), yloc+i+random(-5, 5), 10, 10);
  }
}

//void mousePressed() {
//  systems.add(new ParticleSystem(1, new PVector(mouseX, mouseY)));
//}

// An ArrayList is used to manage the list of Particles

class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector origin;                   // An origin point for where particles are birthed

  ParticleSystem(int num, PVector v) {
    particles = new ArrayList<Particle>();   // Initialize the arraylist
    origin = v.copy();                        // Store the origin point
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin));    // Add "num" amount of particles to the arraylist
    }
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
    // Add either a Particle or CrazyParticle to the system
    if (int(random(0, 2)) == 0) {
      p = new CrazyParticle(origin);
    } 
    else {
      p = new Particle(origin);
    }
    //p = new CrazyParticle(origin);
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

// A subclass of Particle

class CrazyParticle extends Particle {

  // Just adding one new variable to a CrazyParticle
  // It inherits all other fields from "Particle", and we don't have to retype them!
  float theta;

  // The CrazyParticle constructor can call the parent class (super class) constructor
  CrazyParticle(PVector l) {
    // "super" means do everything from the constructor in Particle
    super(l);
    // One more line of code to deal with the new variable, theta
    theta = 0.0;
  }

  // Notice we don't have the method run() here; it is inherited from Particle

  // This update() method overrides the parent class update() method
  void update() {
    super.update();
    // Increment rotation based on horizontal velocity
    float theta_vel = (velocity.x * velocity.mag()) / 10.0f;
    theta += theta_vel;
  }

  // This display() method overrides the parent class display() method
  void display() {
    // Render the ellipse just like in a regular particle
    super.display();
    // Then add a rotating line
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    fill(255, random(50, 200), random(0, 50), lifespan);
    text("lava", 0,0);
    //stroke(255, lifespan);
    //line(0, 0, 25, 0);
    popMatrix();
  }
}


// A simple Particle class

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.5;
  }

  // Method to display
  void display() {
    //stroke(255, random(50, 100), random(100, 200), lifespan);
    fill(255, 0, 0, lifespan);
    //ellipse(position.x, position.y, 8, 8);
    text("lava", position.x, position.y);
  }

  // Is the particle still useful?
  boolean isDead() {
    return (lifespan < 0.0);
  }
}
