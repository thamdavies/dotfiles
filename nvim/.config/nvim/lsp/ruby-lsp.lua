-- on Linux and macOS the default location is ~/.config/nvim/lsp/ruby-lsp.lua
return {
  filetypes = { "ruby" },
  cmd = { "ruby-lsp" }, -- or { "bundle", "exec", "ruby-lsp" }
  root_markers = { "Gemfile", ".git" },
  init_options = {
    formatter = 'standard',
    linters = { 'standard' },
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
}
