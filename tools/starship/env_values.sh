#!/bin/bash

# Format: \033[1;38;2;R;G;Bm
ESPIDF_COLOR='\033[1;38;2;214;96;102m'
PYVENV_COLOR='\033[1;38;2;100;200;100m'
RESET='\033[0m'

# Check for ESP-IDF
if [ -n "$IDF_PATH" ]; then
    echo "${ESPIDF_COLOR}(ESP-IDF)${RESET}"
# Check for Python virutal environment
elif [ -n "$VIRTUAL_ENV" ]; then
    venv_name=$(basename "$VIRTUAL_ENV")
    echo "${PYENV_COLOR}(󱔎 $venv_name)${RESET}"
else
    echo ""
fi