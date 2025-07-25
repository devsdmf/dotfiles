require("util.lazy_file").lazy_file()

return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'main',
  build = ':TSUpdate',
  lazy = false,
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "css",
      "html",
      "java",
      "javascript",
      "json",
      "hcl",
      "lua",
      "markdown",
      "markdown_inline",
      "php",
      "python",
      "query",
      "regex",
      "sh",
      "terraform",
      "tsx",
      "typescript",
      "vim",
      "yaml",
      "xml"
    }
  },
  config = function (_, opts) 
    require("nvim-treesitter").install(opts.ensure_installed)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = opts.ensure_installed,
      callback = function ()
        vim.treesitter.start()
      end
    })
  end,
}
