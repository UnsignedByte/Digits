/**
 * @Author: Edmund Lam <edl>
 * @Date:   18:15:54, 17-Sep-2018
 * @Filename: Brain.js
 * @Last modified by:   edl
 * @Last modified time: 09:12:23, 20-Sep-2018
 */
class Brain {
  constructor(layer_sizes){
    this.shape = layer_sizes;
    this.biases = [];
    for (var i = 1; i < layer_sizes.length; i++){
      this.biases.push(nj.random(layer_sizes[x]));
    }
    this.weights = [];
    for (var i = 1; i < layer_sizes.length; i++){
      this.weights.push(nj.random(layer_sizes[i-1], layer_sizes[i]));
    }
  }
  calculate(x){
    var layers = [x];
    var zipped = zip(this.weights, this.biases);
    for (var i = 0; i < zipped.length; i++){
      layers.push(sigmoid(nj.dot(zipped[i][0], layers[layers.length-1]).add(zipped[1])));
    }
    return layers;
  }
  result(x){
    var layers = this.calculate(x);
    return layers[layers.length-1];
  }
  loss(x, y){
    return (this.result(x).subtract(y)).pow(2)
  }
  backprop(x, y){
    
  }
}
