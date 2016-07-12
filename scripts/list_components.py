#!/usr/bin/env python

import os
import sys

basedir = os.path.dirname(os.path.abspath(__file__))
with open(basedir + '/../data/projects.csv') as i:
    # You're gonna love this one.
    with open(sys.argv[1], 'w') as o:
        # And here's the killer.
        for link in i.read().splitlines():
            o.write(link.rsplit('/', 1)[1][:-4] + '\n')

