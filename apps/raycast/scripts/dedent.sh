#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Dedent
# @raycast.description Remove Leading Spaces
# @raycast.mode silent
# @raycast.icon ✂️

pbpaste | sed 's/^[[:space:]]*//' | pbcopy
echo "Cleaned!"
