#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

CHECK_AND_CREATE_TEAM() { 
		#check if the team is already inserted
		TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$1'")

    # if not found
    if [[ -z $TEAM_ID ]]
			then
			INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$1')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
				then
					echo Inserted into teams, $1
      fi
		fi
}

echo $($PSQL "TRUNCATE teams CASCADE;")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != winner && $OPPONENT != opponent ]]
  then
    CHECK_AND_CREATE_TEAM "$WINNER" "winner"
    CHECK_AND_CREATE_TEAM "$OPPONENT" "opponent"
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")
    if [[ $INSERT_GAME == "INSERT 0 1" ]]
      then
        echo Inserted into games $YEAR, $ROUND, $WINNER, $OPPONENT, $WINNER_GOALS:$OPPONENT_GOALS
    fi
  fi
done