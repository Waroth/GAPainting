


int PopulationSize;
float Energy;
boolean pause;
Population Society;






void setup() {

  fullScreen(2);
  smooth();
  stroke(255);
  background(200);
  loadPixels();
  ellipseMode(CENTER);


  PopulationSize = 100;
  Energy = 1;
  Society = new Population();

  pause = false;
}

void draw() {
  Society.checkReproduction();
  Society.drawPopulation();
  Society.checkDeath();
}

void mousePressed() {
  pause = true;
}