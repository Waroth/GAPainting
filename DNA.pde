class DNA {

  int character;
  float cynycism;
  float irrationality;
  float fecundity;
  float strength;
  PVector direction;

  DNA() {
    character = floor(random(3));
    irrationality = random(1);
    fecundity = random(1);
    cynycism = random(1);
    strength = 2;
    direction = new PVector(random(-1, 1), random(-1, 1));
  }

  DNA(DNA _dna) {
    character = _dna.getCharacter();
    irrationality = _dna.getIrrationality();
    fecundity = _dna.getFecundity() * random(1);
    cynycism = _dna.getCynycism();
    strength = _dna.getStrength()-0.2;
    if (strength < 0) {
      strength = 0;
    }
    direction = new PVector(random(-1, 1), random(-1, 1));
  }

  PVector getDirection() {
    return direction;
  }

  int getCharacter() {
    return character;
  }

  float getIrrationality() {
    return irrationality;
  }

  float getFecundity() {
    return fecundity;
  }

  float getCynycism() {
    return cynycism;
  }

  float getStrength() {
    return strength;
  }
}

/*

 
 Here an individual agent is a graphic point, a virtual stylus, with a set of behavioral properties encoded in a digital genome.
 While their manifestation is strictly graphic, Annunziato makes the metaphor clear in the parameter types: 
 - character
 - movement: random or fixed path (that could be steady curve or straight)
 - energy
 - drives reproduction. Energy is also driven by fecundity
 - reproduction is asexual; just branches into two thinner lines
 - irrationality
 - overall randomness of agent
 - fecundity
 
 - morality
 - agent dies when hitting another trail
 - freedom
 - global parameter: low freedom compels the agent to move in straight lines
 
 
 
 
 
 
 
 
 
 
 
 
 
 */