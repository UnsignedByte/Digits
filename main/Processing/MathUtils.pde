static float[] matrixMultiply(float[] a, float[] b, int l){
  float[] ret = new float[l];
  for(int i = 0; i < l; i++){
    ret[i] = a[i]*b[i];
  }
  return ret;
}

static float sum(float[] a){
  float s = 0;
  for(float f : a){
    s+=f;
  }
  return s;
}

static float[] calcLoss(float[] a, float[] b){
  float[] out = new float[a.length];
  for(int i = 0; i < a.length; i++){
    out[i] = pow(a[i]-b[i], 2);
  }
  return out;
}

float sigmoid(float a){
  return 1/(1+exp(-a));
}
