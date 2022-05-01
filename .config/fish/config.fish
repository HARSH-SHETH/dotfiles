if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_vi_key_bindings

# abbr --add ls='ls --color=auto'
# abbr --add grep='grep --color=auto'
abbr --add c clear
abbr --add q exit
abbr --add s ls --color=auto --group-directories-first
abbr --add r ranger
abbr --add t tmux -2
abbr --add n nnn
abbr --add j nvim
abbr --add sj sudo nvim
abbr --add cfn nvim ~/.config/nvim/
abbr --add cfi nvim ~/.i3/config
abbr --add cfv nvim ~/.vim/vimrc
abbr --add cfz nvim ~/.zshrc
abbr --add cfa nvim ~/.config/alacritty/alacritty.yml
abbr --add cfk nvim ~/.config/kitty/kitty.conf
abbr --add cft nvim ~/.tmux.conf
abbr --add cfh nvim ~/.zhistory
abbr --add tmux tmux -2
abbr --add todo ~/opensource/my_scripts/todo/todo.sh
abbr --add sfz source ~/.config/fish/config.fish
abbr --add cff nvim ~/.config/fish/config.fish
#ALIAS FOR MANAGING DOTFILES
abbr --add dotfiles /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME
abbr --add kdiff git difftool --no-symlinks --dir-diff

set SHELL /usr/bin/fish
set EDITOR /usr/bin/nvim
set -Ux LS_COLORS 'ow=01;105;08:di=01;105;08'

starship init fish | source
