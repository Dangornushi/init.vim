local status,indent = pcall(require,"indent_blankline")
if (not status) then return end

vim.cmd([[
let g:indent_blankline_char = '┊'
let g:indent_blankline_bufname_exclude = ['README.md', '.*\.jade','.*\.pug']
]])
