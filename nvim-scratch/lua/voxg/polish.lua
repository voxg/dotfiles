vim.cmd("colorscheme catppuccin")
vim.cmd("set clipboard+=unnamedplus")

local fix_nvim_lua = function ()
    require('lspconfig').sumneko_lua.setup({
        settings = {
            Lua = {
                diagnostics = {
                    globals = {'vim'}
                }
            }
        }
    })
end

pcall(fix_nvim_lua)
