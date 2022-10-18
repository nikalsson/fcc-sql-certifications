#!/bin/bash
# Number guessing game exercise for freeCodeCamp relational database certification

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Get the user or create a new one
GET_USER() {
  echo -e "Enter your username:"
  read USERNAME

  QUERY_USER=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")
  if [[ -z $QUERY_USER ]]
    # If the username has not been used before
    then
      echo -e "Welcome, $USERNAME! It looks like this is your first time here."
      INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')");
      if [[ -z $INSERT_USER ]]
        then
          echo -e "Uh oh, something went wrong. Please pick a username that is at most 22 characters long and try again."
      fi

    else
      # User found, assign the details to variables
      IFS='|' read -r USERNAME GAMES_PLAYED BEST_GAME <<< "$QUERY_USER"

      echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
}

GET_USER

# Generate the secret number for the user to guess and declare necessary variables
SECRET_NUMBER=$(( 1+ RANDOM % 1000 ))
KEEP_GUESSING=true
AMOUNT_OF_GUESSES=0
GUESS=
echo "Guess the secret number between 1 and 1000:"
echo $SECRET_NUMBER # for cheating

while $KEEP_GUESSING
  do
    read GUESS
    (( AMOUNT_OF_GUESSES += 1 ))

    # Start by filtering out the non-number guesses
    if ! [[ $GUESS =~ ^[0-9]+$ ]] 
      then
        echo "That is not an integer, guess again:"
    elif (( GUESS < SECRET_NUMBER)) 
      then
        echo "It's higher than that, guess again:"
    elif (( GUESS > SECRET_NUMBER)) 
      then
        echo "It's lower than that, guess again:"
    elif (( GUESS == SECRET_NUMBER )) 
      then
        KEEP_GUESSING=false
        echo "You guessed it in $AMOUNT_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

        # Set the new best game result, either overwrite the existing one or set current as best
        if [[ $BEST_GAME > $AMOUNT_OF_GUESSES || -z $BEST_GAME ]]
          then
            BEST_GAME=$AMOUNT_OF_GUESSES
        fi
    fi
done

# Update the user with games played and best game result
UPDATE_USER=$($PSQL "UPDATE users SET games_played=$(($GAMES_PLAYED + 1)), best_game=$BEST_GAME WHERE username='$USERNAME'");
