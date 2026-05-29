local map = vim.keymap.set
local harpoon = require("harpoon")
local luasnip = require("luasnip")
local cmp = require("cmp")

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

map('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, { desc = 'LSP format file' })
map('v', '<leader>lf', function() vim.lsp.buf.format { async = true } end, { desc = 'LSP format selection' })
map('n', '<leader>li', '<cmd>checkhealth vim.lsp<CR>', { desc = 'LSP info' })

map("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

map("n", "-", "<CMD>Oil<CR>", {
  desc = "Open parent directory",
})

-- Normal and Visual mode
map({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<CR>", { desc = "AI Chat Toggle" })
map({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<CR>", { desc = "AI Action Palette" })
map({ "n", "v" }, "<leader>ai", "<cmd>CodeCompanion<CR>", { desc = "AI Inline Prompt" })

-- Visual mode only
map("v", "<leader>ae", ":<C-u>CodeCompanion /explain<CR>", { desc = "AI Explain Selection" })
map("v", "<leader>af", ":<C-u>CodeCompanion /fix<CR>", { desc = "AI Fix Selection" })
map("v", "<leader>at", ":<C-u>CodeCompanion /tests<CR>", { desc = "AI Generate Tests" })
map("v", "<leader>aA", ":<C-u>CodeCompanionChat Add<CR>", { desc = "AI Add to Chat" })

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

vim.keymap.set("n", "<leader>h", function() harpoon:list():add() end)
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

