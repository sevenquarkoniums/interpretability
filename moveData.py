#!/usr/bin/env python
"""
Created on Thu Sep  5 12:02:31 2019

@author: seven

move data

"""
import os
import random
random.seed(0)
from shutil import copyfile

if not os.path.isdir('data/train'):
    os.mkdir('data/train')
if not os.path.isdir('data/val'):
    os.mkdir('data/val')

dirs = [x[0] for x in os.walk('data/all')][1:]
for idir in dirs:
    tail = 'n' + idir.split('n')[-1]
    if not os.path.isdir('data/train/%s' % tail):
        os.mkdir('data/train/%s' % tail)
    if not os.path.isdir('data/val/%s' % tail):
        os.mkdir('data/val/%s' % tail)
    pics = os.listdir('data/all/%s' % tail)
    num = len(pics)
    idxV = random.sample(range(num), k=int(num*0.2))
    idxT = list(set(range(num)) - set(idxV))
    for i in idxT:
        copyfile('data/all/%s/%s' % (tail, pics[i]), 'data/train/%s/%s' % (tail, pics[i]))
    for i in idxV:
        copyfile('data/all/%s/%s' % (tail, pics[i]), 'data/val/%s/%s' % (tail, pics[i]))
        
        