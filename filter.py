#!/usr/bin/env python

import re
import sys

s = re.findall(r"\S+@\S+\.\S+",open(sys.argv[1]).read(),flags = 0)

k = s[0]	

for i in range(1,(len(s))):
	if not s[i] in k:
		k = k+"\n"+ s[i]

open(sys.argv[2],"w").write(k)

# print sys.argv[3]