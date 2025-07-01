return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'saghen/blink.cmp',
            {
                "folke/lazydev.nvim",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local lspconfig = require("lspconfig")
            -- Language servers
            lspconfig.lua_ls.setup { capabilities = capabilities }

            lspconfig.html.setup {
                capabilities = capabilities,
                filetypes = { "html", "blade" }
            }

            -- CSS with Tailwind support
            lspconfig.cssls.setup {
                capabilities = capabilities,
                settings = {
                    css = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore" -- For Tailwind directives
                        }
                    }
                }
            }

            -- TypeScript/JavaScript with vtsls
            lspconfig.vtsls.setup {
                capabilities = capabilities,
                filetypes = {
                    "javascript",
                    "javascriptreact",
                    "javascript.jsx",
                    "typescript",
                    "typescriptreact",
                    "typescript.tsx"
                },
                settings = {
                    complete_function_calls = true,
                    vtsls = {
                        enableMoveToFileCodeAction = true,
                        autoUseWorkspaceTsdk = true,
                        experimental = {
                            maxInlayHintLength = 30,
                            completion = {
                                enableServerSideFuzzyMatch = true,
                            },
                        },
                    },
                    typescript = {
                        updateImportsOnFileMove = { enabled = "always" },
                        suggest = {
                            completeFunctionCalls = true,
                        },
                        inlayHints = {
                            enumMemberValues = { enabled = true },
                            functionLikeReturnTypes = { enabled = true },
                            parameterNames = { enabled = "literals" },
                            parameterTypes = { enabled = true },
                            propertyDeclarationTypes = { enabled = true },
                            variableTypes = { enabled = false },
                        },
                    },
                    javascript = {
                        updateImportsOnFileMove = { enabled = "always" },
                        suggest = {
                            completeFunctionCalls = true,
                        },
                        inlayHints = {
                            enumMemberValues = { enabled = true },
                            functionLikeReturnTypes = { enabled = true },
                            parameterNames = { enabled = "literals" },
                            parameterTypes = { enabled = true },
                            propertyDeclarationTypes = { enabled = true },
                            variableTypes = { enabled = false },
                        },
                    },
                }
            }

            -- Tailwind CSS LSP
            lspconfig.tailwindcss.setup {
                capabilities = capabilities,
                filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "php", "blade" },
                settings = {
                    tailwindCSS = {
                        experimental = {
                            classRegex = {
                                "tw`([^`]*)",          -- tw`...`
                                "tw=\"([^\"]*)",       -- <div tw="..." />
                                "tw={\"([^\"}]*)",     -- <div tw={"..."} />
                                "tw\\.\\w+`([^`]*)",   -- tw.xxx`...`
                                "tw\\(.*?\\)`([^`]*)", -- tw(Component)`...`
                                { "clsx\\(([^)]*)\\)",       "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                                { "classnames\\(([^)]*)\\)", "'([^']*)'" },
                                { "cva\\(([^)]*)\\)",        "[\"'`]([^\"'`]*).*?[\"'`]" },
                                { "cn\\(([^)]*)\\)",         "(?:'|\"|`)([^']*)(?:'|\"|`)" }
                            }
                        }
                    }
                }
            }

            lspconfig.marksman.setup { capabilities = capabilities }
            lspconfig.rust_analyzer.setup { capabilities = capabilities }

            -- PHP LSP
            lspconfig.phpactor.setup {
                capabilities = capabilities,
                init_options = {
                    ["language_server_phpstan.enabled"] = true,
                    ["language_server_psalm.enabled"] = false,
                }
            }

            -- Intelephense as alternative PHP LSP
            lspconfig.intelephense.setup {
                capabilities = capabilities,
                settings = {
                    intelephense = {
                        files = {
                            maxSize = 1000000,
                            associations = { "*.php", "*.phtml", "*.blade.php" },
                            exclude = {
                                "**/node_modules/**",
                                "**/vendor/**/Tests/**",
                                "**/vendor/**/tests/**",
                                "**/storage/framework/views/*.php"
                            }
                        },
                        environment = {
                            includePaths = { "vendor/" }
                        },
                        completion = {
                            insertUseDeclaration = true,
                            fullyQualifyGlobalConstantsAndFunctions = false,
                            triggerParameterHints = true,
                            maxItems = 100
                        },
                        format = {
                            enable = true
                        }
                    }
                }
            }

            lspconfig.pyright.setup { capabilities = capabilities }
            lspconfig.nil_ls.setup { capabilities = capabilities }

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local c = vim.lsp.get_client_by_id(args.data.client_id)
                    if not c then return end

                    local filetypes_to_format = {
                        "lua", "html", "css", "javascript", "typescript",
                        "javascriptreact", "typescriptreact", "markdown",
                        "php", "rust", "python"
                    }

                    if vim.tbl_contains(filetypes_to_format, vim.bo.filetype) then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            buffer = args.buf,
                            callback = function()
                                -- Use conform.nvim if available, otherwise fallback to LSP
                                local ok, conform = pcall(require, "conform")
                                if ok then
                                    conform.format({ bufnr = args.buf })
                                else
                                    vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
                                end
                            end,
                        })
                    end
                end,
            })
        end,
    }
}
