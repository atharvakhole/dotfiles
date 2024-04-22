require 'nvim-treesitter.configs'.setup {
    -- auto tag completion for tsx/html
    autotag = {
        enable = true,
    },
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "javascript", "html", "css", "java", "typescript", "lua", "vim", "vimdoc", "query", "rust",
        "toml" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
