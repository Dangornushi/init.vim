vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.number = true
vim.wo.number = true
vim.wo.relativenumber = false
vim.opt.mouse = 'a'
vim.opt.title = true vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true 
vim.opt.incsearch = true -- 検索直後に画面が変遷する
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'fish'
vim.opt.inccommand = 'split'
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true 
vim.opt.helplang = 'ja'
vim.opt.updatetime = 300
vim.opt.showtabline = 1 -- barbar.nvimを用いる場合、値を1に設定しておかないと起動時に一瞬空のBufferがちらつく
vim.opt.clipboard = 'unnamedplus'
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.wrap = true

-- float-transparent
-- vim.opt.winblend = 
-- Python3

vim.cmd([[
    let g:python3_host_prog = '/usr/bin/python3'
]])

-- 不可視文字を表示(colorscheme用)
vim.cmd([[
set listchars=tab:»-,nbsp:%,eol:↲
]])
vim.opt.list = false

-- Leader Key
vim.g.mapleader = ' '

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- キーバインド
-- 画面分割
keymap('n', 'ss', ':split<Return><C-w>w', opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', opts)

-- アクティブウィンドウの移動
keymap('n', 'sh', '<C-w>h', opts)
keymap('n', 'sk', '<C-w>k', opts)
keymap('n', 'sj', '<C-w>j', opts)
keymap('n', 'sl', '<C-w>l', opts)

-- New tab
keymap("n", "te", ":tabedit", { noremap = true, silent = true })
-- 新しいタブを一番右に作る
keymap("n", "gn", ":tabnew<Return>", { noremap = true, silent = true })
-- move tab
keymap("n", "gh", "gT", { noremap = true, silent = true })
keymap("n", "gl", "gt", { noremap = true, silent = true })

-- 折返し時に論理行ではなく物理行で移動する
keymap('n','j','gj', opts)
keymap('n','k','gk', opts)
-- jjでEscする
keymap('i','jj','<Esc>', opts)

-- 設定ファイルを開く
keymap('n','<F1>',':edit $MYVIMRC<CR>', opts)

-- Prettierを適用 
keymap('n','ff',':Prettier<CR>', opts)

local status, prettier = pcall(require, "prettier")
if (not status) then return end

prettier.setup {
  bin = 'prettierd',
  filetypes = {
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "scss",
    "less"
  }
}
