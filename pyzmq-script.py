#!/usr/bin/env python

import sys
import zmq
import random

new_message = int("0")

first_time1 = 1
first_time2 = 1

port_in = "9006"
port_out = "9004"
	
context = zmq.Context()	

if len(sys.argv) == 2:
	if sys.argv[1] == "start":
		message = random.randint(1001,10000000)
		print "started with random number: %s" % message
	
	else:
		print "invalid argument %s" % sys.argv[1]

while new_message is not 1:

	if len(sys.argv) is not 2 or first_time1 is 0:
		if first_time2 is 1:
			socket_in = context.socket(zmq.REP)
			socket_in.bind("tcp://*:%s" % port_in)
			first_time2 = 0

		message = int(socket_in.recv())

		socket_in.send("received request : %s" % message)


	print "Lakshay's Script"

	print "Received request : %s" % message

	if message is 1:
		new_message = 1

	elif message % 2 is 0:
		new_message = message / 2

	else:
		new_message = 3 * message + 1
	if first_time1 is 1:	
		socket_out = context.socket(zmq.REQ)

		socket_out.connect("tcp://localhost:%s" % port_out)

	print "Sending message : %s\n" % new_message

	socket_out.send (str(new_message))

	if new_message is 1:
		print "\nExiting..."
		sys.exit()	

	first_time1 = 0

	reply = socket_out.recv()
