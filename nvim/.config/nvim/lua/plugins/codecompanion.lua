return {
  {
    'olimorris/codecompanion.nvim',
    version = '^19.0.0',
    opts = {
      interactions = {
        chat = {
          adapter = "kiro"
        }
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter'
    },
    keys = {
      { "<leader>cc", "<cmd>CodeCompanionActions<cr>", desc = "Open CodeCompanionActions" },
    },
  },
}
