#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"

USER_INFO() {
    echo "Enter your username:"
    read USERNAME
}

USER_SEARCH() {
# FIND USER
    USER_RESULT=$($PSQL "SELECT username FROM user_info WHERE username = '$USERNAME'")
    if [[ -z $USER_RESULT ]]
    then 			
		    echo "Welcome, $USERNAME! It looks like this is your first time here."
    else
        #GET EXISTING DATA
        GAMES_PLAYED=$($PSQL "SELECT MAX(games_played) FROM user_info WHERE username='$USERNAME' GROUP BY username")
        BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM user_info WHERE username='$USERNAME' GROUP BY username")
        echo "Welcome back, $(echo $USERNAME | sed -e 's/^[ \t]*//')! You have played $(echo $GAMES_PLAYED | sed -e 's/^[ \t]*//') games, and your best game took $(echo $BEST_GAME | sed -e 's/^[ \t]*//') guesses."
    fi
SECRET_NUMBER=$((RANDOM % 1000 + 1))
}

GUESS_ATTEMPT() {
  echo "Guess the secret number between 1 and 1000:"
  #GUESS NUMBER
  NUMBER_OF_GUESSES=1
  
  read USER_GUESS
while [[ $USER_GUESS -ne $SECRET_NUMBER ]]
do
# GUESS NOT A NUMBER
    if [[ ! $USER_GUESS =~ ^-?[0-9]+$ ]]
    then
    echo "That is not an integer, guess again:" 
#GUESS IS HIGHER
    elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
    then
    echo "It's lower than that, guess again:"
# GUESS IS LOWER   
    elif [[ $USERGUESS -lt $SECRET_NUMBER ]]
    then
     echo "It's higher than that, guess again:"  
 fi 
 read USER_GUESS 
 NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES + 1)) 
done
# GUESS IS CORRECT
 if [[ $USER_GUESS -eq $SECRET_NUMBER ]]
  then
   echo -e "You guessed it in $(echo $NUMBER_OF_GUESSES | sed -E 's/^ *| *$//g') tries. The secret number was $(echo $SECRET_NUMBER | sed -E 's/^ *| *$//g'). Nice job!"
  fi
}

INSERT_DATA() {
    if [[ -z $USER_RESULT ]] || [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
then
    GAMES_PLAYED=$(( $GAMES_PLAYED + 1))
    NEW_USER_UPDATE=$($PSQL "INSERT INTO user_info (username, guesses, games_played) VALUES ('$USERNAME', $NUMBER_OF_GUESSES, $GAMES_PLAYED)")
    else
    GAMES_PLAYED=$(( $GAMES_PLAYED + 1))
    INSERT_NEW_USER_GAME_DETAILS=$($PSQL "UPDATE user_info SET games_played = '$GAMES_PLAYED', username = '$USERNAME', guesses = $NUMBER_OF_GUESSES")
fi
}
USER_INFO
USER_SEARCH
GUESS_ATTEMPT
INSERT_DATA
