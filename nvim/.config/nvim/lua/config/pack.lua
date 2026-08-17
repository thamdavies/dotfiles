local map = vim.keymap.set

vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = 'https://github.com/nvim-mini/mini.pick', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.animate', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.pairs', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.icons', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.indentscope', version = 'stable' },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
  { src = "https://github.com/3rd/image.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/olimorris/codecompanion.nvim", version = "main" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
  { src = "https://github.com/epwalsh/obsidian.nvim" },
  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/monkoose/neocodeium" },
  { src = "https://github.com/sotte/presenting.nvim" }
})

-- Mini Things
require("mini.pick").setup({
  mappings = {
    move_down = "<C-j>",
    move_up = "<C-k>",
  }
})

require('mini.icons').setup()
require('mini.animate').setup()
require('mini.pairs').setup()
require('mini.indentscope').setup()

-- Markdown Renderer
require('render-markdown').setup({
  -- Cấu hình hiển thị chung
  heading = {
    enabled = true,
    sign = true,
    icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' }, -- Icon tiêu đề H1-H6
  },
  
  -- Cấu hình khối Code Blocks chuẩn GitHub
  code = {
    enabled = true,
    sign = true,
    style = 'full',           -- Hiển thị nền và khung đầy đủ
    position = 'left',
    language_pad = 0,         -- Khoảng đệm cho tên ngôn ngữ
    language_icon = true,     -- Hiển thị icon ngôn ngữ (Devicons)
    language_name = true,     -- Hiển thị tên ngôn ngữ
    border = 'thin',          -- Đường viền khối code
    width = 'full',           -- Trải dài toàn bộ chiều rộng
    left_pad = 2,
    right_pad = 2,
  },

  -- Cấu hình Checkbox ([ ] / [x])
  checkbox = {
    enabled = true,
    unchecked = { icon = '󰄱 ' },
    checked = { icon = ' ' },
  },

  -- Cấu hình Callouts / GitHub Alerts (> [!NOTE], > [!WARNING],...)
  callout = {
    note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
    tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
    important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
    warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
    caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
  },

  -- Cấu hình Bảng (Tables)
  pipe_table = {
    enabled = true,
    style = 'full',
    cell = 'padded',
  },
})

require("image").setup({
  backend = "kitty",
  integrations = {
    markdown = {
      enabled = true,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      filetypes = { "markdown", "vimwiki" },
    },
  },
})

-- Treesitter
require("nvim-treesitter").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  ensure_installed = {
    "lua",
    "markdown",
    "markdown_inline",
    "tsx",
    "typescript",
    "javascript",
    "css",
    "json",
    "html",
    "ruby",
    "go", "gomod", "gowork", "gosum"
  }
})

-- File Explorer
require("oil").setup()

-- LuaSnip
require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_vscode").lazy_load()

-- Lsp
vim.lsp.enable({
  "lua_ls",
  "cssls",
  "tailwindcss",
  "ts_ls",
  "ruby-lsp",
  "gopls",
})

require("fidget").setup()

-- AI
require("codecompanion").setup()
-- require("neocodeium").setup()

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

-- Slides
require('presenting').setup({
  options = {
      width = vim.o.columns,
  },
})

require "config.keymaps"
