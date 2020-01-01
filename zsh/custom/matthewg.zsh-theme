#!/usr/bin/env zsh

# Modified from git.zsh
function my_git_prompt_status() {
  local STATUS=$(git_prompt_status)
  if [ ! -z "$STATUS" ] && STATUS=" $STATUS"
  echo $STATUS
}

function my_git_prompt() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "%{$GIT_PROMPT_INFO%} ($(parse_git_dirty)${ref#refs/heads/}$(my_git_prompt_status)%{$GIT_PROMPT_INFO%})"
  fi
}

# Based on oh-my-zsh theme https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/themes/muse.zsh-theme

setopt promptsubst

autoload -U add-zsh-hook

DEFAULT_COLOR=$reset_color # $FG[252]
DARK_COLOR=$FG[012]
PROMPT_SUCCESS_COLOR=$DEFAULT_COLOR
PROMPT_FAILURE_COLOR=$FG[124]
PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_PROMPT=$DEFAULT_COLOR
GIT_DIRTY_COLOR=$fg[green]
GIT_CLEAN_COLOR=$fg[green]
GIT_PROMPT_INFO=$DEFAULT_COLOR
USERNAME_COLOR=$DEFAULT_COLOR
MACHINE_COLOR=$DARK_COLOR
TIMESTAMP_COLOR=$FG[239]

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$fg_bold[red]%}(ssh) "
  fi
}

local ret_status="%(?:%{$PROMPT_SUCCESS_COLOR%}:%{$PROMPT_FAILURE_COLOR%}):%{$reset_color%}"
local user_status="$(ssh_connection)%{$USERNAME_COLOR%}%n@%{$MACHINE_COLOR%}%m%{$reset_color%}"

PROMPT='[$user_status$ret_status%~%{$reset_color%}$(my_git_prompt)$(virtualenv_prompt_info)%{$reset_color$PROMPT_PROMPT%}]$ZSH_THEME_PROMPT_SUFFIX%{$reset_color%}  '

# Show timestamp
RPROMPT='%{$TIMESTAMP_COLOR%}[%D{%m/%d %l:%M.%S %p}]%{$reset_color%}'

#PROMPT=$'\n$(ssh_connection)%{$fg_bold[green]%}%n@%m%{$reset_color%}$(my_git_prompt) : %~\n[${ret_status}] %# '

ZSH_THEME_GIT_PROMPT_DIRTY="%{$GIT_DIRTY_COLOR%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$GIT_CLEAN_COLOR%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[red]%}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}✭%{$reset_color%}"

ZSH_THEME_VIRTUALENV_PREFIX=" ["
ZSH_THEME_VIRTUALENV_SUFFIX="]"

ZSH_THEME_PROMPT_SUFFIX="$"