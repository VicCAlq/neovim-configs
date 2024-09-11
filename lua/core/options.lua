local utils = require("core.utils")
local cmd = vim.cmd
local opt = vim.opt
local api = vim.api

cmd("filetype plugin indent on")
cmd([[highlight WinSeparator guibg = None]])

-- Mouse activation and default shell for Term
opt.mouse = "a"
opt.shell = "fish"

-- Layout settings
vim.g.have_nerd_font = true
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 20
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_clipboard = 0
vim.g.netrw_fastbrowse = 2

opt.pumheight = 15
opt.cmdheight = 1
opt.numberwidth = 3
opt.laststatus = 3
opt.showtabline = 2
opt.scrolloff = 10
opt.sidescrolloff = 5

-- Behaviour settings
opt.number = true
opt.relativenumber = true
opt.showcmd = true
opt.showmode = false
opt.termguicolors = true
opt.cursorline = true
opt.cursorcolumn = false
opt.signcolumn = "yes"

opt.fileencoding = "utf-8" -- File Encoding
opt.clipboard = "unnamedplus"
opt.completeopt = { "menu", "menuone", "noselect" }
opt.shortmess:append("c")
opt.undofile = true
opt.autochdir = false
opt.hidden = true
opt.splitright = true
opt.splitbelow = true

-- Delay-related settings
opt.updatetime = 250
opt.timeoutlen = 250

-- Search related settings
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.inccommand = "split"
opt.whichwrap = "b,s,<,>,[,]"
opt.backspace = "indent,eol,start"
opt.iskeyword:append("-,_")

-- Lines and indent settings
opt.wrap = true
opt.linebreak = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.breakindent = true
opt.smartindent = true
opt.autoindent = true
opt.expandtab = true
opt.smarttab = true

-- Backup settings
opt.backup = false
opt.writebackup = true

-- Keep cursor unchanged after quiting
api.nvim_create_autocmd("ExitPre", {
  group = vim.api.nvim_create_augroup("Exit", { clear = true }),
  command = "set guicursor=a:ver90",
  desc = "Set cursor back to beam when leaving Neovim.",
})

-- Options based on filetypes
-- Markdown
api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.wrap = true
    vim.opt.linebreak = true
  end,
})

-- Disable commenting next line
api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
    vim.opt_local.scrolloff = 0

    vim.bo.filetype = "terminal"
  end,
})

-- Set background color to transparent
vim.api.nvim_command([[
  augroup ChangeBackgroudColour
    autocmd colorscheme * :hi normal ctermbg=none guibg=none
    " -- autocmd colorscheme * :hi normal ctermbg=Black guibg=#050607
    " -- autocmd colorscheme * :hi normal ctermbg=none guibg=#050607
  augroup END
]])

-- Apply custom italic/bold settings when changing colorschemes
api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    utils.set_new_hl()
  end,
})
