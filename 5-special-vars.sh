#!/bin/bash

echo " all varables passed to script : $@"
echo " number varabiles:$#"
echo " script name: $0"
echo " current directory: $PWD"
echo " user running thiss cript: $USER"
echo " home directory of the user : $HOME"
echo " PID of the script : $$"
sleep 10 &
echo " pid of last command in background: $!"
