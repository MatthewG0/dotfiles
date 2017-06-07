# run all bash scripts
for file in $HOME/.dotfiles/**/*.bash;
do
  source $file;
done
