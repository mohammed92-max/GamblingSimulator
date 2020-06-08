#!/bin/bash -x

everyDayStake=100;
betEveryGame=1;

echo "Gambler starts with stake of $everyDayStake$ everyday"
echo "Gambler bets $betEveryGame$ every game"

WIN=1;
LOOSE=0;

totalAmountWon=0;
totalAmountLost=0;
winCount=0;
looseCount=0;
daysWonDiff=0;
daysLooseDiff=0;

for((day=1; day<=30; day++))
do
    bet=1;
    win=0;
    loose=0;

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

        echo "Amount won per day is $win$";
        echo "Amount lost per day is $loose$";

                if [[ $win == 50 ]]
        then
            echo "Gambler won 50 times & resigned for the day"
                        ((winCount++));
                        break;
        fi

        if [[ $loose == 50 ]]
        then
                echo "Gambler loose 50 times & resigned for the day"
                        ((looseCount++));
                        break;
        fi
    done

    totalAmountWon=$(($totalAmountWon+$win));
    totalAmountLost=$(($totalAmountLost+$loose));
done

if [[ $winCount -gt $looseCount ]]
then
        daysWonDiff=$(($winCount-$looseCount));
        echo "Days won difference are $daysWonDiff"
fi

if [[ $looseCount -gt $winCount ]]
then
        daysLooseDiff=$(($looseCount-$winCount));
        echo "Days lost difference are $daysLooseDiff"
fi

echo "Total amount won in 20 days is $totalAmountWon$"
echo "Total amount lost in 20 days is $totalAmountLost$"

echo "Days won is $winCount"
echo "Days lost is $looseCount"






