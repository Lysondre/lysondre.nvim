-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- line number settings
vim.opt.number = true
vim.opt.relativenumber = true

-- indentation settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- enable mouse mode for resizing splits
vim.opt.mouse = 'a'

vim.opt.showmode = false

-- sync clipboard between OS and neovim
vim.opt.clipboard = 'unnamedplus'

-- enable break indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- make search case-incensitive by default
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep the sign column
vim.opt.signcolumn = 'yes'

-- preferred line length
vim.opt.colorcolumn = '90'

-- decrease update time
vim.opt.updatetime = 250

-- decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- how splits should be open
vim.opt.splitright = true
vim.opt.splitbelow = true

-- set how certain whitespace characters are displayed in editor
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- not entirely sure what this does for me, TODO: take a closer look
vim.opt.inccommand = 'split'

-- show the line the cursor is on
vim.opt.cursorline = true

-- screen lines to keep above and below cursor line
vim.opt.scrolloff = 8

-- 24-bit colour
vim.opt.termguicolors = true
