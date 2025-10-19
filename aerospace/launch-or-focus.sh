#!/bin/bash

if (($# == 0)); then
    echo "Usage: launch-or-focus.sh [app-name] [launch-command]"
    exit 1
fi

APP_NAME="$1"
LAUNCH_COMMAND="$2"
alw_fmt='%{window-id} %{window-title} %{app-name} %{workspace}'
WINDOW_ID=$(aerospace list-windows --all --json --format "$alw_fmt" | yq "[sort_by(.window-id) | .[]|select(.app-name == \"$APP_NAME\")][0].window-id" | head -n1)

if [[ -n $WINDOW_ID ]] && [[ $WINDOW_ID != 'null' ]]; then
    aerospace focus --window-id $WINDOW_ID
else
    eval exec $LAUNCH_COMMAND
fi
