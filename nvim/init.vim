" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible
set number
set clipboard+=unnamedplus

" 外部設定ファイルを読み込む
runtime! options.vim
runtime! keymap.vim

" neovim用pythonの設定
" pip install pynvim
if has('win64')
    let g:python3_dir = 'C:\Users\tlaloc\python_envs\nvim\.venv\Scripts\'
    let g:python3_host_prog=g:python3_dir . 'python.exe'
elseif has("unix")
    let g:python3_dir = '/usr/bin/'
    let g:python3_host_prog= g:python3_dir . 'python'
endif

" dein関係
" Set Dein base path (required)
let s:dein_base = '/home/dangomushi/.cache/dein/'

let s:vim_base = '/home/dangomushi/.config/nvim/'
let s:dein_toml = s:vim_base . 'dein.toml'
let s:dein_lazy_toml = s:vim_base . 'dein_lazy.toml'

" Set Dein source path (required)
let s:dein_src = '/home/dangomushi/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

let g:dein#auto_recache=1

let s:watch_files = ['~/.config/nvim/init.vim', '~/.config/nvim/dein.toml', '~/.config/nvim/dein_lazy.toml']

if dein#load_state('~/.cache/dein')
  call dein#begin(s:dein_base)
  call dein#add(s:dein_src)
  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

syntax enable

if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" 保存時に自動でrustfmt
let g:rustfmt_autosave = 1
"スペースfでFormat
nmap <silent> <space>f <Plug>(coc-format)


" === gruvbox ===
colorscheme gruvbox

set background=dark
set t_Co=256            " gruvboxをカラースキーマにするときに必要！
let g:ligthline = { 'colorscheme': 'gruvbox' }
" === gruvbox ===
