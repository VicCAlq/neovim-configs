return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      require("dapui").setup()
      require("dap-go").setup()

      require("nvim-dap-virtual-text").setup({
        -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
        display_callback = function(variable)
          local name = string.lower(variable.name)
          local value = string.lower(variable.value)
          -- If screen sharing, enable below
          -- if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
          --   return "*****"
          -- end

          if #variable.value > 15 then
            return " " .. string.sub(variable.value, 1, 15) .. "... "
          end

          return " " .. variable.value
        end,
      })

      -- Handled by nvim-dap-go
      -- dap.adapters.go = {
      --   type = "server",
      --   port = "${port}",
      --   executable = {
      --     command = "dlv",
      --     args = { "dap", "-l", "127.0.0.1:${port}" },
      --   },
      -- }

      -- local elixir_ls_debugger = vim.fn.exepath "elixir-ls-debugger"
      -- if elixir_ls_debugger ~= "" then
      --   dap.adapters.mix_task = {
      --     type = "executable",
      --     command = elixir_ls_debugger,
      --   }
      --
      --   dap.configurations.elixir = {
      --     {
      --       type = "mix_task",
      --       name = "phoenix server",
      --       task = "phx.server",
      --       request = "launch",
      --       projectDir = "${workspaceFolder}",
      --       exitAfterTaskReturns = false,
      --       debugAutoInterpretAllModules = false,
      --     },
      --   }
      -- end

      vim.keymap.set("n", "<space>Db", dap.toggle_breakpoint, { desc = "[D]AP toggle [b]reakpoint" })
      vim.keymap.set("n", "<space>Dr", dap.run_to_cursor, { desc = "[D]AP [r]un to cursor" })

      -- Eval var under cursor
      vim.keymap.set("n", "<space>De", function()
        require("dapui").eval(nil, { enter = true })
      end, { desc = "[D]AP [e]val" })

      vim.keymap.set("n", "<F1>", dap.continue, { desc = "[D]AP continue" })
      vim.keymap.set("n", "<F2>", dap.step_into, { desc = "[D]AP step into" })
      vim.keymap.set("n", "<F3>", dap.step_over, { desc = "[D]AP step over" })
      vim.keymap.set("n", "<F4>", dap.step_out, { desc = "[D]AP step out" })
      vim.keymap.set("n", "<F5>", dap.step_back, { desc = "[D]AP step back" })
      vim.keymap.set("n", "<F13>", dap.restart, { desc = "[D]AP restart" })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
