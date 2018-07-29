
final int[] LAYER_SIZES = {1, 2};
final int NUM_LAYERS = LAYER_SIZES.length;

final int BUTTON_TOP_MARGIN = 75;
final int BUTTON_LEFT_MARGIN = 50;
final int BUTTON_WIDTH = 150;
final int BUTTON_HEIGHT = 45;
final color WHITE = #FFFFFF;
final color BLACK = #000000;
final int BATCH_SIZE = 1;
final float ETA = 0.01;

boolean Training = false;

Brain brain;

Button b;

void setup(){
  size(1000,1000);
  stroke(255);
  background(55);
  b = new Button("Train", BUTTON_LEFT_MARGIN, BUTTON_TOP_MARGIN, BUTTON_WIDTH, BUTTON_HEIGHT, WHITE, BLACK, new Runnable(){
    public void run() {
      Training = !Training;
    }
  });
  b.draw();
  brain = new Brain(LAYER_SIZES, NUM_LAYERS);
}

void draw() {
  b.draw();
  if (Training){
    train();
  }
}

void mouseClicked(){
  b.onClick();
}
