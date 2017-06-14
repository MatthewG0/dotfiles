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

if [ -e $HOME/.nvm/nvm.sh ]; then
  [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
  if [ -e $HOME/OneDrive/Dev/Node/node_modules ]; then
    export NODE_PATH=$HOME/.nvm/versions/node/v0.12.0/lib/node_modules:$HOME/OneDrive/Dev/Node/node_modules:$NODE_PATH
  fi
fi

# Other settings
alias 'gcan=git commit --amend --no-edit'
alias 'gpmh=git push -u me HEAD'
alias 'gpf=git push -f'
alias 'ff=find . -name '

