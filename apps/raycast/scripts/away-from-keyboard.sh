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

# wait 500ms before continue
sleep 0.5

# put laptop in sleep mode
pmset sleepnow
