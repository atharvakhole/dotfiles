return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "debugpy",
        "js-debug-adapter",
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = { "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")

      -- Custom signs
      vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

      -- JavaScript/TypeScript debugging
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }

      for _, language in ipairs({ "typescript", "javascript" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    opts = {
      layouts = {
        {
          -- Output group (console + repl) at bottom
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
          position = "bottom",
          size = 15,
        },
        {
          -- Debug info group (scopes, breakpoints, etc.) on the right
          elements = {
            { id = "scopes", size = 0.40 },
            { id = "breakpoints", size = 0.20 },
            { id = "stacks", size = 0.20 },
            { id = "watches", size = 0.20 },
          },
          position = "right",
          size = 50,
        },
      },
    },
    config = function(_, opts)
      local dapui = require("dapui")
      dapui.setup(opts)

      -- NO auto-open or auto-close
      -- UI only toggles manually via keymaps

      -- Keymaps for toggling different groups
      -- Toggle entire DAP UI
      vim.keymap.set("n", "<leader>du", function()
        dapui.toggle()
      end, { desc = "Toggle DAP UI" })

      -- Toggle output group (console + repl) - layout #1
      vim.keymap.set("n", "<leader>do", function()
        dapui.toggle(1)
      end, { desc = "Toggle DAP Output (Console/REPL)" })

      -- Toggle debug info group (scopes, breakpoints, etc.) - layout #2
      vim.keymap.set("n", "<leader>di", function()
        dapui.toggle(2)
      end, { desc = "Toggle DAP Info (Scopes/Breakpoints)" })
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
    config = function()
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(mason_path)
    end,
  },
}
