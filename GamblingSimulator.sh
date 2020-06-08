#!/bin/bash -x

everyDayStake=100;
betEveryGame=1;

echo "Gambler starts with stake of $everyDayStake$ everyday"
echo "Gambler bets $betEveryGame$ every game"

WIN=1;
LOOSE=0;
win=0;
loose=0;
bet=0;

while(($bet <= 100))
do
        ((bet++));
        gamblerCheck=$((RANDOM%2));

        if [[ $gamblerCheck -eq WIN ]]
        then
                echo "Gambler won 1$"
                win=$(($win+1));
        fi

        if [[ $gamblerCheck -eq LOOSE ]]
        then
                echo "Gambler loose 1$"
                loose=$(($loose+1));
        fi

        if [[ $win == 50 ]]
        then
                echo "Gambler won 50 times & resigned for the day"
                break;
        fi

        if [[ $loose == 50 ]]
        then
                echo "Gambler loose 50 times & resigned for the day"
                break;
        fi
done

