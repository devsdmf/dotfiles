return {
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      { "mason-org/mason.nvim", opts = {}  },
      'neovim/nvim-lspconfig'
    },
    opts = {
      automatic_enable = true,
      ensure_installed = {
        'autotools_ls',
        'bashls',
        'clangd',
        'cmake',
        'cssls',
        'docker_compose_language_service',
        'dockerls',
        'eslint',
        'html',
        'intelephense',
        'java_language_server',
        'jsonls',
        'lua_ls',
        'pyright',
        'vimls',
        'terraformls',
        'tsp_server'
      }
    },
    config = function(_, opts)
      require('mason-lspconfig').setup(opts)
      vim.diagnostic.config({
        virtual_text = true
      })
    end
  },
  {
    "folke/trouble.nvim",
    opts = {
    }, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>cd",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
    },
  }
}
