" -- neobundle --
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

filetype plugin indent on

" -- neobundle installation check --
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'buftabs'

filetype plugin indent on " required!
syntax on
set autoindent
set noswapfile
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/backup
set browsedir=buffer 
set clipboard=unnamed
set expandtab
set hidden
set incsearch
set number
set shiftwidth=4
set showmatch
set smartcase
set smartindent
set smarttab
set whichwrap=b,s,h,l,<,>,[,]
set nowrapscan

augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

inoremap <silent> <ESC> <ESC>
inoremap <silent> <C-[> <ESC>

" --neocomplcacheの有効化と<tab>での補完割り当て--
let g:neocomplcache_enable_at_startup = 1
function InsertTabWrapper()
    if pumvisible()
        return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return "\<c-n>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" --vimfiler--
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0

" --buftabs--
let g:buftabs_only_basename=1
let g:buftabs_in_statusline=1
let g:buftabs_active_highlight_group="Visual"
set laststatus=2
set statusline=%f%=%<%m%r[%{(&fenc!=''?&fenc:&enc)}][%{&ff}][%Y][%v,%l/%L]
" --キーマッピング--
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap ;f <F12>
nnoremap ,v :e ~/_vimrc<CR> 
nnoremap ,gv :e ~/_gvimrc<CR>
nnoremap <F2> :<C-u>source ~/_vimrc<CR>
nnoremap g<F2> :<C-u>source ~/_gvimrc<CR>
noremap <Space> :bnext<CR>
noremap <S-Space> :bprev<CR>
noremap <ESC><ESC> :nohlsearch<CR>
imap <C-Tab> <Plug>(neocomplcache_snippets_expand)
smap <C-Tab> <Plug>(neocomplcache_snippets_expand)
noremap esnip :<C-u>NeoComplCacheEditSnippets<CR>

colorscheme wombat