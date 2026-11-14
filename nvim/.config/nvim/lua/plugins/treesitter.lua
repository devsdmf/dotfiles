require("util.lazy_file").lazy_file()

return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'main',
  build = function()
    local TS = require("nvim-treesitter")
    if not TS.get_installed then
      error("Please restart Neovim and run `:TSUpdate` to use the `nvim-treesitter` **main** branch.")
      return
    end
  end,
  lazy = vim.fn.argc(-1) == 0,
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
  opts_extend = { "ensure_installed" },
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
      "terraform",
      "tsx",
      "typescript",
      "vim",
      "yaml",
      "xml"
    }
  },
  config = function (_, opts) 
    local TS = require("nvim-treesitter")

    setmetatable(require("nvim-treesitter.install"), {
      __newindex = function (_, k)
        if k == "compilers" then
          vim.schedule(function()
            error("Setting custom compilers for nvim-treesitter is no longer supported")
          end)
        end
      end,
    })

    if not TS.get_installed then
      return error("Please use :Lazy and update nvim-treesitter")
    elseif type(opts.ensure_installed) ~= "table" then
      return error("nvim-treesitter opts.ensure_installed must be a table")
    end

    TS.install(opts.ensure_installed)

    -- parser names differ from filetypes (e.g. tsx -> typescriptreact, bash -> sh)
    local filetypes = {}
    for _, lang in ipairs(opts.ensure_installed) do
      vim.list_extend(filetypes, vim.treesitter.language.get_filetypes(lang))
    end

    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function (ev)
        -- parser may still be installing on first run
        pcall(vim.treesitter.start, ev.buf)
      end
    })
  end,
}
