#!/bin/bash -x

DAILY_MONEY=100
NUM_OFDAYS=30
WIN=1
LOSS=0
BET=1
FLAG=true
LAST_LOSSAMOUNT=0

stakePercentAmount=$(( 50*$DAILY_MONEY/100 ))
maxWin=$(( $stakePercentAmount+$DAILY_MONEY ))
maxLoss=$(( $DAILY_MONEY-$stakePercentAmount ))
totalWinOrLoss=0
daysWin=0
daysLoss=0

declare -A day
declare -A month

function gamblerDayBet()
{
   dayMoney=$DAILY_MONEY
   while [ $dayMoney -lt $maxWin ] && [ $dayMoney -gt $maxLoss ]
   do
     rem=$(( RANDOM % 2 ))
     if [ $rem -eq 1 ]
     then
        dayMoney=$(( $dayMoney+$BET ))
     else
        dayMoney=$(( $dayMoney-$BET ))
     fi
   done
}

function gamblerMonthBet(){

   for (( day=1; day<=$NUM_OFDAYS; day++ ))
   do
   gamblerDayBet
      if [ $dayMoney -eq $maxLoss ]
      then
         totalWinOrLoss=$(( $totalWinOrLoss - $stakePercentAmount ))
         day["Day $day"]=-$stakePercentAmount
         month["Day $day"]=$totalWinOrLoss
         ((daysLoss++))
      else
         totalWinOrLoss=$(( $totalWinOrLoss + $stakePercentAmount ))
         day["Day $day"]=$stakePercentAmount
         month["Day $day"]=$totalWinOrLoss
         ((daysWin++))
      fi
   done

   echo "Total Won or loss is $totalWinOrLoss"
   echo "Number of days Win $daysWin by $(($daysWin*$stakePercentAmount))"

   luckiestDay=$( printf "%s\n" ${month[@]} | sort -nr | head -1 )
   unluckiestDay=$( printf "%s\n" ${month[@]} | sort -nr | tail -1 )

   echo "Number of days Loss $daysLoss by  $(($daysLoss*$stakePercentAmount))"
   echo "${!month[@]} : ${month[@]}"

   for data in "${!month[@]}"
   do
      if [[ ${month[$data]} -eq $luckiestDay ]]
      then
         echo "Gambler's lucky day is $data $luckiestDay"
      elif [[ ${month[$data]} -eq $unluckiestDay ]]
      then
         echo "Gambler's unlucky day is $data $unluckiestDay"
      fi
   done
}



