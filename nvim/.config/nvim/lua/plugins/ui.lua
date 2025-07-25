return {
  {
    'Shatur/neovim-ayu',
    priority = 1000,
    config = function()
      require('ayu').colorscheme()
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'wombat'
      }
    }
  },
}
