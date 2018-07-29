abstract class Action {
  public abstract float act(float a, float b);
}

Layer[] updateLayers(Layer[] a, Layer[] b, Action func){
  
  for(int l = 0; l < b.length; l++){
    for(int j = 0; j < b[l].layersize; j++){
      a[l].biases[j] = func.act(a[l].biases[j], b[l].biases[j]);
      for(int k = 0; k < b[l].weights[j].length; k++){
        a[l].weights[j][k] = func.act(a[l].weights[j][k], b[l].weights[j][k]);
      }
    }
  }
  return b;
}

Tuple genInput(){
  float[] out = {random(1)};
  int ans = round(out[0]);
  return new Tuple<float[], Integer>(out, ans);
}

class Tuple<X, Y> { 
  public final X x; 
  public final Y y; 
  public Tuple(X x, Y y) { 
    this.x = x; 
    this.y = y; 
  } 
} 


Layer[] calculate(){
  Tuple<float[], Integer> in = genInput();
  float[][] cn = brain.calculate(in.x);
  println(cn[NUM_LAYERS-1][0]+" "+in.y);
  println(pow(in.y-cn[NUM_LAYERS-1][0], 2));
  Layer[] sum = brain.backprop(cn, in.y);
  return sum;
}

void train(){
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
      brain.layers[l].biases[j] += sum[l].biases[j];
      for(int k = 0; k < sum[l].weights[j].length; k++){
        brain.layers[l].weights[j][k] -= sum[l].weights[j][k]*ETA/sum.length;
      }
    }
  }
}
