return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- Override default keymaps if needed
    },
    opts = function(_, opts)
      local actions = require("telescope.actions")

      opts.defaults = opts.defaults or {}
      opts.defaults.mappings = {
        i = {
          -- Tab navigation
          ["<Tab>"] = actions.move_selection_next,
          ["<S-Tab>"] = actions.move_selection_previous,

          -- Ctrl navigation (alternative)
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,

          -- Arrow keys still work
          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,

          -- Other useful mappings
          ["<c-t>"] = actions.select_tab,
          ["<CR>"] = actions.select_default,
          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
        },
        n = {
          ["<Tab>"] = actions.move_selection_next,
          ["<S-Tab>"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      }

      return opts
    end,
  },
}
