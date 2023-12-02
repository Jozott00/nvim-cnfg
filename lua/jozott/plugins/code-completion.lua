return {
    -- Language Support
    -- Added this plugin.
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        },
        config = function()
            local lsp = require('lsp-zero')
            lsp.preset('recommended')

            lsp.nvim_workspace()
            lsp.setup()
        end
    },

    {
        'neovim/nvim-lspconfig',
        init = function()
            local m = require("jozott.core.utils").merge
            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local km = vim.keymap
                    local opts = { buffer = ev.buf }

                    km.set("n", "<leader>ld", vim.lsp.buf.definition, m(opts, { desc = "Jump to definition" }))
                    km.set("n", "<leader>lD", vim.lsp.buf.declaration, m(opts, { desc = "Jump to declaration" }))
                    km.set("n", "<leader>li", vim.lsp.buf.implementation, m(opts, { desc = "Jump to implementation" }))
                    km.set("n", "<leader>lk", vim.lsp.buf.hover, m(opts, { desc = "Show infos" }))
                    km.set("n", "<leader>ls", vim.lsp.buf.signature_help, m(opts, { desc = "Show signature" }))
                    km.set("n", "<leader>lt", vim.lsp.buf.type_definition, m(opts, { desc = "Show type definition" }))
                    km.set("n", "<leader>la", vim.lsp.buf.code_action, m(opts, { desc = "Show code actions" }))
                    km.set("n", "<leader>lR", vim.lsp.buf.rename, m(opts, { desc = "Rename" }))
                    km.set("n", "<leader>lr", vim.lsp.buf.references, m(opts, { desc = "Show references" }))
                end,
            })
        end
    },


    {
        "nvim-treesitter/nvim-treesitter",
    },

    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        setup = function()
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local cmp = require("cmp")
            local luasnip = require("luasnip")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },

                }),
                mapping = {
                    ["<CR>"] = cmp.mapping.confirm { select = true },
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                            -- that way you will only jump inside the snippet region
                        elseif luasnip.jumpable() then
                            luasnip.jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
            })
        end
    },

    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
    },

    -- Hop (Better Navigation)
    {
        "phaazon/hop.nvim",
    },

}
