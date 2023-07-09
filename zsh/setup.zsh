# make sure that the environment variables are working by sourcing them
source ~/.dotfiles/zsh/.zshenv

# clean up the home directory by moving the oh-my-zsh files to .dotfiles
mkdir $XDG_CONFIG_HOME/oh-my-zsh
mv ~/.oh-my-zsh/* $XDG_CONFIG_HOME/oh-my-zsh/
rm -rf ~/.oh-my-zsh

# oh-my-zsh installation makes a .zshrc file in the home dir
# so let's remove that too
rm ~/.zshrc

# source the main zsh file
source $ZDOTDIR/.zshrc

# install plugins for zsh via oh-my-zsh
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# theme: PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# reload once again to finish the setup
source $ZDOTDIR/.zshrc
