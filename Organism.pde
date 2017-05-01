class Organism {

  DNA dna;
  boolean isDead;
  PVector position;
  float lifetime;

  Organism() {
    dna = new DNA();
    isDead = false;
    position = new PVector(random(width), random(0));
  }

  Organism(DNA _dna, PVector pos) {
    dna = new DNA(_dna);
    isDead = false;
    position = new PVector(pos.x, pos.y);
  }

  void move() {
    lifetime+=0.1;
    int character = dna.getCharacter();
    PVector direction = dna.getDirection();

  
    if (random(1) * dna.getIrrationality() > 0.95) {
      character = floor(random(3));
    }
  

    switch (character) {
    case 0: // Tends to go straight
      direction = dna.getDirection();
      break;
    case 1: // Tends to curve at constant rate
      direction.rotate(PI*0.001);
      break;
    case 2: // Tends to curve and evolve the curve
      direction.rotate(PI*random(0.001*lifetime));
      break;
    }
    position.add(direction);

    if (position.x < 0) {
      position.x = width-1;
    } else if (position.x > width) {
      position.x = 0;
    }
    if (position.y < 0) {
      position.y = height-1;
    } else if (position.y > height) {
      position.y = 0;
    }

    int pixelCount = floor(position.y) * width + floor(position.x);



    if (red(pixels[pixelCount]) > 250) {
      isDead = true;
    } else if (dna.getStrength() == 0) {
      isDead = true;
      //println("hey");
    }
  }

  boolean getDead() {
    return isDead;
  }

  void drawOrganism() {
    strokeWeight(dna.getStrength());
    point(position.x, position.y);
  }

  void reproduce() {
    float percentage;
    percentage = dna.getFecundity() * Energy * random(1);
    if (percentage > 0.25) {
      Society.addOrganism(dna, position);
    }
  }
}