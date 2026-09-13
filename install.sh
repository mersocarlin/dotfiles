#!/bin/bash

set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

bash ./packages.sh
bash ./apps.sh
bash ./postinstall.sh

echo "Done. Start a new terminal or run: exec zsh"
