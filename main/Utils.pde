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

Layer[] calculate(){
  pair in = genInput();
  float[][] cn = brain.calculate(in.arr);
  Layer[] sum = brain.backprop(cn, in.ans);
  return sum;
}
