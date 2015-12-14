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
 NeoBundle 'vim-scripts/sudo.vim'

    NeoBundle 'vim-scripts/vimCU'
    NeoBundle 'sjl/gundo.vim'
    NeoBundle 'nvie/vim-flake8'
    NeoBundle 'nvie/vim-pyunit'
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
    NeoBundle 'scrooloose/nerdcommenter'

    NeoBundle 'SirVer/ultisnips'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neomru.vim'
    NeoBundle 'Shougo/neosnippet-snippets'
    NeoBundle 'tpope/vim-obsession'
    NeoBundle 'godlygeek/tabular'

    NeoBundle 'Raimondi/delimitMate'
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'mileszs/ack.vim'

    " NeoBundle 'SirVer/ultisnips'

    NeoBundle 'shawncplus/phpcomplete.vim'
    NeoBundle 'vim-scripts/PDV--phpDocumentor-for-Vim'
    NeoBundle 'vim-scripts/taglist.vim'
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'jistr/vim-nerdtree-tabs'
    NeoBundle 'majutsushi/tagbar'
    NeoBundle 'sukima/xmledit'
    " NeoBundle 'vim-scripts/guicolorscheme.vim'
    " NeoBundle 'noahfrederick/Hemisu'
    " NeoBundle 'tpope/vim-vividchalk'
    "
    NeoBundle 'scrooloose/syntastic.git'
    NeoBundle 'https://github.com/Valloric/YouCompleteMe.git'


 
 
 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck


let mapleader=","

" NERDTree {{{
let NERDTreeIgnore = ['\.pyc$', 'build', 'venv', 'egg', 'egg-info/', 'dist', 'docs']
nnoremap <leader>d :NERDTree<cr>
nnoremap <leader>dd :NERDTreeToggle<cr>
" }}}
"
" Airline {{{
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
nnoremap <space>u :Unite file_rec<cr>
nnoremap <space>ub :Unite buffer<cr>


" Ag mappings
nnoremap <leader>a :Ag 


" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>


" Colors {{{
syntax enable " enable syntax processing
colorscheme badwolf
set background=light
" }}}
" Misc {{{
set ttyfast " faster redraw
set backspace=indent,eol,start
" }}}
" Spaces & Tabs {{{
set tabstop=4 " 4 space tab
set expandtab " use spaces for tabs
set softtabstop=4 " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
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


 " Uncomment the following to have Vim jump to the last position when reopening a file
    if has("autocmd")
            au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif

" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}


" My custom mappings

nnoremap ; :
nnoremap : ;
nnoremap <leader>w :w<cr>
inoremap <leader>w <ESC>:w<cr>
nnoremap <leader>ww :wq!<cr>
inoremap <leader>ww <ESC>:wq!<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>o :only<cr>
inoremap jj <C-[>
nnoremap <leader>c <C-w>c
