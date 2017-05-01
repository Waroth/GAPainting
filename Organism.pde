class Organism {

  DNA dna;
  boolean isDead;
  PVector position;

  Organism() {
    dna = new DNA();
    isDead = false;
    position = new PVector(random(width), random(height));
  }

  Organism(DNA _dna, PVector pos) {
    dna = new DNA(_dna);
    isDead = false;
    position = new PVector(pos.x,pos.y);
  }

  void move() {
    int character = dna.getCharacter();
    PVector direction = dna.getDirection();

    switch (character) {
    case 0: // Tends to go straight
      direction = dna.getDirection();
      break;
    case 1: // Tends to curve at constant rate
      direction.rotate(PI*0.001);
      break;
    case 2: // Tends to curve and evolve the curve
      direction.rotate(PI*random(0.01));
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
    }
  }

  boolean getDead() {
    return isDead;
  }

  void drawOrganism() {
    point(position.x, position.y);
  }

  void reproduce() {
    float percentage;
    percentage = dna.getFecundity() * Energy * random(1);
    if (percentage > 0.5) {
      Society.addOrganism(dna, position);
    }
  }
}