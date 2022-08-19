#!/bin/bash

# if arg not empty
if [ "$1" != "" ] ; then

	# try catch each step
	
	# assemble target.asm
	echo "assembling..." $1
	{ 

		nasm -f elf $1/$1.asm
	} || { 

		echo "assembling failed"
		return -1
	}

	# linking target.o
	echo "linking..." $1".o"
	{
		ld -s $1/$1.o -o $1/$1

	} || {

		echo "linking failed"
		return -1
	}

	# run excutable target
	echo "excute..." $1
	./$1/$1
	
else
	echo "script need target !"
	echo "example : ./run.bash helloworld"
fi

