#!/usr/bin/env python

from __future__ import print_function

import os

basedir = os.path.dirname(os.path.abspath(__file__)) + '/..'
with open(basedir + '/data/projects.lst') as i:
    for link in i.read().splitlines():
        print(link.rsplit('/', 1)[1][:-4])

