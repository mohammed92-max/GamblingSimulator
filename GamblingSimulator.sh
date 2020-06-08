#!/bin/bash -x

everyDayStake=100;
betEveryGame=1;

echo "Gambler starts with stake of $everyDayStake$ everyday"
echo "Gambler bets $betEveryGame$ every game"

gamblerCheck=$((RANDOM%2));
LOOSE=0;
WIN=1;

if [[ $gamblerCheck -eq LOOSE ]]
then
        echo "Gambler loose $1"
fi

if [[ $gamblerCheck -eq WIN ]]
then
        echo "Gambler won $1"
fi
