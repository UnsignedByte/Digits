class Layer {
  int layersize;
  float[][] weights;
  float[] biases;
  Layer(int lll, int cll){
    layersize = cll;
    weights = new float[cll][lll];
    biases = new float[cll];
    int higher = max(lll, cll);
    int lower = min(lll, cll);
    for(int i = 0; i < cll; i++){
      biases[i] = random(lower, higher)*sqrt(2/lll);
      for(int j = 0; j < lll; j++) {
        weights[i][j] = random(lower, higher)*sqrt(2/lll);
      }
    }
  }
  
  Layer(float[][] w, float[] b){
    weights = w;
    biases = b;
    layersize = biases.length;
  }
  
  float[] calculate(float[] inputs){
    float[] output = new float[layersize];
    for(int i = 0; i < layersize; i++){
      output[i] = sigmoid(sum(matrixMultiply(inputs, weights[i], inputs.length))+biases[i]);
    }
    return output;
  }
}
