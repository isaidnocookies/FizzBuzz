#!/bin/sh
START=-50;
FINISH=50

for i in `seq $START $FINISH`; do
      if [ $i == 0 ]; then
            echo $i;
      elif [ $((i % 15)) == 0 ]; then
            echo "FizzBuzz";
      elif [ $((i % 3)) == 0 ]; then
            echo "Fizz";
      elif [ $((i % 5)) == 0 ]; then
            echo "Buzz";
      else
            echo $i;
      fi
done
