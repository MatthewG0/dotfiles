export PATH=/usr/local/bin:/usr/local/sbin:$HOME/.fastlane/bin:$PATH
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

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
