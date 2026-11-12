local map = vim.keymap.set

vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = 'https://github.com/nvim-mini/mini.pick', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.pairs', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.icons', version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.indentscope', version = 'stable' },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
  { src = "https://github.com/3rd/image.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
  { src = "https://github.com/epwalsh/obsidian.nvim" },
  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/monkoose/neocodeium" },
  { src = "https://github.com/sotte/presenting.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/tpope/vim-fugitive" },
  { src = "https://github.com/sindrets/diffview.nvim" },
})

-- Mini Things
vim.env.RIPGREP_CONFIG_PATH = vim.fn.stdpath("config") .. "/ripgrep.conf"
require("mini.pick").setup({
  mappings = {
    move_down = "<C-j>",
    move_up = "<C-k>",
    choose_in_vsplit = "<M-v>",
    paste_clipboard = {
      char = "<C-v>",
      func = function()
        local paste = vim.api.nvim_replace_termcodes("<C-r>+", true, false, true)
        vim.api.nvim_feedkeys(paste, "n", false)
      end,
    },
  }
})

-- mini.pick's installed version blocks terminal paste while a picker is active.
local paste = vim.paste
vim.paste = function(lines, phase)
  if not MiniPick.is_picker_active() then
    return paste(lines, phase)
  end

  local text = table.concat(lines, " "):gsub("[%z\1-\31\127]", " ")
  vim.api.nvim_feedkeys(text, "n", true)
  return true
end

require('mini.icons').setup()
require('mini.pairs').setup()
require('mini.indentscope').setup()

local markdown_plugins_setup = false
local function setup_markdown_plugins()
  if markdown_plugins_setup then return end
  markdown_plugins_setup = true

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
end

vim.api.nvim_create_autocmd({ "BufReadPre", "FileType" }, {
  pattern = { "*.md", "*.markdown", "markdown", "vimwiki" },
  callback = setup_markdown_plugins,
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

-- Lsp
vim.lsp.enable({
  "lua_ls",
  "cssls",
  "tailwindcss",
  "ts_ls",
  "ruby-lsp",
  "gopls",
})

local fidget_setup = false
local function setup_fidget()
  if fidget_setup then return end
  fidget_setup = true
  require("fidget").setup()
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "gomod", "gowork", "gosum", "lua", "css", "typescript", "javascript", "ruby" },
  callback = setup_fidget,
})

-- require("neocodeium").setup()

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

-- Git
require("gitsigns").setup({
  current_line_blame = false,
  on_attach = function(bufnr)
    local gs = require("gitsigns")
    local function bmap(mode, l, r, desc)
      map(mode, l, r, { buffer = bufnr, desc = desc })
    end

    bmap("n", "]c", function()
      if vim.wo.diff then vim.cmd.normal({ "]c", bang = true }) else gs.nav_hunk("next") end
    end, "Next hunk")
    bmap("n", "[c", function()
      if vim.wo.diff then vim.cmd.normal({ "[c", bang = true }) else gs.nav_hunk("prev") end
    end, "Prev hunk")

    bmap("n", "<leader>gs", gs.stage_hunk, "Stage/unstage hunk")
    bmap("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage selection")
    bmap("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
    bmap("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset selection")
    bmap("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
    bmap("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
    bmap("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
    bmap("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle inline blame")
    bmap("n", "<leader>gD", gs.diffthis, "Diff against index")
  end,
})

-- Fugitive
map("n", "<leader>gg", "<cmd>Git<CR>", { desc = "Git status" })
map("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Git commit" })
map("n", "<leader>gl", "<cmd>Git log --oneline<CR>", { desc = "Git log" })
map("n", "<leader>gP", "<cmd>Git push<CR>", { desc = "Git push" })
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })
map("n", "<leader>gq", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" })
