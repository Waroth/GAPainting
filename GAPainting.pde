


int PopulationSize;
float Energy;
boolean pause;
Population Society;


void setup() {

  fullScreen(2);
  smooth();
  stroke(255);
  background(0);
  loadPixels();
  ellipseMode(CENTER);

  PopulationSize = 50;
  Energy = 1;
  Society = new Population();

  pause = false;
}

void draw() {
  Society.drawPopulation();
  println(Society.getPopulationSize());
}

void mousePressed() {
  pause = true;
}