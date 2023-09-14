#!/bin/bash

get_author() {
  AREACODE_REGEX='^\+1.+'
  if [[ "$SMS_1_NUMBER" =~ $AREACODE_REGEX ]]
  then
    AUTHOR="${SMS_1_NUMBER:0:2} ${SMS_1_NUMBER:2:3} ${SMS_1_NUMBER:5:3} ${SMS_1_NUMBER:8:4}"
  else
    AUTHOR=$SMS_1_NUMBER
  fi
  echo "$AUTHOR"
}

get_full_message() {
  FULLMSG=""
  for SMSIDX in $(seq 1 ${SMS_MESSAGES}); do
    declare SMS_CONTENT="SMS_${SMSIDX}_TEXT"
    FULLMSG+="${!SMS_CONTENT} "
  done
  echo "$FULLMSG"
}