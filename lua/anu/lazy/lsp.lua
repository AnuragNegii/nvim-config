return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        vim.o.completeopt = "menu,menuone,noselect"

        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local on_attach = function()
        end
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "pyright",
                "omnisharp",
                "omnisharp_mono",
                "gopls",
                "html",
                "ts_ls",
                "cssls",
                "ast_grep",
                "sqls",
            },
            handlers = {
                function(server_name) -- default handler (optional)

                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                ["pyright"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.pyright.setup {
                        capabilities = capabilities,
                        settings = {
                            python = {
                                analysis = {
                                    typeCheckingMode = "basic",   -- "off", "basic", "strict"
                                    autoSearchPaths = true,
                                    useLibraryCodeForTypes = true,
                                    diagnosticMode = "workspace", -- analyze whole project
                                }
                            }
                        }
                    }
                end,

                ["omnisharp"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.omnisharp.setup {
                        capabilities = capabilities,
                    }
                end,
                
                ["omnisharp_mono"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.omnisharp_mono.setup{
                        capabilities = capabilities,
                    }
                end,
                
                ["gopls"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.gopls.setup{
                        capabilities = capabilities,
                    }
                end,

                ["html"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.html.setup{
                        capabilities = capabilities,
                    }
                end,

                ["ts_ls"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.ts_ls.setup{
                        capabilities = capabilities,
                        init_options = {
                            preferences = {
                                disableSuggestion = true,
                            }
                        }
                    }
                end,

                ["cssls"] = function ()  -- Added CSS LSP handler
                    local lspconfig = require("lspconfig")
                    lspconfig.cssls.setup{
                        capabilities = capabilities,
                    }
                end,

                ["ast_grep"] = function ()  -- astgrep
                    local lspconfig = require("lspconfig")
                    lspconfig.ast_grep.setup{
                        capabilities = capabilities,
                    }
                end,

                ["sqls"] = function ()
                    local lspconfig  = require("lspconfig")
                    lspconfig.sqls.setup{
                        capabilities = capabilities,
                    }
                end
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                    { name = 'buffer' },
                })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
        --check this for error
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
                    buffer = args.buf,
                    desc = "LSP Rename",
                })
            end,
        })
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open diagnostics in a floating window" })
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to the previous diagnostic" })
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to the next diagnostic" })
        vim.keymap.set('n', '<leader>q', function ()
            vim.diagnostic.setqflist() -- Populate the quickfix list with diagnostics
            vim.cmd('copen')           -- Open the quickfix list
        end, { desc = "Open diagnostic quickfix list" })

        -- Automatically jump to the diagnostic location when moving in the list
        vim.api.nvim_create_autocmd("QuickFixCmdPost", {
            pattern = "[^]*",
            callback = function()
                vim.cmd("wincmd p")  -- Focus back on the main buffer
                vim.fn.cursor(vim.fn.getqflist({ idx = 0 }).items[vim.fn.getqflist().idx].lnum, 1)
            end,
        })
    end
}
