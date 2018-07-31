import os
from enum import Enum

class Directory(Enum):
    def parent(dir):
        return os.path.abspath(os.path.join(dir, os.pardir))

    def traverse_up(dir, num=1):
        for i in range(num):
            dir = Directory.parent(dir)
        return dir
