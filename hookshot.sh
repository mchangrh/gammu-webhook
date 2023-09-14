#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/env.sh"
source "$SCRIPT_DIR/parse.sh"

AUTHOR=$(get_author)
FULLMSG=$(get_full_message)

curl \
  -H "Content-Type: application/json" \
  -d "{\"version\":\"v2\",\"username\":\"${AUTHOR}\",\"text\":\"${FULLMSG}\"}" \
  "$HOOKSHOT_URL"