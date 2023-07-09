# make sure that the environment variables are working by sourcing them
source $HOME/.dotfiles/zsh/setup/.zshenv

# add symlinks to home folder for setting up the shell on startup
ln -s $ZDOTDIR/.zshrc $HOME/.zshrc
ln -s $ZDOTDIR/.zshenv $HOME/.zshenv

# clean up the home directory by moving the oh-my-zsh files to .dotfiles
mkdir $XDG_CONFIG_HOME/oh-my-zsh
mv $HOME/.oh-my-zsh/* $XDG_CONFIG_HOME/oh-my-zsh/
rm -rf $HOME/.oh-my-zsh

# install plugins for zsh via oh-my-zsh
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# theme: PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# reload once again to finish the setup
source $ZDOTDIR/.zshrc
