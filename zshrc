# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sporty_256"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux extract archlinux)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Vars
# 
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source virtualenvwrapper.sh


source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='vim'
fi

   export PAGER='vimpager'
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias -g v=vim
alias -g sv="sudo vim"
alias -g mp="mousepad "
alias -g zrc="vim ~/.zshrc"
alias -g tconf="vim ~/.tmux.conf"
alias -g pconf="sudo vim /etc/pacman.conf"
alias -g mirrors="sudo vim /etc/pacman.d/mirrorlist"
alias -g vrc="vim ~/.vimrc"
alias -g zenv="vim ~/.zshenv"
alias -g xdef="vim ~/.Xdefaults"
alias -g fix='sudo rm -f /var/lib/pacman/db.lck'
alias -g ys='yaourt -S'
alias -g ysyu='yaourt -Syua'
alias -g con='vim $HOME/.i3/config'
alias -g comp='vim $HOME/.config/compton.conf'
alias -g sps='sudo pacman -S'
alias -g spsc='sudo pacman -Sc'
alias -g spss='sudo pacman -Ss'
alias -g spsyu='sudo pacman -Syu'
alias -g spsyy='sudo pacman -Syy'
alias -g spsy='sudo pacman -Sy'
alias -g spr='sudo pacman -Rcns'
alias -g del='rm -rvf'
alias -g s='sudo'
alias -g cop='cp -rvfn'
alias -g rbt='systemctl reboot'
alias -g off='systemctl poweroff'
alias -g mirrors='sudo pacman-mirrors -g'
