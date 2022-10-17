#!/bin/bash
# freeCodeCamp Relational Database task "Periodic Table"
PSQL="psql -X --username=freecodecamp --dbname=periodic_table  --tuples-only -c"

# End the program immediately if no argument is passed
if [[ -z $1 ]]
  then
    echo "Please provide an element as an argument."
  exit
fi

# Set up variable to try and populate with queries
ELEMENT_DETAILS=

# Input is a number
if [[ $1 =~ ^[0-9]+$ ]] 
  then
    ELEMENT_DETAILS=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE elements.atomic_number=$1;")

  else
    INPUT_LENGTH=${#1}
    
    # Input is a symbol
    if [[ $INPUT_LENGTH < 3 ]]
      then
        ELEMENT_DETAILS=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE elements.symbol='$1';")

      # Input is a name
      else
        ELEMENT_DETAILS=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE elements.name='$1';")
    fi
fi

# Check if an element was found
if [[ ! -z $ELEMENT_DETAILS ]]
  then
    ELEMENT_DETAILS_NO_PIPES=$(echo $ELEMENT_DETAILS | sed -r 's/ \| / /g')

    echo $ELEMENT_DETAILS_NO_PIPES  | while read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
    do
         echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done

  else
    echo "I could not find that element in the database."
fi
