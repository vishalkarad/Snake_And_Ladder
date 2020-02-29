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

# Generate random number 1 to 3
randomNumber1=$((RANDOM%3+1))

# Check Snake position Ladder position and No Play
case $randomNumber1 in
   1)
      position=$(($position))
      echo "No Play - position is =$position" 
      ;;

   2)
      ladderRandom="$(rollDie)"
      position=$(($position+$ladderRandom))
      echo "Ladder - position is =$position" 
      ;;

   3)
      snakeRandom="$(rollDie)"
      position=$(($position-$snakeRandom))
      echo "Snake - position is =$position" 
      ;;
esac
