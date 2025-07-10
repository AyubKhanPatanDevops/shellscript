#!/bin/bash

echo "All varibles: $@"
echo "Number of varibles passed: $#"
echo "script name: $0"
echo "current working directory: $PWD"
echo "home directory of current user: $HOME"
echo "which user is runnig this script: $USER"
echo "host name :$HOSTNAME"
echo "process id of the current shellscript: $$"
echo "process id of last background command: $!"
echo "lis of files: $LS -L"