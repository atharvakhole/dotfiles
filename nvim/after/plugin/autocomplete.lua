-- Completion Plugin Setup
local cmp = require 'cmp'
cmp.setup({
    -- Enable LSP snippets
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    -- mapping = {
    --   ['<C-p>'] = cmp.mapping.select_prev_item(),
    --   ['<C-n>'] = cmp.mapping.select_next_item(),
    --   -- Add tab support
    --   ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    --   ['<Tab>'] = cmp.mapping.select_next_item(),
    --   ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    --   ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --   ['<C-Space>'] = cmp.mapping.complete(),
    --   ['<C-e>'] = cmp.mapping.close(),
    --   ['<CR>'] = cmp.mapping.confirm({
    --     behavior = cmp.ConfirmBehavior.Insert,
    --     select = true,
    --   })
    -- },
    -- Installed sources:
    sources = {
        { name = 'path' },                                        -- file paths
        { name = 'nvim_lsp',                keyword_length = 1 }, -- from language server
        { name = 'nvim_lsp_signature_help', keyword_length = 1 }, -- display function signatures with current parameter emphasized
        { name = 'nvim_lua',                keyword_length = 3 }, -- complete neovim's Lua runtime API such vim.lsp.*
        { name = 'buffer',                  keyword_length = 1 }, -- source current buffer
        { name = 'vsnip',                   keyword_length = 3 }, -- nvim-cmp source for vim-vsnip
        { name = 'calc',                    keyword_length = 3 }, -- source for math calculation
        { name = 'dictionary',              keyword_length = 2 }, -- source for math calculation
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                vsnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})

local dict = require("cmp_dictionary")

dict.setup({
     first_case_insensitive = true,
})
dict.switcher({
    filetype = {
        markdown = "/usr/share/dict/words",
    },
})
