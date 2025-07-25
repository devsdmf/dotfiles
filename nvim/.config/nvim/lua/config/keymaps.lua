-- general mappings
vim.keymap.set('n', '<leader>q', '<Cmd>q<CR>', { desc = 'Quit vim' })
vim.keymap.set('n', '<leader>s', '<Cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>r', '<Cmd>r<CR>', { desc = 'Reload file' })

-- copy/paste
vim.keymap.set({'n','v'}, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set({'n','v'}, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set({'n','v'}, '<leader>P', '"+P', { desc = 'Paste from system clipboard' })

-- tab mapping
vim.keymap.set('n', '<leader>t', '<Cmd>tabnew<CR>', { desc = 'Open a new tab' })
vim.keymap.set('n', '<leader>.', '<Cmd>tabnext<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>m', '<Cmd>tabprevious<CR>', { desc = 'Go to previous tab' })
vim.keymap.set('n', '<leader>1', '<Cmd>tabn 1<CR>', { desc = 'Go to tab no 1' })
vim.keymap.set('n', '<leader>2', '<Cmd>tabn 2<CR>', { desc = 'Go to tab no 2' })
vim.keymap.set('n', '<leader>3', '<Cmd>tabn 3<CR>', { desc = 'Go to tab no 3' })
vim.keymap.set('n', '<leader>4', '<Cmd>tabn 4<CR>', { desc = 'Go to tab no 4' })
vim.keymap.set('n', '<leader>5', '<Cmd>tabn 5<CR>', { desc = 'Go to tab no 5' })
vim.keymap.set('n', '<leader>6', '<Cmd>tabn 6<CR>', { desc = 'Go to tab no 6' })
