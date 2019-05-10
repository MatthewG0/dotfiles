BREW_PREFIX=$(brew --prefix)

path_add () {
  case ":$PATH:" in
    *":$1:"*) :;;
    *) PATH="$1:$PATH";;
  esac
}

path_add /usr/local/bin
path_add /usr/local/sbin
path_add $HOME/.fastlane/bin

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME=$HOME/Library/Android/sdk

path_add $ANDROID_HOME/tools
path_add $ANDROID_HOME/tools/bin
path_add $ANDROID_HOME/platform-tools

# iTerm2 tab titles
# function title {
#   local pwd_prompt='echo -ne "\033]0;$(dirs -0)\007";'
#   local escaped_pwd_prompt=${pwd_prompt//\\/\\\\}
#   export PROMPT_COMMAND=${PROMPT_COMMAND/$escaped_pwd_prompt}
#   if [ "$1" ] ; then
#     echo -ne "\033]0;${*}\007"
#   else
#     export PROMPT_COMMAND=$pwd_prompt${PROMPT_COMMAND}
#   fi
# }
# title

# bash_completion
if [ -f $BREW_PREFIX/etc/bash_completion ]; then
  . $BREW_PREFIX/etc/bash_completion
fi
if [ -e ~/.bashrc ]; then
  source ~/.bashrc
fi

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


NVM_INSTALL=/usr/local/Cellar/nvm/0.33.2/nvm.sh
if [ ! -e $NVM_INSTALL ]; then
  NVM_INSTALL=~/.nvm/nvm.sh
fi
if [ -e $NVM_INSTALL ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_INSTALL" ] && \. "$NVM_INSTALL"  # This loads nvm
#  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# Other settings
alias 'gcan=git commit --amend --no-edit'
alias 'gpmh=git push -u me HEAD'
alias 'gpf=git push -f'
alias 'gpr=git pull --rebase'
alias 'ff=find . -name '
alias 'gbd=git push me --delete $1 ; git branch -D $1'
REM() {
  echo %* &>/dev/null
}