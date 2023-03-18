local config = {

    plugins = {
        {
            "nvim-neorg/neorg",
            build = ":Neorg sync parsers",
            opts = {
                load = {
                    ["core.defaults"] = {},
                    ["core.norg.concealer"] = {},
                    ["core.norg.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/norgnotes",
                            },
                            default_workspace = "notes",
                        },
                    },
                    ["core.export"] = {
                        config = {
                            export_dir = "~/mdnotes/<export-dir>"
                        }
                    },
                    ["core.export.markdown"] = {
                        config = {
                            extensions = "all",
                        },
                    },
                },
            },
            dependencies = { { 'nvim-lua/plenary.nvim' } },
            lazy = false,
        },
    },

    -- sets vim.x.y options
    options = {
        -- sets vim.opt.whatever
        opt = {
            -- [[ Context ]]
            colorcolumn = "80,100",
            number = true,
            -- relativenumber = false,
            -- signcolumn = "yes",
            scrolloff = 4,
            sidescrolloff=6,

            -- [[ File encoding ]]
            encoding = 'utf8',
            fileencoding = 'utf8',

            -- [[ Theme ]]
            syntax = "ON",
            termguicolors = true,
            guifont = 'FiraCode Nerd Font Mono',

            -- [[ Search ]]
            ignorecase = true,
            smartcase = true,
            incsearch = true,
            hlsearch = true,

            -- [[ Whitespace ]]
            expandtab = true,
            shiftwidth = 4,
            softtabstop = 4,
            tabstop = 4,

            -- [[ Splits ]]
            splitright = true,
            splitbelow = true,
        },
        g = {
            maplocalleader = " ",
        },
    },

    -- LSP configuration
    lsp = {
        -- Override LSP server settings; keys are the name of the server
        ["server-settings"] = {
            -- example for adding schemas to yamlls
            -- yamlls = {
            --      settings = {
            --          yaml = {
            --              schemas = {
            --                  ["https://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
            --              }
            --          }
            --      }
            -- }
        },
        formatting = {
            disabled = {
                "powershell_es",
            },
        },
    },

    ["which-key"] = {
        -- Add bindings which show up as group name
        register = {
            -- first key is mode, n == normal mode
            n = {
                -- second key is the prefix, <leader> prefixes
                ["<leader>"] = {
                    -- third key is the key to bring up the next level
                    ["n"] = { name = "Neorg" },
                },
            },
        },
    },

    mappings = {
        -- first key is the mode
        n = {
            -- second key is the left side of the map
            ["<leader>ni"] = { "<cmd>Neorg index<cr>", desc = "index"}
        },
    },

    updater = { channel = "stable", },

    -- Function to run last
    polish = function()
        -- vim.cmd("Neorg sync-parsers")
        require('nvim-autopairs').setup({
            disable_filetype = { "TelescopePrompt", "ps1" },
        })
    end
}

return config
