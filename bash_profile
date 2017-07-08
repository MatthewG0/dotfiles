export PATH=/usr/local/bin:/usr/local/sbin:$HOME/.fastlane/bin:$PATH
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# iTerm2 tab titles
function title {
  local pwd_prompt='echo -ne "\033]0;$(dirs -0)\007";'
  local escaped_pwd_prompt=${pwd_prompt//\\/\\\\}
  export PROMPT_COMMAND=${PROMPT_COMMAND/$escaped_pwd_prompt}
  if [ "$1" ] ; then
    echo -ne "\033]0;${*}\007"
  else
    export PROMPT_COMMAND=$pwd_prompt${PROMPT_COMMAND}
  fi
}
title

# bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
if [ -e ~/.bashrc ]; then
  source ~/.bashrc
fi

NVM_INSTALL=$(brew --prefix nvm)/nvm.sh
if [ -e $NVM_INSTALL ]; then
  export NVM_DIR=~/.nvm
  [[ -s $NVM_INSTALL ]] && . $NVM_INSTALL  # This loads NVM
fi

# Other settings
alias 'gcan=git commit --amend --no-edit'
alias 'gpmh=git push -u me HEAD'
alias 'gpf=git push -f'
alias 'ff=find . -name '

