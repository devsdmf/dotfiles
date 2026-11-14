require('util.lazy_file').lazy_file()

return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    },
    lazy = false,
    keys = {
      { '<C-o>', '<Cmd>Neotree toggle<CR>', desc = 'Toggle neotree', mode = 'n'}
    },
    config = function ()
      require('neo-tree').setup({
          sources = { "filesystem", "buffers" },
          close_if_last_window = false,
          popup_border_style = "NC",
          enable_git_status = true,
          enable_diagnostics = true,
          open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
          open_files_using_relative_paths = false,
          short_case_insensitive = false,
          window = {
            position = 'right',
            mapping_options = {
              noremap = true,
              nowait = true,
            }
          },
          filesystem = {
            bind_to_cwd = false,
            filtered_items = {
              visible = false,
              hide_dotfiles = false,
              hide_gitignored = false,
              hide_hidden = false,
              hide_by_name = {},
              hide_by_pattern = {},
              always_show = {},
              always_show_by_pattern = {},
              never_show = {},
              never_show_by_pattern = {}
            },
            group_empty_dirs = false,
            follow_current_file = { enabled = true }
          }
        })
    end
  },
  {
    'alexghergh/nvim-tmux-navigation',
    keys = {
      {
        '<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>',
        desc = 'Navigate to left buffer', mode = 'n'
      },
      {
        '<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>',
        desc = 'Navigate to buffer below', mode = 'n'
      },
      {
        '<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>',
        desc = 'Navigate to buffer above', mode = 'n'
      },
      {
        '<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>',
        desc = 'Navigate to right buffer', mode = 'n'
      }
    },
    config = function()
      local nav = require('nvim-tmux-navigation')

      nav.setup({
          disable_when_zoomed = true
        })
    end
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'modern',
      triggers = {
        { '<auto>', mode = 'nxso' },
        { '<leader>?', mode = {'n', 'v'} }
      },
      plugins = {
        marks = false,
        registers = false,
        presets = {
          operators = true,
          motions = false,
          text_objects = false,
          windows = false,
          z = false,
          g = false
        }
      },
      spec = {
        {
          mode = { 'n', 'v' },
          { 's', group = 'surrounding' },
          { 'S', desc = 'Add surrounding (visual)' },
          { 'gS', desc = 'Add surrounding (break lines)' },
          { 'ys', desc = 'Add surrounding (normal)' },
          { 'ysiw', desc = 'Add surrounding over text-object (normal)' },
          { 'cs', desc = 'Change surrounding (normal, visual)' },
          { 'ds', desc = 'Delete surrounding (normal, visual)' }
        }
      }
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show({ global = false})
        end,
        desc = 'Show keymaps',
        mode = { 'n', 'v' }
      }
    },
    config = function (_, opts)
      local wk = require('which-key')
      wk.setup(opts)
    end
  },
  {
    'kylechui/nvim-surround',
    version = '^3.0.0',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({})
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'LazyFile'
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function (_, opts)
      local npairs = require 'nvim-autopairs'
      local Rule = require 'nvim-autopairs.rule'

      npairs.setup(opts)

      local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }

      npairs.add_rules {
        Rule(' ', ' ')
            :with_pair(function(opts)
              local pair = opts.line:sub(opts.col - 1, opts.col)
              return vim.tbl_contains({
                brackets[1][1] .. brackets[1][2],
                brackets[2][1] .. brackets[2][2],
                brackets[3][1] .. brackets[3][2],
              }, pair)
            end)
      }
      for _, bracket in pairs(brackets) do
        npairs.add_rules {
          Rule(bracket[1] .. ' ', ' ' .. bracket[2])
              :with_pair(function() return false end)
              :with_move(function(opts)
                return opts.prev_char:match('.%' .. bracket[2]) ~= nil
              end)
              :use_key(bracket[2])
        }
      end
    end
  }
}
