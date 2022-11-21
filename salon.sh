#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ My Salon ~~~~~\n"

MAIN_MENU () {
  SERVICE_SELECTION_MENU
  CUSTOMER_INFO_MENU
  APPOINTMENT_SCHEDULE_MENU
}

SERVICE_SELECTION_MENU () {
  SERVICES_OFFERED=$($PSQL "SELECT service_id, name FROM services")
  echo "Welcome to my Salon! How may I help you?"
  echo -e "We offer these services:"
  echo "$SERVICES_OFFERED" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  echo -e "\nEnter the number for the service that you want?"
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED == [1-3] ]]
  then
    echo "Please enter a valid service number"
    SERVICE_SELECTION_MENU
  else
    SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED") 
  fi
}

CUSTOMER_INFO_MENU () {
# GET CUSTOMER PHONE NUMBER 
 echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
 if [[ -z $CUSTOMER_PHONE ]]
 then
  echo "Please input a valid number"
  CUSTOMER_INFO_MENU
 else
  CHECK_CUSTOMER_PHONE=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'") 
  CHECK_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE' AND name IS NULL")      
# IF CUSTOMER DOES NOT EXIST
if [[ -z $CHECK_CUSTOMER_PHONE ]]
        then
        echo -e "\nWhat's your name?"
        read CUSTOMER_NAME
         INSERT_CUSTOMER_INFO=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
        else
        if [[ ! -z $CUSTOMER_NAME ]]
        then
            echo -e "\nWhat's your name?"
            read $CUSTOMER_NAME
            INSERT_CUSTOMER_NAME=$($PSQL "UPDATE customers SET name='$CUSTOMER_NAME' WHERE phone='$CUSTOMER_PHONE'")
        fi
fi
fi
}

APPOINTMENT_SCHEDULE_MENU () {
# GET SERVICE TIME
 echo -e "\nWhat's your desired time EX:hh:mm?"
          read SERVICE_TIME
if [[ -z $SERVICE_TIME ]]
then
  echo "Please input your desired time EX:hh:mm"
  APPOINTMENT_SCHEDULE_MENU
else 
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  else
  INSERT_SERVICE_TIME_RESULT=$($PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME')")
   echo -e "\nI have put you down for a$SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
fi
fi
}

MAIN_MENU 

