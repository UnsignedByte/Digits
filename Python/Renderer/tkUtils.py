import tkinter as tk

class TkFrame(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.pack()
        self.objects = {}
    def add_button(self, id, grid=(0, 0), **kwargs):
        self.objects[id] = tk.Button(self, **kwargs)
        self.objects[id].grid(row=grid[0], column=grid[1])
