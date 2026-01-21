return {
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        config = true,
        init = function()
            vim.keymap.set(
                'n',
                '<leader>tt',
                ':ToggleTerm size=15 direction=horizontal name=desktop<CR>',
                { desc = 'Open the terminal' }
            )
            vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
        end,
    },
}
