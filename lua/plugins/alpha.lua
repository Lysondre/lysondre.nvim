return {
    {
        'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        opts = function()
            local dashboard = require('alpha.themes.dashboard')

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
                dashboard.button('n', '  Open config', ':cd ~/.config/nvim<CR>:e $MYVIMRC<CR>'),
                dashboard.button('e', '  New file', ':ene <BAR> startinsert<CR>'),
                dashboard.button('q', '  Quit', ':qa<CR>'),
            }
        end,
        config = function()
            local dashboard = require('alpha.themes.dashboard')

            require('alpha').setup(dashboard.config)
        end,
    },
}
