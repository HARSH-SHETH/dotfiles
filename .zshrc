# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
# autoload -U promptinit; promptinit
# prompt spaceship

bindkey -v

# Generate Elfman
source ~/colorscripts/elfman

# My Functions 

# CHANGE TMUX WORKING DIRECTORY TO CURRENT DIRECTORY 
change_tmux_working_dir () {
  tmux command-prompt "attach -c %1 $PWD"
}

# COMPILE CPP FILES
gpp () {
  g++ "$1"
  if [ $? -eq 0 ] 
  then
    echo "program compiled succesfully"
    echo "Running binary -------\n"
    ./a.out
  else
    echo "error while compiling source file "$1" "
  fi
}

# MY ALIASES
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias c='clear'
alias q='exit'
alias s='ls --color=auto --group-directories-first'
alias r='ranger'
alias n='nnn'
alias j='nvim'
alias sj='sudo nvim'
alias cfn='nvim ~/.config/nvim/init.vim'
alias cfi='nvim ~/.i3/config'
alias cfv='nvim ~/.vim/vimrc'
alias cfz='nvim ~/.zshrc'
alias sfz='source ~/.zshrc'
alias cfa='nvim ~/.config/alacritty/alacritty.yml'
alias cft='nvim ~/.tmux.conf'
alias tmux='tmux -2'
alias todo='~/opensource/my_scripts/todo/todo.sh'
#ALIAS FOR MANAGING DOTFILES
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#ALIAS FOR TESTING NEOVIM
alias tj='VIMRUNTIME=runtime /home/harsh/opensource/github_contrib/neovim/build/bin/nvim -u NORC'
alias debug_nvim='gdb --silent -tui -p `pidof nvim` build/bin/nvim'
#ALIAS FOR CHANGING TMUX'S WORKING DIR
alias chtmuxdir='change_tmux_working_dir'

# MY ENVIRONMENT VARIABLES
export FZF_DEFAULT_COMMAND='find .'
export TERM=tmux-256color
export EDITOR=/usr/bin/nvim

# NVIM LSP SERVERS PATH
NVIM_DATA=$HOME/.local/share/nvim/lsp_servers
LSP_GO_PLS=$NVIM_DATA/go
LSP_TSSERVER=$NVIM_DATA/tsserver/node_modules/.bin
export PATH=$PATH:$LSP_GO_PLS:$LSP_TSSERVER

if (( $SHLVL == 1 )); then
  tmux
fi

# z - jump around
POWERLINE9K_SHORTEN_STRATEGY=truncate_to_last
source /usr/share/z/z.sh
