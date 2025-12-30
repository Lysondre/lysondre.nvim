
return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        version = false,
        lazy = false,
        init = function()
            vim.cmd.colorscheme 'catppuccin-macchiato'
        end,
        opts = {
            term_colors = true,
        },
    },
}
