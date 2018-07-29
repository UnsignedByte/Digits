
final int[] LAYER_SIZES = {1, 2, 2};
final int NUM_LAYERS = LAYER_SIZES.length;

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
    Layer[] sum = calculate();
    for(int i = 1; i < BATCH_SIZE; i++){
      Layer[] nsum = calculate();
      Action act = new Action(){
        public float act(float a, float b){
          return a+b;
        }
      };
      sum = updateLayers(sum, nsum, act);
    }
    
    final float f = sum.length;
    Action act = new Action(){
      public float act(float a, float b){
        return a+b/f;
      }
    };
    brain.layers = updateLayers(brain.layers, sum, act);
    for(int l = 0; l < sum.length; l++){
      for(int j = 0; j < sum[l].layersize; j++){
        sum[l].biases[j]/=sum.length;
        for(int k = 0; k < sum[l].weights[j].length; k++){
          sum[l].weights[j][k] /= sum.length;
        }
      }
    }
    
    for(int l = 0; l < sum.length; l++){
      for(int j = 0; j < sum[l].layersize; j++){
        brain.layers[l].biases[j] += sum[l].biases[j];
        for(int k = 0; k < sum[l].weights[j].length; k++){
          brain.layers[l].weights[j][k] += sum[l].weights[j][k];
        }
      }
    }
  }
}

void mouseClicked(){
  b.onClick();
}
