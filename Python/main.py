from Utils import FileUtils, MathUtils, MNISTParser
from Utils.Brain import Brain
import numpy as np

hidden_layers = [16, 16]

unparsed_data = MNISTParser.parse_data()
parsed_data = [(x, [0]*y+[1]+[0]*(9-y)) for x, y in unparsed_data]
# print([len(x) for x, y in parsed_data])
layers = [len(parsed_data[0][0])] + hidden_layers + [len(parsed_data[0][1])]

nn = Brain(layers)
nn.train_network(parsed_data, 1, 1000, 0.01)
