-- open vim-native file browser
-- vim.cmd([[nnoremap <leader>x :Ex<CR>]])

-- x = eXplorer with NvimTree
vim.keymap.set('n', '<leader>x', ":NvimTreeToggle<CR>")

-- Shift-h/l to navigate buffers via BufferLine
vim.keymap.set('n', 'H', [[<Cmd>BufferLineCyclePrev<CR>]])
vim.keymap.set('n', 'L', [[<Cmd>BufferLineCycleNext<CR>]])

-- Ctrl-h/j/k/l to navigate windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')

local lsp_maps = {
    ["K"] = "Display hover information",
    ["gd"] = "Jump to definition",
    ["gD"] = "Jump to declaration",
    ["gi"] = "List all implementations",
    ["go"] = "Jump to type definition",
    ["gr"] = "List references to symbol",
    ["<C-k>"] = "Display signature information",
    ["<F2>"]  = "Rename all references to symbol",
    ["<F4>"]  = "Select a code action",
    ["gl"]    = "Show diagnostics",
    ["[d"]    = "Previous diagnostic",
    ["]d"]    = "Next diagnostic",
}

local wk = require('which-key')
wk.register({
    c = {
        name = 'Code',
        a = 'action',
    },
    D = 'Type definition',
    f = {
        name = "find",
        f = {'<cmd>Telescope find_files<cr>', "Find File" },
        F = {'<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>', "Find File (include hidden)" },
        g = {'<cmd>Telescope live_grep<cr>', 'Live grep' },
        r = {'<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
        b = {'<cmd>Telescope buffers<cr>', 'Buffers' },
        h = {'<cmd>Telescope help_tags<cr>', 'Help tags' },
        m = {'<cmd>Telescope man_pages<cr>', 'Man pages' },
    },
    i = {
        name = "insert",
        d = {'<cmd>r! date -Iminute<cr>', "Date/time"},
    },
    p = {
        name = 'packages',
        c = { '<cmd>PackerCompile<cr>', "Compile Packages" },
        i = { '<cmd>PackerInstall<cr>', "Install Package" },
        s = { '<cmd>PackerSync<cr>', 'Sync Packages' },
        S = { '<cmd>PackerStatus<cr>', 'Package Status' },
        u = { '<cmd>PackerUpdate<cr>', 'Update Packer' },
    },
    r = {
        name = 'rename',
        n = 'rename',
    },
    w = {
        name = 'workspace',
        a = 'Add workspace folder',
        r = 'Remove workspace folder',
        l = 'List workspace folders',
    },
    x = { "Open file explorer" },
}, { prefix = "<leader>" })

wk.register(lsp_maps, { mode = "n", prefix = "" })
