
return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs',
        opts = {
            ensure_installed = {
                'bash',
                'c',
                'diff',
                'html',
                'lua',
                'luadoc',
                'markdown',
                'vimdoc',
                'python',
            },
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = { enable = true },
        },
        config = function()
            require('nvim-treesitter.install').prefer_git = true
        end,
    },
}
