" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
    NeoBundle 'tomasr/molokai'
    NeoBundle 'wellle/targets.vim'
    NeoBundle 'tmhedberg/matchit'
    NeoBundle 'vim-scripts/sudo.vim'
    NeoBundle 'AlessandroYorba/Sierra'
    NeoBundle 'vim-scripts/vimCU'
    NeoBundle 'sjl/gundo.vim'
    NeoBundle 'nvie/vim-flake8'
    NeoBundle 'terryma/vim-multiple-cursors'
    NeoBundle 'rking/ag.vim'
    NeoBundle 'tpope/vim-fugitive'
	NeoBundle 'Shougo/unite.vim'
	NeoBundle 'tpope/vim-unimpaired'
	NeoBundle 'bling/vim-airline'
	NeoBundle 'tpope/vim-commentary'
	NeoBundle 'kien/ctrlp.vim'
	NeoBundle 'easymotion/vim-easymotion'
	NeoBundle 'garbas/vim-snipmate'
	NeoBundle 'MarcWeber/vim-addon-mw-utils'
	NeoBundle 'honza/vim-snippets'
    NeoBundle 'spolu/dwm.vim'
    NeoBundle 'terryma/vim-expand-region'
    NeoBundle 'SirVer/ultisnips'
    NeoBundle 'Shougo/vimfiler.vim'
    NeoBundle 'Shougo/neomru.vim'
    NeoBundle 'tpope/vim-obsession'
    NeoBundle 'godlygeek/tabular'
    NeoBundle 'Raimondi/delimitMate'
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'sukima/xmledit'
    NeoBundle 'scrooloose/syntastic.git'
    " NeoBundle 'vim-scripts/taglist.vim'
    " NeoBundle 'majutsushi/tagbar'
    " NeoBundle 'https://github.com/Valloric/YouCompleteMe.git'
    " NeoBundle 'rdnetto/YCM-Generator'

 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype  off

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck


"mapleader key
let mapleader = ","

" VimFiler {{{
	
	let g:vimfiler_as_default_explorer = 1
	
	" Enable file operation commands.
	" Edit file by tabedit.
	call vimfiler#custom#profile('default', 'context', {
	      \ 'safe' : 0,
	      \ })
	
	" Like Textmate icons.
	let g:vimfiler_tree_leaf_icon = ' '
	let g:vimfiler_tree_opened_icon = '▾'
	let g:vimfiler_tree_closed_icon = '▸'
	let g:vimfiler_file_icon = '-'
	let g:vimfiler_marked_file_icon = '*'
nnoremap <leader>d :VimFiler<cr>
" }}}
"

" YouCompleteMe settings
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_key_invoke_completion = '<C-b>'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_auto_trigger = 1
let g:ycm_complete_in_strings = 1
let g:ycm_confirm_extra_conf = 0
map <C-]> :YcmCompleter GoToImprecise<CR>

" UltiSnips settings
let g:UltiSnipsExpandTrigger='<c-k>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-s-k>'
let g:UltiSnipsSnippetsDir='~/.vim/bundle/vim-snippets/UltiSnips'
" let g:UltiSnipsSnippetDirectories=["snippets"]


" Airline settings{{{
"
set laststatus=2
" * the separator used on the left side >
  let g:airline_left_sep='>'
" * the separator used on the right side >
  let g:airline_right_sep='<'
" * enable modified detection >
  let g:airline_detect_modified=1
" * enable paste detection >
  let g:airline_detect_paste=1
" * enable crypt detection >
  let g:airline_detect_crypt=1
" * enable iminsert detection >
  let g:airline_detect_iminsert=0
" * determine whether inactive windows should have the left section collapsed to
  "only the filename of that buffer.  >
  let g:airline_inactive_collapse=1
" * themes are automatically selected based on the matching colorscheme. this
  " can be overridden by defining a value. >
  "let g:airline_theme=
" * if you want to patch the airline theme before it gets applied, you can
  "supply the name of a function where you can modify the palette. >
  let g:airline_theme_patch_func = 'AirlineThemePatch'
  function! AirlineThemePatch(palette)
    if g:airline_theme == 'badwolf'
      for colors in values(a:palette.inactive)
        let colors[3] = 245
      endfor
    endif
  endfunction
" * enable/disable automatic population of the `g:airline_symbols` dictionary
  " with powerline symbols. >
  let g:airline_powerline_fonts=0
"  }}}

nnoremap <F5> :GundoToggle<CR>


" Unite mappings
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <space>b :<C-u>Unite -start-insert buffer<CR>
nnoremap <space>f :<C-u>Unite -start-insert file_rec/async:!<CR>


" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'


" Uncomment the following to have Vim jump to the last position when reopening a file
    if has("autocmd")
            au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif



filetype indent on
filetype plugin on

" Turn on syntax highlighting
syntax on


set autowrite
" Security
set modelines=0

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Allow hidden buffers
set hidden

" Last line
set showmode

set ttyfast " faster redraw
" }}}

" Spaces & Tabs {{{
set tabstop=4 " 4 space tab
set expandtab " use spaces for tabs
set softtabstop=4 " 4 space tab
set shiftwidth=4
set autoindent
" }}}

" UI Layout {{{
set number " show line numbers
set relativenumber " show relative line numbers
set showcmd " show command in bottom bar
set nocursorline " highlight current line
set wildmenu
set cursorline
set lazyredraw
set showmatch " higlight matching parenthesis
" }}}

" Searching {{{
set ignorecase " ignore case when searching
set incsearch " search as characters are entered
set hlsearch " highlight all matches
nnoremap <leader><space> :nohlsearch<cr>  " Turn off highlight
" }}}

" Folding {{{
"=== folding ===
set foldmethod=indent " fold based on indent level
set foldnestmax=10 " max 10 depth
set foldenable " don't fold files by default on open
" nnoremap <space> za
set foldlevelstart=10 " start with fold level of 1
" }}}


" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}


" Searching
nnoremap / /\v
vnoremap / /\v
set smartcase

" Visualize tabs and newlines
 set list
" set listchars=tab:▸-,eol:¬,nbsp:%
set listchars=tab:│·,trail:·,extends:→
set showbreak=\\ " [bonus]"
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
nnoremap <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
" set background=dark


" ===========================================================================================
" ===========================================================================================
" Colors {{{
syntax enable " enable syntax processing
colorscheme sierra
set background=dark
" set background=light
" }}}
"
" Edit and reload vimrc and source it.
nnoremap <leader>ev   :vsp $MYVIMRC<CR>

augroup VimReload
    autocmd!
    autocmd BufWritePost  $MYVIMRC  source $MYVIMRC
augroup END

" My custom mappings

nnoremap ; :
nnoremap : ;
nnoremap <leader>w :w<cr>
nnoremap <Tab> <c-w>w 
inoremap <leader>w <ESC>:w<cr>
nnoremap <leader>ww :wq!<cr>
inoremap <leader>ww <ESC>:wq!<cr>
nnoremap <leader>q :q!<cr>
inoremap <leader>qq <ESC>:q!<cr>
nnoremap <leader>o :only<cr>
inoremap jj <C-[>
nnoremap <leader>c <C-w>c
nnoremap <leader>a :Ag<cr>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Disables arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
