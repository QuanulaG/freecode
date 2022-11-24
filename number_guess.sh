#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"


echo "Enter your username:"
read USERNAME

# FIND USER
    USER_RESULT=$($PSQL "SELECT username FROM user_info WHERE username = '$USERNAME'")
    if [[ -z $USER_RESULT ]]
    then 
        NEW_USER_UPDATE=$($PSQL "INSERT INTO user_info (username, guesses) VALUES ('$USERNAME', 0)")			
		    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
    else
        #GET EXISTING DATA
        COUNT_RESULT=$($PSQL "SELECT COUNT(game_id) FROM user_info WHERE username='$USERNAME' GROUP BY username")
        MIN_RESULT=$($PSQL "SELECT MIN(guesses) FROM user_info WHERE username='$USERNAME' GROUP BY username")
        echo "Welcome back, $USERNAME! You have played $COUNT_RESULT games, and your best game took $MIN_RESULT guesses."
    fi

echo -e "Guess the secret number between 1 and 1000:"
NUMBER=$((RANDOM % 1000 + 1))

#GUESS NUMBER
read USER_GUESS
let COUNT=0
until [ $USER_GUESS -eq $NUMBER]; do
# GUESS NOT A NUMBER
while [ $((USER_GUESS)) != $USER_GUESS ];
do
echo "That is not an integer, guess again:"
    READ $USER_GUESS
done
#GUESS IS HIGHER
    while [ $USER_GUESS -gt $NUMBER ];
    do
    echo "It's lower than that, guess again:"
    READ $USER_GUESS
    let COUNT++
    done
# GUESS IS LOWER   
    while [ $USER_GUESS -lt $NUMBER ];
    do
    echo "It's higher than that, guess again:"
    READ $USER_GUESS
    let COUNT++
    done
    done
# GUESS IS CORRECT   
    echo "You guessed it in $COUNT tries. The secret number was $NUMBER. Nice Job!"

if [[ -z $USER_RESULT ]]
then
    INSERT_NEW_USER_GAME_DETAILS=$($PSQL "UPDATE user_info SET guesses = $COUNT WHERE username = '$USERNAME'")
else
    INSERT_NEW_GAME_DETAILS=$($PSQL "INSERT INTO user_info(guesses) VALUES($COUNT)")
fi

