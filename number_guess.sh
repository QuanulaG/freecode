#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

USER_INFO() {
    echo "Enter your username:"
    read USERNAME
}

USER_SEARCH() {
# FIND USER
    USER_RESULT=$($PSQL "SELECT username FROM user_info WHERE username = '$USERNAME'")
    if [[ -z $USER_RESULT ]]
    then 
        NEW_USER_UPDATE=$($PSQL "INSERT INTO user_info (username, guesses) VALUES ('$USERNAME', 0)")			
		    echo "Welcome, $USERNAME! It looks like this is your first time here."
    else
        #GET EXISTING DATA
        GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM user_info WHERE username='$USERNAME' GROUP BY username")
        BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM user_info WHERE username='$USERNAME' GROUP BY username")
        echo "Welcome back, $(echo $USERNAME | sed -e 's/^[ \t]*//')! You have played $(echo $GAMES_PLAYED | sed -e 's/^[ \t]*//') games, and your best game took $(echo $BEST_GAME | sed -e 's/^[ \t]*//') guesses."
    fi
}
SECRET_NUMBER=$((RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=1
NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES + 1))
GUESS_ATTEMPT() {
echo "Guess the secret number between 1 and 1000:"
#GUESS NUMBER
read USER_GUESS
# GUESS NOT A NUMBER
if [[ ! $USER_GUESS =~ ^[0-9]*$ ]]
then
    echo "That is not an integer, guess again:"
    GUESS_ATTEMPT
#GUESS IS HIGHER
    else if [[ $USER_GUESS -gt $SECRET_NUMBER ]]
    then
    echo "It's lower than that, guess again:"
    let NUMBER_OF_GUESSES++
    GUESS_ATTEMPT
# GUESS IS LOWER   
    else if [[ $USER_GUESS -lt $SECRET_NUMBER ]]
    then
     echo "It's higher than that, guess again:"
     let NUMBER_OF_GUESSES++
     GUESS_ATTEMPT
   # GUESS IS CORRECT   
    else if [[ -z $USER_RESULT ]]
then
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice Job!"
    INSERT_NEW_USER_GAME_DETAILS=$($PSQL "UPDATE user_info SET guesses = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'")
else
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice Job!"
    INSERT_NEW_GAME_DETAILS=$($PSQL "INSERT INTO user_info(guesses) VALUES($NUMBER_OF_GUESSES)")
fi
fi
fi
fi
}

USER_INFO
USER_SEARCH
GUESS_ATTEMPT
