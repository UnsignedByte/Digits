
final int NUM_LAYERS = 4;
final int[] LAYER_SIZES = {784, 16, 16, 10};


void setup(){
  size(1000,1000);
  stroke(255);
  background(192, 64, 0);
  brain = new Brain(LAYER_SIZES, NUM_LAYERS);
}

void draw() {
  line(150, 25, mouseX, mouseY);
}
