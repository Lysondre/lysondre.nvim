return {
    {
        'folke/which-key.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        event = 'VeryLazy',
        opts = {
            preset = 'modern',
            spec = {
                { '<leader>f', group = 'Telescope [F]ind' },
                { '<leader>t', group = '[T]ab navigation' },
            },
        },
        keys = {
            {
                '<leader>?',
                function()
                    require('which-key').show { global = false }
                end,
                desc = 'Buffer Local Keymaps (which-key)',
            },
        },
    },
}
