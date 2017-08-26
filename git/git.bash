source /usr/local/git/contrib/completion/git-completion.bash
source /usr/local/git/contrib/completion/git-prompt.sh
GIT_PS1_DESCRIBE_STYLE='describe'
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUNTRACKEDFILES=1

# Some escape codes that we can use to color our prompt
   RED="\[\033[0;31m\]"
YELLOW="\[\033[1;33m\]"
 GREEN="\[\033[0;32m\]"
  BLUE="\[\033[0;34m\]"
RESET="\[\e[0m\]"

export PROMPT_COMMAND='__git_ps1 "[\u@${BLUE}\h${RESET}:\w" "]\\\$ ";'${PROMPT_COMMAND}
