
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
  set background=light
  "display the current line and column in which the cursor is present
  set cursorline nocursorcolumn
  "undofile after closing
  set undofile
  "awesome inccomand
  set inccommand=split
  " match CursorColumn /^\ \+/ 
"}}}

"TERMINAL RELATED KEY MAPPINGS{{{
  tnoremap <leader>n <c-\><c-n>:b#<cr>
  nnoremap <leader>t :tabnew<cr>:terminal<cr>a
  nnoremap <leader>n :b#<cr>
  tnoremap <esc> <c-\><c-n>
  set shell=/usr/bin/fish
"}}}

"VIM-PLUG FOR MANAGING PLUGINS{{{
call plug#begin('~/.config/nvim/plugged/')
  Plug 'c0r73x/colorizer'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'sainnhe/everforest'
  Plug 'tpope/vim-commentary'
  Plug 'gruvbox-community/gruvbox'
  Plug 'marko-cerovac/material.nvim'
  Plug 'khaveesh/vim-fish-syntax'

  "LSP 
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'

  "SNIPPET ENGINE
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'

  "AUTOCOMPLETION USING NVIM-CMP
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-nvim-lua'

  "TELESCOPE PLUGIN
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " We recommend updating the parsers on update
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
  " Plug 'https://github.com/cohama/lexima.vim'
  Plug 'windwp/nvim-autopairs'
call plug#end()
"}}}

" LUA CONFIG AND PLUGINS MAPPINGS{{{
  lua require('config')
  " TELESCOPE MAPPINGS
  " Find files using Telescope command-line sugar.
  nnoremap <leader>tf <cmd>Telescope find_files<cr>
  nnoremap <leader>tg <cmd>Telescope git_files<cr>
  nnoremap <leader>tb <cmd>Telescope buffers<cr>
  nnoremap <leader>th <cmd>Telescope help_tags<cr>
" }}}

"SET YOUR COLORSCHEME{{{
"colorscheme gruvbox

if (has("nvim"))
  let $nvim_tui_enable_true_color=1
endif
if (has("termguicolors"))
  set termguicolors
endif

let g:material_style = "lighter"
" colorscheme everforest
colorscheme material
""}}}

" CUSTOM AUGROUPS{{{
" HIGHLIGHT YANKED TEXT {{{
  augroup yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
  augroup END
" }}}
"
  augroup indent
    "highlight leading spaces (helps in highlighting indentation)
    autocmd!
    autocmd BufEnter,BufReadPost,BufAdd * match CursorColumn /^\ \+/ 
  augroup END
" }}}

