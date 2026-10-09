#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=numberguess -t --no-align -c"

echo -e "\n~~~ Welcome to the Number Guessing game! ~~~\n"

echo -e "\nEnter your username:"
read USER_NAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USER_NAME'")
# check if user_ID already registered in the database
if [[ -z $USER_ID ]]
then
  # add username in users table
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES ('$USER_NAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USER_NAME'")
  
  echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."

else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(result) FROM games WHERE user_id = $USER_ID")
  echo -e "\nWelcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# start the game
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS_NUMBER

NUMBER_OF_GUESSES=1

while true
do
  if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then 
    echo -e "\nThat is not an integer, guess again:"
    read GUESS_NUMBER
    continue
  fi  
  
  if (( GUESS_NUMBER == SECRET_NUMBER ))
  then
    break
  elif (( GUESS_NUMBER > SECRET_NUMBER ))
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:" 
  fi
  
  read GUESS_NUMBER
  NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
done

INSERT_GAME_INFO=$($PSQL "INSERT INTO games(user_id, result) VALUES ($USER_ID, $NUMBER_OF_GUESSES)")

echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
