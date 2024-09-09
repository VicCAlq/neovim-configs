return {
  "Shatur/neovim-session-manager",
  event = "BufWritePost",
  cmd = "SessionManager",
  enabled = vim.g.resession_enabled ~= true,
  lazy = false,
}
