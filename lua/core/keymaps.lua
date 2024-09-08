local icons = require("resources.icons")
local utils = require("core.utils")

local map = vim.keymap.set

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
map("n", "<c-j>", "<c-w><c-j>", { desc = "Switch to split below" })
map("n", "<c-k>", "<c-w><c-k>", { desc = "Switch to split above" })
map("n", "<c-l>", "<c-w><c-l>", { desc = "Switch to right split" })
map("n", "<c-h>", "<c-w><c-h>", { desc = "Switch to left split" })
map("n", "<C-left>", "<c-w>1<", { desc = "Resize split left" })
map("n", "<C-right>", "<c-w>1>", { desc = "Resize split right" })
map("n", "<C-up>", "<C-w>+", { desc = "Resize split up" })
map("n", "<C-down>", "<C-w>-", { desc = "Resize split down" })

-- Code running
map("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
map("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- Diagnostics navigation
map("n", "]d", utils.fn(vim.diagnostic.jump, { count = 1, float = true }))
map("n", "[d", utils.fn(vim.diagnostic.jump, { count = -1, float = true }))

-- Standard  operations
map("n", "<leader>n", "<cmd>enew<cr>", { desc = "New file" })
map("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "Split vertically" })
map("n", "<leader>h", "<cmd>vsplit<cr>", { desc = "Split horizontally" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "[Q]uickfix list" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights on <Esc>" })

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
  map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = icons.TreeFileAlt .. " Toggle NeoTree [E]xplorer" })
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
