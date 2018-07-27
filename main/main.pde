
final int NUM_LAYERS = 2;
final int[] LAYER_SIZES = {1, 2, 2};

final int BUTTON_TOP_MARGIN = 75;
final int BUTTON_LEFT_MARGIN = 50;
final int BUTTON_WIDTH = 150;
final int BUTTON_HEIGHT = 45;
final color WHITE = #FFFFFF;
final color BLACK = #000000;
final int BATCH_SIZE = 1;

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
    pair in = genInput();
    Layer[] sum = brain.calculate(in.arr, in.ans);
    for(int i = 1; i < BATCH_SIZE; i++){
      in = genInput();
      Layer[] nsum = brain.calculate(in.arr, in.ans);
    }
  }
}

pair genInput(){
  float[] out = {random(1)};
  int ans = round(out[0]);
  return new pair(out, ans);
}

class pair {
  float[] arr;
  int ans;
  pair(float[] a, int b){
    arr = a;
    ans = b;
  }
}

void mouseClicked(){
  b.onClick();
}
