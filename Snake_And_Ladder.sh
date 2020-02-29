#!/bin/bash -x

echo "*************************Welcome To Snake And Ladder**********************"

# Constant
PLAYER=1

# Variable
position=0
timeOfReachedPosition=0
# player Roll die 1 TO 6
function rollDie()
{
randomNumber=$((RANDOM%6+1))
echo $randomNumber
}

# Generate random number 1 to 3
randomNumber1=$((RANDOM%3+1))

# Check Snake position Ladder position and No Play
while [[ $position -ne 100 ]]
do
	(( timeOfReachedPosition++ ))
	case $randomNumber1 in
   	1)
      	position=$(($position))
      	echo "No Play - position is =$position" 
      	;;

   	2)
      	ladderRandom="$(rollDie)"
      	position=$(($position+$ladderRandom))
      	echo "Ladder - position is =$position"
			if [ $position -gt 100 ]
			then
				position=$(($position-$ladderRandom)) 
      	fi
			;;

   	3)
      	snakeRandom="$(rollDie)"
			if [ $position -ne 0 ]
      	then
				position=$(($position-$snakeRandom))
      	fi
			echo "Snake - position is =$position" 
      	;;
	esac
done
printf "Reached to position : $timeOfReachedPosition"
