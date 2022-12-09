-- open vim-native file browser
-- vim.cmd([[nnoremap <leader>x :Ex<CR>]])

-- x = eXplorer with NvimTree
vim.cmd([[nnoremap <leader>x :NvimTreeToggle<CR>]])

-- Shift-h/l to navigate buffers via BufferLine
vim.cmd([[nnoremap H :BufferLineCyclePrev<CR>]])
vim.cmd([[nnoremap L :BufferLineCycleNext<CR>]])

-- Ctrl-h/j/k/l to navigate windows
vim.cmd([[noremap <C-h> <C-w><C-h>]])
vim.cmd([[noremap <C-j> <C-w><C-j>]])
vim.cmd([[noremap <C-k> <C-w><C-k>]])
vim.cmd([[noremap <C-l> <C-w><C-l>]])
