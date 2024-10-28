-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
--vim.filetype.add {
--  extension = {
--    foo = "fooscript",
--  },
--  filename = {
--    ["Foofile"] = "fooscript",
--  },
--  pattern = {
--    ["~/%.config/foo/.*"] = "fooscript",
--  },
--}
--
require("nvim-autopairs").setup {
  disable_filetype = { "TelescopePrompt", "ps1" },
}

--local bundle_path = vim.fn.stdpath "data" .. "/mason/packages/powershell-editor-services"
--local command_fmt =
--  [[& '%s/PowerShellEditorServices/Start-EditorServices.ps1' -BundledModulesPath '%s' -LogPath '%s/powershell_es.log' -SessionDetailsPath '%s/powershell_es.session.json' -FeatureFlags @() -AdditionalModules @() -HostName nvim -HostProfileId 0 -HostVersion 1.0.0 -Stdio -LogLevel Normal]]
--local temp_path = vim.fn.stdpath "cache"
--local command = command_fmt:format(bundle_path, bundle_path, temp_path, temp_path)

require("lspconfig").powershell_es.setup {
  settings = {
    powershell = {
      codeFormatting = { Preset = "OTBS" },
    },
  },
  --  cmd = { "pwsh", "-NoLogo", "-NoProfile", "-Command", command },
}

--require("lspconfig").powershell_es.setup {}
require("mini.surround").setup()
require("mini.ai").setup()
