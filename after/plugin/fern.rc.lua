
vim.g["fern#renderer"] = "nvim-web-devicons"

vim.g["fern#default_hidden"]= 1

vim.cmd([[
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

]])

vim.keymap.set('n', '<C-f>', ':Fern . -reveal=% -drawer -toggle -width=40<CR>')

-- 下記の記述はtrash-cliを用いない場合にファイル等を削除する方法
-- ただし内部的には $ rm のため、原則使わない

-- function! s:fern_settings() abort
--   nmap <silent> <buffer> dd <Plug>(fern-action-remove)
-- endfunction

-- augroup fern-settings
--   autocmd!
--   autocmd FileType fern call s:fern_settings()
-- augroup END
