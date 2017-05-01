class Population {

  ArrayList<Organism> orgs;

  Population() {
    orgs = new ArrayList();
    for (int i = 0; i < PopulationSize; i++) {
      orgs.add(new Organism());
    }
  }

  void drawPopulation() {
    loadPixels();

    for (Organism o : orgs) {
      if (!pause) {
        o.move();
      }
      o.drawOrganism();
    }

    //updatePixels();
    //println("================================");
  }

  void checkDeath() {
    for (int i = orgs.size()-1; i > 0; i--) {
      if (orgs.get(i).getDead()) {
        orgs.remove(i);
      }
    }
  }

  void checkReproduction() {
    for (int i = orgs.size()-1; i > 0; i--) {
      orgs.get(i).reproduce();
    }
  }

  void addOrganism(DNA dna, PVector pos) {
    orgs.add(new Organism(dna, pos));
    println("hey");
  }
}