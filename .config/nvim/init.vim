
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
  source ~/.vim/vimrc
  set background=dark
  "display the current line and column in which the cursor is present
  set cursorline nocursorcolumn
  "undofile after closing
  set undofile
  "awesome inccomand
  set inccommand=split
"}}}

"TERMINAL RELATED KEY MAPPINGS{{{
  tnoremap <leader>n <c-\><c-n>:b#<cr>
  nnoremap <leader>t :w<cr>:tabnew<cr>:terminal<cr>a
  nnoremap <leader>n :b#<cr>
  tnoremap <esc> <c-\><c-n>
"}}}

"VIM-PLUG FOR MANAGING PLUGINS{{{
call plug#begin('~/.config/nvim/plugged/')
  Plug 'gruvbox-community/gruvbox'
  " Plug 'sheerun/vim-polyglot'
  Plug 'c0r73x/colorizer'
  Plug 'itchyny/lightline.vim'
  Plug 'sainnhe/everforest'
  Plug 'tpope/vim-commentary'
  Plug '~/opensource/vimscript/vimtodo/'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  " We recommend updating the parsers on update
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
call plug#end()
"}}}

"SET YOUR COLORSCHEME{{{
"colorscheme gruvbox

if (has("nvim"))
  let $nvim_tui_enable_true_color=1
endif
if (has("termguicolors"))
  set termguicolors
endif
colorscheme everforest
"let g:gruvbox_italic=1
""}}}

"LIGHTLINE SETTINGS{{{
  let g:lightline = {
    \ 'colorscheme': 'everforest'
    \ }
"}}}

" CUSTOM AUGROUPS{{{
" HIGHLIGHT YANKED TEXT {{{
  augroup yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
  augroup END
" }}}
" }}}

" LSP SETUP{{{
lua << EOF
  local on_attach = require'completion'.on_attach
  require'lspconfig'.tsserver.setup{ on_attach=on_attach }
EOF
" }}}

" TREESITTER CONFIGURATION{{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- Modules and its options go here
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}
EOF

" }}}
