-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Set tabs to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.title = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.wrap = false

-- Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
vim.opt.breakindent = true

-- Enable incremental searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true

vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"

-- Decrease updatetime to 200ms
vim.opt.updatetime = 50

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { "menuone", "noselect" }

-- Enable access to System Clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 8

-- Place a column line
vim.opt.colorcolumn = "80"
