# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/bbraunj/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="avit"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zshmarks)

source $ZSH/oh-my-zsh.sh

# User configuration

set -o vi

# Unlock sudo with Apple Watch double press side button
function awsudo {
                osascript -e "do shell script \"$*\" with administrator privileges"
}

# Completion
fpath=(~/.zsh $fpath)

alias vi="nvim"
alias vim="nvim"

# Other aliases
alias ls="ls -G"
alias lh="ls -lh"
alias la="ls -a"
alias fvi="vi +NERDTreeToggle"

export GREP_OPTIONS='--color=always'

# Source these scripts
source ~/.git-prompt.sh

# PATH Additions
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH='~/.nvim/bin':$PATH

# Zshmarks
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias p="showmarks"
alias l="showmarks"

PROMPT="%{$fg[white]%}[%!] %~ "
PROMPT+="%{$fg[green]%}$(git_prompt_info) "
PROMPT+="%{$fg[cyan]%}%m:%n "
PROMPT+="%{$fg[white]%}$ "

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/bbraunj/.anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/bbraunj/.anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/bbraunj/.anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/bbraunj/.anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export PATH="/Users/bbraunj/.anaconda3/bin:$PATH"
export MPLBACKEND="module://itermplot"
