from random import shuffle
import numpy as np
from Utils.MathUtils import *

class Brain:
    def __init__(self, layer_sizes):
        self.shape = layer_sizes
        self.biases = [np.random.randn(x) for x in layer_sizes[1:]]
        self.weights = [np.random.randn(a, b) for a, b in zip(layer_sizes[1:], layer_sizes[:-1])]
    def calculate(self, x):
        layers = [x]
        for a, b in zip(self.weights, self.biases):
            layers.append(sigmoid((a @ layers[-1])+b))
        return layers
    def result(self, x):
        return self.calculate(x)[-1];

    def loss(self, x, y):
        return (self.result(x)-y)**2

    def backprop(self, x, y):
        delta_biases = [np.zeros(x.shape) for x in self.biases]
        delta_weights = [np.zeros(x.shape) for x in self.weights]

        layers = self.calculate(x)

        curr_delta = 2*(layers[-1]-y)

        delta_biases[-1] = curr_delta
        delta_weights[-1] = np.outer(curr_delta, layers[-2])

        for i in range(2, len(self.shape)):
            raw = sigmoid_derivative(layers[-i])
            curr_delta = (self.weights[-i+1].transpose() @ curr_delta) * raw
            delta_biases[-i] = curr_delta
            delta_weights[-i] = np.outer(curr_delta, layers[-i-1])
        return (delta_biases, delta_weights)

    def train_batch(self, batch, rate):
        total_delta_biases = [np.zeros(x.shape) for x in self.biases]
        total_delta_weights = [np.zeros(x.shape) for x in self.weights]

        avg = 0

        for x, y in batch:
            # print(len(x), len(y))
            avg+=self.loss(x, y)
            delta_biases, delta_weights = self.backprop(x, y)
            total_delta_biases = [x+y for x, y in zip(total_delta_biases, delta_biases)]
            total_delta_weights = [x+y for x, y in zip(total_delta_weights, delta_weights)]
        self.biases = [x-(rate/len(batch))*y for x, y in zip(self.biases, total_delta_biases)]
        self.weights = [x-(rate/len(batch))*y for x, y in zip(self.weights, total_delta_weights)]
        return np.average(avg/len(batch))

    def train_network(self, data, epochs, batch_size, rate):
        for i in range(epochs):
            shuffle(data)
            batches = [data[x:x+batch_size] for x in range(0, len(data), batch_size)]
            for batch in batches:
                loss = self.train_batch(batch, rate)
                print("\tBatch complete. Loss: {0}".format(loss))
            print("Epoch {0} complete.")
