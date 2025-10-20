return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false, -- Better contrast
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          functions = {},
          variables = {},
        },
        -- Disable semantic tokens for specific token types to let Treesitter win
        semantic_tokens = true, -- Keep enabled but we'll override specific things
        on_highlights = nil, -- We'll define this below
        on_colors = function(colors)
          -- Custom Moonlight palette
          colors.bg = "#1e1e2e" -- Warm dark background
          colors.bg_dark = "#181825" -- Darker variant
          colors.bg_highlight = "#2a2a3e"
          colors.fg = "#cdd6f4" -- Soft lavender text
          colors.fg_dark = "#7f849c" -- Dimmed text
          colors.fg_gutter = "#45475a"

          -- The 4 functional colors
          colors.green = "#a6e3a1" -- Constants (strings, numbers)
          colors.yellow = "#f9e2af" -- Top-level definitions
          colors.blue = "#89b4fa" -- Declarations
          colors.teal = "#94e2d5" -- Return types (distinct teal/cyan)
          colors.pink = "#f5c2e7" -- Comments (pink, stand out!)

          -- Utility colors
          colors.cyan = "#94e2d5"
          colors.red = "#f38ba8"
          colors.orange = "#fab387"
          colors.magenta = "#cba6f7"
          colors.purple = "#b4befe"

          -- Punctuation
          colors.punctuation = "#585b70"

          -- Extended palette - Warm tones
          colors.peach = "#f5b5a8"
          colors.coral = "#f2a599"
          colors.amber = "#f9c96e"
          colors.gold = "#e5c890"

          -- Extended palette - Cool tones
          colors.sky = "#87ceeb"
          colors.lavender = "#c4a7e7"
          colors.mint = "#b5e8d3"
          colors.seafoam = "#a8dfd2"
          colors.periwinkle = "#a5b4fc"
          colors.ice = "#c9dcf5"

          -- Extended palette - Vibrant accents
          colors.rose = "#eca8d0"
          colors.salmon = "#f5a9b8"
          colors.lime = "#bef264"
          colors.chartreuse = "#d4f477"

          -- Extended palette - Muted/desaturated
          colors.sage = "#9db89c"
          colors.slate = "#8891a5"
          colors.mauve = "#ddb6c6"
          colors.beige = "#e6d5c3"
          colors.taupe = "#b8a89f"

          -- Extended palette - Darker variants
          colors.dark_teal = "#5a8a8a"
          colors.dark_purple = "#7e5a8f"
          colors.dark_blue = "#5b7a9f"
          colors.dark_green = "#6b8f71"
        end,
        on_highlights = function(hl, c)
          -- ============================================
          -- PRINCIPLE: If everything is highlighted, nothing stands out
          -- Most code should be BASE COLOR (c.fg)
          -- ============================================

          hl.Normal = { fg = c.fg, bg = c.bg }

          -- ============================================
          -- GREEN: Constants (strings, numbers, booleans)
          -- These are reference points in your code
          -- ============================================
          hl.String = { fg = c.green }
          hl.Character = { fg = c.green }
          hl.Number = { fg = c.green }
          hl.Float = { fg = c.green }
          hl.Boolean = { fg = c.green }
          hl.Constant = { fg = c.green }
          hl["@string"] = { fg = c.green }
          hl["@number"] = { fg = c.green }
          hl["@boolean"] = { fg = c.green }
          hl["@constant"] = { fg = c.green }
          hl["@constant.builtin"] = { fg = c.green }

          -- ============================================
          -- PINK: Comments (prominent, not greyed out!)
          -- Good comments ADD to code, they're important
          -- ============================================
          hl.Comment = { fg = c.pink }
          hl["@comment"] = { fg = c.pink }
          hl["@comment.documentation"] = { fg = c.pink }

          -- ============================================
          -- YELLOW: Top-level definitions (structure)
          -- Function/class definitions (not calls!)
          -- ============================================
          hl.Function = { fg = c.yellow, bold = true }
          hl["@function"] = { fg = c.yellow, bold = true }
          hl["@function.method"] = { fg = c.yellow, bold = true }
          hl["@constructor"] = { fg = c.yellow, bold = true }

          -- Type/class definitions
          hl.Type = { fg = c.yellow }
          hl["@type.definition"] = { fg = c.yellow }
          hl["@class"] = { fg = c.yellow }
          hl.Structure = { fg = c.yellow }
          hl.StorageClass = { fg = c.yellow }

          -- Markdown headers (structure)
          hl["@markup.heading"] = { fg = c.yellow, bold = true }
          hl["@text.title"] = { fg = c.yellow, bold = true }

          -- ============================================
          -- BLUE: Variable/parameter declarations
          -- Where things are defined (not where they're used)
          -- ============================================
          hl["@variable.parameter"] = { fg = c.blue }
          hl["@parameter"] = { fg = c.blue }
          hl["@variable.member"] = { fg = c.blue } -- Object properties at declaration
          hl["@property"] = { fg = c.blue } -- Property definitions
          hl["@field"] = { fg = c.blue }

          -- LSP semantic tokens for declarations
          hl["@lsp.type.parameter"] = { fg = c.blue }
          hl["@lsp.typemod.variable.declaration"] = { fg = c.blue }
          hl["@lsp.typemod.parameter.declaration"] = { fg = c.blue }

          -- ============================================
          -- BASE COLOR (c.fg): Everything else!
          -- Keywords, variable usage, function calls
          -- This is 75%+ of your code
          -- ============================================

          -- Keywords (class, function, if, else, return, etc.)
          -- You don't search for "if", you search for the condition!
          hl.Keyword = { fg = c.fg_dark }
          hl["@keyword"] = { fg = c.fg_dark }
          hl["@keyword.function"] = { fg = c.fg_dark }
          hl["@keyword.operator"] = { fg = c.fg_dark }
          hl["@keyword.return"] = { fg = c.red }
          hl["@keyword.conditional"] = { fg = c.fg_dark }
          hl["@keyword.repeat"] = { fg = c.fg_dark }
          hl["@keyword.import"] = { fg = c.fg_dark }
          hl.Conditional = { fg = c.fg_dark }
          hl.Repeat = { fg = c.fg_dark }
          hl.Statement = { fg = c.fg_dark }
          hl.Include = { fg = c.fg_dark }

          -- Variable usage (not declaration)
          hl["@variable"] = { fg = c.fg }
          hl["@variable.builtin"] = { fg = c.fg }
          hl.Identifier = { fg = c.fg }

          -- Function/method calls (not definitions)
          hl["@function.call"] = { fg = c.peach }
          hl["@function.builtin"] = { fg = c.peach }
          hl["@function.method.call"] = { fg = c.peach }
          hl["@method.call"] = { fg = c.peach }

          -- Type usage (not definition)
          hl["@type"] = { fg = c.fg }
          hl["@type.builtin"] = { fg = c.fg }
          hl["@type.qualifier"] = { fg = c.fg }

          -- LSP semantic tokens (usage)
          hl["@lsp.type.variable"] = { fg = c.fg }
          hl["@lsp.type.property"] = { fg = c.fg }
          hl["@lsp.type.function"] = {} -- Function calls via LSP
          hl["@lsp.type.method"] = {} -- Method calls via LSP

          -- Prevent LSP from overriding function calls
          hl["@lsp.typemod.function.defaultLibrary"] = { fg = c.peach }
          hl["@lsp.typemod.method.defaultLibrary"] = { fg = c.peach }

          -- Make sure return keyword stays red even with LSP
          hl["@lsp.type.keyword"] = {} -- Don't let LSP override keywords

          -- Attributes, annotations, decorators
          hl["@attribute"] = { fg = c.fg }
          hl["@decorator"] = { fg = c.fg }

          -- Labels
          hl.Label = { fg = c.fg }
          hl["@label"] = { fg = c.fg }

          -- ============================================
          -- DIMMED: Punctuation (helps names stand out)
          -- ============================================
          hl.Operator = { fg = c.punctuation }
          hl["@operator"] = { fg = c.punctuation }
          hl["@punctuation.delimiter"] = { fg = c.punctuation }
          hl["@punctuation.bracket"] = { fg = c.punctuation }
          hl["@punctuation.special"] = { fg = c.punctuation }
          hl.Delimiter = { fg = c.punctuation }

          -- HTML/JSX tags
          hl["@tag"] = { fg = c.fg }
          hl["@tag.attribute"] = { fg = c.blue }
          hl["@tag.delimiter"] = { fg = c.punctuation }

          -- ============================================
          -- Special cases
          -- ============================================
          hl.Special = { fg = c.fg }
          hl.SpecialChar = { fg = c.green }
          hl.SpecialComment = { fg = c.pink, bold = true }

          -- Escape sequences in strings
          hl["@string.escape"] = { fg = c.green, bold = true }
          hl["@string.special"] = { fg = c.green, bold = true }

          -- Regex
          hl["@string.regex"] = { fg = c.green }

          -- ============================================
          -- Errors and diagnostics (not part of the 4)
          -- ============================================
          hl.Error = { fg = c.red, bold = true }
          hl.ErrorMsg = { fg = c.red, bold = true }
          hl.WarningMsg = { fg = c.orange }

          hl.DiagnosticError = { fg = c.red }
          hl.DiagnosticWarn = { fg = c.orange }
          hl.DiagnosticInfo = { fg = c.blue }
          hl.DiagnosticHint = { fg = c.fg_dark }

          hl.DiagnosticUnderlineError = { undercurl = true, sp = c.red }
          hl.DiagnosticUnderlineWarn = { undercurl = true, sp = c.orange }
          hl.DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue }
          hl.DiagnosticUnderlineHint = { undercurl = true, sp = c.fg_dark }

          -- ============================================
          -- UI elements
          -- ============================================
          hl.LineNr = { fg = c.fg_gutter }
          hl.CursorLineNr = { fg = c.yellow, bold = true }
          hl.SignColumn = { bg = c.bg }
          hl.FoldColumn = { fg = c.fg_gutter }

          hl.StatusLine = { fg = c.fg, bg = c.bg_highlight }
          hl.StatusLineNC = { fg = c.fg_dark, bg = c.bg_dark }

          hl.Visual = { bg = c.dark_blue }
          hl.VisualNOS = { bg = c.dark_blue }

          hl.Search = { bg = c.bg_highlight, fg = c.yellow, bold = true }
          hl.IncSearch = { bg = c.yellow, fg = c.bg, bold = true }
          hl.CurSearch = { bg = c.yellow, fg = c.bg, bold = true }

          hl.Pmenu = { fg = c.fg, bg = c.bg_dark }
          hl.PmenuSel = { bg = c.bg_highlight, bold = true }
          hl.PmenuSbar = { bg = c.bg_dark }
          hl.PmenuThumb = { bg = c.fg_gutter }

          hl.WinSeparator = { fg = c.fg_gutter }
          hl.VertSplit = { fg = c.fg_gutter }

          -- ============================================
          -- Git signs
          -- ============================================
          hl.GitSignsAdd = { fg = c.green }
          hl.GitSignsChange = { fg = c.yellow }
          hl.GitSignsDelete = { fg = c.red }

          -- Git diff
          hl.DiffAdd = { bg = "#273849", fg = c.green }
          hl.DiffChange = { bg = "#2a2836", fg = c.yellow }
          hl.DiffDelete = { bg = "#3c2838", fg = c.red }
          hl.DiffText = { bg = "#344f69", fg = c.yellow }

          -- ============================================
          -- Language-specific refinements
          -- ============================================

          -- Markdown
          hl["@markup.strong"] = { bold = true }
          hl["@markup.italic"] = { italic = true }
          hl["@markup.link"] = { fg = c.blue, underline = true }
          hl["@markup.link.url"] = { fg = c.green }
          hl["@markup.raw"] = { fg = c.green }
          hl["@markup.list"] = { fg = c.punctuation }

          -- Python
          hl["@keyword.operator.python"] = { fg = c.fg } -- and, or, not, in

          -- JavaScript/TypeScript
          hl["@variable.builtin.javascript"] = { fg = c.fg } -- this, arguments
          hl["@variable.builtin.typescript"] = { fg = c.fg }

          -- Lua
          hl["@constructor.lua"] = { fg = c.punctuation } -- {} table constructors

          -- CSS
          hl["@property.css"] = { fg = c.blue }
          hl["@type.css"] = { fg = c.green } -- color values, etc

          -- JSON/YAML
          hl["@property.json"] = { fg = c.blue }
          hl["@property.yaml"] = { fg = c.blue }

          -- ============================================
          -- Telescope (fuzzy finder)
          -- ============================================
          hl.TelescopeNormal = { fg = c.fg, bg = c.bg }
          hl.TelescopeSelection = { bg = c.bg_highlight, bold = true }
          hl.TelescopeMatching = { fg = c.yellow, bold = true }
          hl.TelescopeBorder = { fg = c.fg_gutter }

          -- ============================================
          -- Neo-tree / File explorer
          -- ============================================
          hl.NeoTreeFileName = { fg = c.fg }
          hl.NeoTreeDirectoryName = { fg = c.yellow }
          hl.NeoTreeDirectoryIcon = { fg = c.yellow }
          hl.NeoTreeGitModified = { fg = c.yellow }
          hl.NeoTreeGitAdded = { fg = c.green }
          hl.NeoTreeGitDeleted = { fg = c.red }

          -- ============================================
          -- Which-key
          -- ============================================
          hl.WhichKey = { fg = c.yellow }
          hl.WhichKeyGroup = { fg = c.blue }
          hl.WhichKeyDesc = { fg = c.fg }
          hl.WhichKeySeparator = { fg = c.punctuation }
        end,
      })

      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
