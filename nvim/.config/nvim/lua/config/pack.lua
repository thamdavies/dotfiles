local map = vim.keymap.set

vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = 'https://github.com/nvim-mini/mini.pick', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.animate', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.pairs', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.indentscope', version = 'stable' },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/olimorris/codecompanion.nvim", version = vim.version.range("^19.0.0") },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
  { src = "https://github.com/epwalsh/obsidian.nvim" },
  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/monkoose/neocodeium" },
})

-- Mini Things
require("mini.pick").setup({
  mappings = {
    move_down = "<C-j>",
    move_up = "<C-k>",
  }
})

require('mini.animate').setup()
require('mini.pairs').setup()
require('mini.indentscope').setup()

-- Markdown Renderer
require("render-markdown").setup()

-- File Explorer
require("oil").setup()

-- LuaSnip
require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_vscode").lazy_load()

-- Mason
require "mason".setup()

-- Lsp
vim.lsp.enable({
  "lua_ls",
  "cssls",
  "tailwindcss",
  "ts_ls",
  "ruby-lsp",
})

require("fidget").setup()

-- AI
require("codecompanion").setup()
require("neocodeium").setup()

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()

-- Obsidian
require("obsidian").setup({
  workspaces = {
    {
      name = "main",
      path = "~/OneDrive/Personal/Obsidian/Vault/main",
    },
  },
})

require "config.keymaps"

