-- Show relative numbers and absolute number on current line
local numbertoggle_group = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
vim.api.nvim_create_autocmd({'BufEnter,FocusGained,InsertLeave,WinEnter'}, { command = 'if &nu && mode() != "i" | set rnu | endif', group = numbertoggle_group })
vim.api.nvim_create_autocmd({'BufLeave,FocusLost,InsertEnter,WinLeave'}, { command = 'if &nu | set nornu | endif', group = numbertoggle_group })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
