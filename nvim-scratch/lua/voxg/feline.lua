-- local lsp = require 'feline.providers.lsp'

-- local icons = {
--     linux = ' ',
--     macos = ' ',
--     windows = ' ',
-- 
--     errs = ' ',
--     warns = ' ',
--     infos = ' ',
--     hints = ' ',
-- 
--     lsp = ' ',
--     git = '',
-- }
-- 
-- local function file_osinfo()
--     local os = vim.bo.fileformat:upper()
--     local icon
--     if os == 'UNIX' then
--         icon = icons.linux
--     elseif os == 'MAC' then
--         icon = icons.macos
--     else
--         icon = icons.windows
--     end
--     return icon .. os
-- end
-- 
-- local file_encoding_component = {
--     provider = 'file_encoding'
-- }

require('feline').setup()
