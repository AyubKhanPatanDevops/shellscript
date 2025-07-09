#!/bin/bash

HOUSENAMES=("AYUB" "AKBAR" "AMEERKHAN")

#size of above array is 3.
#index are 0,1,2
# list always start with 0.

echo "first name  is: ${AYUB[0]}" 
echo "secon name  is: ${AKBAR[1]}" 
echo "first name  is: ${AMEERKHKAN[2]}"
echo "first name  is: ${[@]}" 