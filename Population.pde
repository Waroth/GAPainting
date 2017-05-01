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

    for (int i = orgs.size()-1; i > 0; i--) {
      if (orgs.get(i).getDead()) {
        orgs.remove(i);
      } else {
        orgs.get(i).reproduce();
        orgs.get(i).move();
        orgs.get(i).drawOrganism();
      }
    }
  }

  void addOrganism(DNA dna, PVector pos) {
    orgs.add(new Organism(dna, pos));
  }

  int getPopulationSize() {
    return orgs.size();
  }
}