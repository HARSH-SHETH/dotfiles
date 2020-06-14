
""████     ██                           ██            
"░██░██   ░██                          ░░             
"░██░░██  ░██  █████   ██████  ██    ██ ██ ██████████ 
"░██ ░░██ ░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
"░██  ░░██░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
"░██   ░░████░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██
"░██    ░░███░░██████░░██████   ░░██   ░██ ███ ░██ ░██
"░░      ░░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░ 

"BASIC SETTINGS{{{
"autocmd bufread,bufnew * set colorcolumn^=0
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
  source ~/.vimrc
  set background=dark
  "display the current line and column in which the cursor is present
  set cursorline nocursorcolumn
  "undofile after closing
  set undofile
"}}}

"TERMINAL RELATED KEY MAPPINGS{{{
  tnoremap <leader>n <c-\><c-n>:b#<cr>
  nnoremap <leader>t :terminal<cr>a
  nnoremap <leader>n :b#<cr>
  tnoremap <esc> <c-\><c-n>
"}}}

"VIM-PLUG FOR MANAGING PLUGINS{{{
call plug#begin('~/.config/nvim/plugged/')
  Plug 'morhetz/gruvbox'
  Plug 'sheerun/vim-polyglot'
  Plug 'dylanaraps/wal.vim'
  Plug 'c0r73x/colorizer'
call plug#end()
"}}}

"SET YOUR COLORSCHEME{{{
colorscheme gruvbox

if (has("nvim"))
  let $nvim_tui_enable_true_color=1
endif
if (has("termguicolors"))
  set termguicolors
endif
""italics for my favorite color scheme
let g:gruvbox_italic=1
""}}}

