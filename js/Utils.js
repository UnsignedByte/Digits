/**
 * @Author: Edmund Lam <edl>
 * @Date:   08:21:05, 18-Sep-2018
 * @Filename: Utils.js
 * @Last modified by:   edl
 * @Last modified time: 17:50:24, 18-Sep-2018
 */
function zip(arrays) {
   return arrays[0].map(function(_,i){
       return arrays.map(function(array){return array[i]})
   });
}

function sigmoid(x) {
  return .5*(1+Math.tanh(.5*x));
}

function sigmoid_derivative(x){
  return x*(1-x)
}
