#!/bin/env python

import sys
from math import sin
import torch
import numpy

def my_test(x) :
    print(' From Python test: {}'.format(x.size))
    for i in range(x.size) :
        x[i] += 1.0

    a = torch.from_numpy(x)
    print(a)

    b = torch.from_numpy(x.astype(numpy.float32))
    print(b)

    if torch.cuda.is_available() :
        b_dev = b.cuda()
        print(b_dev)

if __name__ == "__main__" :
    import numpy as np

    x = np.arange(10, dtype=numpy.float64)
    print(x)
    
    my_test(x)

    print(x)


