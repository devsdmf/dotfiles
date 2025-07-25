return {
  'nvim-telescope/telescope.nvim', branch = 'master',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      "<leader>f",
      function () require("telescope.builtin").find_files() end,
      desc = "Find file"
    }
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
    }
  }
}
