#!/usr/bin/env bash

# colors
default=39
black=30
red=31
green=32
yellow=33
blue=34
magenta=35
cyan=36
light_gray=37
dark_gray=90
light_red=91
light_green=92
light_yellow=93
light_blue=94
light_magenta=95
light_cyan=96
white=97

color() {
  echo "\e[$1m$2\e[0m"
}

directory() {
  echo $(color $green "\w ")
}

git_branch() {
  echo $(git rev-parse --abbrev-ref HEAD 2> /dev/null)
}

git_dirty() {
  git diff --quiet
  if [ ! $? -eq 0 ]; then
    echo $(color $red '+')
  fi
}

git_status() {
  local current_branch=$(git_branch)
  if [[ -n $current_branch ]]; then
    echo "($(color $cyan $current_branch)$(git_dirty)) "
  fi
}

exit_flag() {
  if [ $1 -eq 0 ]; then
    prompt_color=$yellow
  else
    prompt_color=$red
  fi

  echo $(color $prompt_color '> ')
}

jobs_count() {
  local count=$(jobs | wc -l)
  if [ ! $count -eq 0 ]; then
    echo $(color $yellow $count)
  fi
}

remote() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "$(color $magenta $HOST):"
  fi
}

prompt() {
  local last_exit_code=$?
  PS1="\n$(remote)$(directory)$(git_status)$(jobs_count)\n$(exit_flag $last_exit_code)"
}

PROMPT_COMMAND=prompt