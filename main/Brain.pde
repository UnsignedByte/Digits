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
  
  float[][] calculate(float[] input){
    float[][] currnodes = new float[BRAIN_DEPTH+1][0];
    currnodes[0] = input;
    for(int i = 0; i < BRAIN_DEPTH; i++){
      currnodes[i+1] = layers[i].calculate(currnodes[i]);
    }
    return currnodes;
  }
  
  Layer[] backprop(float[][] nodes, int ans){
    Layer[] newlayers = new Layer[BRAIN_DEPTH];
    float lastnodes = 0;
    for(int i = 0; i < nodes[BRAIN_DEPTH].length; i++){
      lastnodes+= 2*(nodes[BRAIN_DEPTH][i] - ((i == ans) ? 1:0));
    }
    for(int i = BRAIN_DEPTH-1; i >= 0; i--){
      float newlastnodes = 0;
      //backprop through each weight
      float[][] nweights = new float[nodes[i+1].length][nodes[i].length];
      float[] nbiases = new float[nodes[i+1].length];
      for(int j = 0; j < layers[i].layersize; j++){
        float term = nodes[i+1][j]*(1-nodes[i+1][j])*lastnodes;
        nbiases[j] = term;
        for(int k = 0; k < nodes[i].length; k++){
          nweights[j][k] = term*nodes[i][k];
          newlastnodes+=term*layers[i].weights[j][k];
        }
      }
      lastnodes = newlastnodes;
      newlayers[i] = new Layer(nweights, nbiases);
    }
    return newlayers;
  }
}
