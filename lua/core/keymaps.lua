local icons = require "resources.icons"
local utils = require "core.utils"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Changing default behaviours
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
map("n", "x", "_x", { silent = true })
map("n", "c", "_c", { silent = true })
map("n", "p", "_dP", { silent = true })
map("n", "n", "nzzzv", { silent = true })
map("n", "N", "Nzzzv", { silent = true })

-- Movement remaps
map("n", "j", "gj", { desc = "Move cursor down " })
map("n", "k", "gk", { desc = "Move cursor up " })

-- Indent in selection mode
map("v", "<Tab>", ">gv", { desc = "Indent line" })
map("v", "<S-Tab>", "<gv", { desc = "Dedent line" })

-- Alternate commenting line
map("n", "<leader>/", "gcc", { desc = "(un)Comment line" })
map("v", "<leader>/", "gc", { desc = "(un)Comment line" })

-- Terminal navigation
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Terminal left window navigation" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Terminal down window navigation" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Terminal up window navigation" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Terminal right window navigation" })

-- Splits manipulation
map("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "Split vertically" })
map("n", "<leader>h", "<cmd>vsplit<cr>", { desc = "Split horizontally" })
map("n", "<c-j>", "<c-w><c-j>", { desc = "Switch to split below" })
map("n", "<c-k>", "<c-w><c-k>", { desc = "Switch to split above" })
map("n", "<c-l>", "<c-w><c-l>", { desc = "Switch to right split" })
map("n", "<c-h>", "<c-w><c-h>", { desc = "Switch to left split" })
map("n", "<C-left>", "<cmd>resize -2<cr>", { desc = "Resize split left" })
map("n", "<C-right>", "<cmd>resize +2<cr>", { desc = "Resize split right" })
map("n", "<C-up>", "<cmd>vertical resize -2<cr>", { desc = "Resize split up" })
map("n", "<C-down>", "<cmd>vertical resize +2<cr>", { desc = "Resize split down" })
map("n", "<leader>rh", "<C-w>=", { desc = "Resize splits equally" })

-- Buffer navigation
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Go to previous buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Go to next buffer" })
map("n", "<leader>c", "<cmd>bdelete<cr>", { desc = "Close current buffer" })
map("n", "<leader>n", "<cmd>enew<cr>", { desc = "New file" })

-- Code running
map("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
map("n", "<leader>s", "<cmd>source %<CR>", { desc = "Source/Run the current file" })

-- Diagnostics navigation
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic item" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic item" })
map("n", "<leader>do", vim.diagnostic.open_float, { desc = "Open diagnostic list" })
map("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Set diagnostic list" })

-- Standard  operations
map("n", "<leader>w", "<cmd>noautocmd w<cr>", { desc = "Save with no autoformatting" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "[Q]uickfix list" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights on <Esc>" })

-- VimTabs
map("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Save with no autoformatting" })
map("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Save with no autoformatting" })
map("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Save with no autoformatting" })
map("n", "<leader>tb", "<cmd>tabp<cr>", { desc = "Save with no autoformatting" })

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
-- Easily hit escape in terminal mode.
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Escape terminal mode" })
-- Open a terminal at the bottom of the screen with a fixed height.
map("n", "<leader>ts", function()
  vim.cmd.new()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
  vim.wo.winfixheight = true
  vim.cmd.terminal()
end, { desc = "Open a standard terminal at screen bottom" })

-- NeoTree (Change to mini.files later)
if utils.is_available("neo-tree.nvim") then
  map("n", "<leader>e", "<cmd>Neotree toggle position=right<cr>",
    { desc = icons.TreeFileAlt .. " Toggle NeoTree [E]xplorer" })
  map("n", "<leader>o", function()
    if vim.bo.filetype == "neo-tree" then
      vim.cmd.wincmd("p")
    else
      vim.cmd.Neotree("focus")
    end
  end, { desc = icons.TreeFileAlt .. " Toggle NeoTree [E]xplorer" })
else
  map("n", "<leader>e", "<cmd>Vex<cr><cmd>cd %:h<cr>", { desc = "Opens NetRW on current buffer's location" })
  map("n", "<leader>o", "<cmd>Lex<cr><cmd>cd %:h<cr>", { desc = "Opens NetRW on current buffer's location" })
end
