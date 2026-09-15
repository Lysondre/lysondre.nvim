-- highlight on search and clear by pressing <Esc>
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- diagnostics
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- split navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

local function hover()
    vim.lsp.buf.hover {
        border = 'rounded',
    }
end

vim.keymap.set('n', 'K', hover, { desc = 'Show Hover Docs' })

local snacks = require 'snacks'

vim.keymap.set('n', '<leader>e', Snacks.explorer.open, { desc = 'Open explorer' })
vim.keymap.set('n', '<leader>lg', snacks.lazygit.open, { desc = 'Open LazyGit' })
