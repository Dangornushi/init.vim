syntax enable
syntax on 
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set number
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set nocompatible
set clipboard+=unnamed

" Leader KEY
let mapleader = " "

let s:dein_path = expand('~/.vim/dein')

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  let s:toml_dir  = $HOME . '/.config/nvim/rc'
  let s:toml      = s:toml_dir . '/dein.toml'

  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})

  call dein#add('bluz71/vim-nightfly-guicolors')
  call dein#add('preservim/nerdtree')
  call dein#add('itchyny/lightline.vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('vim-scripts/a.vim')
  call dein#add('justmao945/vim-clang')
  call dein#add('rhysd/vim-clang-format')
  call dein#add('kana/vim-operator-user')
  call dein#add('drewtempelmeyer/palenight.vim')
  call dein#add('rust-lang/rust.vim')
  call dein#add('vim-denops/denops.vim')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('Shougo/neco-syntax')
  call dein#add('ujihisa/neco-look')
  call dein#add('baabelfish/nvim-nim')
  call dein#add('sonph/onehalf', {'rtp': '/vim/'})
  call dein#add('joshdick/onedark.vim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('chriskempson/vim-tomorrow-theme')
  call dein#add('haishanh/night-owl.vim')
  call dein#add('liuchengxu/space-vim-dark')
  call dein#add('preservim/tagbar')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('jistr/vim-nerdtree-tabs')
  call dein#add('wadackel/vim-dogrun')
  call dein#add('embark-theme/vim', { 'name': 'embark' })
  call dein#add("sudar/vim-arduino-syntax")
  call dein#add("jdkanani/vim-material-theme")
  call dein#add("octol/vim-cpp-enhanced-highlight")
  call dein#add("arcticicestudio/nord-vim")
  call dein#add('tpope/vim-fugitive')

  call dein#add('Shougo/ddc.vim') 
" ポップアップウィンドウを表示するプラグイン
  call dein#add('Shougo/pum.vim') 
" カーソル周辺の既出単語を補完するsource
  call dein#add('Shougo/ddc-around') 
" ファイル名を補完するsource
  call dein#add('LumaKernel/ddc-file') 
" 入力中の単語を補完の対象にするfilter
  call dein#add('Shougo/ddc-matcher_head') 
" 補完候補を適切にソートするfilter
  call dein#add('Shougo/ddc-sorter_rank') 
" 補完候補の重複を防ぐためのfilter
  call dein#add('Shougo/ddc-converter_remove_overlap')

  call dein#add('mattn/vim-lsp-settings')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/asyncomplete.vim')
  call dein#add('prabirshrestha/asyncomplete-lsp.vim')

  call dein#add('Shougo/ddc-nvim-lsp')

  call dein#end()
  call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

if dein#check_install()
  call dein#install()
endif

call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', [
 \ 'around',
 \ 'vim-lsp',
 \ 'file',
 \ 'nvim-lsp'
 \ ])
call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_head'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \   'nvim-lsp': {
 \       'mark': 'L',
 \       'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
 \ },
 \ 'around': {'mark': 'Around'},
 \ 'vim-lsp': {
 \   'mark': 'LSP', 
 \   'matchers': ['matcher_head'],
 \   'forceCompletionPattern': '\.|:|->|"\w+/*'
 \ },
 \ 'file': {
 \   'mark': 'file',
 \   'isVolatile': v:true, 
 \   'forceCompletionPattern': '\S/\S*'
 \ }})
" Use Customized labels
call ddc#custom#patch_global('sourceParams', {
      \ 'nvim-lsp': { 'kindLabels': { 'Class': 'c' } },
      \ })

call ddc#enable()
inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p> <Cmd>call pum#map#insert_relative(-1)<CR>
call ddc#enable()

" Terminal

if has('nvim')
  command! -nargs=* T split | terminal <args>
  command! -nargs=* Tv vsplit | terminal <args>
endif

" Nim
let g:nvim_nim_highlighter_semantics=1

if $TERM == 'screen'
    set t_Co=256
endif

" カラースキーム
syntax enable
" テキスト背景色
au ColorScheme * hi Normal ctermbg=none
" 括弧対応
au ColorScheme * hi MatchParen cterm=bold ctermfg=214 ctermbg=black
" スペルチェック
au Colorscheme * hi SpellBad ctermfg=23 cterm=none ctermbg=none

let g:embark_terminal_italics = 1
let g:nightflyCursorColor = v:true

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

filetype plugin indent on
syntax enable
set background=dark

"colorscheme dogrun
"colorscheme embark
"colorscheme nightfly 
colorscheme nord

hi Comment cterm=italic


" formaterS
" C/C++
" ========

"let g:deoplete#enable_at_startup   = 1
"let g:deoplete#sources#clang#libckang_path = '/usr/local/bin/clang-format'
filetype plugin indent on
autocmd FileType c ClangFormatAutoEnable
map <leader>f <Plug>(operator-clang-format)

" ========
" Rust
" ========

" 保存時に自動でrustfmt
let g:rustfmt_autosave = 1

" ========


" NERDTree
nmap <silent><C-f> :NERDTreeTabsToggle<CR>
" 隠しファイルを設定する
let NERDTreeTabsShowHidden = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeShowHidden=1

let g:embark_terminal_italics = 1

map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

"lightline

map <C-p> :tabn<cr>
map <C-n> :tabp<cr>

let g:lightline = {
        \ 'colorscheme': 'nightfly',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode',
        \   'gitbranch': 'FugitiveHead'
        \ },
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" command Mode
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

" a.vim
nmap <silent> <leader>aa :A<CR> 
nmap <silent> <leader>at :AT<CR> 
nmap <silent> <leader>av :AV<CR>

