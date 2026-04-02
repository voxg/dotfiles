-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = true, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap

        colorcolumn = "80,100",
        scrolloff = 4,
        sidescrolloff = 6,

        encoding = "utf8",
        fileencoding = "utf8",

        ignorecase = true,
        smartcase = true,
        incsearch = true,
        hlsearch = true,

        expandtab = true,
        shiftwidth = 4,
        softtabstop = 4,
        tabstop = 4,

        splitright = true,
        splitbelow = true,

        -- timeoutlen = 300,
        showbreak = "└─",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" }

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,

        -- My notes bindings
        ["<Leader>n"] = { desc = "Notes" },
        ["<Leader>nd"] = {
          function() vim.cmd(os.date "edit ~/notes/journals/%Y-%m-%d.md") end,
          desc = "Edit today's journal",
        },
        ["<Leader>nt"] = {
          function() require("telescope.builtin").live_grep { default_text = "\\[ \\]", cwd = "~/notes" } end,
          desc = "Live grep to-do items",
        },
        ["<Leader>nu"] = {
          function() require("telescope.builtin").live_grep { default_text = ":(ups|downs):", cwd = "~/notes" } end,
          desc = "Live grep to-do items",
        },
        ["<Leader>np"] = {
          function()
            local filename = os.date "pasted_%Y%m%d%H%M%S.png"
            vim.cmd(string.format("!pngpaste ~/notes/img/%s", filename))
            local pos = vim.api.nvim_win_get_cursor(0)[2]
            local line = vim.api.nvim_get_current_line()
            local nline = line:sub(0, pos) .. string.format("![](../img/%s)", filename) .. line:sub(pos + 1)
            vim.api.nvim_set_current_line(nline)
          end,
          desc = "Paste image",
        },
        ["<leader>nx"] = {
          function()
            local line = vim.api.nvim_get_current_line()
            if string.match(line, " [[][ -]] ") ~= nil then
              vim.cmd "s/ \\[[ -]\\] / [x] /"
            elseif string.match(line, " [[][x-]] ") ~= nil then
              vim.cmd "s/ \\[[x-]\\] / [ ] /"
            end
          end,
          desc = "Toggle task as done",
        },
        ["<leader>nh"] = {
          function()
            local line = vim.api.nvim_get_current_line()
            if string.match(line, " [[] ] ") ~= nil then
              vim.cmd "s/ \\[ \\] / [-] /"
            elseif string.match(line, " [[][x-]] ") ~= nil then
              vim.cmd "s/ \\[[x-]\\] / [ ] /"
            end
          end,
          desc = "Toggle task as on hold",
        },
        ["<leader>P"] = {
          function()
            local p = require "peek"
            local buf = vim.api.nvim_get_current_buf()
            local ft = vim.api.nvim_buf_get_option(buf, "filetype")
            -- If the Peek preview is open, you can close it from any buffer...
            if p.is_open() then
              p.close()
            else
              -- ...but you can only start Peek from a .md buffer
              if ft == "markdown" then p.open() end
            end
          end,
          desc = "Toggle Markdown Peek",
        },
        ["<leader>r"] = {
          function() require("replacer").run() end,
        },
      },
    },
  },
}
