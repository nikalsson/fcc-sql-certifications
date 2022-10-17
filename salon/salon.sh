#!/bin/bash
# freeCodeCamp Relational Database task "Salon Appointment Scheduler"
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "Welcome to My Salon, how can I help you?" 
  echo -e "\n1) Haircut\n2) Massage\n3) Manicure"
  read SERVICE_ID_SELECTED

  if [[ $SERVICE_ID_SELECTED < 1 || $SERVICE_ID_SELECTED > 3 ]]
    then
      MAIN_MENU "Please enter a valid option."
    else
      BOOK_VISIT $SERVICE_ID_SELECTED
  fi
}

BOOK_VISIT() {
  NAME_OF_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$1")
  echo "$NAME_OF_SERVICE"

  # Check if the user exists
  echo "What's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # If customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
    then
      # get new customer name
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

  # Get the ID of the customer
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # Pick the time for the appointment
  NAME_OF_SERVICE_LOWERCASE=$(echo $NAME_OF_SERVICE | awk '{print tolower($0)'})
  CUSTOMER_NAME_SPACES_REMOVED=$(echo $CUSTOMER_NAME | sed -r 's/ *$|^ *//g')
  echo "At what time would you like your $NAME_OF_SERVICE_LOWERCASE, $CUSTOMER_NAME_SPACES_REMOVED?"
  read SERVICE_TIME

  # Insert new appointment
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  if [[ $INSERT_CUSTOMER_RESULT == "INSERT 0 1" ]]
    then
      # Insert success, display a message
      echo -e "I have put you down for a $NAME_OF_SERVICE_LOWERCASE at $SERVICE_TIME, $CUSTOMER_NAME_SPACES_REMOVED."
    else
      # Failure, return to main menu
      MAIN_MENU "Sorry, failed to create your appointment. Please try again."
  fi
}

MAIN_MENU
