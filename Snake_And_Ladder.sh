#!/bin/bash -x

echo "*************************Welcome To Snake And Ladder**********************"

# Constant
PLAYER=1

# Variable
position=0

# player Roll die 1 TO 6
function rollDie()
{
randomNumber=$((RANDOM%6+1))
echo $randomNumber
}

