return {
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        init = function()
            vim.g.barbar_auto_setup = false

            vim.keymap.set('n', '<leader>tn', '<cmd>BufferNext<CR>', { desc = 'Move [T]ab [N]ext' })
            vim.keymap.set('n', '<leader>tp', '<cmd>BufferPrevious<CR>', { desc = 'Move [T]ab [P]revious' })

            vim.keymap.set('n', '<A-1>', '<cmd>BufferGoto 1<CR>', { desc = 'Go to buffer 1' })
            vim.keymap.set('n', '<A-2>', '<cmd>BufferGoto 2<CR>', { desc = 'Go to buffer 2' })
            vim.keymap.set('n', '<A-3>', '<cmd>BufferGoto 3<CR>', { desc = 'Go to buffer 3' })
            vim.keymap.set('n', '<A-4>', '<cmd>BufferGoto 4<CR>', { desc = 'Go to buffer 4' })
            vim.keymap.set('n', '<A-5>', '<cmd>BufferGoto 5<CR>', { desc = 'Go to buffer 5' })
            vim.keymap.set('n', '<A-6>', '<cmd>BufferGoto 6<CR>', { desc = 'Go to buffer 6' })
            vim.keymap.set('n', '<A-7>', '<cmd>BufferGoto 7<CR>', { desc = 'Go to buffer 7' })
            vim.keymap.set('n', '<A-8>', '<cmd>BufferGoto 8<CR>', { desc = 'Go to buffer 8' })
            vim.keymap.set('n', '<A-9>', '<cmd>BufferGoto 9<CR>', { desc = 'Go to buffer 9' })

            vim.keymap.set('n', '<A-w>', '<cmd>BufferClose<CR>', { desc = 'Tab Close' })
        end,
        opts = {},
    },
}
