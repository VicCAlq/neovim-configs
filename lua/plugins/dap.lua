return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")
      local icons = require("resources.icons")

      local js_based_languages = {
        "typescript",
        "javascript",
        "typescriptreact",
        "javascriptreact",
        "vue",
      }
      require("dapui").setup()
      require("dap-go").setup()

      require("nvim-dap-virtual-text").setup({
        -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
        display_callback = function(variable)
          --- NOTE: If screen sharing, enable below
          --
          -- local name = string.lower(variable.name)
          -- local value = string.lower(variable.value)
          -- if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
          --   return "*****"
          -- end

          if #variable.value > 15 then
            return " " .. icons.Peek .. " " .. string.sub(variable.value, 1, 15) .. "... "
          end

          return " " .. icons.Peek .. " " .. variable.value
        end,
      })

      -- Lua configs
      dap.adapters["local-lua"] = {
        type = "executable",
        command = "node",
        args = {
          -- 💀 Make sure to update this path to point to your installation
          "/home/vicmca/CodeProjects/nvim/DAPs//local-lua-debugger-vscode/extension/debugAdapter.js",
        },
        enrich_config = function(config, on_config)
          if not config["extensionPath"] then
            local c = vim.deepcopy(config)
            -- 💀 If this is missing or wrong you'll see
            -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
            c.extensionPath = "/home/vicmca/CodeProjects/nvim/DAPs/local-lua-debugger-vscode/"
            on_config(c)
          else
            on_config(config)
          end
        end,
      }

      dap.configurations.lua = {
        {
          type = "local-lua",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }

      -- JavaScript configs
      for _, language in ipairs(js_based_languages) do
        dap.configurations[language] = {
          -- Debug single nodejs files
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
          },
          -- Debug nodejs processes (make sure to add --inspect when you run the process)
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
          },
          -- Debug web applications (client side)
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch & Debug Chrome",
            url = function()
              local co = coroutine.running()
              return coroutine.create(function()
                vim.ui.input({
                  prompt = "Enter URL: ",
                  default = "http://localhost:3000",
                }, function(url)
                  if url == nil or url == "" then
                    return
                  else
                    coroutine.resume(co, url)
                  end
                end)
              end)
            end,
            webRoot = vim.fn.getcwd(),
            protocol = "inspector",
            sourceMaps = true,
            userDataDir = false,
          },
          -- Divider for the launch.json derived configs
          {
            name = "----- ↓ launch.json configs ↓ -----",
            type = "",
            request = "launch",
          },
        }
      end

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

      -- stylua: ignore
      vim.keymap.set( "n", "<space>çb", ":lua require('dap').toggle_breakpoint() <CR>", { desc = "[D]AP toggle [b]reakpoint" })
      vim.keymap.set("n", "<space>çr", ":lua require('dap').run_to_cursor() <CR>", { desc = "[D]AP [r]un to cursor" })
      vim.keymap.set("n", "<space>ço", ":lua require('dapui').open() <CR>", { desc = "[D]APUI [o]pen" })
      vim.keymap.set("n", "<space>çc", ":lua require('dapui').close() <CR>", { desc = "[D]APUI [o]pen" })
      -- stylua: ignore
      vim.keymap.set( "n", "<space>çn", ":lua require('dapui').open({ reset = true }) <CR>", { desc = "[D]APUI [o]pen a[n]ew" })

      -- Eval var under cursor
      vim.keymap.set("n", "<space>çe", ":lua require('dapui').eval(nil, { enter = true }) ", { desc = "[D]AP [e]val" })

      vim.keymap.set("n", "<leader>ç1", ":lua require('dap').continue() <CR>", { desc = "[D]AP continue" })
      vim.keymap.set("n", "<leader>ç2", ":lua require('dap').step_into() <CR>", { desc = "[D]AP step into" })
      vim.keymap.set("n", "<leader>ç3", ":lua require('dap').step_over() <CR>", { desc = "[D]AP step over" })
      vim.keymap.set("n", "<leader>ç4", ":lua require('dap').step_out() <CR>", { desc = "[D]AP step out" })
      vim.keymap.set("n", "<leader>ç5", ":lua require('dap').step_back() <CR>", { desc = "[D]AP step back" })
      vim.keymap.set("n", "<leader>ç6", ":lua require('dap').restart() <CR>", { desc = "[D]AP restart" })

      vim.fn.sign_define("DapBreakpoint", {
        text = icons.DapBreakpoint,
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
      })
      vim.fn.sign_define("DapBreakpointCondition", {
        text = icons.DapBreakpointCondition,
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
      })
      vim.fn.sign_define("DapBreakpointRejected", {
        text = icons.DapBreakpointRejected,
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
      })
      vim.fn.sign_define("DapLogPoint", {
        text = icons.DapLogPoint,
        texthl = "DapLogPoint",
        linehl = "DapLogPoint",
        numhl = "DapLogPoint",
      })
      vim.fn.sign_define("DapStopped", {
        text = icons.DapStopped,
        texthl = "DapStopped",
        linehl = "DapStopped",
        numhl = "DapStopped",
      })

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
