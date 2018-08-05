import numpy as np

def sigmoid(x):
    return .5 * (1 + np.tanh(.5 * x))
    # try:
    #     return 1.0/(1.0+np.exp(-x))
    # except RuntimeWarning:

def sigmoid_derivative(x):
    return x*(1-x);
