#!/bin/bash

HOUSENAMES=("AYUB" "AKBAR" "AMEERKHAN")

# size of above array is 3.
# index are 0,1,2
# list always start with 0.

echo "first name  is: ${HOUSENAMES[0]}" 
echo "second name is: ${HOUSENAMES[1]}" 
echo "third name  is: ${HOUSENAMES[2]}"
echo "first name  is: ${HOUSENAMES[@]}" 