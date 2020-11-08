# Path to your oh-my-zsh installation.
export ZSH=$HOME/.ohmyzsh

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent lifetime 4h
# zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa2 id_github
zstyle :omz:plugins:ssh-agent identities id_rsa
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="frontcube"

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
plugins=(git tmux extract archlinux ssh-agent)
# plugins=(git tmux extract archlinux)
# plugins=(git tmux extract archlinux)

# autoload edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Vars
# 
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source virtualenvwrapper.sh


# source $ZSH/oh-my-zsh.sh

# export TERM=xterm-256color
export TERM=screen-256color
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
else
   export EDITOR='nvim'
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
se(){du -a $1 | awk '{print $2}' | fzf | xargs -r $EDITOR;}
vf(){fzf | xargs -r $EDITOR;}
alias -g v='nvim'
alias -g sv="sudo nvim"
alias -g zrc="nvim ~/.zshrc"
alias -g tconf="nvim ~/.tmux.conf"
alias -g pconf="sudo nvim /etc/pacman.conf"
alias -g mirrors="sudo nvim /etc/pacman.d/mirrorlist"
alias -g vrc="nvim ~/.vimrc"
alias -g zenv="nvim ~/.zshenv"
alias -g xref="nvim ~/.Xresources"
alias -g fix='sudo rm -f /var/lib/pacman/db.lck'
alias -g ys='yay -S'
alias -g yss='yay -Ss'
alias -g ysyu='yay -Syua'
alias -g brc='nvim $HOME/.config/bspwm/bspwmrc'
alias -g sps='sudo pacman -S'
alias -g spu='sudo pacman -U'
alias -g spsc='sudo pacman -Sc'
alias -g spss='sudo pacman -Ss'
alias -g spsyu='sudo pacman -Syu'
alias -g spsyy='sudo pacman -Syy'
alias -g spsy='sudo pacman -Sy'
alias -g spr='sudo pacman -Rcns'
alias -g del='rm -rvf'
alias -g s='sudo'
alias -g cop='cp -rvfni'
alias -g rbt='systemctl reboot'
alias -g off='systemctl poweroff'
alias -g mirror='sudo pacman-mirrors -g'
alias -g mkp='mkproject'
alias -g mkv='mkvirtualenv'
alias -g rmv='rmvirtualenv'
alias -g wk='workon'
alias -g exe='workon excellence && cd excellence/src'
alias -g hso='workon hsop && cd hsop/src'
alias -g dac='deactivate'
alias -g pms='python manage.py runserver'
alias -g pmk='python manage.py makemigrations'
alias -g pmg='python manage.py migrate'
alias -g pm='python main.py'
alias -g pi='pip install'
alias -g pir='pip install -r'
alias -g pf='pip freeze'

alias -g df='df -h'                          # human-readable sizes
alias -g du='du -h'                          # human-readable sizes
alias -g free='free -mh'                      # show sizes in MB
alias -g fd='s fdisk -l'
alias -g printer='system-config-printer'

alias -g ssta='sudo systemctl start'
alias -g sstp='sudo systemctl stop'
alias -g ssts='sudo systemctl status'
alias -g ssrt='sudo systemctl restart'
alias -g om='oddsmon.py'
alias -g om2='oddsmon2.py'
alias -g i='invs.py'
alias -g i2='invs2.py'
alias -g eth0='sudo systemctl start dhcpcd@ens33'
alias -g pp='sudo systemctl start dhcpcd@enp0s29f7u6'
alias -g trr='tremc'
alias -g tdt='td-toggle'
alias -g pv='mpv --ytdl-format=160+249 --ytdl-raw-options=limit-rate=50K'
alias -g pv2='mpv --ytdl-format=18+249 --ytdl-raw-options=limit-rate=300K'
alias -g yf='youtube-dl -F'
alias -g y18='youtube-dl -f 18'
alias -g y251='youtube-dl -f 251'
