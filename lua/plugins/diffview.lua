return {
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = '[G]it [d]iff view' },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<CR>', desc = '[G]it file [h]istory' },
      { '<leader>gq', '<cmd>DiffviewClose<CR>', desc = '[G]it diff [q]uit' },
    },
  },
}
