local status, telescope = pcall(require, "telescope")
if (not status) then return end

local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    preview = {
      -- 巨大なProjectで固まることがあるためtreesitterを無効に
      -- @refer https://github.com/nvim-telescope/telescope.nvim/issues/1379
   		treesitter = false,
   	},
    sorting_strategy = "ascending",
    -- winblend = 4, -- everforestを透明にしているためオフにしておく
    -- layout_strategy = 'vertical',
    layout_config = { height = 0.9 },
    -- 画像類を検索対象に含めない(検索が重くなる)
    file_ignore_patterns = {
      "^.git/",
      "./.git/",
      "^node_modules/",
      "./node_modules/",
      "%.jpg",
      "%.jpeg",
      "%.png",
      "%.pdf",
      "%.gif",
      "%.svg",
      ".DS_Store",
    },
    wrap_results = true, -- 検索結果を折り返す
  },
  extensions = {
    coc = {
      prefer_locations = false,   -- always use Telescope locations to preview definitions/declarations/implementations etc
    },
  },
})

-- telescope.load_extension("frecency") --frecency search
telescope.load_extension("coc")      -- coc integration

-- file search
vim.keymap.set('n', '<leader>f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)

-- -- Grep
vim.keymap.set('n', '<leader>r',
  function()
    builtin.live_grep({
      no_ignore = false,
      hidden = true
    })
  end)

-- buffer-fuzzy-find
vim.keymap.set('n', '<leader>b',
  function()
    builtin.current_buffer_fuzzy_find({
      no_ignore = false,
      hidden = true
    })
  end)

---- Telescope-coc
--定義ジャンプ
vim.keymap.set("n", "gd", "<cmd>Telescope coc definitions<cr>", { noremap = true, silent = true })
-- 型定義ジャンプ
vim.keymap.set("n", "gy", "<cmd>Telescope coc type_definitions<cr>", { noremap = true, silent = true })
-- diagnostics
vim.keymap.set("n", "<leader>a", "<cmd>Telescope coc diagnostics<cr>", {noremap = true, silent = true })
--頻度検索
vim.keymap.set("n", "<leader>l", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})
