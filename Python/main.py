from Utils import FileUtils, MathUtils, MNISTParser
import tkinter as tk
from Renderer.tkUtils import TkFrame
from Utils.Brain import Brain
import numpy as np
import pickle
import asyncio

hidden_layers = [16, 16]

unparsed_data = MNISTParser.parse_data()
parsed_data = [(x, [0]*y+[1]+[0]*(9-y)) for x, y in unparsed_data]
layers = [len(parsed_data[0][0])] + hidden_layers + [len(parsed_data[0][1])]
training = False

nn = Brain(layers)

# nn.train_network(parsed_data, 5000, 1000, 0.01)
# with open("Brain.txt", 'wb') as f:
#     pickle.dump(nn, f)

def train_network():
    global training
    training = not training

async def trainloop():
    while True:
        if training:
            nn.train_network(parsed_data, 1, batch_size, rate)

async def eventloop():
    pass

root = tk.Tk()
mainframe = TkFrame(root)
mainframe.add_button("train", grid=(2, 2), text="Train Network", fg="#FFFFFF", command=train_network)
mainframe.add_button("quit", grid=(30, 20), text="Quit", fg="#FFFFFF", command=root.destroy)
mainframe.mainloop()

asyncio.gather(trainloop, eventloop)
