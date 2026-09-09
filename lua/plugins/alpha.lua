return {
    {
        'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        opts = function()
            local dashboard = require 'alpha.themes.dashboard'

            local logo = [[
  ███╗   ██╗██╗   ██╗ █████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║╚██╗ ██╔╝██╔══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║ ╚████╔╝ ███████║██║   ██║██║██╔████╔██║  ╱|、
  ██║╚██╗██║  ╚██╔╝  ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║ (˚ˎ 。7 
  ██║ ╚████║   ██║   ██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║  |、˜〵 
  ╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  じしˍ,)ノ
                                                  
    ]]

            dashboard.section.header.val = vim.split(logo, '\n')

            -- buttons
            dashboard.section.buttons.val = {
                dashboard.button('f', '  Find file', ':Telescope find_files<CR>'),
                dashboard.button('r', '  Recent files', ':Telescope oldfiles<CR>'),
                dashboard.button('n', '  Open neovim config', ':cd ~/.config/nvim<CR>:e $MYVIMRC<CR>'),
                dashboard.button('s', '  Open quickshell config', ':cd ~/.config/quickshell<CR>:e shell.qml<CR>'),
                dashboard.button('h', '  Open hyprland config', ':cd ~/.config/hypr<CR>:e hyprland.lua<CR>'),
                dashboard.button('e', '  New file', ':ene <BAR> startinsert<CR>'),
                dashboard.button('q', '  Quit', ':qa<CR>'),
            }
        end,
        config = function()
            local dashboard = require 'alpha.themes.dashboard'

            require('alpha').setup(dashboard.config)
        end,
    },
}
