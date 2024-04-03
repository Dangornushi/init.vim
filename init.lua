-- Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- basic setting
require('base')

--Plugin list
require("lazy").setup({

 -- Common Plugin(Lua)
  'antoinemadec/FixCursorHold.nvim',
  'nvim-lua/plenary.nvim',
  'folke/lsp-colors.nvim',
  'nvim-tree/nvim-web-devicons',
  {'tjdevries/colorbuddy.nvim',lazy = false, priority = 1500},

 -- colorscheme
{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
  -- { "rebelot/kanagawa.nvim",lazy = false, priority = 1500  },
 --  { "EdenEast/nightfox.nvim" },
 --  { "catppuccin/nvim", as = "catppuccin" }
 -- 'ishan9299/nvim-solarized-lua',
 -- {'svrana/neosolarized.nvim',lazy = false},
 --  'rose-pine/neovim'
-- 'AlexvZyl/nordic.nvim',
--   "EdenEast/nightfox.nvim"
-- {'rmehri01/onenord.nvim',lazy = false, priority = 1500},
-- {'sainnhe/everforest',lazy = false, priority = 1500 },

{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}, 

-- Telescope
  {'nvim-telescope/telescope.nvim' },
  {'fannheyward/telescope-coc.nvim'},
  {
   "nvim-telescope/telescope-frecency.nvim",
   dependencies = {"kkharji/sqlite.lua"}
  },


-- Fern
 {'lambdalisue/fern.vim',lazy = false, priority = 1000 }, --遅延読み込みをオフにして優先度を上げないとnvim-web-deviconsが読み込めない
 'lambdalisue/glyph-palette.vim',
  'lambdalisue/fern-git-status.vim',
  {'TheLeoP/fern-renderer-web-devicons.nvim',dependencies = {'nvim-web-devicons'}}, 

 -- coc.nvim
  {'neoclide/coc.nvim', branch = 'release'},

 -- Statusline
  {'nvim-lualine/lualine.nvim'},

 -- Buffer Control
  {'romgrk/barbar.nvim',dependencies = { 'nvim-web-devicons' }},

 -- Curosor underline
--  'yamatsum/nvim-cursorline',

 -- Jump to define
  'pechorin/any-jump.vim',

 -- Comment out
 {'numToStr/Comment.nvim', config = function() require('Comment').setup() end},

 -- View colorcode
 'norcalli/nvim-colorizer.lua',

 -- auto tag
 'windwp/nvim-ts-autotag',

 -- 閉じ括弧を自動で入力
 'windwp/nvim-autopairs',

 -- インデントの縦を点線で描画
 { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

{"rust-lang/rust.vim"}
})


vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
