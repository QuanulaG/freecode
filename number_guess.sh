#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo -e "\n~~~~WELCOME TO NUMBER GUESS~~~~\n"


USER_INFO() {
echo -e "Enter your username:"
read USERNAME
}

USER_SEARCH() {
# FIND USER
    USER_RESULT=$($PSQL "SELECT username FROM user_info WHERE username = '$USERNAME'")
    if [[ -z $USER_RESULT ]]
    then 
        NEW_USER_UPDATE=$($PSQL "INSERT INTO user_info (username, guesses) VALUES ('$USERNAME', 0)")			
		    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
    else
        #GET EXISTING DATA
        GAMES_INFO=$($PSQL "SELECT username, games_id, guesses FROM user_info WHERE username='$USERNAME'")
        COUNT_RESULT=$($PSQL "SELECT COUNT(games_id) FROM user_info WHERE username='$USERNAME' GROUP BY username")
        MIN_RESULT=$($PSQL "SELECT MIN(guesses) FROM user_info WHERE username='$USERNAME' GROUP BY username")
        echo "$GAMES_INFO" | while IFS="|" read GAMES_ID GUESSES
        do 
        echo -e "Welcome back, $(echo $USERNAME | sed -e 's/^[ \t]*//')! You have played $(echo $COUNT_RESULT | sed -e 's/^[ \t]*//') games, and your best game took $(echo $MIN_RESULT | sed -e 's/^[ \t]*//') guesses."
        done
    fi
}

NUMBER=$((RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=0
START_GAME() {
#GUESS NUMBER
echo -e "Guess the secret number between 1 and 1000:"
read USER_GUESS

# GUESS NOT A NUMBER
if [[ ! $USER_GUESS =~ ^[0-9]*$ ]]
then
    let NUMBER_OF_GUESSES++
    echo -e "That is not an integer, guess again:"
    START_GAME
#GUESS IS HIGHER
    else if [[ $USER_GUESS -gt $NUMBER ]]
    then
    let NUMBER_OF_GUESSES++
  echo -e "It's lower than that, guess again:"
  START_GAME
# GUESS IS LOWER   
    else if [[ $USER_GUESS -lt $NUMBER ]]
    then
    let NUMBER_OF_GUESSES++
  echo -e "It's higher than that, guess again:"
  START_GAME
# GUESS IS CORRECT   
    else if [[ $USER_GUESS = $NUMBER ]]
    then
     echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice Job!"
fi
}

INSERT_GAME_RESULT() {
if [[ -z $USER_RESULT ]]
then
    INSERT_NEW_USER_GAME_DETAILS=$($PSQL "UPDATE user_info SET guesses = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'")
else
    INSERT_NEW_GAME_DETAILS=$($PSQL "INSERT INTO user_info(guesses) VALUES($NUMBER_OF_GUESSES)")
fi
}

USER_INFO
USER_SEARCH
START_GAME
INSERT_GAME_RESULT
