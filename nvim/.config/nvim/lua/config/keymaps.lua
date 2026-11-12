local map = vim.keymap.set

local harpoon
local function get_harpoon()
  if not harpoon then
    harpoon = require("harpoon")
    harpoon:setup()
  end
  return harpoon
end

map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>y", '"+y')
map("n", "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", [["_d]])

map("i", "jk", "<Esc>")

map("n", "<C-h>", "<C-w>h<CR>zz")
map("n", "<C-l>", "<C-w>l<CR>zz")
map("n", "<C-j>", "<C-w>j<CR>zz")
map("n", "<C-k>", "<C-w>k<CR>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

local function pack_clean()
  local active_plugins = {}
  local unused_plugins = {}

  for _, plugin in ipairs(vim.pack.get()) do
    active_plugins[plugin.spec.name] = plugin.active
  end

  for _, plugin in ipairs(vim.pack.get()) do
    if not active_plugins[plugin.spec.name] then
      table.insert(unused_plugins, plugin.spec.name)
    end
  end

  if #unused_plugins == 0 then
    print("No unused plugins.")
    return
  end

  local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
  if choice == 1 then
    vim.pack.del(unused_plugins)
  end
end

map("n", "<leader>\\", pack_clean)

map('n', 'gd', vim.lsp.buf.definition, {})
map('n', 'gD', vim.lsp.buf.declaration, {})
map('n', 'gi', vim.lsp.buf.implementation, {})
map('n', 'gr', vim.lsp.buf.references, {})
map('n', 'K', vim.lsp.buf.hover, {})
map('n', '<leader>rn', vim.lsp.buf.rename, {})
map('n', '<leader>ca', vim.lsp.buf.code_action, {})
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostics' })

map('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, { desc = 'LSP format file' })
map('v', '<leader>lf', function() vim.lsp.buf.format { async = true } end, { desc = 'LSP format selection' })
map('n', '<leader>li', '<cmd>checkhealth vim.lsp<CR>', { desc = 'LSP info' })

map("n", "<C-b>", "<cmd>Explore<CR>", { desc = "Open file explorer" })

local function setup_completion()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  luasnip.setup({ enable_autosnippets = true })
  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
  mapping = {
   ['<CR>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            if luasnip.expandable() then
                luasnip.expand()
            else
                cmp.confirm({
                    select = true,
                })
            end
        else
            fallback()
        end
    end),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  })
end

vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = setup_completion,
})

map("n", "<leader>h", function() get_harpoon():list():add() end)
map("n", "<C-e>", function() local h = get_harpoon(); h.ui:toggle_quick_menu(h:list()) end)
map("n", "<M-1>", function() get_harpoon():list():select(1) end)
map("n", "<M-2>", function() get_harpoon():list():select(2) end)
map("n", "<M-3>", function() get_harpoon():list():select(3) end)
map("n", "<M-4>", function() get_harpoon():list():select(4) end)
map("n", "<M-5>", function() get_harpoon():list():select(5) end)
map("n", "<M-6>", function() get_harpoon():list():select(6) end)
map("n", "<M-7>", function() get_harpoon():list():select(7) end)
map("n", "<M-8>", function() get_harpoon():list():select(8) end)
map("n", "<M-9>", function() get_harpoon():list():select(9) end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function() get_harpoon():list():prev() end)
map("n", "<C-S-N>", function() get_harpoon():list():next() end)


map("n", "<leader>ff", function()
  MiniPick.builtin.files()
end, { desc = "Find files" })

map("n", "<leader>fw", function()
  MiniPick.builtin.grep_live({ method = "plain" })
end, { desc = "Live grep" })

map("n", "<leader>fb", function()
  MiniPick.builtin.buffers()
end, { desc = "Buffers" })

map("n", "<leader>fh", function()
  MiniPick.builtin.help()
end, { desc = "Help tags" })

map("n", "<leader>fr", function()
  MiniPick.builtin.resume()
end, { desc = "Resume picker" })

map("n", "<leader>fo", function()
  MiniPick.builtin.oldfiles()
end, { desc = "Recent files" })

-- 'n' = normal mode
map('n', "<leader>s", ":Presenting<CR>", { silent = true, noremap = true })
