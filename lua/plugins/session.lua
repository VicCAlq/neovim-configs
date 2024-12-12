return {
  "Shatur/neovim-session-manager",
  event = "BufWritePost",
  cmd = "SessionManager",
  enabled = vim.g.resession_enabled ~= true,
  lazy = false,
  config = function()
    local Path = require("plenary.path")

    vim.keymap.set("n", "<leader>sl", ":SessionManager load_session<CR>", { desc = "Choose session to [L]oad" })
    vim.keymap.set("n", "<leader>sL", ":SessionManager load_last_session<CR>", { desc = "[L]oad [L]ast session" })
    vim.keymap.set(
      "n",
      "<leader>sd",
      ":SessionManager load_current_dir_session<CR>",
      { desc = "Load session related to current [D]irectory" }
    )
    vim.keymap.set(
      "n",
      "<leader>sg",
      ":SessionManager load_git_session<CR>",
      { desc = "Load session from current [G]it repo" }
    )
    vim.keymap.set("n", "<leader>ss", ":SessionManager save_current_session<CR>", { desc = "[S]ave current session" })

    return {
      sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"), -- The directory where the session files will be saved.
      -- session_filename_to_dir = session_filename_to_dir, -- Function that replaces symbols into separators and colons to transform filename into a session directory.
      -- dir_to_session_filename = dir_to_session_filename, -- Function that replaces separators and colons into special symbols to transform session directory into a filename. Should use `vim.uv.cwd()` if the passed `dir` is `nil`.
      -- autoload_mode = config.AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. See "Autoload mode" section below.
      autosave_last_session = true, -- Automatically save last session on exit and on session switch.
      autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
      autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
      autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
        "gitcommit",
        "gitrebase",
      },
      autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
      autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
      max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
    }
  end,
}
