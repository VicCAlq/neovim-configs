-- Custom Parameters (with defaults)
return {
  "David-Kunz/gen.nvim",
  lazy = false,
  config = function()
    local gen = require("gen")
    local map = vim.keymap.set

    map({ "n", "v" }, "<leader>gm", function()
      gen.select_model()
    end, { desc = "Change [M]odel" })
    map({ "n", "v" }, "<leader>gc", ":Gen Chat<CR>", { desc = "Open Ollama's [C]hat" })
    map({ "n", "v" }, "<leader>gr", ":Gen Review_Code<CR>", { desc = "[R]eview the code" })
    map({ "n", "v" }, "<leader>ge", ":Gen Enhance_Code<CR>", { desc = "Attempt to [E]nhance the code" })
    map({ "n", "v" }, "<leader>gC", ":Gen Change_Code<CR>", { desc = "[C]hange the code" })
    map({ "n", "v" }, "<leader>gg", ":Gen Enhance_Grammar_Spelling<CR>", { desc = "Attempt to enhance [G]rammar" })
    map({ "n", "v" }, "<leader>gw", ":Gen Enhance_Wording<CR>", { desc = "Attempt to enhance [W]ording" })
    map({ "n", "v" }, "<leader>gl", ":Gen Make_List<CR>", { desc = "Format to markdown [L]ist" })
    map({ "n", "v" }, "<leader>gt", ":Gen Make_Table<CR>", { desc = "Format to markdown [T]able" })

    require("gen").setup({
      model = "qwen2:1.5b", -- The default model to use.
      quit_map = "q", -- set keymap for close the response window
      retry_map = "<c-r>", -- set keymap to re-send the current prompt
      accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
      host = "localhost", -- The host running the Ollama service.
      port = "11434", -- The port on which the Ollama service is listening.
      display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split".
      show_prompt = true, -- Shows the prompt submitted to Ollama.
      show_model = true, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = false, -- Never closes the window automatically.
      hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
      init = function(options)
        pcall(io.popen, "ollama-init > /dev/null 2>&1 &")
      end,
      -- Function to initialize Ollama
      command = function(options)
        local body = { model = options.model, stream = true }
        return "curl --silent --no-buffer -X POST http://"
          .. options.host
          .. ":"
          .. options.port
          .. "/api/chat -d $body"
      end,
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a command string.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      -- list_models = '<omitted lua function>', -- Retrieves a list of model names
      debug = false, -- Prints errors and the command which is run.
    })
  end,
}
