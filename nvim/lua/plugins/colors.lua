return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          operators = false,
          folds = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,
        contrast = "",
        palette_overrides = {},
        overrides = {},
      })

      vim.cmd([[colorscheme gruvbox]])

      -- Get gruvbox colors
      local colors = {
        dark0 = "#282828",
        dark1 = "#3c3836",
        dark2 = "#504945",
        dark3 = "#665c54",
        dark4 = "#7c6f64",

        light1 = "#ebdbb2",
        light2 = "#d5c4a1",
        light3 = "#bdae93",
        light4 = "#a89984",

        bright_red = "#fb4934",
        bright_green = "#b8bb26",
        bright_yellow = "#fabd2f",
        bright_blue = "#83a598",
        bright_purple = "#d3869b",
        bright_aqua = "#8ec07c",
        bright_orange = "#fe8019",

        faded_red = "#9d0006",
        faded_green = "#79740e",
        faded_yellow = "#b57614",
        faded_blue = "#076678",

        dark_green = "#6b8f71",
        peach = "#f5b5a8",
      }

      -- Apply custom highlights
      local hl = vim.api.nvim_set_hl

      -- ============================================
      -- GREEN: Constants (strings, numbers, booleans)
      -- ============================================
      hl(0, "String", { fg = colors.dark_green })
      hl(0, "Character", { fg = colors.bright_green })
      hl(0, "Number", { fg = colors.bright_green })
      hl(0, "Float", { fg = colors.bright_green })
      hl(0, "Boolean", { fg = colors.bright_green })
      hl(0, "Constant", { fg = colors.bright_green })
      hl(0, "@string", { fg = colors.dark_green })
      hl(0, "@number", { fg = colors.bright_green })
      hl(0, "@boolean", { fg = colors.bright_green })
      hl(0, "@constant", { fg = colors.bright_green })
      hl(0, "@constant.builtin", { fg = colors.bright_green })

      -- ============================================
      -- PURPLE: Comments (prominent!)
      -- ============================================
      hl(0, "Comment", { fg = colors.bright_purple })
      hl(0, "@comment", { fg = colors.bright_purple })
      hl(0, "@comment.documentation", { fg = colors.bright_purple })

      -- ============================================
      -- YELLOW: Top-level definitions
      -- ============================================
      hl(0, "Function", { fg = colors.bright_yellow, bold = true })
      hl(0, "@function", { fg = colors.bright_yellow, bold = true })
      hl(0, "@function.method", { fg = colors.bright_yellow, bold = true })
      hl(0, "@constructor", { fg = colors.bright_yellow, bold = true })
      hl(0, "Type", { fg = colors.bright_yellow })
      hl(0, "@type.definition", { fg = colors.bright_yellow })
      hl(0, "@class", { fg = colors.bright_yellow })
      hl(0, "Structure", { fg = colors.bright_yellow })
      hl(0, "StorageClass", { fg = colors.bright_yellow })
      hl(0, "@markup.heading", { fg = colors.bright_yellow, bold = true })
      hl(0, "@text.title", { fg = colors.bright_yellow, bold = true })

      -- ============================================
      -- BLUE: Declarations
      -- ============================================
      hl(0, "@variable.parameter", { fg = colors.bright_blue })
      hl(0, "@parameter", { fg = colors.bright_blue })
      hl(0, "@variable.member", { fg = colors.bright_blue })
      hl(0, "@property", { fg = colors.bright_blue })
      hl(0, "@field", { fg = colors.bright_blue })
      hl(0, "@lsp.type.parameter", { fg = colors.bright_blue })
      hl(0, "@lsp.typemod.variable.declaration", { fg = colors.bright_blue })
      hl(0, "@lsp.typemod.parameter.declaration", { fg = colors.bright_blue })

      -- ============================================
      -- BASE COLOR: Keywords and variable usage
      -- ============================================
      hl(0, "Keyword", { fg = colors.light2 })
      hl(0, "@keyword", { fg = colors.light2 })
      hl(0, "@keyword.function", { fg = colors.light2 })
      hl(0, "@keyword.operator", { fg = colors.light2 })
      hl(0, "@keyword.return", { fg = colors.bright_red })
      hl(0, "@keyword.conditional", { fg = colors.light2 })
      hl(0, "@keyword.repeat", { fg = colors.light2 })
      hl(0, "@keyword.import", { fg = colors.light2 })
      hl(0, "Conditional", { fg = colors.light2 })
      hl(0, "Repeat", { fg = colors.light2 })
      hl(0, "Statement", { fg = colors.light2 })
      hl(0, "Include", { fg = colors.light2 })

      hl(0, "@variable", { fg = colors.light1 })
      hl(0, "@variable.builtin", { fg = colors.light1 })
      hl(0, "Identifier", { fg = colors.light1 })

      hl(0, "@type", { fg = colors.light1 })
      hl(0, "@type.builtin", { fg = colors.light1 })
      hl(0, "@type.qualifier", { fg = colors.light1 })

      hl(0, "@lsp.type.variable", { fg = colors.light1 })
      hl(0, "@lsp.type.property", { fg = colors.light1 })
      hl(0, "@lsp.type.function", {})
      hl(0, "@lsp.type.method", {})
      hl(0, "@lsp.type.keyword", {})

      -- ============================================
      -- PEACH: Function calls
      -- ============================================
      hl(0, "@function.call", { fg = colors.peach })
      hl(0, "@function.builtin", { fg = colors.peach })
      hl(0, "@function.method.call", { fg = colors.peach })
      hl(0, "@method.call", { fg = colors.peach })
      hl(0, "@lsp.typemod.function.defaultLibrary", { fg = colors.peach })
      hl(0, "@lsp.typemod.method.defaultLibrary", { fg = colors.peach })

      -- ============================================
      -- DIMMED: Punctuation
      -- ============================================
      hl(0, "Operator", { fg = colors.dark4 })
      hl(0, "@operator", { fg = colors.dark4 })
      hl(0, "@punctuation.delimiter", { fg = colors.dark4 })
      hl(0, "@punctuation.bracket", { fg = colors.dark4 })
      hl(0, "@punctuation.special", { fg = colors.dark4 })
      hl(0, "Delimiter", { fg = colors.dark4 })

      -- ============================================
      -- HTML/JSX
      -- ============================================
      hl(0, "@tag", { fg = colors.light1 })
      hl(0, "@tag.attribute", { fg = colors.bright_blue })
      hl(0, "@tag.delimiter", { fg = colors.dark4 })

      -- ============================================
      -- Special cases
      -- ============================================
      hl(0, "Special", { fg = colors.light1 })
      hl(0, "SpecialChar", { fg = colors.bright_green })
      hl(0, "SpecialComment", { fg = colors.bright_purple, bold = true })
      hl(0, "@string.escape", { fg = colors.bright_green, bold = true })
      hl(0, "@string.special", { fg = colors.bright_green, bold = true })
      hl(0, "@string.regex", { fg = colors.bright_green })

      -- ============================================
      -- Diagnostics
      -- ============================================
      hl(0, "Error", { fg = colors.bright_red, bold = true })
      hl(0, "ErrorMsg", { fg = colors.bright_red, bold = true })
      hl(0, "WarningMsg", { fg = colors.bright_orange })
      hl(0, "DiagnosticError", { fg = colors.bright_red })
      hl(0, "DiagnosticWarn", { fg = colors.bright_orange })
      hl(0, "DiagnosticInfo", { fg = colors.bright_blue })
      hl(0, "DiagnosticHint", { fg = colors.light2 })
      hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.bright_red })
      hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.bright_orange })
      hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.bright_blue })
      hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.light2 })

      -- ============================================
      -- UI
      -- ============================================
      hl(0, "CursorLineNr", { fg = colors.bright_yellow, bold = true })
      hl(0, "Visual", { bg = colors.dark2 })
      hl(0, "Search", { bg = colors.dark1, fg = colors.bright_yellow, bold = true })
      hl(0, "IncSearch", { bg = colors.bright_yellow, fg = colors.dark0, bold = true })
      hl(0, "CurSearch", { bg = colors.bright_yellow, fg = colors.dark0, bold = true })

      -- ============================================
      -- Git
      -- ============================================
      hl(0, "DiffAdd", { bg = colors.faded_green, fg = colors.bright_green })
      hl(0, "DiffChange", { bg = colors.faded_yellow, fg = colors.bright_yellow })
      hl(0, "DiffDelete", { bg = colors.faded_red, fg = colors.bright_red })
      hl(0, "DiffText", { bg = colors.faded_blue, fg = colors.bright_yellow })

      -- ============================================
      -- Markdown
      -- ============================================
      hl(0, "@markup.strong", { bold = true })
      hl(0, "@markup.italic", { italic = true })
      hl(0, "@markup.link", { fg = colors.bright_blue, underline = true })
      hl(0, "@markup.link.url", { fg = colors.bright_green })
      hl(0, "@markup.raw", { fg = colors.bright_green })
      hl(0, "@markup.list", { fg = colors.dark4 })

      -- ============================================
      -- Telescope
      -- ============================================
      hl(0, "TelescopeSelection", { bg = colors.dark2, bold = true })
      hl(0, "TelescopeMatching", { fg = colors.bright_yellow, bold = true })

      -- ============================================
      -- Neo-tree
      -- ============================================
      hl(0, "NeoTreeDirectoryName", { fg = colors.bright_yellow })
      hl(0, "NeoTreeDirectoryIcon", { fg = colors.bright_yellow })
      hl(0, "NeoTreeGitModified", { fg = colors.bright_yellow })
      hl(0, "NeoTreeGitAdded", { fg = colors.bright_green })
      hl(0, "NeoTreeGitDeleted", { fg = colors.bright_red })

      -- ============================================
      -- Which-key
      -- ============================================
      hl(0, "WhichKey", { fg = colors.bright_yellow })
      hl(0, "WhichKeyGroup", { fg = colors.bright_blue })
      hl(0, "WhichKeySeparator", { fg = colors.dark4 })
    end,
  },
}
