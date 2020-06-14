
"                                   '##::::'##:'####:'##::::'##:'########:::'######::
"                                    ##:::: ##:. ##:: ###::'###: ##.... ##:'##... ##:
"                                    ##:::: ##:: ##:: ####'####: ##:::: ##: ##:::..::
"                                    ##:::: ##:: ##:: ## ### ##: ########:: ##::::::: 
"                                   . ##:: ##::: ##:: ##. #: ##: ##.. ##::: ##:::::::
"                                   :. ## ##:::: ##:: ##:.:: ##: ##::. ##:: ##::: ##:
"                                   ::. ###::::'####: ##:::: ##: ##:::. ##:. ######::
"                                   :::...:::::....::..:::::..::..:::::..:::......:::
" BASIC SETTINGS -------------------{{{
let mapleader =","
set hls incsearch ignorecase smartcase
set number relativenumber "shows absolute and relative number at the same time
set numberwidth=4	"sets the width of the column displaying numbers to 2
filetype plugin on
filetype plugin indent on
syntax enable
set autoindent 
set backspace=indent,eol,start  "Allow backspace over everything in insert mode
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab 
set scrolloff=2  	"forces vim to keep the cursor two lines above or below the file
set background=dark
set splitbelow splitright "Always open window on the right side in verticals split and below in horizontal split
set foldmethod=manual
set showcmd "Show commands while typing in normal or visual mode 
" }}}

"ARROW KEY MAPPINGS{{{
  "bindings to increase decrease window widths
    nnoremap <silent> <up> <c-w>>
    nnoremap <silent> <down> <c-w><
  "mapping arrow keys to switch buffers
    nnoremap <right> :bn<cr>
    nnoremap <left> :bp<cr>
"}}}

"QUICK SAVE AND CLOSE MAPPINGS{{{
  nmap <leader><leader> :w<CR>
  nmap <leader>q :wq<CR>
"}}}

" CUSTOM KEY MAPPINGS FOR AUTO-CLOSING OF BRACKETS AND QUOTES{{{
  inoremap { {}<esc>i
  inoremap } <esc>la
  inoremap [ []<esc>i
  inoremap ] <esc>la
  inoremap ( ()<esc>i
  inoremap ) <esc>la
  inoremap " ""<esc>i
  inoremap ' ''<esc>i
" }}}

"WILDMENU STATUS LINE AND COLORCOLUMN{{{

"WILDMENU SETTINGS{{{
  set path+=**
  set wildmenu
  set wildmode=longest:full,full
"}}}

"STATUS LINE{{{
  set laststatus=2	"show status line 
  set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%) "Customized status line
  hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
"}}}

"COLORCOLUMN SETTINGS{{{
  hi User1 term=none,bold cterm=none,bold ctermfg=none
  let &colorcolumn=join(range(100,999),",") 
"}}}
"}}}

"CUSTOM AUGROUPS{{{

  "AUGROUP FOR VIM FILETYPE SPECIFIC SETTINGS {{{
    augroup filetype_vim
      autocmd!
      autocmd filetype vim setlocal foldmethod=marker
      "mapping to the default behaviour
      autocmd filetype vim inoremap <buffer> " "
    augroup end
  "}}}
  
"ADD C-STYLE COMMENTS TO THE VISUALLY SELECTED TEXT{{{
augroup comment
  autocmd!
  autocmd bufenter,bufread  *.ejs vnoremap <leader>/ <esc>`<i<%#<esc>`>a%><esc>
  autocmd filetype javascript,cpp,css vnoremap <leader>/ <esc>`<i/*<esc>`>a*/<esc>
  autocmd filetype html vnoremap <leader>/ <esc>`<i<!--<esc>`>a--><esc>
  autocmd filetype vim vnoremap <leader>/ :norm i"<cr>
  autocmd filetype conf vnoremap <leader>/ :norm! i#<cr>
augroup end
"}}}

"SAVE FOLD PERMANENTLY WITH THESE TWO LINES {{{
  augroup save_session
    autocmd!
    autocmd BufWinLeave *.* mkview    
    autocmd BufWinEnter *.* silent! loadview
  augroup end
"}}}

"AUTOCMD TO COPY WHOLE FILE TO THE REGISTER{{{
augroup cp
  autocmd!
  autocmd filetype cpp nnoremap <leader>cp ggvg"+y
augroup end
"}}}

"SYNTAX CONFIGURATION FOR DIFFERENT FILES{{{
  augroup syntax_conf
    autocmd!
    autocmd filetype html,ejs inoremap < <><esc>i
    autocmd filetype html,ejs inoremap > <esc>la
    autocmd filetype html,ejs setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
    autocmd filetype html,ejs onoremap <buffer> in< :execute "normal! /<\r:noh\rvi<"<CR>
  augroup end
"}}}

"SNIPPETS FOR .EJS FILE{{{
  augroup filetype_ejs
    autocmd!
    autocmd BufEnter,BufNewFile,BufRead,BufWrite  *.ejs set filetype=ejs
    autocmd filetype ejs nnoremap <leader>% I<% <esc>A %><esc>
    autocmd filetype ejs inoremap <leader>% <%%><esc>hi
  augroup end
"}}}
  
"}}}

"MAPPINGS FROM \"LEARN VIMSCRIPT THE HARDWAY\"{{{
  let maplocalleader = "\\"
  nnoremap - ddp
  nnoremap _ ddkp
  inoremap <c-u> <esc>viwuea
  nnoremap <c-u> viwu
  vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>
  vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
  inoremap jk <esc>
  inoremap kj <esc>
  nnoremap h ^
  nnoremap l $
  nnoremap <leader>ev :vsp $myvimrc <cr>
  nnoremap <leader>sv :source $myvimrc <cr>:noh<cr>:<bs>
  "toggle folds using this
  nnoremap <silent> <space><space> za
"}}}

  "OPERATOR PENDING MAPPINGS {{{
    "visually select next pair of {parens, brackets, quotations, tags}
      onoremap in( :execute "normal! /(\r:noh\rvi("<CR>
      onoremap in{ :execute "normal! /{\r:noh\rvi{"<CR>
      onoremap in[ :execute "normal! /[\r:noh\rvi["<CR>
      onoremap in" :execute "normal! /\"\rn:noh\rvi\""<CR>
      onoremap in' :execute "normal! /'\rn:noh\rvi'"<CR>
      onoremap il( :execute "normal! ?(\r:noh\rvi("<CR>
      onoremap il{ :execute "normal! ?{\r:noh\rvi{"<CR>
      onoremap il[ :execute "normal! ?[\r:noh\rvi["<CR>
      onoremap il" :execute "normal! ?\"\rn:noh\rvi\""<CR>
      onoremap il' :execute "normal! ?'\rn:noh\rvi'"<CR>
  "}}}

"PERSONAL CODE SNIPPETS{{{
  "Inserts a basic boilerplate for html 
  nnoremap <leader>html :-1read /home/harsh/.boiler_plate.html<CR>3jf>a
"}}}
