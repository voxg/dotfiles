local config = {
    plugins = {
        -- Add plugins; use Packer syntax without the "use"
        init = {
            {
                'nvim-neorg/neorg',
                config = function()
                    require('neorg').setup {
                        load = {
                            ["core.defaults"] = {
                                config = {
                                    disable = {
                                        "core.keybinds",
                                    },
                                },
                            },
                            ["core.norg.concealer"] = {},
                            ["core.norg.dirman"] = {
                                config = {
                                    workspaces = {
                                        notes = "~/norgnotes",
                                    },
                                },
                            },
                        }
                    }
                end,
                requires = 'nvim-lua/plenary.nvim',
            },
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
        }
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

    -- Function to run last
    polish = function()
        -- vim.cmd("Neorg sync-parsers")
    end
}

return config