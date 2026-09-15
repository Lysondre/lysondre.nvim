if vim.g.neovide then
    require 'config.neovide'
end

require 'config.core'
require 'config.lazy'
require 'config.keymaps'
require 'config.autocommands'
require 'config.highlights'

vim.cmd.colorscheme 'catppuccin-mocha'
