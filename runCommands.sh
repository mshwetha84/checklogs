#!/bin/bash
tr -d '\r' < arguments.txt > argsUnix.txt
tr -d '\r' < qeServers.sh > qeServerUnix.sh
chmod a+x qeServerUnix.sh
./qeServerUnix.sh $(cat argsUnix.txt)