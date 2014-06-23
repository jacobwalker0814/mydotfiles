###################
# Begin OH MY ZSH #
###################

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git composer)

source $ZSH/oh-my-zsh.sh

#################
# End OH MY ZSH #
#################

# Style My prompt
for COLOR in CYAN WHITE YELLOW MAGENTA BLACK BLUE RED DEFAULT GREEN GREY; do
    eval COLOR_$COLOR='%{$fg[${(L)COLOR}]%}'
    eval COLOR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done
COLOR_RESET="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX=" ${COLOR_RESET}${COLOR_CYAN}(⎇  "
ZSH_THEME_GIT_PROMPT_SUFFIX="${COLOR_RESET}${COLOR_CYAN})"
ZSH_THEME_GIT_PROMPT_DIRTY="${COLOR_RESET}${COLOR_BRIGHT_RED} ✘${COLOR_RESET}"
ZSH_THEME_GIT_PROMPT_CLEAN="${COLOR_RESET}${COLOR_BRIGHT_GREEN} ✔${COLOR_RESET}"

PROMPT=$COLOR_GREEN'%4~$(git_prompt_info)'$COLOR_BRIGHT_YELLOW'%(?.. %?)'$COLOR_RESET$COLOR_GREEN' ᐳ'$COLOR_RESET' '

# Use vimx when available for better X integration
if [ -e /usr/bin/vimx ]; then
    export EDITOR=/usr/bin/vimx
elif [ -e /usr/bin/vim ]; then
    export EDITOR=/usr/bin/vim
fi

# Define my XDG dirs for things like powerline
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS}:${HOME}/.my_config:/etc/xdg"

export PATH=$PATH:/usr/lib/qt-3.3/bin:/usr/NX/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin
export PATH="${PATH}:${HOME}/bin:${HOME}/.local/bin"

# RVM TODO maybe use a omz plugin?
[ -f ~/.rvm/scripts/rvm ] && . ~/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Hook to make local changes
[ -f ~/.zshrc_local ] && . ~/.zshrc_local
