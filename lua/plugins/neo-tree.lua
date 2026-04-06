return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    lazy = false,
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        window = {
          mappings = {
            ['<bs>'] = 'noop',
          },
        },
      },
    },
    keys = {
      { '<leader>e', ':Neotree toggle<CR>', desc = 'NeoTree toggle', silent = true },
    },
  },
}
