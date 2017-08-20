#!/usr/bin/env python

import sys
import argparse
import re

parser = argparse.ArgumentParser(prog = 'grep')

parser.add_argument('pattern')
parser.add_argument('-r','--recursive',dest='R',action='store_true')
parser.add_argument('-o','--only-matching',dest='O', action='store_true')
parser.add_argument('infile',nargs='*', type=argparse.FileType('r'),default=[sys.stdin])

args = parser.parse_args()

if args.O:
	for i in args.infile:
		l = re.findall(args.pattern,i.read(),flags = 0)
		print '\n'.join(l)

else:
	for j in args.infile:
		for k in j.readlines():
			if re.search(args.pattern,k):
				print k.strip()