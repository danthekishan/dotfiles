# ########       ####    ##
#  ###  ##-------### ##  ##
#  ###  ##   A   ###  ## ##
#  ###  ##-------###   ####
# ########       ###   ####


export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export VISUAL="nvim"
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

# plugins
plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting
  fzf
  git
)

source $ZSH/oh-my-zsh.sh

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi


# vim and emacs
alias lg="lazygit"
alias vim="nvim"

# Changing "ls" to "exa"
alias ls='eza -al --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | egrep "^\."'

# pacman and yay
alias pacsyu='sudo pacman -Syyu'                 # update only standard pkgs
alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'  # remove orphaned packages

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# fetch - nitch
# nitch

# Zellij
export ZELLIJ_CONFIG_DIR=$HOME/.config/zellij

alias zj=zellij
alias zjs="zellij list-sessions"
alias zjl='zellij attach "$(zellij list-sessions -s | fzf)"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### SETTING THE STARSHIP PROMPT ###
eval "$(starship init zsh)"

### exports
export PATH=$PATH:/usr/local/go/bin

# . "$HOME/.local/bin/env"

# Enable vi mode
bindkey -v

# Change the cursor shape for different vi modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
     echo -ne '\e[1 q' # Block cursor for normal mode
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
       echo -ne '\e[5 q' # Beam cursor for insert mode
  fi
}

zle -N zle-keymap-select

zle-line-init() {
  echo -ne "\e[5 q" # Beam cursor
}
zle -N zle-line-init

# Fic backspace in vi mode
bindkey "^?" backward-delete-char
