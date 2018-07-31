import gzip
import struct
import os
from array import array
import numpy as np
from Utils.FileUtils import *


path = os.path.join(Directory.traverse_up(os.path.dirname(__file__), 2), "MNIST_data")

MNISTDATA = {"test":["t10k-images-idx3-ubyte.gz", "t10k-labels-idx1-ubyte.gz"], "train":["train-images-idx3-ubyte.gz", "train-labels-idx1-ubyte.gz"]}

def parse_data(s="train"):
    with gzip.open(os.path.join(path, MNISTDATA[s][1]), 'rb') as f:
        labels = array("B", f.read())[8:]
    with gzip.open(os.path.join(path, MNISTDATA[s][0]), 'rb') as f:
        images = map(lambda x:x.tolist(), np.array_split(array("B", f.read())[16:], len(labels)))

    return list(zip(images, labels))
