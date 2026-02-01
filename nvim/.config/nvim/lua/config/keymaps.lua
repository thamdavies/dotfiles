local map = vim.keymap.set

map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>y", [["+y]])
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

map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
map("n", "<C-b>", "<cmd>NvimTreeFindFile<CR>")

map('n', 'gd', vim.lsp.buf.definition, {})
map('n', 'gD', vim.lsp.buf.declaration, {})
map('n', 'gi', vim.lsp.buf.implementation, {})
map('n', 'gr', vim.lsp.buf.references, {})
map('n', 'K', vim.lsp.buf.hover, {})
map('n', '<leader>rn', vim.lsp.buf.rename, {})
map('n', '<leader>ca', vim.lsp.buf.code_action, {})

map('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, { desc = 'LSP format file' })
map('v', '<leader>lf', function() vim.lsp.buf.format { async = true } end, { desc = 'LSP format selection' })
map('n', '<leader>li', '<cmd>checkhealth vim.lsp<CR>', { desc = 'LSP info' })