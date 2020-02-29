#!/bin/bash -x

echo "*************************Welcome To Snake And Ladder**********************"

# Constant
PLAYER=1
PLAYERTwo=2

# Variable
position=0
playerTwoPosition=0
count=0
timeOfReachedPosition=0

# player Roll die 1 TO 6
function rollDie()
{
	randomNumber=$((RANDOM%6+1))
	echo $randomNumber
}

# Generate random number 1 to 3
#randomNumber1=$((RANDOM%3+1))

# Check Snake position Ladder position and No Play
while [[ $position -ne 100 && $playerTwoPosition -ne 100 ]]
do
	randomNumber1=$((RANDOM%3+1))
	(( count++ ))
	(( timeOfReachedPosition++ ))
	case $randomNumber1 in
   	1)
      	echo "No Play" 
      	;;

   	2)
      	ladderRandom="$(rollDie)"
			if [ $(($count%2)) -eq 1 ]
			then
      		position=$(($position+$ladderRandom))
      		echo "Ladder1 - position is =$position"
			else
				playerTwoPosition=$(($playerTwoPosition+$ladderRandom))
				echo "Ladder2 - position is =$playerTwoPosition"
			fi
			#position equals to 100
			if [ $position -gt 100 ]
			then
				position=$(($position-$ladderRandom)) 
      	fi

			if [ $playerTwoPosition -gt 100 ]
			then
				playerTwoPosition=$(($playerTwoPosition-$ladderRandom))
			fi
			;;

   	3)
      	snakeRandom="$(rollDie)"
			if [ $(($count%2)) -eq 1 ]
			then
			
				if [ $position -gt 0 ]
      		then
					position=$(($position-$snakeRandom))
      		fi
				echo "Snake1 - position is =$position" 
			else
				if [ $playerTwoPosition -gt 0 ]
            then
               playerTwoPosition=$(($playerTwoPosition-$snakeRandom))
            fi
            echo "Snake2 - position is =$playerTwoPosition" 

			fi
      	;;
	esac
done
printf "Reached to position : $timeOfReachedPosition"

if [ $playerTwoPosition -eq 100 ]
then
	printf "Second player win..."
else
	printf "First player win..."
fi
