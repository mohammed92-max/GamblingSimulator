#!/bin/bash -x

everyDayStake=100;
betEveryGame=1;

echo "Gambler starts with stake of $everyDayStake$ everyday"
echo "Gambler bets $betEveryGame$ every game"

WIN=1;
LOOSE=0;
totalAmountWon=0;
totalAmountLost=0;

for((day=1; day<=20; day++))
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
                echo "Gambler has been won 1$"
                win=$(($win+1));
        fi

        if [[ $gamblerCheck -eq LOOSE ]]
        then
            echo "Gambler has loose 1$"
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

                echo "Amount won per day is $win$";
                echo "Amount lost per day is $loose$";
        done

        totalAmountWon=$(($totalAmountWon+$win));
        totalAmountLost=$(($totalAmountLost+$loose));
done

echo "Total amount won in 20 days is $totalAmountWon$"
echo "Total amount lost in 20 days is $totalAmountLost$"



