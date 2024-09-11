#!/bin/bash

spotify_workspace=$(hyprctl clients -j \
    | jq -r '.[] | select(.initialTitle == "Spotify Premium")' \
    | jq -r '.workspace.id')

[ -z "$spotify_workspace" ] && { spotify & } \
|| hyprctl dispatch workspace "$spotify_workspace"
