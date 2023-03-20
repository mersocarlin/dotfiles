#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title [AFK] Away from keyboard
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 📴

# Documentation:
# @raycast.author Hemerson Carlin
# @raycast.authorURL https://mersocarlin.com

# turn off office lights
curl -X HA_URL

# wait 2 seconds before continue
sleep 2

# put laptop in sleep mode
pmset sleepnow
