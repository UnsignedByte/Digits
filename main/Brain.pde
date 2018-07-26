class Brain {
  int BRAIN_DEPTH;
  Layer[] layers;
  
  //Make a random brain
  Brain(int[] layer_sizes, int brain_depth){
    BRAIN_DEPTH = brain_depth-1;
    layers = new Layer[BRAIN_DEPTH];
    for(int i = 0; i < BRAIN_DEPTH; i++){
      layers[i] = new Layer(layer_sizes[i], layer_sizes[i+1]);
    }
  }
  
  void calculate(float[] input, int ans){
    float[][] currnodes = new float[BRAIN_DEPTH+1][0];
    currnodes[0] = input;
    for(int i = 0; i < BRAIN_DEPTH; i++){
      currnodes[i+1] = layers[i].calculate(currnodes[i]);
    }
    backprop(currnodes, ans);
  }
  
  Layer[] backprop(float[][] nodes, int ans){
  }
}
