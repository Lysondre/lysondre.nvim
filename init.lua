-- Neovide needs extra configs
if vim.g.neovide then
    require 'config.neovide'
end

require 'config.core'
require 'config.lazy'
require 'config.keymaps'
require 'config.autocommands'
