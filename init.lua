-- NOTE: :help lua-guide
-- NOTE: :Tutor
-- NOTE: :help
-- "<space>sh" to [s]earch the [h]elp documentation,
-- NOTE: :checkhealth
-- NOTE: See `:help mapleader`

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
-- NOTE: See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

require("core")
