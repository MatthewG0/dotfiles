# Matthew's dotfiles
A collection of settings and preferences to personalize your dev environment.
## Usage
1. Clone this repo to your local machine, e.g. `~/.dotfiles`
1. From this directory, run `./install`.  This command will create symlinks from this project into your home directory and other locations, for example `~/.dotfiles/bashrc` will be linked to `~/.bashrc`.
1. Installer will warn you if preexisting files would be overwritten by links. You will need to copy settings from those files into this project, or ignore them, in order to remove the preexisting dotfiles and use this installer.
1. Changes that you make to files in the project will be reflected directly in your settings without an additional `./install` required, since the files are symlinked.
1. If you make changes that can be shared, please submit a Pull Request
1. If you have changes for your local machine that you do not want to share, you can make this is a subdirectory called `local`.  For example, `local/gitconfig` can contain your github username/email and this does not need to be added to the main project.
