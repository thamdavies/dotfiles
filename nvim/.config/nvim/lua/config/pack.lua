local map = vim.keymap.set

vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = 'https://github.com/nvim-mini/mini.pick', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.animate', version = 'stable' },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/olimorris/codecompanion.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
  { src = "https://github.com/epwalsh/obsidian.nvim" },
})

-- Mini Things
require("mini.pick").setup({
  mappings = {
    move_down = "<C-j>",
    move_up = "<C-k>",
  }
})

-- don't know why this isn't working if put in keymaps.lua xD
vim.keymap.set("n", "<leader>ff", function()
  MiniPick.builtin.files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fw", function()
  MiniPick.builtin.grep_live()
end, { desc = "Live grep" })

vim.keymap.set("n", "<leader>fb", function()
  MiniPick.builtin.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>fh", function()
  MiniPick.builtin.help()
end, { desc = "Help tags" })

vim.keymap.set("n", "<leader>fr", function()
  MiniPick.builtin.resume()
end, { desc = "Resume picker" })

vim.keymap.set("n", "<leader>fo", function()
  MiniPick.builtin.oldfiles()
end, { desc = "Recent files" })

require('mini.animate').setup()

-- File Explorer
require("oil").setup()

-- LuaSnip
require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

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
require("codecompanion").setup()

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<M-5>", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<M-6>", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<M-7>", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<M-8>", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<M-9>", function() harpoon:list():select(9) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- Obsidian
require("obsidian").setup({
  workspaces = {
    {
      name = "main",
      path = "~/OneDrive/Personal/Obsidian/Vault/main",
    },
  },
})