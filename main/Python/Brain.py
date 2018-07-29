import numpy as np

class Brain {
    def __init__(self, layer_sizes){
        this.biases = [np.zeroes(x) for x in layer_sizes];
    }
}
