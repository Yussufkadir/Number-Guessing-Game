#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDOM_NUM=$((RANDOM % 1000 + 1))
GAME_INITIATOR(){
echo -n "Enter your username: "
read USERNAME
USER_ID=$($PSQL "select user_id from users where username='$USERNAME'")
if [[ -z $USER_ID ]]
then
echo "Welcome, $USERNAME! It looks like this is your first time here."
INSERT_USER=$($PSQL "insert into users(username) values('$USERNAME')")
USER_ID=$($PSQL "select user_id from users where username='$USERNAME'")
GAMES_PLAYED=0
BEST_GAME=0
else
GAMES_PLAYED=$($PSQL "select count(*) from games where user_id=$USER_ID")
BEST_GAME=$($PSQL "select min(tries) from games where user_id=$USER_ID")
if [[-z $BEST_GAME ]]
then
BEST_GAME=0
fi
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
echo "Guess the secret number between 1 and 1000:"
GAME 0 
}
GAME(){
NUM_OF_TRIES=$1
read GUESS
NUM_OF_TRIES=$(($NUM_OF_TRIES + 1))
if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
echo "That is not an integer, guess again:"
GAME $NUM_OF_TRIES
fi
if [[ $GUESS -lt $RANDOM_NUM ]]
then
echo "It's higher than that, guess again:"
GAME $NUM_OF_TRIES
elif [[ $GUESS -gt $RANDOM_NUM ]]
then
echo "It's lower than that, guess again:"
GAME $NUM_OF_TRIES
elif [[ $GUESS -eq $RANDOM_NUM ]]
then
echo  "You guessed it in $NUM_OF_TRIES tries. The secret number was $RANDOM_NUM. Nice job!"
INSERT_FINAL_RESULT=$($PSQL "insert into games(user_id, number, tries) values($USER_ID, $RANDOM_NUM, $NUM_OF_TRIES)")
fi
}
GAME_INITIATOR
