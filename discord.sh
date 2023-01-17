#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/env.sh"
AREACODE_REGEX='^\+1\d+'

if [[ "$SMS_1_NUMBER" =~ $AREACODE_REGEX ]]
then
  AUTHOR="${SMS_1_NUMBER:0:2} ${SMS_1_NUMBER:2:3} ${SMS_1_NUMBER:5:3} ${SMS_1_NUMBER:8:4}"
else
  AUTHOR=$SMS_1_NUMBER
fi

curl \
  -H "Content-Type: application/json" \
  -d "{\"username\": \"${AUTHOR}\", \"content\": \"${SMS_1_TEXT}\"}" \
  "$WEBHOOK_URL"