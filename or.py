#!/usr/bin/env python
import sys
h = float(sys.argv[1])
m = float(sys.argv[2])
th = h+m/60.0
ops = th*.75
res = th*.25
opsr = int(ops*10 + .5)/10.0
resr = int(res*10 + .5)/10.0
print h,m,opsr,resr
