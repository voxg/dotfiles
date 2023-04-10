local config = {

    colorscheme = "catppuccin-frappe",
    plugins = {
        -- {
        --     "nvim-neorg/neorg",
        --     build = ":Neorg sync parsers",
        --     opts = {
        --         load = {
        --             ["core.defaults"] = {},
        --             ["core.norg.concealer"] = {},
        --             ["core.norg.dirman"] = {
        --                 config = {
        --                     workspaces = {
        --                         notes = "~/norgnotes",
        --                     },
        --                     default_workspace = "notes",
        --                 },
        --             },
        --             ["core.export"] = {
        --                 config = {
        --                     export_dir = "~/mdnotes/<export-dir>"
        --                 }
        --             },
        --             ["core.export.markdown"] = {
        --                 config = {
        --                     extensions = "all",
        --                 },
        --             },
        --         },
        --     },
        --     dependencies = { { 'nvim-lua/plenary.nvim' } },
        --     lazy = false,
        -- },
        {
            'ekickx/clipboard-image.nvim',
            name = "clipboard-image",
            lazy = false,
        },
        {
            "catppuccin/nvim",
            name = "catppuccin",
            lazy = false,
        },
        {
            "lunarvim/darkplus.nvim",
            name = "darkplus",
            lazy = false,
        },
        -- 
        -- To fix line breaks the way Davy likes them, after update edit
        -- ~/.local/share/nvim/lazy/peek.nvim/app/src/markdownit.ts and add
        --     breaks: true,
        -- to the object passed to
        --     const md = new MarkdownIt('default', {
        --
        {
            'toppair/peek.nvim',
            build = 'deno task --quiet build:fast',
            ft = 'markdown'
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

            -- [[ which-key timeout ]]
            timeoutlen=300,

            -- [[ pretty wrapped lines ]]
            showbreak = "└─"
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

    mappings = {
        -- first key is the mode
        n = {
            -- second key is the left side of the map
            -- ["<leader>n"] = { desc = "Neorg" },
            -- ["<leader>ni"] = { "<cmd>Neorg index<cr>", desc = "Neorg index"},
            ["<leader>i"] = {
                function ()
                    require('clipboard-image.paste').paste_img()
                end,
                desc = "Paste image",

            },
            ["<leader>n"] = { desc = "Notes" },
            ["<leader>nd"] = {
                function ()
                    vim.cmd(os.date("edit ~/notes/journals/%Y-%m-%d.md"))
                end,
                desc = "Edit today's journal",
            },
            ["<leader>nt"] = {
                function()
                    require('telescope.builtin').live_grep({default_text='\\[ \\]', cwd='~/notes'})
                end,
                desc = "Live grep to-do items",
            },
            ["<leader>nu"] = {
                function()
                    require('telescope.builtin').live_grep({default_text=':(ups|downs):', cwd='~/notes'})
                end,
                desc = "Live grep ups and downs",
            },
            ["<leader>nc"] = {
                function()
                    require('telescope.builtin').live_grep({default_text=':capex:', cwd='~/notes'})
                end,
                desc = "Live grep capital time reporting",
            },
            ["<leader>P"] = {
                function()
                    local p = require('peek')
                    local buf = vim.api.nvim_get_current_buf() 
                    local ft = vim.api.nvim_buf_get_option(buf, "filetype")
                    -- If the Peek preview is open, you can close it from any buffer...
                    if p.is_open() then
                        p.close()
                    else
                        -- ...but you can only start Peek from a .md buffer
                        if ft == 'markdown' then
                            p.open()
                        end
                    end
                end,
                desc = "Toggle Markdown Peek"
            },
            ["H"] = {
                function ()
                    require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
                end,
                desc = "Previous buffer"
            },
            ["L"] = {
                function ()
                    require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
                end,
                desc = "Next buffer"
            },
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
