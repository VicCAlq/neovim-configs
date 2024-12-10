local icons = require("resources.icons")
local utils = require("core.utils")

-- Setting leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Changing default behaviours
-- map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- map("n", "x", "_x", { silent = true })
-- map("n", "c", "_c", { silent = true })
-- map("n", "p", "_dP", { silent = true })

-- Center items on "n" navigtion
map("n", "n", "nzzzv", { silent = true })
map("n", "N", "Nzzzv", { silent = true })

-- Movement remaps
map("n", "j", "gj", { desc = "Move cursor down" })
map("n", "<Down>", "gj", { desc = "Move cursor down" })
map("n", "k", "gk", { desc = "Move cursor up" })
map("n", "<Up>", "gk", { desc = "Move cursor up" })
map("v", "j", "gj", { desc = "Move cursor down" })
map("v", "<Down>", "gj", { desc = "Move cursor down" })
map("v", "k", "gk", { desc = "Move cursor up" })
map("v", "<Up>", "gk", { desc = "Move cursor up" })
map("n", "H", "^", { desc = "Move to start of line" })
map("n", "L", "$", { desc = "Move to end of line" })

-- Indent in selection mode
map("v", "<Tab>", ">gv", { desc = "Indent line" })
map("v", "<S-Tab>", "<gv", { desc = "Dedent line" })

-- Alternate commenting line
map("n", "<leader>/", "gcc", { desc = "(un)Comment line", remap = true })
map("v", "<leader>/", "gc", { desc = "(un)Comment line", remap = true })

-- Terminal navigation
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Terminal left window navigation" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Terminal down window navigation" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Terminal up window navigation" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Terminal right window navigation" })

-- Splits manipulation
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split vertically" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split horizontally" })
map("n", "<c-j>", "<c-w><c-j>", { desc = "Switch to split below" })
map("n", "<c-k>", "<c-w><c-k>", { desc = "Switch to split above" })
map("n", "<c-l>", "<c-w><c-l>", { desc = "Switch to right split" })
map("n", "<c-h>", "<c-w><c-h>", { desc = "Switch to left split" })
map("n", "<C-up>", "<cmd>resize -2<cr>", { desc = "Resize split up" })
map("n", "<C-down>", "<cmd>resize +2<cr>", { desc = "Resize split down" })
map("n", "<C-left>", "<cmd>vertical resize -2<cr>", { desc = "Resize split left" })
map("n", "<C-right>", "<cmd>vertical resize +2<cr>", { desc = "Resize split right" })
map("n", "<leader>sr", "<C-w>=", { desc = "Resize splits equally" })

-- Buffer navigation
--  NOTE: buffer cycling handled by BufferLine now
-- map("n", "[b", "<cmd>bprevious<cr>", { desc = "Go to previous buffer" })
-- map("n", "]b", "<cmd>bnext<cr>", { desc = "Go to next buffer" })
map("n", "<leader>c", ":bp | sp | bn | bd<CR>", { desc = "Close current buffer", remap = true, silent = true })
map("n", "<leader>n", "<cmd>enew<cr>", { desc = "New file" })

-- Code running
map("n", "<leader>xx", ":.lua<CR>", { desc = "Execute the current line" })
map("v", "<leader>xx", ":lua<CR>", { desc = "Execute the current selection" })
map("n", "<leader>xf", "<cmd>source %<CR>", { desc = "Source/Run the current file" })

-- Diagnostics navigation
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic item" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic item" })
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Open diagnostic list" })
map("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Set diagnostic list" })

-- Standard  operations
map("n", "<leader>w", "<cmd>noautocmd w<cr>", { desc = "Save with no autoformatting" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "[Q]uickfix list" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights on <Esc>" })
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "[R]eplace word under cursor for whole buffer" })
map("n", "<C-c>r", "ciw", { desc = "[C]hange word under cursor" })
-- map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
-- map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })

-- VimTabs
map("n", "<leader>To", "<cmd>tabnew<cr>", { desc = "Create a new Vim tab" })
map("n", "<leader>Tx", "<cmd>tabclose!<cr>", { desc = "Close this vim Tab" })
map("n", "<leader>Tn", "<cmd>tabn<cr>", { desc = "Go to next Vim tab" })
map("n", "<leader>Tb", "<cmd>tabp<cr>", { desc = "Go to previous Vim Tab" })

-- Terminal
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

-- NetRW mappings (in case NeoTree is disabled for some reason)
if not utils.is_available("neo-tree.nvim") then
  map("n", "<leader>e", "<cmd>Vex<cr><cmd>cd %:h<cr>", { desc = "Opens NetRW on current buffer's location" })
  map("n", "<leader>o", "<cmd>Lex<cr><cmd>cd %:h<cr>", { desc = "Opens NetRW on current buffer's location" })
end
