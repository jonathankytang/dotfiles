"set runtimepath+=~/.vim_runtime
"
"source ~/.vim_runtime/vimrcs/basic.vim
"source ~/.vim_runtime/vimrcs/filetypes.vim
"source ~/.vim_runtime/vimrcs/plugins_config.vim
"source ~/.vim_runtime/vimrcs/extended.vim
"
"try
"source ~/.vim_runtime/my_configs.vim
"catch
"endtry

""" FROM VIM AWESOME
"""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" use spaces instead of tabs
set expandtab

" be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" linebreak on 500 characters
set lbr
set tw=500

set ai "auto indent
set si "smart indent
set wrap "wrap lines

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


""" MY STUFF BELOW

" Syntax highlighting
syntax enable
set background=dark
colorscheme gruvbox

" Line Number
set number

" Status Line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set ruler
"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

" Syntax checking
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1 
let g:syntastic_check_on_wq = 0

set t_Co=256

" Hide introductory message
set shortmess=at

" Cursor Line
set cursorline
highlight Cursorline cterm=underline ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'morhetz/gruvbox'
Plugin 'git://github.com/jiangmiao/auto-pairs.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mattn/emmet-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'
"Plugin 'itchyny/lightline.vim'
Plugin 'mhinz/vim-signify'
"Plugin 'python-mode/python-mode', { 'branch': 'develop' }
"Plugin 'lervag/vimtex'
"Plugin 'valloric/youcompleteme'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'wakatime/vim-wakatime'
call vundle#end()
filetype plugin indent on

" Vim airline settings
let g:airline_theme='gruvbox'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline_exclude_preview=1    
" let g:airline_section_y = '%{strftime("%c")}'
" let g:airline_section_c = '%F'
" let g:airline_extensions = ['ctrlp']
"let g:airline#extensions#ctrlp#color_template = 'insert'
"let g:airline#extensions#ctrlp#show_adjacent_modes = 1


" Ale settigns
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
" Python
let g:ale_python_pylint_options = '--load-plugins pylint_django'

" Cpp highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1

" You complete me settings
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
"let g:ycm_python_interpreter_path = ''
"let g:ycm_python_sys_path = []
"let g:ycm_extra_conf_vim_data = [
"  \  'g:ycm_python_interpreter_path',
"  \  'g:ycm_python_sys_path'
"  \]
"let g:ycm_global_ycm_extra_conf = '~/Users/jonathantang/.vim/bundle/YouCompleteMe/.global_extra_conf.py'
""" turn on completion in comments
"let g:ycm_complete_in_comments=1
""" load ycm conf by default
"let g:ycm_confirm_extra_conf=0
""" turn on tag completion
"let g:ycm_collect_identifiers_from_tags_files=1
""" only show completion as a list instead of a sub-window
"set completeopt-=preview
""" start completion from the first character
"let g:ycm_min_num_of_chars_for_completion=1
""" don't cache completion items
"let g:ycm_cache_omnifunc=0
""" complete syntax keywords
"let g:ycm_seed_identifiers_with_syntax=1
"let g:ycm_server_keep_logfiles = 1 
"let g:ycm_server_log_level = 'debug'

" Ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_working_path_mode = 'ra'

