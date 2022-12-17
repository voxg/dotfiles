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

local wk = require('which-key')
wk.register({
    f = {
        name = "files",
        f = {'<cmd>Telescope find_files<cr>', "Find File" },
        F = {'<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>', "Find File (include hidden)" },
        r = {'<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
        b = {'<cmd>Telescope buffers<cr>', 'Buffers' },
        h = {'<cmd>Telescope help_tags<cr>', 'Help tags' },
        m = {'<cmd>Telescope man_pages<cr>', 'Man pages' },
    },
    p = {
        name = 'packages',
        c = { '<cmd>PackerCompile<cr>', "Compile Packages" },
        i = { '<cmd>PackerInstall<cr>', "Install Package" },
        s = { '<cmd>PackerSync<cr>', 'Sync Packages' },
        S = { '<cmd>PackerStatus<cr>', 'Package Status' },
        u = { '<cmd>PackerUpdate<cr>', 'Update Packer' },
    },
    x = { "Open file explorer" },
}, { prefix = "<leader>" })
