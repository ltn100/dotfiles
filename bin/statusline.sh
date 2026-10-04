#!/bin/bash

# Claude Code Status Line Script
# Shows: model, context progress bar, cost, directory, git branch
#
# Claude Code sends JSON data via stdin — read it from there, not from a file.

# ANSI Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
DIM='\033[2m'
BOLD='\033[1m'
NC='\033[0m'

input=$(cat)

# Extract fields using jq
MODEL=$(echo "$input" | jq -r '.model.display_name // "unknown"')
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
DIR=$(echo "$input" | jq -r '.workspace.current_dir // "."')

COST_FMT=$(printf '$%.2f' "$COST")
CURRENT_DIR=$(basename "$DIR")

# Git branch
GIT_BRANCH=$(git -C "$DIR" branch 2>/dev/null | grep '^*' | sed 's/* //')

# Progress bar
BAR_WIDTH=20
FILLED=$((PCT * BAR_WIDTH / 100))
EMPTY=$((BAR_WIDTH - FILLED))

# Color based on context usage
if [[ $PCT -lt 50 ]]; then
    BAR_COLOR=$GREEN
elif [[ $PCT -lt 75 ]]; then
    BAR_COLOR=$YELLOW
else
    BAR_COLOR=$RED
fi

BAR="${BAR_COLOR}${BOLD}"
for ((i = 0; i < FILLED; i++)); do BAR+="█"; done
BAR+="${NC}${DIM}"
for ((i = 0; i < EMPTY; i++)); do BAR+="░"; done
BAR+="${NC}"

# Build location string
if [[ -n "$GIT_BRANCH" ]]; then
    LOCATION="${CYAN}${CURRENT_DIR}${NC} ${DIM}(${MAGENTA}${GIT_BRANCH}${NC}${DIM})${NC}"
else
    LOCATION="${CYAN}${CURRENT_DIR}${NC}"
fi

echo -e "${BLUE}${BOLD}${MODEL}${NC} ${DIM}|${NC} ${BAR} ${BAR_COLOR}${PCT}%${NC} ${DIM}|${NC} ${GREEN}${COST_FMT}${NC} ${DIM}|${NC} ${LOCATION}"
